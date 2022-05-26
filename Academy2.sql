create database Academy2
GO
use Academy2
GO
create Table Faculties(
Id int identity not null primary key,
Financing money not null check(Financing>0) default 0,
Name nvarchar(100) not null check(Name!='') unique
)
GO
create table Curators(
Id int Identity not null primary key ,
Name nvarchar(max) not null check(Name!=''),
Surname nvarchar(max) not null check(Surname!='')
)
GO
create table Departments(
Id int identity not null primary key,
Financing money not null check(Financing>0) default 0,
Name nvarchar(100) not null check(Name!='') unique,
FacultyId int not null references Faculties(Id)
)
GO
create table Groups(
Id int identity not null primary key,
Name nvarchar(10) not null check(Name!='') unique,
Year int not null check(year>=1 and year<=5),
DepartmentId int not null references Departments (Id)
)
GO
create table GroupseCurators(
Id int identity not null primary key,
CuratorId int not null references Curators(Id),
GroupId int not null references Groups(Id)
)
GO
create table Subjects(
Id int identity not null primary key,
Name nvarchar(100) not null check(Name!='') unique
)
GO
create table Teachers(
Id int identity not null primary key,
Name nvarchar(max) not null check(Name!=''),
Salary money not null check(Salary>0),
Surname nvarchar(max) not null check(Surname!='')
)
GO
create table Lectures(
Id int identity not null primary key,
LectureRoom nvarchar(max) not null check(LectureRoom!=''),
SubjectId int not null references Subjects(Id),
TeacherId int not null references Teachers(Id)
)
GO
create table GroupsLectures(
Id int identity not null primary key,
GroupId int not null references Groups(Id),
LecturedId int not null references Lectures(Id)
)
GO
  INSERT Faculties (Name,Financing)
  VALUES 
  ('Computer Science',200),
  ('Parkser',94344),
  ('Jasper',6777),
  ('Computer',5455)
GO
INSERT INTO Curators ([Name],Surname)
  VALUES
  ('Bruno','Richard'),
  ('Otto','Hull'),
  ('Whilemina','Ferguson'),
  ('Samuel','Kelly')
  GO
   INSERT Departments (Name,Financing,FacultyId)
  VALUES 
  ('Tom',455,1),
  ('Parkser',94344,1),
  ('Whilemina',1454,2),
  ('Ferguson',4344,3)
GO
 INSERT Groups ([Name],[Year],DepartmentId)
VALUES
  ('P107',1,1),
  ('B103',2,2),
  ('OEH',2,2),
  ('QA',5,2),
  ('3D',4,1)
GO
  INSERT INTO Teachers ([Name],Surname,Salary)
VALUES
  ('Samantha', 'Adams', 4555),
  ('Castoret','March',3881),
  ('Winger','Zamor',1051),
  ('Lana','Parker','129309')
GO
  INSERT INTO GroupseCurators (CuratorId,GroupId)
  VALUES
  ('1','1'),
  ('2','2')
GO
  INSERT INTO Subjects ([Name])
  VALUES 
  ('P107'),
  ('B103'),
  ('Database Theory'),
  ('Mathematics'),
  ('Physics')
GO
  INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId)
  VALUES
  ('1','1','1'),
  ('2','2','2'),
  ('3','3','3'),
  ('4','4','4')
GO
  INSERT INTO GroupsLectures (GroupId,LecturedId)
  VALUES
  ('1','1'),
  ('2','2'),
  ('3','3'),
  ('4','4')

--1--
  Select Teachers.[Name], Groups.[Name] from Teachers cross join Groups
--2--
  Select (Select [Name] from Departments where Faculties.Id = Departments.Id and Faculties.Financing < Departments.Financing ) from Faculties
--3--
 select Id,
	(select Name+' '+Surname  from Curators
	where Curators.Id=GroupseCurators.Id) as Curator,
	(select Name from Groups
	where Groups.Id=GroupseCurators.Id) as 'Group'
from GroupseCurators
--4--
Select Teachers.Name +' '+ Surname  AS Name_Surname 
	FROM GroupsLectures 
	join Groups on GroupsLectures.GroupId=Groups.Id 
	join Lectures on GroupsLectures.LecturedId=Lectures.Id 
	join Teachers on Lectures.TeacherId=Teachers.Id
	where Groups.Name='P107'
--5--
	Select Teachers.Surname as SurnameTeacher, Faculties.Name as Facultiet
  from Teachers 
  Join Lectures on TeacherId=Teachers.Id 
  Join GroupsLectures on LecturedId=Lectures.Id
  join Groups on GroupId=Groups.Id
  join Departments on DepartmentId=Departments.Id
  join Faculties on FacultyId=Faculties.Id
--6--
  Select Faculties.Name as Faculti, Groups.Name as Groups from Faculties
  full join Departments on Departments.Id=Faculties.Id
  full join Groups on Groups.Id=Departments.Id
--7--
  Select Subjects.Name, Teachers.Name, Teachers.Surname
from Lectures 
join Subjects on SubjectId=Subjects.Id
join Teachers on TeacherId=Teachers.Id
where Teachers.Name='Samantha' and Teachers.Surname='Adams'
--8--
select Departments.Name
from GroupsLectures
join Lectures on LecturedId=Lectures.Id
join Subjects on SubjectId=Subjects.Id
join Groups on GroupId=Groups.Id
join Departments on DepartmentId=Departments.Id
where Subjects.Name='Database Theory'
--9--
select Faculties.Name as Facultet, Groups.Name as Groups from Faculties
join Departments on Faculties.Id=FacultyId
join Groups on Departments.Id=DepartmentId
where Faculties.Name='Computer Science'
--10--
select Groups.Name as 'Group', Faculties.Name as Facultet from Groups
join Departments on DepartmentId=Departments.Id
join Faculties on FacultyId=Faculties.Id
where Groups.Year=5
--11--
Select Teachers.Name+' '+Teachers.Surname as Teacher, LectureRoom as Room, Subjects.Name as 'Subject',
Groups.Name as 'Groups' from GroupsLectures
join Lectures on LecturedId=Lectures.Id
join Subjects on SubjectId=Subjects.Id
join Teachers on TeacherId=Teachers.Id
join Groups on GroupId=Groups.Id
where LectureRoom<>2

	

	