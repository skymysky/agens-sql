/*"""
.. function:: pg_qualstats_reset()

  Resets statistics gathered by pg_qualstats.
*/
CREATE FUNCTION pg_qualstats_reset()
RETURNS void
AS 'MODULE_PATHNAME'
LANGUAGE C;

/*"""
.. function:: pg_qualstats()

  Returns:
    A SETOF record containing the data gathered by pg_qualstats

    Attributes:
      userid (oid):
        the user who executed the query
      dbid (oid):
        the database on which the query was executed
      lrelid (oid):
        oid of the relation on the left hand side
      lattnum (attnum):
        attribute number of the column on the left hand side
      opno (oid):
        oid of the operator used in the expression
      rrelid (oid):
        oid of the relation on the right hand side
      rattnum (attnum):
        attribute number of the column on the right hand side
      uniquequalnodeid(bigint):
        hash of the parent ``AND`` expression, if any. This is useful for identifying
        predicates which are used together.
      qualnodeid(bigint):
        the predicate hash. Everything (down to constants) is used to compute this hash
      count (bigint):
        the total number of execution of this predicate.
      nbfiltered (bigint):
        the number of lines filtered by this predicate
      constant_position (int):
        the position of the constant in the original query, as filled by the lexer.
      queryid (oid):
        the queryid identifying this query, as generated by pg_stat_statements
      constvalue (varchar):
        a string representation of the right-hand side constant, if
        any, truncated to 80 bytes.
      eval_type (char):
        the evaluation type. Possible values are ``f`` for execution as a filter (ie, after a Scan)
        or ``i`` if it was evaluated as an index predicate. If the qual is evaluated as an index predicate,
        then the nbfiltered value will most likely be 0, except if there was any rechecked conditions.

  Example:

  .. code-block:: sql

      powa=# select * from powa_statements where queryid != 2;
      powa=# select * from pg_qualstats();
      -[ RECORD 1 ]-----+-----------
      userid            | 16384
      dbid              | 850774
      lrelid            | 851367
      lattnum           | 1
      opno              | 417
      rrelid            |
      rattnum           |
      qualid            |
      uniquequalid      |
      qualnodeid        | 1711571257
      uniquequalnodeid  | 466568149
      count             | 1206
      nbfiltered        | 0
      constant_position | 47
      queryid           | 3644521490
      constvalue        | 2::integer
      eval_type         | f
*/
CREATE FUNCTION pg_qualstats(
  OUT userid oid,
  OUT dbid oid,
  OUT lrelid oid,
  OUT lattnum smallint,
  OUT opno oid,
  OUT rrelid oid,
  OUT rattnum smallint,
  OUT qualid  bigint,
  OUT uniquequalid bigint,
  OUT qualnodeid    bigint,
  OUT uniquequalnodeid bigint,
  OUT count bigint,
  OUT nbfiltered bigint,
  OUT constant_position int,
  OUT queryid    bigint,
  OUT constvalue varchar,
  OUT eval_type  "char"
)
RETURNS SETOF record
AS 'MODULE_PATHNAME'
LANGUAGE C STRICT VOLATILE;

/*"""
.. function:: pg_qualstats_names()

  This function is the same as pg_qualstats, but with additional columns corresponding
  to the resolved names, if ``pg_qualstats.resolve_oids`` is set to ``true``.

  Returns:
    The same set of columns than :func:`pg_qualstats()`, plus the following ones:

    rolname (text):
      the name of the role executing the query. Corresponds to userid.
    dbname (text):
      the name of the database on which the query was executed. Corresponds to dbid.
    lrelname (text):
      the name of the relation on the left-hand side of the qual. Corresponds to lrelid.
    lattname (text):
      the name of the attribute (column) on the left-hand side of the qual. Corresponds to rrelid.
    opname (text):
      the name of the operator. Corresponds to opno.
*/
CREATE FUNCTION pg_qualstats_names(
  OUT userid oid,
  OUT dbid oid,
  OUT lrelid oid,
  OUT lattnum smallint,
  OUT opno oid,
  OUT rrelid oid,
  OUT rattnum smallint,
  OUT qualid  bigint,
  OUT uniquequalid bigint,
  OUT qualnodeid    bigint,
  OUT uniquequalnodeid bigint,
  OUT count bigint,
  OUT nbfiltered bigint,
  OUT constant_position int,
  OUT queryid    bigint,
  OUT constvalue varchar,
  OUT eval_type  "char",
  OUT rolname text,
  OUT dbname text,
  OUT lrelname text,
  OUT lattname  text,
  OUT opname text,
  OUT rrelname text,
  OUT rattname text
)
RETURNS SETOF record
AS 'MODULE_PATHNAME'
LANGUAGE C STRICT VOLATILE;


