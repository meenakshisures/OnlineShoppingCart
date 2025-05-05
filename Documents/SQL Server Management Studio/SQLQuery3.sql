CREATE TABLE Users (
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20)
);
INSERT INTO Users (username, password, name, email, phone)
VALUES ('admin', 'adminpassword', 'Admin User', 'admin@example.com', '1234567890');
CREATE TABLE Enquiries (
    enquiry_id VARCHAR(50) PRIMARY KEY,
    enquirer_name VARCHAR(50),
    enquiry_subject VARCHAR(255),
    enquiry_message TEXT,
    enquiry_date_time DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (enquirer_name) REFERENCES Users(username)
);
CREATE INDEX idx_enquirer_name ON Enquiries (enquirer_name);
CREATE INDEX idx_enquiry_date_time ON Enquiries (enquiry_date_time);
SELECT * FROM Users;
SELECT * FROM Enquiries;
SELECT * FROM Users WHERE username = 'Meenu';

