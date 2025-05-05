USE employee_db;
--create table inside employee_db database
--if u want u can give any table name after TABLE or write 'employee_db.dbo.table name',the later is not mandatory if the table is already selected
CREATE TABLE employee (
 id int identity primary key,
 name varchar(50),
 age smallint,
 location varchar(50)
 );

 --alter table to change existing table colums
 alter table employee add dob date;
 alter table employee add testcolumn int;
 --stored procedure to view the schema of the table 
 exec sp_help employee;
 --alter table to change an existing column properties
 alter table employee alter column testcolumn varchar(50);
 --alter table to drop an existing column
 alter table employee drop column testcolumn;
 --inserting data into tables
 INSERT INTO employee(name,age,location,dob)
 VALUES('Tom',2,'USA','2018-10-20'),
 ('Jerry',1,'USA','2019-10-20')
 --VIEW THE DATA IN THE TABLE
 select *from employee;
 --without the column names(all cols should have data)
 insert into employee
 values('Mickey',3,'USA','2017-10-20')
 --view data in the table
 select* from employee;
 --update the existing data in the table
 update employee set name='Donald' where name='Tom';
 --delete data from existing table
 delete from employee where name='Tom';
 --to clear all the data from the table,preserving the table structure
 truncate table employee;
 --delete the table using drop command
 drop table employee;