-- Register a view on the function for ease of use.
/*"""
.. view:: pg_qualstats

  This view is just a simple wrapper on the :func:`pg_qualstats()` function, filtering on the current database for convenience.
*/
CREATE VIEW pg_qualstats AS
  SELECT qs.* FROM pg_qualstats() qs
  INNER JOIN pg_database on qs.dbid = pg_database.oid
  WHERE pg_database.datname = current_database();


GRANT SELECT ON pg_qualstats TO PUBLIC;

-- Don't want this to be available to non-superusers.
REVOKE ALL ON FUNCTION pg_qualstats_reset() FROM PUBLIC;

/*"""
.. view:: pg_qualstats_pretty

  This view resolves oid "on the fly", for the current database.

  Returns:
    left_schema (name):
      the name of the left-hand side relation's schema.
    left_table (name):
      the name of the left-hand side relation.
    left_column (name):
      the name of the left-hand side attribute.
    operator (name):
      the name of the operator.
    right_schema (name):
      the name of the right-hand side relation's schema.
    right_table (name):
      the name of the right-hand side relation.
    right_column (name):
      the name of the operator.
    count (bigint):
      the total number of time this qual was executed.
    nbfiltered (bigint):
      the total number of tuples filtered by this qual.
*/
CREATE VIEW pg_qualstats_pretty AS
  select
        nl.nspname as left_schema,
        al.attrelid::regclass as left_table,
        al.attname as left_column,
        opno::regoper as operator,
        nr.nspname as right_schema,
        ar.attrelid::regclass as right_table,
        ar.attname as right_column,
        sum(count) as count,
        sum(nbfiltered) as nbfiltered
  from pg_qualstats qs
  left join (pg_class cl inner join pg_namespace nl on nl.oid = cl.relnamespace) on cl.oid = qs.lrelid
  left join (pg_class cr inner join pg_namespace nr on nr.oid = cr.relnamespace) on cr.oid = qs.rrelid
  left join pg_attribute al on al.attrelid = qs.lrelid and al.attnum = qs.lattnum
  left join pg_attribute ar on ar.attrelid = qs.rrelid and ar.attnum = qs.rattnum
  group by al.attrelid, al.attname, ar.attrelid, ar.attname, opno, nl.nspname, nr.nspname
;


CREATE OR REPLACE VIEW pg_qualstats_all AS
  SELECT dbid, relid, userid, queryid, array_agg(distinct attnum) as attnums, opno, max(qualid) as qualid, sum(count) as count,
    coalesce(qualid, qualnodeid) as qualnodeid
  FROM (
    SELECT
          qs.dbid,
          CASE WHEN lrelid IS NOT NULL THEN lrelid
               WHEN rrelid IS NOT NULL THEN rrelid
          END as relid,
          qs.userid as userid,
          CASE WHEN lrelid IS NOT NULL THEN lattnum
               WHEN rrelid IS NOT NULL THEN rattnum
          END as attnum,
          qs.opno as opno,
          qs.qualid as qualid,
          qs.qualnodeid as qualnodeid,
          qs.count as count,
          qs.queryid
    FROM pg_qualstats() qs
    WHERE lrelid IS NOT NULL or rrelid IS NOT NULL
  ) t GROUP BY dbid, relid, userid, queryid, opno, coalesce(qualid, qualnodeid)
