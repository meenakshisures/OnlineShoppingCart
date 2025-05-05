
CREATE DATABASE course_db;
USE course_db;

--User Login mangement
CREATE TABLE user_mgmt(
    user_id INT IDENTITY PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    username VARCHAR(50),
    password VARCHAR(50) NOT NULL
        );
        

--Course Management
CREATE TABLE course_mgmt(
    course_id INT IDENTITY(10,1) PRIMARY KEY,
    course_Code VARCHAR(50) UNIQUE,
    course_Name VARCHAR(500),
    description NVARCHAR,
    duration VARCHAR(50),
    fees DECIMAL(10,2),
    CONSTRAINT fk_duration_id FOREIGN KEY (duration_id) REFERENCES course_duration(duration_id)
    );
    

-- Course Modules 
CREATE TABLE course_mod(
    course_mod VARCHAR(50),
    course_id INT,
    CONSTRAINT fk_course_id FOREIGN KEY (course_id) REFERENCES course_mgmt(course_id)
    )





--qualications
CREATE TABLE qualification(
    qualification_id INT IDENTITY(1000,1) PRIMARY KEY,
    qualification VARCHAR(100) NOT NULL,
    course_id INT,
    CONSTRAINT fk_course_qual_id FOREIGN KEY(Course_id) REFERENCES course_mgmt(Course_id)
    );

--resource mgmt
CREATE TABLE resource(
    resource_id INT IDENTITY(2000,1) PRIMARY KEY,
    resource_name VARCHAR(100) NOT NULL,
    );






--Enquiry management
Create table enq_mgmt(
    enquiry_Code INT IDENTITY PRIMARY KEY,
    enquirer_id INT,
    Resourse_id INT,
    course_id INT,
    enquiry_Date date,
    enquiry_Status_id INT,
    constraint fk_resource_enq foreign key(resourse_id) references resource(resource_id),
    constraint fk_course_code foreign key(course_id) references Course_mgmt(course_id),
    constraint fk_enquirer_enq foreign key(enquirer_id) references enquirer(enquirer_id),
    constraint fk_status_enq foreign key(enquiry_status_id) references enquiry_status(enquiry_status_id)
    );

--enquiry status
CREATE TABLE enquiry_status(
    enquiry_status_id INT IDENTITY PRIMARY KEY,
    enquiry_status_name VARCHAR(10))

--ENQUIRER TABLE
CREATE TABLE enquirer(
    enquirer_id INT IDENTITY PRIMARY KEY,
    Enquirer_Name VARCHAR(100),
    Date_of_Birth date,
    Email_id VARCHAR(50),
    Mobile_number int,
    Address VARCHAR(500),
    Highest_Qualification VARCHAR(100),
    Percentage_of_marks decimal(10,2),
    Year_Of_Passout int)





--Usertable includes basic profile,firstname,lastnams,userid,password
--user(only admin for the time being)
--we can allow users to register(backend),the persons sitting in office.
--password shoul be in not null
--course management should be given from under user management and login--till here 1st table

--2nd table
--course adding,courseid is the primary key,from ADD COURSE paramteres write all them
--for adding MULTIPLE QYUALIFICATIONS create a separate table caleed QUALIFICATIONS(qualifiid primary key,qualificastion name,course id(foreign key of 
--COURSE TABLE,
--Admin can edit course table and qualifications table,multiple select given to course_id(fk)

--3rd table-enquiry status table
----enquiry statue gives as 1 for pending,2 for interested,3 for selected,(can make a separate table as ENQUIRY STATUS......................
--STATUs id(pk),enquirystatusname,

--4TH TABLE
-- ENQUIRY TABLE-enquiry_code(pk),enquirerprofileid(fk from enquirer table),enquired courseid(coursetables fk)
--Enquirer table(enquirerprofile_id(pk),enquirycode,enquirer name,date of birth,emailid,mobile number,address,
--highest qualifiuca(varchar),enyuirydate(autofill),resource name(varchar)
---enquirysatus(default to 0),......

--log file-dont keep it in a db
