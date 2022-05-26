--Homework: Kurach Volodymyr
CREATE DATABASE Academy 
GO
USE Academy
GO
CREATE TABLE Groups (
ID int IDENTITY PRIMARY KEY NOT NULL,
[Name] nvarchar(100) UNIQUE NOT NULL,
Rating int CHECK (Rating BETWEEN 0 AND 5) NOT NULL,
[Year] int CHECK ([Year] BETWEEN 1 AND 5) NOT NULL,
)
GO
CREATE TABLE Departments (
ID int IDENTITY PRIMARY KEY NOT NULL,
Financing money DEFAULT 0 CHECK (Financing !< 0) NOT NULL,
[Name] nvarchar(100) UNIQUE NOT NULL
)
GO
CREATE TABLE Faculties (
ID int IDENTITY PRIMARY KEY NOT NULL,
Dean nvarchar(max) NOT NULL,
[Name] nvarchar(100) UNIQUE NOT NULL,
)
GO
CREATE TABLE Teachers (
ID int IDENTITY NOT NULL PRIMARY KEY,
EmploymentDate date CHECK (EmploymentDate !< '1990.01.01') NOT NULL,
IsAssistant bit DEFAULT 0 NOT NULL,
IsProfessor bit DEFAULT 0 NOT NULL,
[Name] nvarchar(MAX) NOT NULL,
Position nvarchar(max) NOT NULL,
Premium money CHECK (Premium !< 0) DEFAULT 0 NOT NULL, 
Salary money CHECK (Salary !< 0),
Surname nvarchar(max) NOT NULL,
)
GO
INSERT INTO Groups ([name],Rating,[Year])
VALUES
  ('Jolene',5,2),
  ('Aquila',3,1),
  ('Lana',5,4),
  ('Maite',1,2),
  ('Malik',5,4),
  ('Sybill',1,4),
  ('Quinn',4,4),
  ('Reagan',4,3),
  ('Francis',2,1),
  ('Ora',3,4);
GO
INSERT INTO Teachers ([name],Surname,Premium,Salary,EmploymentDate,Position,IsProfessor)
VALUES
  ('Dima','Kravch','29309','27049','01/06/2001','Computer Science','1'),
  ('Lana','Parker','129309','127049','05/03/2002','QA','1')
GO
  INSERT INTO Teachers ([name],Surname,Premium,Salary,EmploymentDate,Position,IsAssistant)
VALUES
  ('Castoret','March',3881,8911,'07/01/2000','3D animator','2'),
  ('Winger','Zamor',1051,1534,'01/20/2006','System Administrator','2')
GO
INSERT INTO Teachers ([name],Surname,Premium,Salary,EmploymentDate,Position)
VALUES
  ('Sasha','Pol',2000,2000,'06/07/2005','Development'),
  ('Maks','Rash',165,456,'03/01/2000','Software Development'),
  ('Tom','lly',165,456,'06/07/2002','Programmer'),
  ('Samuel','Kelly',769,147,'06/07/2003','Programmer'),
  ('Whilemina','Ferguson',7343,3816,'01/11/2009','Web analyst'),
  ('Jasper','Parks',9344,9818,'11/23/2019','QA engineer'),
  ('Katelyn','Pennington',632,6045,'03/06/1992','Front end developer'),
  ('Cherokee','Hammond',9715,5960,'09/24/2001','Mobile developer'),
  ('Otto','Hull',4312,6313,'05/27/2013','3D animator'),
  ('Macy','Baird',935,739,'09/04/1993','UX designer'),
  ('Bruno','Richard',8631,6988,'01/30/1995','System Administrator'),
  ('Garth','Morin',2925,6028,'07/07/2015','Cyber ??Security Specialist'),
  ('Oleg','Stevenson',7572,557,'09/12/1999','SEO Specialist');
  GO
INSERT INTO Faculties ([Name],Dean) VALUES
('Computer Science','Muldoon'),
('Programmer','Tobias'),
('Web analyst','Salazar'),
('QA engineer','Horace'),
('Mobile developer','Candida'),
('3D animator','Filius'),
('UX designer','Penelope'),
('System Administrator','Pomona');

           -- ??????? ???????? 3 --
--????: ?????? SELECT, INSERT, UPDATE, DELETE --
SELECT [Name] FROM Teachers ORDER By [Name] DESC
SELECT [Name] AS Group_name, Rating AS Group_Rating FROM Groups 
SELECT Surname,Premium,Salary FROM Teachers WHERE Salary = 2000 OR Premium = 2000 
SELECT Dean AS 'The dean of faculty [faculty] is [dean].' FROM Faculties
SELECT IsProfessor,[Surname],Premium,Salary FROM Teachers WHERE IsProfessor LIKE '1' AND (Premium > 1050) AND (Salary > 1050)
SELECT Salary FROM Teachers WHERE (Salary < 11000 ) OR (Salary > 25000)
SELECT [Name] FROM Faculties WHERE [Name] NOT LIKE 'Computer Science'
SELECT Surname,Position FROM Teachers WHERE IsProfessor  NOT Like '1'
SELECT Surname,Position,Salary,Premium FROM Teachers WHERE Premium BETWEEN 160 AND 550
SELECT Surname,Salary,IsAssistant FROM Teachers WHERE IsAssistant LIKE '1'
SELECT Surname,Position,EmploymentDate FROM Teachers WHERE EmploymentDate < '2000.1.1'
SELECT Position AS 'Name of Department' FROM Teachers ORDER BY Position ASC
SELECT Surname,IsAssistant,Salary,Premium FROM Teachers WHERE Salary < 1200 and Premium < 1200
SELECT * FROM Groups WHERE [Year] BETWEEN 2 AND 4 AND Rating BETWEEN 2 AND 4
SELECT Surname,IsAssistant,Salary,Premium FROM Teachers WHERE Salary < 550 and Premium < 200
-- Homework: Kurach Volodymyr --


