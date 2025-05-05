--Clauses in MSSQL
--DISTINCT CLAUSE,to select non duplicate items
select distinct city from customers;
select distinct city,region from Customers;
select city,region,country from Customers where country='uk';
select distinct city,region,country from Customers where country='uk';
select city from customers where city like 'London';
select * from customers;

--selet * from customers;
--GROUP BY clause to group rows that have same values into temp rows
--its used along with aggregate functions
select count(customerid) as 'no of cust',country
from customers group by country;
order by 'no of cust';


select count(customerid) as 'no of cust',country
from customers group by country;
order by count(customerid) desc;

--where clause to filter records from the table
--most often used along with the select,update and delete statements
--eg of where clause using=operator
select* from suppliers;
select companyname,city from suppliers
where country='usa' order by CompanyName;
--eg of where clause using between operator
select *FROM Employees
WHERE EmployeeID BETWEEN 1 AND 10;
--eg of where clause using IN operator
select *FROM Employees
WHERE EmployeeID IN(1,5,4,8,9);

--Order by clause to arrange the data in either ascending or descending
--if numbers will be in ascending or descending,if string it will be alphabetical order
select firstname,birthdate from Employees
ORDER BY BirthDate DESC,FirstName DESC;

select companyname,country from customers order by country;
select companyname,country from customers order by country,CompanyName asc;

--since we cannot use where clause along with aggragate functions like
--sum(),min() etc, in mssql we have a having clause to get the same functionality
--having clause shoul be coupled with a group by clause
select productname,unitprice from products
group by productname,UnitPrice
having avg(unitprice)>20;

select productname,UnitPrice from products;
select * from region;
select concat(lastname,' ',firstname)as fullname from employees;

--Only after exceuting USE exceute the others
--Lets create a sample db and table to demo the grouping sets
--Create Database employee_db;
USE employee_db;
CREATE TABLE employeemaster(
id int identity primary key,
employeecode varchar(10),
employeename varchar(25),
departmentcode varchar(10),
locationcode varchar(10),
salary int
);
--We don't have to explicity specify the id,it will auto fill
insert into employeemaster values
('E0001','Susmin','IT','Tvm',4000),
('E0002','Akash','IT','Tvm',4000),
('E0003','Devika','QA','Klm',3000),
('E0004','Arunima','QA','Klm',3000),
('E0005','Meenakshi','HR','Tvm',5000),
('E0006','Keerthana','HR','Ktm',5000),
('E0007','Preethi','HR','Ktm',5000),
('E0008','Sanju','IT','Tvm',4000),
('E0009','Jayadevan','QA','Tvm',3000)
select * from employeemaster;

--using grouping set clause we are trying to get the following data
--get the list of total cost by each employee
--get the total cost by department,by location
--get the total cost to the company for all departments
SELECT employeecode,employeename,departmentcode,locationcode,sum(salary) as totalcost from employeemaster
 group by
  grouping sets(
  (employeecode,departmentcode,locationcode),--for each employee,all the 4 should be included since they are required to calculate the following 2
  (employeecode,employeename),--for each empl display code and name
  (departmentcode),--total cost for each dept
  (locationcode),--total cost for each location
  ()--total cost for the entire comapny,by giving this only the commands written after locationcode is executed.
  )

  --comparison operators in mssql
  select *from employeemaster where salary =3000;
    select *from employeemaster where salary <3000;
	  select *from employeemaster where salary <=3000;
	    select *from employeemaster where salary >3000;
		  select *from employeemaster where salary >=3000;
		    select *from employeemaster where salary !>3000;
			  select *from employeemaster where salary !<3000;
	--in and not operators
	select * from employeemaster where salary IN(3000,5000);--exactly 3k and 5k
	select * from employeemaster where salary =5000;--exactly 5k
	select * from employeemaster where salary =5000 OR salary=4000;--4k or 5k
	select * from employeemaster where employeename in('Susmin','Sanju');
	select * from employeemaster where employeename  not in('Akash','Devika');
	select * from employeemaster where salary between 3000 and 5000;
	select * from employeemaster where salary is not null;
	select * from employeemaster where salary is null;

	--if % is given if the starting two letters are given then whole thing can be obtained
	--like operator for wildcard search using wildcard regular expressions
	select * from employeemaster where employeename like 'Arunima';
	select * from employeemaster where employeename like 'Arun%';
	select * from employeemaster where employeename like '%nima';
	--start with something or nothing followed by ka and ends with soething or nothing
	select * from employeemaster where employeename like '%run%';
	select * from employeemaster where employeename like '%ka%';
	select * from employeemaster where employeename  not like '%run%';

	--use[] to match any char inside it separated by commas
	select  * from employeemaster where employeename like'Jaya[drtnb]evan%';
	select  * from employeemaster where employeename like'Jaya[^xy]evan%';
	select * from employeemaster where employeename not like '%hi';

	--if a result fo the query exist which is written after WHERE only then the first written query works
	--exists operator in sql
	select *from employeemaster where exists (select * from employeemaster where employeename like 'Keerthana');--will give result for main query
		select *from employeemaster where exists (select * from employeemaster where employeename like 'Keerthi');--will not give resut for main query

		--create one more table to demenstate  union and intersect operators

		CREATE TABLE employeemaster2(
id int identity primary key,
employeecode varchar(10),
employeename varchar(25),
departmentcode varchar(10),
locationcode varchar(10),
salary int
);
--insert data with some common names and few names
insert into employeemaster2 values
('E0001','Susmin','IT','Tvm',4000),
('E0002','Akash','IT','Tvm',4000),
('E0003','Anu','QA','Klm',3000),
('E0004','Manu','QA','Klm',3000),
('E0005','Sinu','HR','Tvm',5000),
('E0006','Binu','HR','Ktm',5000),
('E0007','Tinu','HR','Ktm',5000)

