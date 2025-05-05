--SELF JOIN,considering a single table with two alias names as two tables and do join
select t1.first_name,t1.last_name,t2.city
from trainee t1,trainee t2 where t1.admission_no=t2.admission_no
and t1.city=t2.city
order by t2.city;
--cross join,the cartesian product of two tables
select *from trainee cross join fee;


--SQL STORED PROCEDURES
--They are set of precompiled SQL Statements identified by a name
create procedure sp_AgewiseList
as begin
 select first_name,age,city
 from trainee
 order by age;
end;
--call the stored procedure by the name
exec sp_AgewiseList;
--alter/change the sp which is already created
alter procedure sp_AgewiseList
as begin
 select first_name,age,city
 from trainee
 order by age;
end;
----call the stored procedure by the name
exec sp_AgewiseList;
--list all the stored procedures in the currently selected db
select*from sys.procedures;

--rename the stored procedure
exec sp_rename'sp_AgewiseList' , 'newsp_AgewiseList';
--delete the stored procedure
drop procedure newsp_AgewiseList;

--passing parameters into the stored procedure s that we can get the desired output
--filtered output
--accepting the city name in a variable called city with datatype varchar of len 50
create procedure sp_getTraineesFromCity(@city varchar(50))
as
begin
 set nocount on;--set to on so that the dbms will not give back the no of affected rows
 select first_name,last_name,age,city
 from trainee
 where city=@city
 end;
exec sp_getTraineesFromCity 'california';--call the sp with the parameter

--Getting data from stored procedure
--create a stored procedure with a variable name to send the output and keyword as OUTPUT
create procedure getTraineeCount(@traineecount int output)
as
begin
 select @traineecount =count(id)from trainee;--the count output is saved in @traineecount
 end;
 --these set of statements shoild be selected and run together
 --calling the stored procedure
 --declare a variable to hold the sp output
 declare @mytraineecount int
 --execute the sp
 exec getTraineeCount @mytraineecount output;
 --print the variable
 print @mytraineecount;

 --subquery in sql,a query within another query
 select * from trainee where id
      in (select id from trainee where age>15);

--VIEW IN SQL,A VIRTUAL TABLE BASED ON THE RESULT OF A SQL QUERY
--CREATE A VIEW
create view[cali trainees] as
 select first_name,last_name,city
 from trainee where city='california';
 --call the created viuew
 select * from[cali trainees];
 select * from semester;

 --TRANSACTIONS IN SQL,EXECUTE A SEQUENCE OF SQL STATEMENTS AS A TRANSACTION,
 --TWO POSSIBLE OUTCOMES.If the satements work fine,it will be 'committed'and
 --db changes are made permanent.If any issue during the working of statements,
 --then the changes till then will be reverted back.

 --creating a new transaction and do a manual comit without any condition,everything shoul be run together
 begin transaction
 --statements of the transaction
 insert into semester(sem_no,sem_name)values(5,'sem 5')
 update semester set sem_name='s5'where sem_no=5
 --commit the changes
 commit transaction

 --creating a new transaction and do a manual rollback without any condition,everything shoul be run together,since rollback statement is used no change will be made
 begin transaction
 --statements of the transaction
 insert into semester(sem_no,sem_name)values(6,'sem 6')
 update semester set sem_name='s6'where sem_no=6
 --rollback the changes
 rollback transaction
 select * from semester;

 --creating a new transaction and do a manual comit without any condition,everything shoul be run together,because it is done in 'transactions'
 --without using rollback itself it rollsback
 begin transaction
 --statements of the transaction
 insert into semester(sem_no,sem_name)values(7,'sem 7')
 update semester set sem_name='s7'where sem_no=7
 --commit the changes
 commit transaction;