USE employee_db;
CREATE TABLE Employee(
employeeid int identity primary key,
patientfirstname varchar(50),
patientlastname varchar(50),
dob Date,
position varchar(100),
salary decimal(10,2)
);

INSERT INTO Employee
Values('John','Doe','1980-01-15','Manager',75000.00),
('Smith', 'Jane','1985-03-22','Developer',60000.00),('Brown','Michael','1990-07-30','Designer',5500.00)
select * from Employee;

update Employee set salary=65000.00 where employeeid=2;
delete from Employee where employeeid=3;
select *from Employee where salary > 60000.00;
--to check the current schema
select SCHEMA_NAME();

--create a custom schema
CREATE SCHEMA schema1;
--create a new table ionside our schema taht we created
CREATE TABLE employee_db.myschema1.employeenew (
 id int identity primary key,
 name varchar(50),
 age smallint,
 location varchar(50)
 );
 --alter schema to add or remove objects to a schema
 ALTER SCHEMA schema1 transfer object::dbo.employee;
 alter schema dbo transfer object::schema1.employee;
  alter schema dbo transfer object::schema1.employee;
--drop schema(make sure that no objects are under the schema)
drop schema schema1;