;

/*"""
.. type:: qual

  Attributes:

    relid (oid):
      the relation oid
    attnum (integer):
      the attribute number
    opno (oid):
      the operator oid
    eval_type (char):
      the evaluation type. See :func:`pg_qualstats()` for an explanation of the eval_type.
*/
CREATE TYPE qual AS (
  relid oid,
  attnum integer,
  opno oid,
  eval_type "char"
 );

/*"""
.. type:: qualname

  Pendant of :type:`qual`, but with names instead of oids

  Attributes:

    relname (text):
      the relation oid
    attname (text):
      the attribute number
    opname (text):
      the operator name
    eval_type (char):
      the evaluation type. See :func:`pg_qualstats()` for an explanation of the eval_type.
*/
CREATE TYPE qualname AS (
  relname text,
  attnname text,
  opname text,
  eval_type "char"
);

CREATE OR REPLACE VIEW pg_qualstats_by_query AS
        SELECT coalesce(uniquequalid, uniquequalnodeid) as uniquequalnodeid, dbid, userid,  coalesce(qualid, qualnodeid) as qualnodeid, count, nbfiltered, queryid,
      array_agg(distinct constvalue) as constvalues, array_agg(distinct ROW(relid, attnum, opno, eval_type)::qual) as quals
      FROM
      (

        SELECT
            qs.dbid,
            CASE WHEN lrelid IS NOT NULL THEN lrelid
                WHEN rrelid IS NOT NULL THEN rrelid
            END as relid,
            qs.userid as userid,
            CASE WHEN lrelid IS NOT NULL THEN lattnum
                WHEN rrelid IS NOT NULL THEN rattnum
            END as attnum,
            qs.opno as opno,
            qs.qualid as qualid,
            qs.uniquequalid as uniquequalid,
            qs.qualnodeid as qualnodeid,
            qs.uniquequalnodeid as uniquequalnodeid,
            qs.count as count,
            qs.queryid as queryid,
            qs.constvalue as constvalue,
            qs.nbfiltered as nbfiltered,
            qs.eval_type
        FROM pg_qualstats() qs
        WHERE (qs.lrelid IS NULL) != (qs.rrelid IS NULL)
    ) i GROUP BY coalesce(uniquequalid, uniquequalnodeid), coalesce(qualid, qualnodeid),  dbid, userid, count, nbfiltered, queryid
;


CREATE VIEW pg_qualstats_indexes AS
SELECT relid::regclass, attnames, possible_types, sum(count) as count
FROM (
  SELECT qs.relid::regclass, array_agg(distinct attnames) as attnames, array_agg(distinct amname) as possible_types, max(count) as count, array_agg(distinct attnum) as attnums
  FROM pg_qualstats_all as qs
  INNER JOIN pg_amop amop ON amop.amopopr = opno
  INNER JOIN pg_am on amop.amopmethod = pg_am.oid,
  LATERAL (SELECT attname as attnames from pg_attribute inner join unnest(attnums) a on a = attnum and attrelid = qs.relid order by attnum) as attnames,
  LATERAL unnest(attnums) as attnum
  WHERE NOT EXISTS (
    SELECT 1 from pg_index i
    WHERE indrelid = relid AND (
        (i.indkey::int2[])[0:array_length(attnums, 1) - 1] @> (attnums::int2[]) OR
        ((attnums::int2[]) @> (i.indkey::int2[])[0:array_length(indkey, 1) + 1]  AND
            i.indisunique))
  )
  GROUP BY qs.relid, qualnodeid
) t GROUP BY relid, attnames, possible_types;



