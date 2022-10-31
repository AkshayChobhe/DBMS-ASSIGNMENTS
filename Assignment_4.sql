CREATE table Cirarea(radius number,Area number);

DECLARE 
radius number;
Area number;

BEGIN
FOR radius IN 5..9 LOOP
  Area:= 3.14*radius*radius;
  INSERT into Cirarea values(radius,Area);
  END LOOP;

END;
/

Select * from Cirarea;



/*OUTPUT
RADIUS	AREA
5	      78.5
6	      113.04
7	      153.86
8	      200.96
9	      254.34
*/
