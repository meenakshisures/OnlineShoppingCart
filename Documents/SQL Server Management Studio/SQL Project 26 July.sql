
,
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
    Year_Of_Passout int);


