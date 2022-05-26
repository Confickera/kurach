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