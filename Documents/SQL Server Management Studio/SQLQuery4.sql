-- Create Users Table
CREATE TABLE Users (
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    is_admin BIT DEFAULT 0 -- 0 for regular user, 1 for admin
);

-- Create Enquiries Table
CREATE TABLE Enquiries (
    enquiry_id VARCHAR(20) PRIMARY KEY,
    enquirer_name VARCHAR(50),
    enquiry_subject VARCHAR(255),
    enquiry_message TEXT,
    enquiry_date_time DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (enquirer_name) REFERENCES Users(username)
);

-- Insert an admin user into the Users table
-- Modify this according to your admin credentials
INSERT INTO Users (username, password, name, email, phone, is_admin)
VALUES ('admin', 'admin_password', 'Admin Name', 'admin@example.com', '1234567890', 1);
SELECT * FROM Users
SELECT * FROM Enquiries