--union operator
select * from employeemaster union select * from employeemaster2;
--union all operator,returns the duplicate values too
select * from employeemaster union all select * from employeemaster2;
--union with expressions
select * from employeemaster where salary >4000 
union select * from employeemaster2 where salary>3000;

truncate table employeemaster2;--done this becoz one mostake came
truncate table employeemaster;

--intersect operator
select * from employeemaster intersect select * from employeemaster2;
--intersect operator with expressions
select * from employeemaster where salary >3000
intersect select * from employeemaster2;

--Create a table to demenstrate popular data types
create table data_types_eg(
  bit_col BIT,
  char_col char(3),
  date_col date,
  date_time_col datetime2(3),
  date_time_offset_col datetimeoffset(2),
  dec_col decimal(4,2),
  num_col numeric(4,2),
  bigint_col bigint,
  int_col int,
  smallint_col smallint,
  tinyint_col tinyint,
  nchar_col nchar(10),
  nvarchar_col nvarchar(10),
  time_col time(0),
  varchar_col varchar(10)
  );

  --insert a sample row into the table
  insert into data_types_eg values(
  1,
  'ABC',
  '2024-07-22',
  '2024-07-22 02:51:00',
   '2024-07-22 02:51:00 +05:30',
   10.25,
   23.56,
   812970653498957935,
   989579,
   1234,
   230,
   N'sdfa ' ,
   N' hjik' ,
   '02:51:00',
   'Good '
   );
   select * from data_types_eg;

   --constraints are restrictions given to table 
   --primary key constraint
   Create table usage_logs(
   logid int not null identity primary key,
   message char(255) not null
   );
   --removed the primary key using the object explorer UI
   --ONCE again set primary key for an already existing table
   --using alter table command,give the constraint name too
alter table usage_logs add constraint
logid_pk primary key(logid);
--to find the constraint index name using a stored procedure
exec sp_help usage_logs;

--disable the primary key(require the index name)
alter index logid_pk on usage_logs disable;
--reenable the primary key(require the index name)
alter index logid_pk on usage_logs rebuild;
--drop the primary key permanently(here also we need the index name)
alter table usage_logs drop constraint logid_pk;
--foreign key is reffered in a table which is another table's primary key
--Foreign key example
--Creating two tables to demenstrate foreign key
--create a product table from which we will use productid as the primary key
create table myproducts(
product_id int not null identity primary key,
product_name varchar(50) not null,
category varchar(25)
);
--create an inventory table(child table) with foreign key referring to the product id of the product table(parent table)
create table myinventory(
inventory_id int not null primary key,
my_product_id int not null,--this will be our foreign key
quantity int,
min_level int,
max_level int,
constraint fk_product_id foreign key(my_product_id)
references myproducts(product_id)
);
exec sp_help myinventory;


--to disable a foreign key(we need the constraint name)
--so that the foreign key constraint will not be checked while saving
alter table myinventory nocheck constraint fk_product_id;
--to reenable a foreign key
alter table myinventory check constraint fk_product_id;
--to drop a foreign key
alter table myinventory drop constraint fk_product_id;






















