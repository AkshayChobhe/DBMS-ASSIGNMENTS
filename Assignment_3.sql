CREATE table Borrower(rollno int,name varchar(255),date_of_issue date,name_of_book varchar(255),status varchar(20));
CREATE table Fine(roll_no int,date_of_return date,fine_amount int);

INSERT into Borrower values(1,'Aditya','05-05-2022','Mritunjaya','issued');
INSERT into Borrower values(2,'Aman','20-05-2022','Bhagwadgita','issued');
INSERT into Borrower values(3,'Shubham','15-06-2022','Ramayan','issued');
INSERT into Borrower values(4,'Akshay','25-07-2022','Budhbhushan','issued');
INSERT into Borrower values(5,'Laxmikant','10-08-2022','Chhava','issued');
INSERT into Borrower values(6,'Pravin','20-09-2022','Agnipankh','issued');

DECLARE
  roll_number number;
  name1 varchar(20);
  dateofissue date;
  System_date date;
  noofdays number(20);
  fine_amount number;
  BEGIN
  roll_number:=:roll_number;
  name1:=:name1;
  select Sysdate into System_date from dual;
  select date_of_issue into dateofissue from Borrower where rollno=roll_number and name_of_book=name1;
  dbms_output.put_line(dateofissue);
  noofdays:=System_date - dateofissue;
  dbms_output.put_line(noofdays);
  if noofdays>15 and noofdays<30 then
  fine_amount :=noofdays*5;
  dbms_output.put_line('Fine : ' || fine_amount);
  elsif noofdays>30 then
  fine_amount:=noofdays*50;
  dbms_output.put_line('Fine : ' || fine_amount);
  else
  dbms_output.put_line('No Fine');
  end if;
  if noofdays>15 then
  INSERT into Fine values(roll_number,Sysdate,fine_amount);
  UPDATE Borrower set status='r' where rollno=roll_number;
  end if;
  exception
  when no_data_found then
  dbms_output.put_line(roll_number || 'Not Found');
  END;
  /
  SELECT * from Borrower;
  SELECT * from Fine;
