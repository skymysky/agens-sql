#!/bin/bash

if [ ! -f $INSTALL_PATH/pgsql/bin/postmaster ]; then ln -s $INSTALL_PATH/pgsql/bin/postgres $INSTALL_PATH/pgsql/bin/postmaster; fi

AGENS_HOME="$INSTALL_PATH"
agens_passwd_file=$AGENS_HOME/pgsql/dbuser_passwd
password="$agens.password"
port="$agens_sql.port"
DATA_DIR="$agens_sql.data_path"

# create password file
echo "$password" > $agens_passwd_file
chmod 600 $agens_passwd_file

# initialize agens database
if [ -z $password ]; then
	LD_LIBRARY_PATH=$AGENS_HOME/pgsql/lib $AGENS_HOME/pgsql/bin/initdb -U agens -D $DATA_DIR
else
	LD_LIBRARY_PATH=$AGENS_HOME/pgsql/lib $AGENS_HOME/pgsql/bin/initdb --pwfile=$agens_passwd_file -A md5 -U agens -D $DATA_DIR
fi

# edit postgresql.conf
if [ $port -ne "5456" ]; then
    sed -e 's/#port = 5456/port = $agens_sql.port/g' $DATA_DIR/postgresql.conf > $DATA_DIR/postgresql.conf
    mv $DATA_DIR/postgresql.conf $DATA_DIR/postgresql.conf
    chmod 600 $DATA_DIR/postgresql.conf
fi


# operate server
LD_LIBRARY_PATH=$AGENS_HOME/pgsql/lib $AGENS_HOME/pgsql/bin/pg_ctl -w -D $DATA_DIR -l $DATA_DIR/server_log.txt start

# createdb
if [ -z $password ]; then
	$AGENS_HOME/pgsql/bin/createdb -p $port -U agens agens
else
	$AGENS_HOME/pgsql/bin/createdb -p $port -U agens agens < $agens_passwd_file
fi

# remove password file
rm -f $agens_passwd_file


# run psql
# $AGENS_HOME/pgsql/bin/psql -p $port -U agens agens


