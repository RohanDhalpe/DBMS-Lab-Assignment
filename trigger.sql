
Enter password:

Connected to:
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

SQL> create table library(book_name varchar(50),status varchar(50));

Table created.

SQL> create table library_audit(book_name varchar(30),todaydate date,old_status varchar(50),new_status varchar(50),action varchar(50));

Table created.

SQL> set serveroutput on;

SQL> edit triggerr
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 create or replace trigger trig
    after
    insert or update or delete
    on library
    for each row
    enable
  
    begin
   if inserting then
   insert into library_audit values(:new.book_name,sysdate,:old.status,:new.status,'insert');
 
   elsif updating then
   insert into library_audit values(:old.book_name,sysdate,:old.status,:new.status,'update');
 
   elseif
   insert into library_audit values(:old.book_name,sysdate,:old.status,:new.status,'delete');
   end;
   /

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

SQL> @triggerr;

Trigger created.

SQL> insert into library values('DBMS','present');

1 row created.

SQL> select *from library;

BOOK_NAME
--------------------------------------------------
STATUS
--------------------------------------------------
DBMS
present


SQL> select *from library_audit;

BOOK_NAME                      TODAYDATE
------------------------------ ---------
OLD_STATUS
--------------------------------------------------
NEW_STATUS
--------------------------------------------------
ACTION
--------------------------------------------------
DBMS                           14-NOV-22

present
insert
