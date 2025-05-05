USE hospital_db;
CREATE TABLE patient(
patientrecordno int identity primary key,
patientname varchar(50),
age smallint,
location varchar(50)
);
alter table patient add gender char;
alter table patient add phoneno int;
exec sp_help patient;
alter table patient alter column gender varchar(50);
 alter table patient drop column location;
 INSERT INTO patient(patientname,age,phoneno)
 VALUES('Tom',2,201810),
 ('Jerry',1,20191020)
 select *from patient;
  delete from patient where patientname='Tom';

