Microsoft Windows [Version 10.0.19044.2006]
(c) Microsoft Corporation. All rights reserved.

C:\Users\rohan gajanan dhalpe>sqlplus

SQL*Plus: Release 11.2.0.2.0 Production on Mon Nov 14 11:53:24 2022

Copyright (c) 1982, 2014, Oracle.  All rights reserved.

Enter user-name: system
Enter password:

Connected to:
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

SQL> drop table old_rollcall;

Table dropped.

SQL> drop table new_rollcall;

Table dropped.

SQL> create table old_rollcall(rno int, name varchar(20),status varchar(20));

Table created.

SQL> create table new_rollcall(rno int, name varchar(20),status varchar(20));

Table created.

SQL> insert into old_rollcall values(1,'rohan','present');

1 row created.

SQL> insert into old_rollcall values(2,'Yogesh','present');

1 row created.

SQL> insert into old_rollcall values(3,'aniket','present');

1 row created.

SQL> insert into new_rollcall values(4,'suyash','present');

1 row created.

SQL> insert into new_rollcall values(5,'sarthak','present');

1 row created.



SQL> select *from old_rollcall;

       RNO NAME                 STATUS
---------- -------------------- --------------------
         1 rohan                present
         2 Yogesh               present
         3 aniket               present

SQL> select *from new_rollcall;

       RNO NAME                 STATUS
---------- -------------------- --------------------
         4 suyash               present
         5 sarthak              present


SQL> set serveroutput on;
SQL> edit implicitcursorrohan.sql


---------------------------------------------------------------
 begin                                                         
 update old_RollCall set status='Present' where rno=3;
if sql%found then
	dbms_output.put_line('Updated');
end if;
if sql%notfound then
	dbms_output.put_line(' not Updated');
end if;
if sql%rowcount=0 then
	dbms_output.put_line('not Updated');
end if;
end;
/
---------------------------------------------------------------



SQL>  @implicitcursorrohan;
updated succesfully

PL/SQL procedure successfully completed.

SQL> select *from new_rollcall;

       RNO NAME                 STATUS
---------- -------------------- --------------------
         4 suyash               present
         5 sarthak              present

SQL> select *from old_rollcall;

       RNO NAME                 STATUS
---------- -------------------- --------------------
         1 rohan                absent
         2 Yogesh               present
         3 aniket               present

SQL>