CREATE OR REPLACE FUNCTION pg_qualstats_suggest_indexes(relid oid, attnums integer[], opno oid) RETURNS TABLE(index_ddl text) AS $$
BEGIN
RETURN QUERY
 SELECT 'CREATE INDEX idx_' || q.relid || '_' || array_to_string(attnames, '_') || ' ON ' || nspname || '.' || q.relid ||  ' USING ' || idxtype || ' (' || array_to_string(attnames, ', ') || ')'  AS index_ddl
 FROM (SELECT t.nspname,
    t.relid,
    t.attnames,
    unnest(t.possible_types) AS idxtype

   FROM ( SELECT nl.nspname AS nspname,
            qs.relid::regclass AS relid,
            array_agg(DISTINCT attnames.attnames) AS attnames,
            array_agg(DISTINCT pg_am.amname) AS possible_types,
            array_agg(DISTINCT attnum.attnum) AS attnums
           FROM (VALUES (relid, attnums::smallint[], opno)) as qs(relid, attnums, opno)
           LEFT JOIN (pg_class cl JOIN pg_namespace nl ON nl.oid = cl.relnamespace) ON cl.oid = qs.relid
           JOIN pg_amop amop ON amop.amopopr = qs.opno
           JOIN pg_am ON amop.amopmethod = pg_am.oid AND pg_am.amname <> 'hash',
           LATERAL ( SELECT pg_attribute.attname AS attnames
                       FROM pg_attribute
                       JOIN unnest(qs.attnums) a(a) ON a.a = pg_attribute.attnum AND pg_attribute.attrelid = qs.relid
                      ORDER BY pg_attribute.attnum) attnames,
           LATERAL unnest(qs.attnums) attnum(attnum)
          WHERE NOT (EXISTS ( SELECT 1
                               FROM pg_index i
                              WHERE i.indrelid = qs.relid AND ((i.indkey::smallint[])[0:array_length(qs.attnums, 1) - 1] @> qs.attnums OR qs.attnums @> (i.indkey::smallint[])[0:array_length(i.indkey, 1) + 1] AND i.indisunique)))
          GROUP BY nl.nspname, qs.relid) t
  GROUP BY t.nspname, t.relid, t.attnames, t.possible_types) q;
END;
$$ language plpgsql;

CREATE OR REPLACE VIEW pg_qualstats_indexes_ddl AS
 SELECT q.nspname,
    q.relid,
    q.attnames,
    q.idxtype,
    q.count,
    'CREATE INDEX idx_' || relid || '_' || array_to_string(attnames, '_') || ' ON ' || nspname || '.' || relid ||  ' USING ' || idxtype || ' (' || array_to_string(attnames, ', ') || ')'  AS ddl
 FROM (SELECT t.nspname,
    t.relid,
    t.attnames,
    unnest(t.possible_types) AS idxtype,
    sum(t.count) AS count

   FROM ( SELECT nl.nspname AS nspname,
            qs.relid::regclass AS relid,
            array_agg(DISTINCT attnames.attnames) AS attnames,
            array_agg(DISTINCT pg_am.amname) AS possible_types,
            max(qs.count) AS count,
            array_agg(DISTINCT attnum.attnum) AS attnums
           FROM pg_qualstats_all qs
           LEFT JOIN (pg_class cl JOIN pg_namespace nl ON nl.oid = cl.relnamespace) ON cl.oid = qs.relid
           JOIN pg_amop amop ON amop.amopopr = qs.opno
           JOIN pg_am ON amop.amopmethod = pg_am.oid,
           LATERAL ( SELECT pg_attribute.attname AS attnames
                       FROM pg_attribute
                       JOIN unnest(qs.attnums) a(a) ON a.a = pg_attribute.attnum AND pg_attribute.attrelid = qs.relid
                      ORDER BY pg_attribute.attnum) attnames,
           LATERAL unnest(qs.attnums) attnum(attnum)
          WHERE NOT (EXISTS ( SELECT 1
                               FROM pg_index i
                              WHERE i.indrelid = qs.relid AND ((i.indkey::smallint[])[0:array_length(qs.attnums, 1) - 1] @> qs.attnums OR qs.attnums @> (i.indkey::smallint[])[0:array_length(i.indkey, 1) + 1] AND i.indisunique)))
          GROUP BY nl.nspname, qs.relid, qs.qualnodeid) t
  GROUP BY t.nspname, t.relid, t.attnames, t.possible_types) q;
