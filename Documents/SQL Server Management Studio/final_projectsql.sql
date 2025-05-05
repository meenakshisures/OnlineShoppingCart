CREATE DATABASE enquiry_db;

CREATE TABLE Enquiries (
    enquiry_id INT IDENTITY(1,1) PRIMARY KEY,
    highest_qualification NVARCHAR(255) NOT NULL,
    percentage_marks NVARCHAR(10) NOT NULL,
    year_of_graduation NVARCHAR(4) NOT NULL,
    enquired_course NVARCHAR(255) NOT NULL,
    source NVARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT GETDATE()
);
SELECT * FROM Enquiries

