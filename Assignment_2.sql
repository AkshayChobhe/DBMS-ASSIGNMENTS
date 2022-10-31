Microsoft Windows [Version 10.0.19044.1706]
(c) Microsoft Corporation. All rights reserved.

C:\Users\SAI>cd C:\Program Files\MySQL\MySQL Server 8.0\bin

C:\Program Files\MySQL\MySQL Server 8.0\bin>mysql -u root -p
Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 21
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
| ass2               |
| assn1              |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
9 rows in set (0.02 sec)

mysql> use ass2
Database changed

mysql> show tables;
+----------------+
| Tables_in_ass2 |
+----------------+
| emp_info       |
| student        |
+----------------+
2 rows in set (0.20 sec)

mysql> select * from emp_info;
+--------+----------+--------+------------+
| emp_id | emp_name | city   | emp_salary |
+--------+----------+--------+------------+
|      1 | Aditya   | Pune   |     250000 |
|      2 | Atharva  | Shirdi |     200000 |
|      3 | Akshay   | Nagar  |     300000 |
|      4 | Shubham  | Nashik |     150000 |
+--------+----------+--------+------------+
4 rows in set (0.00 sec)

#IN

mysql> select * from emp_info where city IN (select city from emp_info where emp_name="Akshay");
+--------+----------+-------+------------+
| emp_id | emp_name | city  | emp_salary |
+--------+----------+-------+------------+
|      3 | Akshay   | Nagar |     300000 |
+--------+----------+-------+------------+
1 row in set (0.00 sec)

#NOT IN

mysql> select * from emp_info where city NOT IN (select city from emp_info where emp_name="Akshay");
+--------+----------+--------+------------+
| emp_id | emp_name | city   | emp_salary |
+--------+----------+--------+------------+
|      1 | Aditya   | Pune   |     250000 |
|      2 | Atharva  | Shirdi |     200000 |
|      4 | Shubham  | Nashik |     150000 |
+--------+----------+--------+------------+
3 rows in set (0.00 sec)

mysql> select * from emp_info where emp_salary NOT IN (select emp_salary from emp_info where emp_name="Akshay");
+--------+----------+--------+------------+
| emp_id | emp_name | city   | emp_salary |
+--------+----------+--------+------------+
|      1 | Aditya   | Pune   |     250000 |
|      2 | Atharva  | Shirdi |     200000 |
|      4 | Shubham  | Nashik |     150000 |
+--------+----------+--------+------------+
3 rows in set (0.00 sec)

# <

mysql> select * from emp_info where emp_salary < (select emp_salary from emp_info where emp_name="Akshay");
+--------+----------+--------+------------+
| emp_id | emp_name | city   | emp_salary |
+--------+----------+--------+------------+
|      1 | Aditya   | Pune   |     250000 |
|      2 | Atharva  | Shirdi |     200000 |
|      4 | Shubham  | Nashik |     150000 |
+--------+----------+--------+------------+
3 rows in set (0.00 sec)

# >

mysql> select * from emp_info where emp_salary > (select emp_salary from emp_info where emp_name="Akshay");
Empty set (0.00 sec)

mysql> select * from student;
+---------+---------+-------+
| roll_no | name    | marks |
+---------+---------+-------+
|       1 | Aditya  |    25 |
|       2 | Atharva |    20 |
|       3 | Akshay  |    24 |
|       4 | Shubham |    28 |
+---------+---------+-------+
4 rows in set (0.00 sec)

#View Create

mysql> create view stud2 as select emp_id,emp_name from emp_info where emp_id=1;
Query OK, 0 rows affected (0.03 sec)

#View Select

mysql> select * from stud2;
+--------+----------+
| emp_id | emp_name |
+--------+----------+
|      1 | Aditya   |
+--------+----------+
1 row in set (0.00 sec)

#View alter

mysql> alter view stud2 as select emp_id,city from emp_info where emp_id between 1 and 2;
Query OK, 0 rows affected (0.04 sec)

mysql> select * from stud2;
+--------+--------+
| emp_id | city   |
+--------+--------+
|      1 | Pune   |
|      2 | Shirdi |
+--------+--------+
2 rows in set (0.00 sec)

