--NOT NULL CONSTRAINT ,using this, null value can be restricted from entering into table
--including a NOT NULL constraint during table creation
create table usage_logs(
 logid int not null,
 message varchar(25)
 );
 insert into usage_logs values(1,'text message');
  insert into usage_logs values(2,'text message2');
      insert into usage_logs values('','text message');
--blanks are defaulted to 0 since the field is an integer
   insert into usage_logs values(NULL,'text message2');--error
	select* from usage_logs;
	--remove the not null constraint using alter table command
	alter table usage_logs alter column logid int NULL;
	--reenable the not null constraint using alter table command
		alter table usage_logs alter column logid int NOT NULL;

--UNIQUE CONTRAINT,one null value can be given,similar to primary key,all values are unique
--drop table usage_logs
		drop table usage_logs;
		--adding unique constraint during table creation
		create table usage_logs(
		 logid int unique,
		 message varchar(25)
		 );
		 insert into usage_logs values(1,'text message');
       insert into usage_logs values(2,'text message2');
      insert into usage_logs values(NULL,'text message2');--will work
		 insert into usage_logs values(NULL,'text message3');--error
		 		 insert into usage_logs values(2,'text message4');--error
		 select *from usage_logs;
		 --in case of UNIQUE CONSTRAINT we need index names
		 exec sp_help usage_logs;--to get the constraint name
		 --drop the unique constraint(will need the constraint name)
		 alter table usage_logs drop constraint UQ__usage_lo__7838F2643EA98E0E;
		 --add the unique constraint to logid column an already existing table
		 alter table usage_logs add constraint unique_logid unique(logid);
		 		 exec sp_help usage_logs;--to get the constraint name
				 		 --drop the unique constraint(will need the constraint name)
				 		 alter table usage_logs drop constraint unique_logid;

--check constraint,to include custom condition check during insert/update
--drop the table usage_logs
drop table usage_logs;
--adding check constraint durinhg table creation
create table usage_logs(
 logid int unique NOT NULL CHECK(logid>10),
 message varchar(25)
 );
  insert into usage_logs values(1,'text message');--error since val<10
  insert into usage_logs values(20,'text message2');--will work
  exec sp_help usage_logs;--to get the constraint name
  drop table usage_logs;
  create table usage_logs(
 logid int unique NOT NULL CHECK(logid>10),
 message varchar(25)
 );
 insert into usage_logs values(1,'text message');--error since val<10
   insert into usage_logs values(20,'text message2');--will work

   --drop the check constraint(will need the constraint name)
		 alter table usage_logs drop constraint CK__usage_log__logid__46B27FE2;
		 --add the CHECK constraint to logid column an already existing table
		 alter table usage_logs add constraint check_logid check(logid>10);
		 		 exec sp_help usage_logs;--to get the constraint name
				 		 --drop the unique constraint(will need the constraint name)
				 		 alter table usage_logs drop constraint check_logid;

--Default Constraint-to include a default value in case the  value is not present
drop table usage_logs;
--create table with message field defaulting to a custom text
create table usage_logs(
 logid int unique NOT NULL ,
 message varchar(25) default 'Not specified',
 );
 insert into usage_logs values(1,'');
   insert into usage_logs values(2,NULL);
      insert into usage_logs (logid) values(3);
	     insert into usage_logs values(4,'my message');
		 select * from usage_logs;
		 exec sp_help usage_logs;--to get the constraint name
		 --drop the default constraint(will need the constraint name)
		 alter table usage_logs drop constraint DF__usage_log__messa__4B7734FF;
		 --add the default constraint to message column of an already existing table
		 alter table usage_logs add constraint 
		 def_message default('Not specified') for message;
		 		 exec sp_help usage_logs;--to get the constraint name
				 		 --drop the udeault constraint(will need the constraint name)
				 		 alter table usage_logs drop constraint def_message;
--to get todays date in default constraint
drop table usage_logs;
create table usage_logs(
 logid int NOT NULL unique ,
 message varchar(255),
 msgdate DATETIME NOT NULL DEFAULT GETDATE()
 );
 select * from usage_logs;
 exec sp_help usage_logs;

 --string functions,accepts string input
 --popular SQL Server String functions
 select ASCII ('b')--RETURNS THE ASCII VALUE OF CHAR
 select CHARINDEX('world','hello world');--find the pos of substring starting in main string
 select CONCAT('hello','-','world');--join together two or more sub strings.
 select LEFT('Hello world',5)--select the 5 chars from the left of the string
  select RIGHT('Hello world',5)--select the 5 chars from the right of the string
   select LOWER('HELLO')--convert to lower case
      select UPPER('hello')--convert to upper case
	     select REPLICATE('HELLO ',4)--duplicate string

