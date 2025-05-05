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