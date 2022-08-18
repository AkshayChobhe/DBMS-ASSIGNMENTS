CONSTRAINTS

C:\Program Files\MySQL\MySQL Server 8.0\bin>mysql -u root -p
Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 19
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| ass1               |
| assn1              |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
8 rows in set (0.01 sec)

mysql> use assn1
Database changed

mysql> create table student1(Roll_No int PRIMARY KEY AUTO_INCREMENT,Name varchar(25) UNIQUE,Mobile_No int,City varchar(20) DEFAULT "Pune",Salary int NOT NULL);
Query OK, 0 rows affected (0.09 sec)

mysql> insert into student1(Name,Mobile_No,City,Salary) values("Aditya",979564,"Pune",50000);
Query OK, 1 row affected (3.67 sec)

mysql> select * from student1;
+---------+--------+-----------+------+--------+
| Roll_No | Name   | Mobile_No | City | Salary |
+---------+--------+-----------+------+--------+
|       1 | Aditya |    979564 | Pune |  50000 |
+---------+--------+-----------+------+--------+
1 row in set (0.00 sec)

mysql> insert into student1(Name,Mobile_No,City,Salary) values("Aditya",979564,"Pune",NULL);
ERROR 1048 (23000): Column 'Salary' cannot be null
mysql> insert into student1(Name,Mobile_No,City,Salary) values("Aditya",979564,"Pune",4500);
ERROR 1062 (23000): Duplicate entry 'Aditya' for key 'student1.Name'
mysql> insert into student1(Name,Mobile_No,City,Salary) values("Aman",979564,60000);
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into student1(Name,Mobile_No,Salary) values("Aman",979564,60000);
Query OK, 1 row affected (0.02 sec)

mysql> select * from student1;
+---------+--------+-----------+------+--------+
| Roll_No | Name   | Mobile_No | City | Salary |
+---------+--------+-----------+------+--------+
|       1 | Aditya |    979564 | Pune |  50000 |
|       3 | Aman   |    979564 | Pune |  60000 |
+---------+--------+-----------+------+--------+
2 rows in set (0.00 sec)

mysql> alter table student1 add CONSTRAINT MyUniqueConstraint CHECK(Salary>55000);
ERROR 3819 (HY000): Check constraint 'MyUniqueConstraint' is violated.
mysql> alter table student1 add CONSTRAINT MyUniqueConstraint CHECK(Salary>50000);
ERROR 3819 (HY000): Check constraint 'MyUniqueConstraint' is violated.
mysql> alter table student1 add CONSTRAINT MyUniqueConstraint CHECK(Salary>40000);
Query OK, 2 rows affected (0.26 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from student1;
+---------+--------+-----------+------+--------+
| Roll_No | Name   | Mobile_No | City | Salary |
+---------+--------+-----------+------+--------+
|       1 | Aditya |    979564 | Pune |  50000 |
|       3 | Aman   |    979564 | Pune |  60000 |
+---------+--------+-----------+------+--------+
2 rows in set (0.00 sec)

mysql> insert into student1(Name,Mobile_No,Salary) values("Akshay",979564,30000);
ERROR 3819 (HY000): Check constraint 'MyUniqueConstraint' is violated.
mysql> exit
Bye

C:\Program Files\MySQL\MySQL Server 8.0\bin>
