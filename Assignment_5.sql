SQL*Plus: Release 21.0.0.0.0 - Production on Wed Sep 28 23:37:01 2022
Version 21.3.0.0.0

Copyright (c) 1982, 2021, Oracle.  All rights reserved.

Enter user-name: System
Enter password:
Last Successful login time: Wed Sep 28 2022 23:36:05 +05:30

Connected to:
Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

SQL> CREATE TABLE Student_Marks(Student_Name varchar2(255),Total_Marks number);

Table created.

SQL> CREATE TABLE Student_Result(Student_Id number,Student_Name varchar2(255),Category varchar2(30));

Table created.

SQL> SET SERVEROUTPUT ON
SQL> CREATE OR REPLACE PROCEDURE Result (Student_Id IN number, Student_Name IN varchar2,Marks IN number) AS
        BEGIN
        IF (Marks<=1500 and Marks>=990) THEN
        dbms_output.put_line('Distinction !');
        INSERT INTO Student_Result VALUES (Student_Id,Student_Name,'Distinction !');
        ELSIF (Marks<=989 and Marks>=900) THEN
        dbms_output.put_line('First Class Pass');
        INSERT INTO Student_Result VALUES (Student_Id,Student_Name,'First Class Pass');
        ELSIF (Marks<=899 and Marks>825) THEN
        dbms_output.put_line('Higher Second Class Pass');
        INSERT INTO Student_Result VALUES(Student_Id,Student_Name,'Higher Second Class Pass');
        ELSIF (Marks<=825 and Marks>500) THEN
        dbms_output.put_line('Lower Second Class Pass');
        INSERT INTO Student_Result VALUES(Student_Id,Student_Name,'Lower Second Class Pass');
        ELSE
        dbms_output.put_line('Failed !');
        INSERT INTO Student_Result VALUES(Student_Id,Student_Name,'Failed !');
        END IF;
        INSERT INTO Student_Marks VALUES(Student_Name,Marks);
        END Result;
        /

Procedure created.

SQL> BEGIN
    Result(01,'Akshay',1300);
    Result(02,'Shubham',970);
    Result(03,'Aditya',880);
    Result(04,'Murli',700);
    Result(05,'Akshat',450);
    END;
    /
    
PL/SQL procedure successfully completed.

SQL> SELECT * FROM Student_Marks;

STUDENT_NAME
--------------------------------------------------------------------------------
TOTAL_MARKS
-----------
Krishna
       1300

Vasudev
        970

Govind
        880


STUDENT_NAME
--------------------------------------------------------------------------------
TOTAL_MARKS
-----------
Murlidhar
        700

Shyam
        450


SQL> SELECT * FROM student_result;

STUDENT_ID
----------
STUDENT_NAME
--------------------------------------------------------------------------------
CATEGORY
------------------------------
         1
Krishna
Distinction !

         2
Vasudev
First Class Category

STUDENT_ID
----------
STUDENT_NAME
--------------------------------------------------------------------------------
CATEGORY
------------------------------

         3
Govind
Higher Second Class Category

         4
Murlidhar

STUDENT_ID
----------
STUDENT_NAME
--------------------------------------------------------------------------------
CATEGORY
------------------------------
Lower Second Class Category

         5
Shyam
Failed !


SQL> EXIT
Disconnected from Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0