--Popular SQL Server Date Functions
select CURRENT_TIMESTAMP;--get the current system time stamp year-month-day hr:min:sec.milsecond
select GETDATE();--get the current system date time
select GETUTCDATE();--get the gmt universal time
select SYSDATETIME();--get the current system date time with high precision
select DATENAME(day,'2024/07/23');--get the date as char
select DATENAME(month,'2024/07/23');--get the date as char
select DATENAME(year,'2024/07/23');--get the year as char
select DATEPART(day,'2024/07/23');--get the date as number
select DATEPART(month,'2024/07/23');--get the date as number
select DATEPART(year,'2024/07/23');--get the year as number
select DAY('2024/07/23');--get the day
select MONTH('2024/07/23');--get the month
select YEAR('2024/07/23');--get the year 
select DATEDIFF(dd,'2024/07/18','2024/07/23');--get the Difference as number of days
select DATEDIFF(mm,'2024/07/18','2024/07/23');--get the Difference as number of months
select DATEDIFF(wk,'2024/07/18','2024/07/23');--get the Difference as number of weeks

--popular SQL mathematical functions 
select SQRT(25);--to get the square root
select ABS(-25);--to get the absolute value
select CEILING(25.3);--to get the next highest value
select FLOOR(25.3);--to get the min value
select POWER(5,2);--to get the power
select LOG(25);--to get the natural log of the no
select SIGN(-25);--to get the sign of the number

----popular SQL server conversion functions
--using the convert() function
--'select is written just to display,without it also its correct
select CONVERT(int,35.756);--converting a float to an int
select CONVERT(datetime,'2024-07-23');--converting a raw string date into datetime
select CONVERT(varchar(100),'2024-07-23');--converting into a varchar of length 100
--using the cast() function
select CAST(35.256 as int);
select CAST('2024-07-23' as datetime);
select CAST('2024-07-23' as varchar(100));

--there are four types of JOIN in SQL,INNER,OUTER,CROSS,SELF.
--The OUETR HAS AGAIN 4 TYPRS-LEFT,RIGHT,FULL
--SQL JOINS
--CREATE  SOME SAMPLE DATE
create database training;
create table trainee(
 id int primary key identity,
  admission_no varchar(50) not null,
  first_name varchar(50)not null,
    last_name varchar(50)not null,
	age int,
	city varchar(30) not null);

create table fee(
     admission_no varchar(50) not null,
	 sem_no int not null,
	 course varchar(50) not null,
	 amount int
	 );
--no need of primary or foreign key in JOINS,nut it will be required to obtain constraints.
create table semester(
   sem_no int not null,--can be set as a primary key
   sem_name varchar(30)
   );

insert into trainee values
 ( '3354','Spider','Man',13,'Texas'),
  ( '2135','James','Bond',15,'Alaska'),
   ( '4321','Jack','Sparrow',14,'California'),
    ( '4213','John','McClane',17,'New York'),
	 ( '5112','Optimus','Prime',16,'Florida'),
	  ( '6113','Captain','Kirk',15,'Arizona'),
	   ( '7555','Harry','Potter',14,'New York'),
	    ( '8345','Rose','Dawson',13,'California');
		select *from trainee;
insert into semester values
(1,'first sem'),
(2,'second sem'),
(3,'third sem'),
(4,'fourth sem');
select *from semester;
insert into fee values
(3354,1,'Java',20000),
(7555,1,'Android',22000),
(4321,2,'Python',20000),
(8345,2,'SQL',15000),
(9345,2,'Blockchain',16000),
(9321,3,'Ethical hacking',17000),
(5112,1,'Machine Learning',30000);
select * from fee;
JOINS IN MSSQL
--dont join more than 3 tables
--since admission no is common in first two tables.in trainee table admission no is primary key and in Fee table it is the foreign key
--For INNER JOIN, one common element should be there in both the tables
select trainee.admission_no,trainee.first_name,trainee.last_name,fee.course,fee.amount--colums to display
from trainee inner join fee--tables and type of join
on trainee.admission_no=fee.admission_no;--join condition

--now if we want to add sem_no and admission_no to the above table combine fee table and semester table,and trainee table
--on the common field admission_no for the first two tables and sem_no for the second and third table

select trainee.admission_no,trainee.first_name,trainee.last_name,fee.course,fee.amount,semester.sem_name--colums to display
from trainee inner join fee--tables and type of join
on trainee.admission_no=fee.admission_no--join condition,till here it is one single condtion
inner join semester on semester.sem_no=fee.sem_no;


--LEFT OUTER JOIN using two tables trainee and fee on the common field
--ALL the data in the left table will be displayed,if they are having the corresponding course.
select trainee.admission_no,trainee.first_name,trainee.last_name,fee.course,fee.amount--colums to display
from trainee left outer join fee--tables and type of join
on trainee.admission_no=fee.admission_no;--join condition

--RIGHT OUTER JOIN,right table will have the priority
select trainee.admission_no,trainee.first_name,trainee.last_name,fee.course,fee.amount--colums to display
from trainee right outer join fee--tables and type of join
on trainee.admission_no=fee.admission_no;--join condition

--Full outer join,no priority for any table is given
select trainee.admission_no,trainee.first_name,trainee.last_name,fee.course,fee.amount--colums to display
from trainee full outer join fee--tables and type of join
on trainee.admission_no=fee.admission_no;--join condition











