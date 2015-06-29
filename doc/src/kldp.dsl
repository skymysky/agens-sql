<!DOCTYPE style-sheet PUBLIC "-//James Clark//DTD DSSSL Style Sheet//EN" [
<!ENTITY % html "IGNORE">
<![%html;[
<!ENTITY % print "IGNORE">
<!ENTITY docbook.dsl SYSTEM "/usr/share/sgml/docbook/dsssl-stylesheets-1.79/html/docbook.dsl" CDATA dsssl>
]]>
<!ENTITY % print "INCLUDE">
<![%print;[
<!ENTITY docbook.dsl SYSTEM "/usr/share/sgml/docbook/dsssl-stylesheets-1.79/print/docbook.dsl" CDATA dsssl>
]]>
]>

<style-sheet>
<style-specification id="print" use="docbook">
<style-specification-body> 

;;
;; DocBook Stylesheet for KLDP ( http://kldp.org )
;; This is based on Modular DocBook Stylesheet ( http://nwalsh.com )
;; 
;; Update : 2001/05/04
;;
;; Maintained by Park Yong Joo ( yongjoo@kldp.org )
;;
;; �ѱ� DocBook ������ ���� KLDP ��Ÿ�Ͻ�Ʈ�Դϴ�.
;; Norman Walsh�� Modular DocBook Stylesheet�� �Բ� ����Ͽ��� �մϴ�.
;;
;; Contributors
;;  Chung, Ha-Nyung ( alita@kldp.org )
;;  Im Eun Jae ( eunjae@kldp.org )
;;  J.-Y. Hoh ( jhoh@stud.uni-goettingen.de )
;;  juami@mail.pentasecurity.com 
;;  Kang, Joonsun( bigbear@ece.skku.ac.kr )
;;  Kim Hyun Soo ( polsci@hitel.net )
;;  KIM KyungHeon ( tody@teoal.net )
;;  Kim Yun Han ( spbear@hanmail.net )
;;  Lee Suk Chan ( acetcom@pentasecurity.com )
;;  rainlood ( rainlood@kldp.org )
;;  Yang Yoo Seong ( yooseong@kldp.org )
;; 
;; Specially thanks to Kwon Soon Sun ( kss@kldp.org )
;;
;; Any suggestion or questions? subscribe Docs@list.kldp.org
;; also http://docs.kldp.org for more information
;;
;; DocBook�� ��Ÿ�Ͻ�Ʈ�� ������ ���ؼ���
;; ���� ������ Ȩ������(http://docs.kldp.org)�� �����ϼ���.
;; ���ϸ� ����Ʈ(Docs@list.kldp.org)������ ���� �ҽ� ����ȭ�� ����
;; ������ ����� ��ٸ��� �ֽ��ϴ�.
;; 

 ;; =====================================
 ;;
 ;; ���⼭���� print�� ��Ÿ�Ͻ�Ʈ �κ��Դϴ�.
 ;; 
 ;; =====================================

 ;; =====================================
 ;;
 ;; Modular DocBook Sytlesheet���� �����ϴ�
 ;; ���� �Ķ���͵��� ���� �����մϴ�. �� �κ��� 
 ;; LDP ��Ÿ�Ͻ�Ʈ�� ���� �����Ͽ����ϴ�(http://www.linuxdoc.org). 
 ;; �� �ۿ��� ��ô ���� �Ķ���͵��� �ֽ��ϴ�. �ڼ��� ������
 ;; ��Ÿ�Ͻ�Ʈ ������ �����Ͻñ� �ٶ��ϴ�.
 ;; http://nwalsh.com/docbook/dsssl/doc/
 ;;
 ;; �� �κ��� �ҽ��� print/dbparam.dsl �Դϴ�. 
 ;;

(define (toc-depth nd)
  ;; '����'�� ���̸� �����մϴ�. �������� �ø���
  ;; ���ʰ� ���� �ڼ��ϰ�(����) ���ɴϴ�. ����ġ�� �������� 
  ;; ���ʿ��� �������Ⱑ �����Ƿ� �̶��� ���� �ٿ��ݴϴ�. 
  2)

(define %paper-type%
  ;; ������ �԰��� �����մϴ�. "USletter"�� A B C �ø�� �����մϴ�. 
  "A4")

(define %two-side% 
  ;; ��� �μ������ ��ȯ�� �������� �����մϴ�.
  ;; #t�� ���� �ָ� ������ ��ȣ�� �¿쿡 ������ ��Ÿ���ϴ�.
  #f)

(define bop-footnotes
  ;; �ּ��� �� ������ �Ʒ��� �ٷ� �־��ݴϴ�. #f�� ���� �ָ�
  ;; �� ��(section)�� �������� �ּ��� �ڸ��ϰ� �˴ϴ�. 
  ;; �� ����� TeX ���·� ������ ��ȯ�� ��
  ;; jade�� -V tex-backend �ɼ��� �־�� �۵��մϴ�.
  #t)

(define %generate-article-titlepage-on-separate-page%
  ;; article�� title page�� ���� �� ������ �����ϵ��� 
  ;; �� ������ �����մϴ�.
  #f)

(define %graphic-default-extension% 
  ;; graphic ���ʿ���� fileref �Ӽ�����,
  ;; %graphic-extensions%���� ������ Ȯ����� ���� ���� �׸� 
  ;; ���� �̸��� ������ �ڵ����� �̰��� ���õ� Ȯ����� ����մϴ�. 
  ;; �� ����� �׸��� �� ������ �������� ���·� ��ȯ�� �� �����մϴ�.
  ;; #f�� ���� �ָ� �� ����� �۵����� �ʰ� �˴ϴ�.
  #f)

(define %graphic-extensions% 
  ;; graphic ���ʿ���� fileref �Ӽ��� ����
  ;; �׸� ������ Ȯ����� �����մϴ�.
  '("eps" "epsf" "gif" "tif" "tiff" "jpg" "jpeg" "png"))

(define %para-indent-firstpara%
  ;; ù��° ������ �鿩���� ������ �����մϴ�.
  5pt)

(define %para-indent%
  ;; ù��° ������ �ƴ� �ٸ� ������ �鿩���� ������ 
  ;; �����մϴ�.
  5pt)

(define formal-object-float
  ;; formal object���� ���ٴ� ����� �����մϴ�.
  ;; �� ����� ����ϰ� �Ǹ� ǥ�� �׸����� ������ ��ġ��
  ;; ã�� `���ٴϰ�' �˴ϴ�. informal�� ���ǵ� ���
  ;; (informalfigure ��)�� ��쿡�� ������� �ʽ��ϴ�.
  ;; #f�� ���� �ָ� ���� ���Ե� ��ġ���� �����˴ϴ�.
  #f)

(define %section-autolabel%
  ;; �� ��(section)�� ���� 1.1.1. ������
  ;; ��ȣ�� �޾��ݴϴ�.
  #t)

(define %admon-graphics%
  ;; caution�̳� warning ���� �׸� �������� ����� ǥ���� ������
  ;; �����մϴ�. 
  #f)

(define %admon-graphics-path%
  ;; %admon-graphics%���� ����� �׸� ������ ��θ� �����մϴ�.
  "../images/")

 ;; ======================================
 ;;
 ;; ��Ÿ�Ͻ�Ʈ�� �Ķ���ʹ� �ƴ����� ��� ��������
 ;; ���ذ��� ���� �����ϴ� �κ��Դϴ�.

(declare-characteristic preserve-sdata?
  ;; character entity�� �״�� ��µǾ� ������ ������ �ذ��� �ݴϴ�.
  ;; �� �������� ������(polsci@hitel.net)���� ������ �ּ̽��ϴ�.
  "UNREGISTERED::James Clark//Characteristic::preserve-sdata?"
  #f)

 ;; =======================================
 ;;
 ;; ���⼭���ʹ� ���� �ڿ������� �ѱ� ǥ���� ����
 ;; Modular DocBook Stylesheet�� print �κ��� �����մϴ�.
 ;;

(element emphasis 
  ;; emphasis�� ������ ���� �۾�ü�� ǥ���ϵ��� �մϴ�. 
  ;; �⺻���� ���Ÿ�ü�Դϴ�.
  ;; �� �κ��� Chung, Ha-Nyung(alita@kldp.org)����
  ;; ������ �ּ̽��ϴ�.
  ;; �ҽ��� print/dbinline.dsl �Դϴ�.
  ($bold-seq$))

(define (book-titlepage-recto-elements)
  ;; �ֻ��� ���ʿ�� book�� ǥ������ � ������
  ;; �������� ���� �����մϴ�. �����̿� �ű��̸� ����
  ;; 'editor'�� 'othercredit'�� �߰��Ǿ����ϴ�.
  ;; �ҽ��� print/dbttlpg.dsl �Դϴ�.
  (list (normalize "title") 
	(normalize "subtitle") 
	(normalize "graphic") 
	(normalize "mediaobject")
	(normalize "corpauthor") 
	(normalize "authorgroup") 
	(normalize "author") 
	(normalize "editor")
	(normalize "othercredit")
))

(define (book-titlepage-verso-elements)
  ;; �ֻ��� ���ʿ�� book�� �������� � ������
  ;; �������� ���� �����մϴ�. �����̿� �ű��̸� ����
  ;; 'editor'�� 'othercredit'�� �߰��Ǿ����ϴ�.
  ;; �ҽ��� print/dbttlpg.dsl �Դϴ�.
  (list (normalize "title") 
	(normalize "subtitle") 
	(normalize "corpauthor") 
	(normalize "authorgroup") 
	(normalize "author") 
	(normalize "editor")
	(normalize "othercredit")
	(normalize "edition") 
	(normalize "pubdate") 
	(normalize "copyright")
	(normalize "abstract") 
	(normalize "legalnotice") 
	(normalize "revhistory")
))

(define (article-titlepage-recto-elements)
  ;; �ֻ��� ���ʿ�� article�� ǥ������ � ������
  ;; �������� ���� �����մϴ�. �����̿� �ű��̸� ����
  ;; 'editor'�� 'othercredit'�� �߰��Ǿ����ϴ�.
  ;; �ҽ��� print/dbttlpg.dsl �Դϴ�.
  (list (normalize "title") 
	(normalize "subtitle") 
	(normalize "corpauthor") 
	(normalize "authorgroup") 
	(normalize "author") 
	(normalize "editor")
	(normalize "othercredit")
	(normalize "pubdate")
	(normalize "copyright")
	(normalize "abstract")
	(normalize "legalnotice")
	(normalize "revhistory")
	(normalize "releaseinfo")
))

(mode article-titlepage-recto-mode
  (element editor
    ;; article�� ǥ������ editor ���ʿ�Ұ� ��� ���������� 
    ;; ���� �����մϴ�.
    ;; �ҽ��� print/dbttlpg.dsl �Դϴ�.
    (let ((editor-name (author-string))
	  (editor-affil (select-elements (children (current-node)) 
					 (normalize "affiliation"))))
      (make sequence      
	(if (first-sibling?) 
	    (make paragraph
              use: article-titlepage-recto-style
	      font-size: (HSIZE 1)
	      line-spacing: (* (HSIZE 1) %line-spacing-factor%)
	      space-before: (* (HSIZE 2) %head-before-factor% 1)
	      quadding: %article-title-quadding%
	      keep-with-next?: #t
	      ;; lang �Ӽ��� ������� 'edited by'�� '������'��
	      ;; �������� �մϴ�.
	      (literal "\U-C5EE;\U-C740;\U-C774;"))
	    (empty-sosofo))
	(make paragraph
          use: article-titlepage-recto-style
	  font-size: (HSIZE 3)
	  line-spacing: (* (HSIZE 3) %line-spacing-factor%)
	  ;; �Ʒ��� ���� �ҽ��� �ִ� ���������� ���� ����
	  ;; �� ������ ���ֱ� ���� �ּ� ó���Ͽ����ϴ�.
	  ;; space-after: (* (HSIZE 2) %head-after-factor% 2)
	  quadding: %article-title-quadding%
	  keep-with-next?: #t
	  (literal editor-name))
	(process-node-list editor-affil))))

  (element contrib
    ;; contrib�� ��� ���������� ���� �����մϴ�.
    (make paragraph
      use: article-titlepage-recto-style
      quadding: %article-title-quadding%
      (process-children)))

  (element othercredit
    ;; article�� ǥ������ othercerdit ���ʿ�Ұ� ��� ���������� 
    ;; ���� �����մϴ�.
    (let ((credit-name (author-string))
	  (credit-contrib (select-elements (children (current-node))
                                            (normalize "contrib")))
	  (credit-affil (select-elements (children (current-node)) 
					 (normalize "affiliation"))))
      (make sequence      
	(if (first-sibling?) 
	    (make paragraph
              use: article-titlepage-recto-style
	      font-size: (HSIZE 1)
	      line-spacing: (* (HSIZE 1) %line-spacing-factor%)
	      space-before: (* (HSIZE 2) %head-before-factor% 1)
	      quadding: %article-title-quadding%
	      keep-with-next?: #t
	      ;; lang �Ӽ��� ������� othercredit��
              ;; `������'�� �������� �մϴ�.
	      (literal "\U-B3C4;\U-C6B4;\U-C774;"))
	    (empty-sosofo))
	(make paragraph
          use: article-titlepage-recto-style
	  font-size: (HSIZE 3)
	  line-spacing: (* (HSIZE 3) %line-spacing-factor%)
	  ;; �� �κ��� ���� �ҽ��� �ִ� ����������
	  ;; ������� �� ������ ���ֱ� ���� �ּ�ó���Ͽ����ϴ�.
	  ;; space-after: (* (HSIZE 2) %head-after-factor% 2)
	  quadding: %article-title-quadding%
	  keep-with-next?: #t
	  (literal credit-name))
	;; othercredit�� contrib�� �������� �մϴ�.
	(process-node-list credit-contrib)
	(process-node-list credit-affil))))

  (element copyright
    ;; Copyright�� �ѱ��� ����ȭ���� '���۱�'���� �����Ǿ� 
    ;; ������ ���� �ڿ������� ������ ���� ���� ǥ����
    ;; �״�� ������ ���ϴ�.
    (make paragraph
      use: article-titlepage-recto-style
      quadding: %article-title-quadding%
      (literal "Copyright")
      (literal "\no-break-space;")
      ;; copyright ���ڰ� �ѱ� ȯ�濡�� ������ ���� �����ϱ� ����
      ;; ������ c�� ��� ����մϴ�.
      ;; �� �������� juami@mail.pentasecurity.com ����
      ;; ������ �ּ̽��ϴ�.
      (literal "\U-24D2;")
      (literal "\no-break-space;")
      (process-children)))

  (element (copyright year)
    ;; Copyright�� ���۱� ���� �⵵�� ��������
    ;; ǥ���մϴ�.
    (make sequence
      (process-children)
      (if (not (last-sibling? (current-node)))
	  (literal ", ")
	  (literal (string-append " " "by" " ")))))
  
)

(mode book-titlepage-recto-mode
  (element editor
    ;; book�� ǥ������ editor ���ʿ�Ұ� ��� ���������� 
    ;; ���� �����մϴ�.
    ;; �ҽ��� print/dbttlpg.dsl �Դϴ�.
    (let ((editor-name (author-string))
	  (editor-affil (select-elements (children (current-node)) 
					 (normalize "affiliation"))))
      (make sequence      
	(if (first-sibling?) 
	    (make paragraph
	      use: book-titlepage-recto-style
	      font-size: (HSIZE 1)
	      line-spacing: (* (HSIZE 1) %line-spacing-factor%)
	      space-before: (* (HSIZE 2) %head-before-factor% 3)
	      quadding: %division-title-quadding%
	      keep-with-next?: #t
	      ;; lang �Ӽ��� ������� 'edited by'��
	      ;; `������'�� �������� �մϴ�.
	      (literal "\U-C5EE;\U-C740;\U-C774;"))
	    (empty-sosofo))
	(make paragraph
	  use: book-titlepage-recto-style
	  font-size: (HSIZE 3)
	  line-spacing: (* (HSIZE 3) %line-spacing-factor%)
	  ;; �Ʒ��� ���� �ҽ��� ���ԵǾ� �ִ� ����������
	  ;; ���� ���� ������ ���ֱ� ���� �ּ�ó���Ͽ����ϴ�.
	  ;; space-after: (* (HSIZE 2) %head-after-factor% 2)
	  quadding: %division-title-quadding%
	  keep-with-next?: #t
	  (literal editor-name))
	(process-node-list editor-affil))))

  (element othercredit
    ;; book�� ǥ������ othercredit ���ʿ�Ұ� ��� ���������� 
    ;; ���� �����մϴ�.
    (let ((credit-name (author-string))
	  (credit-affil (select-elements (children (current-node)) 
					 (normalize "affiliation"))))
      (make sequence      
	(if (first-sibling?) 
	    (make paragraph
	      use: book-titlepage-recto-style
	      font-size: (HSIZE 1)
	      line-spacing: (* (HSIZE 1) %line-spacing-factor%)
	      space-before: (* (HSIZE 2) %head-before-factor% 3)
	      quadding: %division-title-quadding%
	      keep-with-next?: #t
	      ;; lang �Ӽ��� ������� othercredit��
	      ;; '������'�� �������� �մϴ�.
	      (literal "\U-B3C4;\U-C6B4;\U-C774;"))
	    (empty-sosofo))
	(make paragraph
	  use: book-titlepage-recto-style
	  font-size: (HSIZE 3)
	  line-spacing: (* (HSIZE 3) %line-spacing-factor%)
	  ;; �Ʒ��� ���� �ҽ��� �ִ� ���������� �������
	  ;; ������ ���ֱ� ���� �ּ�ó���Ͽ����ϴ�.
	  ;; space-after: (* (HSIZE 2) %head-after-factor% 2)
	  quadding: %division-title-quadding%
	  keep-with-next?: #t
	  (literal credit-name))
	(process-node-list credit-affil))))

)

(mode book-titlepage-verso-mode
  (element author
    ;; book�� �������� author ���ʿ�Ұ� ��� ���������� 
    ;; ���� �����մϴ�.
    ;; �ҽ��� print/dbttlpg.dsl �Դϴ�.
    (let ((in-group (have-ancestor? (normalize "authorgroup") (current-node))))
      (if (not in-group)
	  (make paragraph
	    space-after: (* %bf-size% %line-spacing-factor%)
	    (make sequence
	      ;; lang �Ӽ��� ������� 'by'�� '������'��
	      ;; �������� �մϴ�.
	      (literal "\U-C9C0;\U-C740;\U-C774;")
	      (literal "\no-break-space;")
	      (literal (author-list-string))))
	  (make sequence 
	    (literal (author-list-string))))))  

  (element editor
    ;; book�� �������� editor ���ʿ�Ұ� ��� ���������� 
    ;; ���� �����մϴ�.
    ;; �ҽ��� print/dbttlpg.dsl �Դϴ�.
    (let ((in-group (have-ancestor? (normalize "authorgroup") (current-node))))
      (if (or #t (not in-group))
	  (make paragraph
	    space-after: (* %bf-size% %line-spacing-factor%)
	    (make sequence
	      ;; lang �Ӽ��� ������� 'edited by'�� '������'��
	      ;; �������� �մϴ�.
	      (literal "\U-C5EE;\U-C740;\U-C774;")
	      (literal "\no-break-space;")
	      (literal (author-string))))
	  (make sequence 
	    (literal (author-string))))))

  (element contrib
    ;; contrib�� ��� �������� ���� �����մϴ�.
    (make paragraph
      use: book-titlepage-verso-style
      (process-children)))

  (element othercredit
    ;; book�� �������� othercrdit ���ʿ�Ұ� ��� ���������� 
    ;; ���� �����մϴ�.
    (let ((in-group (have-ancestor? (normalize "authorgroup") (current-node)))
      	  (credit-contrib (select-elements (children (current-node))
                                            (normalize "contrib"))))
      (if (or #t (not in-group))
	  (make paragraph
	    space-after: (* %bf-size% %line-spacing-factor%)
	    (make sequence
	      ;; lang �Ӽ��� ������� othercredit�� 
	      ;; '������'�� �������� �մϴ�.
	      (literal "\U-B3C4;\U-C6B4;\U-C774;")
	      (literal "\no-break-space;")
	      (literal (author-string))
	      (process-node-list credit-contrib)))
	  (make sequence 
	    (literal (author-string))
	    (process-node-list credit-contrib)))))

  (element copyright
    (make paragraph
      use: book-titlepage-verso-style
    ;; �ѱ��� ����ȭ�� ������� ���� ǥ������
    ;; ���۱��� ��Ÿ���ϴ�.
      (literal "Copyright")
      (literal "\no-break-space;")
      (literal "\U-24D2;")
      (literal "\no-break-space;")
      (process-children)))

  (element (copyright year)
    ;; ���۱� ���� �⵵�� �������� ǥ���մϴ�.
    (make sequence
      (process-children)
      (if (not (last-sibling? (current-node)))
	  (literal ", ")
	  (literal (string-append " " "by" " ")))))

)

(define (auto-xref-indirect target 
			    #!optional
			    (xref-string (gentext-xref-strings target)))
  ;; ������ '1���� "����" ��' �������� ǥ���ϱ� ���� �κ��Դϴ�.
  ;; ������ 'the section called "title" in chaper 1' �����Դϴ�.
  ;; common/dbl1ko.dsl���� 'the section called "title"'��
  ;; '"����" ��'��, 'in'�� '��'�� �����Ǿ� �ֽ��ϴ�.
  ;;
  ;; ���⼭�� 'the section called "title"' �κа�
  ;; 'in chapter 1' �κ��� �ڹٲپ� 
  ;; '�� 1�� "����" ��' ���·� ����� �ݴϴ�.
  ;; �ҽ��� common/dbcommon.dsl �Դϴ�.

  (make sequence
    (auto-xref-direct target xref-string)
    (auto-xref-indirect-connector target)))

(define (auto-xref target 
		   #!optional (xref-string (gentext-xref-strings target))) 
  ;; ������ 'in'�� `chapter 1'�� ��ġ�� �ٲٰ� ��ĭ�� ���� 
  ;; '1����' ���¸� ����� �ݴϴ�.
  ;; ���� '1���� "����" ��' �������� ��ȯ�˴ϴ�.
  ;; �ҽ��� common/dbcommon.dsl �Դϴ�.
  (let ((source (current-node))
	(cont-blok (ancestor-member target (block-element-list)))
	(cont-sect (ancestor-member target (section-element-list)))
	(cont-comp (ancestor-member target (component-element-list)))
	(cont-divn (ancestor-member target (division-element-list)))
	(cont-book (ancestor-member target (book-element-list))))
    (make sequence
      (if (or (node-list=? cont-blok 
			   (ancestor-member source (block-element-list)))
	      (node-list=? cont-blok target)
	      (not (auto-xref-indirect? target cont-blok)))
	  (empty-sosofo)
	  (auto-xref-indirect cont-blok))
      (if (or (node-list=? cont-sect 
			   (ancestor-member source (section-element-list)))
	      (node-list=? cont-sect target)
	      (not (auto-xref-indirect? target cont-sect)))
	  (empty-sosofo)
	  (auto-xref-indirect cont-sect))
      (if (or (node-list=? cont-comp 
			   (ancestor-member source (component-element-list)))
	      (node-list=? cont-comp target)
	      (not (auto-xref-indirect? target cont-comp)))
	  (empty-sosofo)
	  (auto-xref-indirect cont-comp))
      (if (or (node-list=? cont-divn 
			   (ancestor-member source (division-element-list)))
	      (node-list=? cont-divn target)
	      (not (auto-xref-indirect? target cont-divn)))
	  (empty-sosofo)
	  (auto-xref-indirect cont-divn))
      (if (or (node-list=? cont-book 
			   (ancestor-member source (book-element-list)))
	      (node-list=? cont-book target)
	      (not (auto-xref-indirect? target cont-book)))
	  (empty-sosofo)
	  (auto-xref-indirect cont-book))
      (auto-xref-direct target xref-string)
)))

(define ($component-title$)
  ;; part, chapter, section�� ��쿡 ��µǴ� ������ �ٲ�
  ;; '1��' '1��' '1��' ���°� �ǵ��� �ϴ� �κ��Դϴ�. �� �ۿ� 
  ;; appendix ���� ���� �״�� '�η� A' �������� ������ �˴ϴ�.
  ;; �ҽ��� print/dbcompon.dsl �Դϴ�.
  (let* ((info (cond
		((equal? (gi) (normalize "appendix"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		((equal? (gi) (normalize "article"))
		 (node-list-filter-by-gi (children (current-node))
					 (list (normalize "artheader")
					       (normalize "articleinfo"))))
		((equal? (gi) (normalize "bibliography"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		((equal? (gi) (normalize "chapter"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		((equal? (gi) (normalize "dedication")) 
		 (empty-node-list))
		((equal? (gi) (normalize "glossary"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		((equal? (gi) (normalize "index"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		((equal? (gi) (normalize "preface"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		((equal? (gi) (normalize "reference"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		((equal? (gi) (normalize "setindex"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		(else
		 (empty-node-list))))
	 (exp-children (if (node-list-empty? info)
			   (empty-node-list)
			   (expand-children (children info) 
					    (list (normalize "bookbiblio") 
						  (normalize "bibliomisc")
						  (normalize "biblioset")))))
	 (parent-titles (select-elements (children (current-node)) (normalize "title")))
	 (info-titles   (select-elements exp-children (normalize "title")))
	 (titles        (if (node-list-empty? parent-titles)
			    info-titles
			    parent-titles))
	 (subtitles     (select-elements exp-children (normalize "subtitle"))))
    (make sequence
      (make paragraph
	font-family-name: %title-font-family%
	font-weight: 'bold
	font-size: (HSIZE 4)
	line-spacing: (* (HSIZE 4) %line-spacing-factor%)
	space-before: (* (HSIZE 4) %head-before-factor%)
	start-indent: 0pt
	first-line-start-indent: 0pt
	quadding: %component-title-quadding%
	heading-level: (if %generate-heading-level% 1 0)
	keep-with-next?: #t
	(if (string=? (element-label) "")
	    (empty-sosofo)
	    ;; ���⼭ part�� chaper, section�� ��� ������ �ٲߴϴ�.
	    (if  (or (equal? (gi) (normalize "part"))
		     (equal? (gi) (normalize "chapter"))
		     (equal? (gi) (normalize "section")))
		 (literal (element-label)
			  (gentext-element-name (current-node))
			  (gentext-label-title-sep (gi)))
		 (literal (gentext-element-name-space (current-node))
			  (element-label)
			  (gentext-label-title-sep (gi)))))
	(if (node-list-empty? titles)
	    (element-title-sosofo)
	    (with-mode component-title-mode
	      (make sequence
		(process-node-list titles)))))
      (make paragraph
	font-family-name: %title-font-family%
	font-weight: 'bold
	font-posture: 'italic
	font-size: (HSIZE 3)
	line-spacing: (* (HSIZE 3) %line-spacing-factor%)
	space-before: (* 0.5 (* (HSIZE 3) %head-before-factor%))
	space-after: (* (HSIZE 4) %head-after-factor%)
	start-indent: 0pt
	first-line-start-indent: 0pt
	quadding: %component-subtitle-quadding%
	keep-with-next?: #t
	(with-mode component-title-mode
	  (make sequence
	    (process-node-list subtitles)))))))

(mode hf-mode
  (element title
    ;; �� ������ ��ܿ� ������ ���� �κп��� '1��' ������
    ;; ����ϴ�.
    ;; �ҽ��� print/dbcompon.dsl �Դϴ�.
    (let* ((component (ancestor-member (current-node) 
				       (component-element-list)))
	   (chap (equal? (gi component) (normalize "chapter")))
	   (app (equal? (gi component) (normalize "appendix"))))
      (if %chap-app-running-heads%
	  (make sequence
	    ; ���⼭ ��� ������ �ٲߴϴ�.
	    (if (and chap
		     %chapter-autolabel%
		     (or %chap-app-running-head-autolabel%
			 (attribute-string (normalize "label") component)))
		(literal (element-label component)
			 (gentext-element-name component)
			 (gentext-label-title-sep (gi component)))
		(empty-sosofo))
	    (if (and app
		     %chapter-autolabel%
		     (or %chap-app-running-head-autolabel%
			 (attribute-string (normalize "label") component)))
		(literal (gentext-element-name-space component)
			 (element-label component) 
			 (gentext-label-title-sep (gi component)))
		(empty-sosofo))
	    (process-children-trim))
	  (empty-sosofo))))

  (element titleabbrev
    (if %chap-app-running-heads%
	(make sequence
	  (if (have-ancestor? (normalize "chapter"))
	      (literal (element-label (parent))
		       (gentext-element-name (parent))
		       (gentext-label-title-sep (gi (parent))))
	      (empty-sosofo))
	  (if (have-ancestor? (normalize "appendix"))
	      (literal (gentext-element-name-space (parent))
		       (element-label (parent))
		       (gentext-label-title-sep (gi (parent))))
	      (empty-sosofo))
	  (process-children-trim))
	(empty-sosofo)))

  (element refentrytitle
    (if %chap-app-running-heads%
	(process-children-trim)
	(empty-sosofo)))

  (element refdescriptor
    (if %chap-app-running-heads%
	(process-children-trim)
	(empty-sosofo)))

  (element refname
    (if %chap-app-running-heads%
	(process-children-trim)
	(empty-sosofo)))

  (element graphic
    (empty-sosofo))

  (element inlinegraphic
    (empty-sosofo))
)

</style-specification-body>
</style-specification>
<style-specification id="html" use="docbook">
<style-specification-body> 

 ;; ========================================
 ;;
 ;; ���⼭���ʹ� HTML�� ��Ÿ�Ͻ�Ʈ �κ��Դϴ�.
 ;;
 ;; ========================================

 ;; ========================================
 ;; 
 ;; Modular DocBook Sytlesheet���� �����ϴ�
 ;; ���� �Ķ���͵��� ���� �����մϴ�.  �� �κ��� 
 ;; LDP ��Ÿ�Ͻ�Ʈ�� ���� �����Ͽ����ϴ�(http://www.linuxdoc.org). 
 ;; �� �ۿ��� ��ô ���� �Ķ���͵��� �ֽ��ϴ�. �ڼ��� ������
 ;; ��Ÿ�Ͻ�Ʈ ������ �����Ͻñ� �ٶ��ϴ�.
 ;; http://nwalsh.com/docbook/dsssl/doc/
 ;;
 ;; �� �κ��� �ҽ��� html/dbparam.dsl �Դϴ�. 
 ;;

(define %html-ext%
  ;; ������ ������ Ȯ����� html�� �����մϴ�.
  ".html")

(define %html-header-tags% 
  ;; ���������� �ѱ��� ������ ��츦 �����ϱ� ����
  ;; ������ ������ ���Ե˴ϴ�.
   '(("META" ("http-equiv" "Content-Type")
             ("content" "text/html; charset=euc-kr")))
)

(define %root-filename%
  ;; ù��° �������� ���ϸ��� index�� �����մϴ�.
  "index")

(define (toc-depth nd)
  ;; '����'�� ���̸� �����մϴ�.
  4)

(define %generate-article-toc%
  ;; article���� ���ʰ� �������� �� �������� �����մϴ�.
  ;; �⺻���� ���ʰ� ������ �ʵ��� �Ǿ� �ֽ��ϴ�(#f). 
  ;; book�� ��쿡�� ���ʰ� ������ ���� �⺻���Դϴ�.
  #t)

(define %graphic-default-extension% 
  ;; graphic ���ʿ���� fileref �Ӽ�����,
  ;; %graphic-extensions%���� ������ Ȯ����� ���� ���� �׸� 
  ;; ���� �̸��� ������ �ڵ����� �̰��� ���õ� Ȯ����� ����մϴ�. 
  ;; �� ����� �׸��� �� ������ �������� ���·� ��ȯ�� �� �����մϴ�.
  ;; #f�� ���� �ָ� �� ����� �۵����� �ʰ� �˴ϴ�.
  #f)

(define %graphic-extensions% 
  ;; graphic ���ʿ���� fileref �Ӽ��� ����
  ;; �׸� ������ Ȯ����� �����մϴ�.
  '("eps" "epsf" "gif" "tif" "tiff" "jpg" "jpeg" "png"))

(define %generate-legalnotice-link%
  ;; ���� ����(legalnotice)�� �� �������� ���� �Ҿ��� 
  ;; ������ �����մϴ�.
  #f)

(define %admon-graphics%
  ;; caution�̳� warning ���� �׸� �������� ����� ǥ���� ������
  ;; �����մϴ�. 
  #f)

(define %admon-graphics-path%
  ;; %admon-graphics%���� ����� �׸� ������ ��θ� �����մϴ�.
  "../images/")

(define %generate-part-toc%
  ;; part���� ���ʸ� �������� �����մϴ�.
  #t)

(define %shade-verbatim%
  ;; programlisting ���� verbatim ȯ�濡����
  ;; ����� ��Ӱ� ���ݴϴ�.
  #t)

(define %use-id-as-filename%
  ;; id �Ӽ��� ���� �� ������ �̸��� �˴ϴ�.
  #t)

(define %section-autolabel%
  ;; ���� 1.1.1. �� ���� ������ ��ȣ �ű��� �մϴ�.
  #t)

(define %callout-graphics%
  ;; calloutlist�� �׸� �����ڸ� ������� �ʽ��ϴ�.
  #f)

(define %funcsynopsis-decoration%
  ;; funcsynopsis�� ���� ���� ���ݴϴ�.
  #t)

 ;; ======================================
 ;;
 ;; ��Ÿ�Ͻ�Ʈ�� �Ķ���ʹ� �ƴ����� ��� ��������
 ;; ���ذ��� ���� �����ϴ� �κ��Դϴ�.

(declare-characteristic preserve-sdata?
  ;; character entity�� �״�� ��µǾ� ������ ������ �ذ��� �ݴϴ�.
  ;; �� �������� ������(polsci@hitel.net)���� ������ �ּ̽��ϴ�.
  "UNREGISTERED::James Clark//Characteristic::preserve-sdata?"
  #f)

(define (chunk-skip-first-element-list)
  ;; aticle���� ù��° ���� title page�� �پ� ������ �ʵ��� �մϴ�.
  '())

(define (list-element-list)
  ;; ���ʰ� ������ �� ���ʿ��� �������Ⱑ �ٴ� ���׸� ���ذ��ϴ�.
  '())


 ;; =======================================
 ;;
 ;; ���⼭���ʹ� ���� �ڿ������� �ѱ� ǥ���� ����
 ;; Modular DocBook Stylesheet�� HTML �κ��� �����մϴ�.
 ;;

(element emphasis 
  ;; emphasis�� ������ ���� �۾�ü�� ǥ���ϵ��� �մϴ�.
  ;; �⺻���� ���Ÿ�ü�Դϴ�.
  ;; �� �κ��� Chung, Ha-Nyung(alita@kldp.org)����
  ;; ������ �ּ̽��ϴ�.
  ;; �ҽ��� html/dbinline.dsl �Դϴ�.
  ($bold-seq$))

(define (article-titlepage-recto-elements)
  ;; article�� ù ���������� ��Ÿ�� ���ʿ�ҵ���
  ;; �����մϴ�. editor�� othercredit�� �߰��Ǿ����ϴ�.
  ;; �ҽ��� html/dbttlpg.dsl �Դϴ�.
  (list (normalize "title")
	(normalize "subtitle")
	(normalize "corpauthor")
	(normalize "authorgroup")
	(normalize "author")
	(normalize "editor")
	(normalize "othercredit")
	(normalize "pubdate")
	(normalize "copyright")
	(normalize "abstract")
	(normalize "legalnotice")
	(normalize "revhistory")
	(normalize "releaseinfo")
))

(define (book-titlepage-recto-elements)
  ;; book�� ù ���������� ��Ÿ�� ���ʿ�ҵ���
  ;; �����մϴ�. editor�� othercredit�� �߰��Ǿ����ϴ�.
  ;; �ҽ��� html/dbttlpg.dsl �Դϴ�.
  (list (normalize "title")
	(normalize "subtitle")
	(normalize "graphic")
	(normalize "mediaobject")
	(normalize "corpauthor")
	(normalize "authorgroup")
	(normalize "author")
	(normalize "editor")
	(normalize "othercredit")	
	(normalize "pubdate")
	(normalize "copyright")
	(normalize "abstract")
	(normalize "legalnotice")
	(normalize "revhistory")
	(normalize "releaseinfo")
))

(mode book-titlepage-recto-mode

  (element editor
    ;; book�� ù ���������� editor�� ��� ���������� ���� �����մϴ�.
    ;; �ҽ��� html/dbttlpg.dsl �Դϴ�.
    (let ((editor-name (author-string))
	  (editor-affil (select-elements (children (current-node)) 
					 (normalize "affiliation"))))
      (make sequence
	;; lang �Ӽ��� ������� 'edited by'�� 
	;; '������'�� ������ �մϴ�. 
	;; KLDP������ 'edited by'�� �������� �ʴ� ����
	;; ��Ģ���� �ϰ� �����Ƿ� �̺κ��� ��µ��� �ʵ��� 
	;; �ּ�ó���Ͽ����ϴ�.
	;; (if (first-sibling?) 
	;;     (make element gi: "H4"
	;;           attributes: (list (list "CLASS" "EDITEDBY"))
	;;           (literal "\U-C5EE;\U-C740;\U-C774;"))
	;;     (empty-sosofo))
	(make element gi: "H3"
	      attributes: (list (list "CLASS" (gi)))
	      (literal editor-name))
              (process-node-list editor-affil))))

 (element contrib
    ;; othercredit�� ���� ���Ǵ� contrib�� ��� ���������� ����
    ;; �����մϴ�.
    (make sequence
      (make element gi: "SPAN"
            attributes: (list (list "CLASS" (gi)))
            (process-children))))

  (element othercredit
    ;; book�� ù ���������� othercredit�� ��� ���������� ���� 
    ;; �����մϴ�.
    (let ((credit-name (author-string))
	  (credit-contrib (select-elements (children (current-node))
                                            (normalize "contrib")))
	  (credit-affil (select-elements (children (current-node)) 
					 (normalize "affiliation"))))
      (make sequence
	;; lang �Ӽ��� ������� othercredit�� 
	;; `������'�� ������ �մϴ�. 
	;; KLDP������ othercredit�� �������� �ʴ� ����
	;; ��Ģ���� �ϰ� �����Ƿ� �̺κ��� ��µ��� �ʵ��� 
	;; �ּ�ó���Ͽ����ϴ�.
	;;	(if (first-sibling?) 
	;;	    (make element gi: "H4"
	;;		  attributes: (list (list "CLASS" "EDITEDBY"))
	;;		  (literal "\U-B3C4;\U-C6B4;\U-C774;"))
	;;	    (empty-sosofo))
	(make element gi: "H3"
	      attributes: (list (list "CLASS" (gi)))
	      ;; othercredit�� contrib�� �������� �մϴ�.  
	      (literal credit-name))
	      (process-node-list credit-contrib)
              (process-node-list credit-affil))))

)

(mode article-titlepage-recto-mode
  (element editor
    ;; article�� ù ���������� editor�� ��� ���������� ���� 
    ;; �����մϴ�.
    ;; �ҽ��� html/dbttlpg.dsl �Դϴ�.
    (let ((editor-name (author-string))
	  (editor-affil (select-elements (children (current-node)) 
					 (normalize "affiliation"))))
      (make sequence
	;; lang �Ӽ��� ������� 'edited by'�� '������'��
	;; �������� �մϴ�.
	;; KLDP������ 'edited by'�� �������� ���� ���� ��Ģ����
	;; �ϹǷ� �� �κ��� �ּ� ó���Ͽ����ϴ�.
	;;	(if (first-sibling?) 
	;;	    (make element gi: "H4"
	;;		  attributes: (list (list "CLASS" "EDITEDBY"))
	;;		  (literal "\U-C5EE;\U-C740;\U-C774;"))
	;;	    (empty-sosofo))
	(make element gi: "H3"
	      attributes: (list (list "CLASS" (gi)))
	      (literal editor-name))
              (process-node-list editor-affil))))

 (element contrib
    ;; othercredit�� ���� ���Ǵ� contrib�� ��� ���������� ����
    ;; �����մϴ�.
    (make sequence
      (make element gi: "SPAN"
            attributes: (list (list "CLASS" (gi)))
            (process-children))))

  (element othercredit
    ;; article�� ù ���������� othercredit�� ��� ���������� ���� 
    ;; �����մϴ�.
    (let ((credit-name (author-string))
	  (credit-contrib (select-elements (children (current-node))
                                            (normalize "contrib")))
	  (credit-affil (select-elements (children (current-node)) 
					 (normalize "affiliation"))))
      (make sequence
	;; lang �Ӽ��� ������� othercredit�� '������'��
	;; ������ �մϴ�.
	;; KLDP������ othercredit�� �������� ���� ���� �⺻����
	;; �ϹǷ� �� �κ��� �ּ�ó���Ͽ����ϴ�.
	;;	(if (first-sibling?) 
	;;	    (make element gi: "H4"
	;;		  attributes: (list (list "CLASS" "EDITEDBY"))
	;;		  (literal "\U-B3C4;\U-C6B4;\U-C774;"))
	;;	    (empty-sosofo))
	(make element gi: "H3"
	      attributes: (list (list "CLASS" (gi)))
	      ;; othercredit�� contrib�� �������� �մϴ�.
	      (literal credit-name))
	      (process-node-list credit-contrib)
              (process-node-list credit-affil))))

)

(define (titlepage-recto-copyright #!optional (node (current-node)))
  ;; lang �Ӽ��� ������� ���۱� ������ ���� ���·�
  ;; ǥ���մϴ�.
  ;; �ҽ��� html/dbttlpg.dsl �Դϴ�.
  (let ((years (select-elements (descendants node)
				(normalize "year")))
	(holders (select-elements (descendants node)
				  (normalize "holder")))
	(legalnotice (select-elements (children (parent node))
				      (normalize "legalnotice"))))
    (make element gi: "P"
	  attributes: (list
		       (list "CLASS" (gi)))
	  (if (and %generate-legalnotice-link%
		   (not nochunks)
		   (not (node-list-empty? legalnotice)))
	      (make sequence
		(make element gi: "A"
		      attributes: (list 
				   (list "HREF" 
					 ($legalnotice-link-file$
					  (node-list-first legalnotice))))
		      (literal "Copyright"))
		(literal " ")
		(dingbat-sosofo "copyright")
		(literal " ")
		(process-node-list years)
		(literal (string-append " " "by" " "))
		(process-node-list holders))
	      (make sequence
		(literal "Copyright")
		(literal " ")
		(dingbat-sosofo "copyright")
		(literal " ")
		(process-node-list years)
		(literal (string-append " " "by" " "))
		(process-node-list holders))))))

(define (auto-xref-indirect target 
			    #!optional
			    (xref-string (gentext-xref-strings target)))
  ;; ������ '1���� "����" ��' �������� ǥ���ϱ� ���� �κ��Դϴ�.
  ;; ������ 'the section called "title" in chaper 1' �����Դϴ�.
  ;; common/dbl1ko.dsl���� 'the section called "title"'��
  ;; '"����" ��'��, 'in'�� '��'�� �����Ǿ� �ֽ��ϴ�.
  ;;
  ;; ���⼭�� 'the section called "title"' �κа�
  ;; 'in chapter 1' �κ��� �ڹٲپ� 
  ;; '�� 1�� "����" ��' ���·� ����� �ݴϴ�.
  ;; �ҽ��� common/dbcommon.dsl �Դϴ�.
  (make sequence
    (auto-xref-direct target xref-string)
    (auto-xref-indirect-connector target)))

(define (auto-xref target 
		   #!optional (xref-string (gentext-xref-strings target)))
  ;; ������ 'in'�� 'chapter 1'�� ��ġ�� �ٲٰ� ��ĭ�� ���� 
  ;; '1����' ���¸� ����� �ݴϴ�.
  ;; ���� '1���� "����" ��' �������� ��ȯ�˴ϴ�.
  ;; �ҽ��� common/dbcommon.dsl �Դϴ�.
  (let ((source (current-node))
	(cont-blok (ancestor-member target (block-element-list)))
	(cont-sect (ancestor-member target (section-element-list)))
	(cont-comp (ancestor-member target (component-element-list)))
	(cont-divn (ancestor-member target (division-element-list)))
	(cont-book (ancestor-member target (book-element-list))))
    (make sequence
      (if (or (node-list=? cont-blok 
			   (ancestor-member source (block-element-list)))
	      (node-list=? cont-blok target)
	      (not (auto-xref-indirect? target cont-blok)))
	  (empty-sosofo)
	  (auto-xref-indirect cont-blok))
      (if (or (node-list=? cont-sect 
			   (ancestor-member source (section-element-list)))
	      (node-list=? cont-sect target)
	      (not (auto-xref-indirect? target cont-sect)))
	  (empty-sosofo)
	  (auto-xref-indirect cont-sect))
      (if (or (node-list=? cont-comp 
			   (ancestor-member source (component-element-list)))
	      (node-list=? cont-comp target)
	      (not (auto-xref-indirect? target cont-comp)))
	  (empty-sosofo)
	  (auto-xref-indirect cont-comp))
      (if (or (node-list=? cont-divn 
			   (ancestor-member source (division-element-list)))
	      (node-list=? cont-divn target)
	      (not (auto-xref-indirect? target cont-divn)))
	  (empty-sosofo)
	  (auto-xref-indirect cont-divn))
      (if (or (node-list=? cont-book 
			   (ancestor-member source (book-element-list)))
	      (node-list=? cont-book target)
	      (not (auto-xref-indirect? target cont-book)))
	  (empty-sosofo)
	  (auto-xref-indirect cont-book))
      (auto-xref-direct target xref-string)
)))

(define ($component-title$ #!optional (titlegi "H1") (subtitlegi "H2"))
  ;; part, chapter, section�� ��쿡 ��µǴ� ������ �ٲ�
  ;; '1��' '1��' '1��' ���°� �ǵ��� �ϴ� �κ��Դϴ�. �� �ۿ� 
  ;; appendix ���� ���� �״�� '�η� A' �������� ������ �˴ϴ�.
  ;; �ҽ��� html/dbcompon.dsl �Դϴ�.
  (let* ((info (cond
		((equal? (gi) (normalize "appendix"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		((equal? (gi) (normalize "article"))
		 (node-list-filter-by-gi (children (current-node))
					 (list (normalize "artheader")
					       (normalize "articleinfo"))))
		((equal? (gi) (normalize "bibliography"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		((equal? (gi) (normalize "chapter"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		((equal? (gi) (normalize "dedication"))
		 (empty-node-list))
		((equal? (gi) (normalize "glossary"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		((equal? (gi) (normalize "index"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		((equal? (gi) (normalize "preface"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		((equal? (gi) (normalize "reference"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		((equal? (gi) (normalize "setindex"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		(else
		 (empty-node-list))))
	 (exp-children (if (node-list-empty? info)
			   (empty-node-list)
			   (expand-children (children info) 
					    (list (normalize "bookbiblio") 
						  (normalize "bibliomisc")
						  (normalize "biblioset")))))
	 (parent-titles (select-elements (children (current-node)) (normalize "title")))
	 (info-titles   (select-elements exp-children (normalize "title")))
	 (titles        (if (node-list-empty? parent-titles)
			    info-titles
			    parent-titles))
	 (subtitles     (select-elements exp-children (normalize "subtitle"))))
    (make sequence
      (make element gi: titlegi
	    (make element gi: "A"
		  attributes: (list (list "NAME" (element-id)))
		  ;; ���⼭ part�� chaper, section�� ��� ������ �ٲߴϴ�.
		  (if (and %chapter-autolabel%
			   (or (equal? (gi) (normalize "part"))
			       (equal? (gi) (normalize "chapter"))
			       (equal? (gi) (normalize "section"))))
		      (literal (element-label (current-node))
			       (gentext-element-name (gi))
			       (gentext-label-title-sep (gi)))
		      (empty-sosofo))
		  (if (and %chapter-autolabel%
			   (or (equal? (gi) (normalize "appendix"))))
		      (literal (gentext-element-name-space (gi))
			       (element-label (current-node))
			       (gentext-label-title-sep (gi)))
		      (empty-sosofo))
		  (if (node-list-empty? titles)
		      (element-title-sosofo)
		      (with-mode title-mode
			(process-node-list titles)))))
      (if (node-list-empty? subtitles) 
	  (empty-sosofo)
	  (with-mode subtitle-mode
	    (make element gi: subtitlegi
		  (process-node-list subtitles)))))))

(define (nav-context-sosofo elemnode)
  ;; �� ������ ��ܿ� ������ ���� �κп��� '1��' ������
  ;; ����ϴ�.
  ;; �ҽ��� html/navig.dsl �Դϴ�.
  (let* ((component     (ancestor-member elemnode
					 (append (book-element-list)
						 (division-element-list)
						 (component-element-list))))
	 (context-text  (inherited-dbhtml-value elemnode "context-text")))
    (if (and context-text (not (string=? context-text "")))
	(literal context-text)
	(if (equal? (element-label component) "")
	    (make sequence
	      (element-title-sosofo component))

	    (if (equal? (gi component) (normalize "chapter"))
		(make sequence
		  (element-label-sosofo component)
		  (if (and (equal? (gi component) (normalize "appendix"))
			   (or (equal? (gi elemnode) (normalize "sect1"))
			       (equal? (gi elemnode) (normalize "section")))
			   (equal? (gi (parent component)) (normalize "article")))
		      (empty-sosofo)
		      (literal (gentext-element-name (gi component))))
		  (literal (gentext-label-title-sep (gi component)))
		  (element-title-sosofo component))
		(make sequence
		  (if (and (equal? (gi component) (normalize "appendix"))
			   (or (equal? (gi elemnode) (normalize "sect1"))
			       (equal? (gi elemnode) (normalize "section")))
			   (equal? (gi (parent component)) (normalize "article")))
		      (empty-sosofo)
		      (literal (gentext-element-name-space (gi component))))
		  (element-label-sosofo component)
		  (literal (gentext-label-title-sep (gi component)))
		  (element-title-sosofo component)))))))

;; (define ($informal-object$ #!optional (rule-before? #f) (rule-after? #f))
;;   ;; informal object�� align �Ӽ��� ����� �� �ֵ��� ���ݴϴ�.
;;   ;; �̸� ���� �׸��̳� ǥ�� ��ġ�� ����, ������, �߾����� ������ ��
;;   ;; �ֽ��ϴ�.
;;   ;; �� �κ��� Kang, Joonsun(bigbear@ece.skku.ac.kr)���� ���� 
;;   ;; �ּ̽��ϴ�.
;;   (let ((id (element-id)))
;;     (cond                                           
;;      ((equal? (attribute-string "role") "center")       
;;       (make element gi: "DIV"
;; 	    attributes: (list
;; 			 (list "CLASS" (gi))
;; 			 (list "ALIGN" "CENTER"))                
;; 	 (if id
;; 	     (make element gi: "A"
;; 		   attributes: (list (list "NAME" id))
;; 		   (empty-sosofo))
;; 	     (empty-sosofo))
;; 	 (if %spacing-paras%
;; 	     (make element gi: "P" (empty-sosofo))
;; 	     (empty-sosofo))
;; 	 (if rule-before?
;; 	     (make empty-element gi: "HR")
;; 	     (empty-sosofo))
;; 	 (process-children)
;; 	 (if rule-after?
;; 	     (make empty-element gi: "HR")
;; 	     (empty-sosofo))
;; 	 (if %spacing-paras%
;; 	     (make element gi: "P" (empty-sosofo))
;; 	     (empty-sosofo))))
;;      ((equal? (attribute-string "role") "left")   
;;       (make element gi: "DIV"
;; 	    attributes: (list
;; 			 (list "CLASS" (gi))
;; 			 (list "ALIGN" "LEFT"))         
;; 	    (if id
;; 		(make element gi: "A"
;; 		      attributes: (list (list "NAME" id))
;; 		      (empty-sosofo))
;; 		(empty-sosofo))
;; 	    (if %spacing-paras%
;; 		(make element gi: "P" (empty-sosofo))
;; 		(empty-sosofo))
;; 	    (if rule-before?
;; 		(make empty-element gi: "HR")
;; 		(empty-sosofo))
;; 	    (process-children)
;; 	    (if rule-after?
;; 		(make empty-element gi: "HR")
;; 		(empty-sosofo))
;; 	    (if %spacing-paras%
;; 		(make element gi: "P" (empty-sosofo))
;; 		(empty-sosofo))))
;;      ((equal? (attribute-string "role") "right")    
;;       (make element gi: "DIV"
;; 	    attributes: (list
;; 			 (list "CLASS" (gi))
;; 			 (list "ALIGN" "RIGHT"))             
;; 	    (if id
;; 		(make element gi: "A"
;; 		      attributes: (list (list "NAME" id))
;; 		      (empty-sosofo))
;; 		(empty-sosofo))
;; 	    (if %spacing-paras%
;; 		(make element gi: "P" (empty-sosofo))
;; 		(empty-sosofo))
;; 	    (if rule-before?
;; 		(make empty-element gi: "HR")
;; 		(empty-sosofo))
;; 	    (process-children)
;; 	    (if rule-after?
;; 		(make empty-element gi: "HR")
;; 		(empty-sosofo))
;; 	    (if %spacing-paras%
;; 		(make element gi: "P" (empty-sosofo))
;; 		(empty-sosofo))))
;;      (else                                    
;;       (make element gi: "DIV"
;; 	    attributes: (list
;; 			 (list "ALIGN" "CENTER"))    
;; 	    (if id
;; 		(make element gi: "A"
;; 		      attributes: (list (list "NAME" id))
;; 		      (empty-sosofo))
;; 		(empty-sosofo))
;; 	    (if %spacing-paras%
;; 		(make element gi: "P" (empty-sosofo))
;; 		(empty-sosofo))
;; 	    (if rule-before?
;; 		(make empty-element gi: "HR")
;; 		(empty-sosofo))
;; 	    (process-children)
;; 	    (if rule-after?
;; 		(make empty-element gi: "HR")
;; 		(empty-sosofo))
;; 	    (if %spacing-paras%
;; 		(make element gi: "P" (empty-sosofo))
;; 		(empty-sosofo))))
;; )))
;;

;; (mode book-titlepage-recto-mode
;;   ;; address �ȿ��� email�� ������ ��ũ�� �����ϵ��� ���ݴϴ�.
;;   ;; �� �κ��� Kang, Joonsun(bigbear@ece.skku.ac.kr)���� ���� 
;;   ;; �ּ̽��ϴ�.
;;   (element address
;;     (make element gi: "P"
;;       (make element gi: "PRE"
;;          attributes: (list (list "CLASS" (gi))))))
;; )

(define (gentext-ko-nav-prev prev)
  (make sequence (literal "����")))
(define (gentext-ko-nav-next next)
  (make sequence (literal "����")))
(define (gentext-ko-nav-up up)
  (make sequence (literal "����")))
(define (gentext-ko-nav-home home)
  (make sequence (literal "Ȩ")))

(define %stylesheet% "kldp.css") ;; kldp.css���� wkpark @ kldp.org
(define ($table-width$) "600")
(define ($shade-verbatim-attr$)
  ;; REFENTRY shade-verbatim-attr
  ;; PURP Attributes used to create a shaded verbatim environment.
  ;; DESC
  ;; See '%shade-verbatim%'
  ;; /DESC
  ;; AUTHOR N/A
  ;; /REFENTRY
  (list
   (list "BORDER" "0")
   (list "ALIGN" "CENTER")
   (list "CELLPADDING" "0")
   (list "BGCOLOR" "#D1D1D7")
   (list "WIDTH" "600")))

</style-specification-body>
</style-specification>
<external-specification id="docbook" document="docbook.dsl">
</style-sheet>