mysql> alter view stud2 as select emp_id,emp_name,city from emp_info where emp_id between 1 and 2;
Query OK, 0 rows affected (0.04 sec)

mysql> select * from stud2;
+--------+----------+--------+
| emp_id | emp_name | city   |
+--------+----------+--------+
|      1 | Aditya   | Pune   |
|      2 | Atharva  | Shirdi |
+--------+----------+--------+
2 rows in set (0.00 sec)

#View Drop

mysql> drop view stud2;
Query OK, 0 rows affected (0.02 sec)

mysql> select * from stud2;
ERROR 1146 (42S02): Table 'ass2.stud2' doesn't exist

#Joins

mysql> create table orders(order_id int,customer_id int,customer_name varchar(20));
Query OK, 0 rows affected (0.11 sec)

mysql> insert into orders values(1,104,"Laxmi"),(2,108,"Rushi"),(3,145,"Aksh");
Query OK, 3 rows affected (0.05 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> create table customers(customer_id int,customer_name varchar(20),city varchar(20));
Query OK, 0 rows affected (0.25 sec)

mysql> insert into customers values(103,"Ketan","Pune"),(108,"Rushi","Nagar"),(145,"Aksh","Nagar");
Query OK, 3 rows affected (0.08 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from orders;
+----------+-------------+---------------+
| order_id | customer_id | customer_name |
+----------+-------------+---------------+
|        1 |         104 | Laxmi         |
|        2 |         108 | Rushi         |
|        3 |         145 | Aksh          |
+----------+-------------+---------------+
3 rows in set (0.00 sec)

mysql> select * from customers;
+-------------+---------------+-------+
| customer_id | customer_name | city  |
+-------------+---------------+-------+
|         103 | Ketan         | Pune  |
|         108 | Rushi         | Nagar |
|         145 | Aksh          | Nagar |
+-------------+---------------+-------+
3 rows in set (0.00 sec)

#INNER JOIN
mysql> select orders.order_id,customers.customer_name,customers.city from orders INNER JOIN customers ON
    -> orders.customer_id=customers.customer_id;
+----------+---------------+-------+
| order_id | customer_name | city  |
+----------+---------------+-------+
|        2 | Rushi         | Nagar |
|        3 | Aksh          | Nagar |
+----------+---------------+-------+
2 rows in set (0.00 sec)

#LEFT JOIN
mysql> select orders.order_id,customers.customer_name,customers.city from orders LEFT JOIN customers ON
    -> orders.customer_id=customers.customer_id;
+----------+---------------+-------+
| order_id | customer_name | city  |
+----------+---------------+-------+
|        1 | NULL          | NULL  |
|        2 | Rushi         | Nagar |
|        3 | Aksh          | Nagar |
+----------+---------------+-------+
3 rows in set (0.00 sec)

#RIGHT JOIN
mysql> select orders.order_id,customers.customer_name,customers.city from orders RIGHT JOIN customers ON
    -> orders.customer_id=customers.customer_id;
+----------+---------------+-------+
| order_id | customer_name | city  |
+----------+---------------+-------+
|     NULL | Ketan         | Pune  |
|        2 | Rushi         | Nagar |
|        3 | Aksh          | Nagar |
+----------+---------------+-------+
3 rows in set (0.00 sec)

#CROSS JOIN
mysql> select orders.order_id,customers.customer_name,customers.city from orders CROSS JOIN customers;
+----------+---------------+-------+
| order_id | customer_name | city  |
+----------+---------------+-------+
|        3 | Ketan         | Pune  |
|        2 | Ketan         | Pune  |
|        1 | Ketan         | Pune  |
|        3 | Rushi         | Nagar |
|        2 | Rushi         | Nagar |
|        1 | Rushi         | Nagar |
|        3 | Aksh          | Nagar |
|        2 | Aksh          | Nagar |
|        1 | Aksh          | Nagar |
+----------+---------------+-------+
9 rows in set (0.00 sec)

#UNION OPERATOR
mysql> select order_id from orders
    -> UNION
    -> select customer_name from customers;
+----------+
| order_id |
+----------+
| 1        |
| 2        |
| 3        |
| Ketan    |
| Rushi    |
| Aksh     |
+----------+
6 rows in set (0.04 sec)
