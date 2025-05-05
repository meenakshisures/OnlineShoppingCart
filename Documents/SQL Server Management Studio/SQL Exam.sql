CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Gender VARCHAR(1),
    Phone VARCHAR(100)
);

CREATE TABLE Marks (
    StudentID INT,
    Term VARCHAR(10),
    Subject VARCHAR(50),
    Mark INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);
INSERT INTO Students (StudentID, Name, Gender, Phone) 
VALUES
(1, 'Rahul', 'M', '9847866777'),
(2, 'Anju', 'F', '3346897990'),
(3, 'Tom', 'M', '1223456689'),
(4, 'Reena', 'F', '786897891'),
(5, 'Suresh', 'M', '66784532678');
SELECT *From Students
DROP TABLE Students
DROP TABLE Marks
INSERT INTO Marks (StudentID, Term, Subject, Mark)
VALUES
(1, 'Term1', 'maths', 85),
(2, 'Term1', 'maths', 78),
(3, 'Term1', 'maths', 90),
(4, 'Term1', 'maths', 88),
(5, 'Term1', 'maths', 85),
(1, 'Term2', 'english', 75),
(2, 'Term2', 'english', 80),
(3, 'Term2', 'english', NULL),
(4, 'Term2', 'english', 85),
(5, 'Term2', 'english', 90);
select*FROM Marks
  SELECT S.Name,M.Mark FROM Students S JOIN Marks M ON S.StudentID=M.StudentID WHERE M.Term='Term1' AND M.Subject ='maths';
   SELECT S.StudentID,SUM(M.Mark) AS TotalMarks FROM Students S JOIN Marks M ON S.StudentID=M.StudentID GROUP BY S.StudentID;
   SELECT * FROM Students WHERE Name LIKE 'S%' OR NAME LIKE '%P%' ORDER BY NAME ASC;
   SELECT S.Name,ISNULL(CAST(M.Mark AS NVARCHAR), 'A') AS EnglishMark FROM Students S
   LEFT JOIN Marks M ON S.StudentID = M.StudentID AND M.Term = 'term2' AND M.Subject = 'english';
    SELECT S.StudentID,SUM(M.Mark) AS TotalMarks FROM Students S JOIN Marks M ON S.StudentID=M.StudentID WHERE S.Gender='M' GROUP BY S.StudentID;
	     SELECT * FROM Students WHERE Phone IS NOT NULL AND NAME LIKE 'A%' ORDER BY NAME ASC;
		 SELECT S.Name, ISNULL(CAST(M.Mark AS NVARCHAR), '0') AS EnglishMark FROM Students S
         LEFT JOIN Marks M ON S.StudentID = M.StudentID AND M.Term = 'term2' AND M.Subject = 'english';
		 SELECT * FROM STUDENTS S WHERE S.Gender='M' AND S.StudentID IN(SELECT M1.StudentID FROM Marks M1 JOIN Marks M2 ON M1.Mark=M2.Mark WHERE
		 M2.StudentID = (SELECT StudentID FROM Students WHERE Name = 'Rahul') AND M1.Subject = 'maths' AND M2.Subject = 'maths');


