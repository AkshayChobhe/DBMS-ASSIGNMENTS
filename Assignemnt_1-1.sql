Microsoft Windows [Version 10.0.19044.1706]
(c) Microsoft Corporation. All rights reserved.

C:\Users\SAI>cd C:\Program Files\MySQL\MySQL Server 8.0\bin

C:\Program Files\MySQL\MySQL Server 8.0\bin>mysql -u root -p
Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 18
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
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
7 rows in set (0.81 sec)

mysql> create database assn1;
Query OK, 1 row affected (0.43 sec)

mysql> use assn1
Database changed
mysql> create table TE_Books(Id int,Subject varchar(30),Author varchar(20),Publication varchar(20),Price float);
Query OK, 0 rows affected (1.35 sec)

mysql> select * from TE_Books;
Empty set (0.11 sec)

mysql> insert into TE_Books values(100,"SPOS","VAM","Technical",300),(101,"DBMS","VUU","Tech_Knowledge",250),(102,"TOC","YSK","Tech_Neo",400),(103,"CNS","SS","Tech_Breathe",275),(104,"SPM","DDR","Tel",350);
Query OK, 5 rows affected (0.22 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from TE_Books;
+------+---------+--------+----------------+-------+
| Id   | Subject | Author | Publication    | Price |
+------+---------+--------+----------------+-------+
|  100 | SPOS    | VAM    | Technical      |   300 |
|  101 | DBMS    | VUU    | Tech_Knowledge |   250 |
|  102 | TOC     | YSK    | Tech_Neo       |   400 |
|  103 | CNS     | SS     | Tech_Breathe   |   275 |
|  104 | SPM     | DDR    | Tel            |   350 |
+------+---------+--------+----------------+-------+
5 rows in set (0.04 sec)

mysql> select Subject from TE_Books;
+---------+
| Subject |
+---------+
| SPOS    |
| DBMS    |
| TOC     |
| CNS     |
| SPM     |
+---------+
5 rows in set (0.00 sec)

mysql> select Price from TE_Books;
+-------+
| Price |
+-------+
|   300 |
|   250 |
|   400 |
|   275 |
|   350 |
+-------+
5 rows in set (0.00 sec)

mysql> select * from TE_Books where Price<300;
+------+---------+--------+----------------+-------+
| Id   | Subject | Author | Publication    | Price |
+------+---------+--------+----------------+-------+
|  101 | DBMS    | VUU    | Tech_Knowledge |   250 |
|  103 | CNS     | SS     | Tech_Breathe   |   275 |
+------+---------+--------+----------------+-------+
2 rows in set (0.06 sec)

mysql> select * from TE_Books where (Price<300) & (Id<103);
+------+---------+--------+----------------+-------+
| Id   | Subject | Author | Publication    | Price |
+------+---------+--------+----------------+-------+
|  101 | DBMS    | VUU    | Tech_Knowledge |   250 |
+------+---------+--------+----------------+-------+
1 row in set (0.08 sec)

mysql> delete from TE_Books where Id=104;
Query OK, 1 row affected (0.08 sec)

mysql> select * from TE_Books;
+------+---------+--------+----------------+-------+
| Id   | Subject | Author | Publication    | Price |
+------+---------+--------+----------------+-------+
|  100 | SPOS    | VAM    | Technical      |   300 |
|  101 | DBMS    | VUU    | Tech_Knowledge |   250 |
|  102 | TOC     | YSK    | Tech_Neo       |   400 |
|  103 | CNS     | SS     | Tech_Breathe   |   275 |
+------+---------+--------+----------------+-------+
4 rows in set (0.00 sec)

mysql> alter table TE_Books add column Total_Pages int;
Query OK, 0 rows affected (0.18 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from TE_Books;
+------+---------+--------+----------------+-------+-------------+
| Id   | Subject | Author | Publication    | Price | Total_Pages |
+------+---------+--------+----------------+-------+-------------+
|  100 | SPOS    | VAM    | Technical      |   300 |        NULL |
|  101 | DBMS    | VUU    | Tech_Knowledge |   250 |        NULL |
|  102 | TOC     | YSK    | Tech_Neo       |   400 |        NULL |
|  103 | CNS     | SS     | Tech_Breathe   |   275 |        NULL |
+------+---------+--------+----------------+-------+-------------+
4 rows in set (0.00 sec)

mysql> alter table TE_Books drop column Total_Pages;
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from TE_Books;
+------+---------+--------+----------------+-------+
| Id   | Subject | Author | Publication    | Price |
+------+---------+--------+----------------+-------+
|  100 | SPOS    | VAM    | Technical      |   300 |
|  101 | DBMS    | VUU    | Tech_Knowledge |   250 |
|  102 | TOC     | YSK    | Tech_Neo       |   400 |
|  103 | CNS     | SS     | Tech_Breathe   |   275 |
+------+---------+--------+----------------+-------+
4 rows in set (0.00 sec)

mysql> alter table TE_Books modify Price int;
Query OK, 4 rows affected (0.34 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> desc from TE_Books;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from TE_Books' at line 1
mysql> desc TE_Books;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| Id          | int         | YES  |     | NULL    |       |
| Subject     | varchar(30) | YES  |     | NULL    |       |
| Author      | varchar(20) | YES  |     | NULL    |       |
| Publication | varchar(20) | YES  |     | NULL    |       |
| Price       | int         | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
5 rows in set (0.17 sec)

mysql> alter table TE_Books rename column Author to Teacher;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from TE_Books;
+------+---------+---------+----------------+-------+
| Id   | Subject | Teacher | Publication    | Price |
+------+---------+---------+----------------+-------+
|  100 | SPOS    | VAM     | Technical      |   300 |
|  101 | DBMS    | VUU     | Tech_Knowledge |   250 |
|  102 | TOC     | YSK     | Tech_Neo       |   400 |
|  103 | CNS     | SS      | Tech_Breathe   |   275 |
+------+---------+---------+----------------+-------+
4 rows in set (0.00 sec)

mysql> update TE_Books set Publication="Tech_Cell" where Id=103;
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from TE_Books;
+------+---------+---------+----------------+-------+
| Id   | Subject | Teacher | Publication    | Price |
+------+---------+---------+----------------+-------+
|  100 | SPOS    | VAM     | Technical      |   300 |
|  101 | DBMS    | VUU     | Tech_Knowledge |   250 |
|  102 | TOC     | YSK     | Tech_Neo       |   400 |
|  103 | CNS     | SS      | Tech_Cell      |   275 |
+------+---------+---------+----------------+-------+
4 rows in set (0.00 sec)

mysql> exit
Bye

C:\Program Files\MySQL\MySQL Server 8.0\bin>
