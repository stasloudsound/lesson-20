﻿CREATE DATABASE MyUniversty
GO
USE MyUniversty
 
CREATE TABLE Curators
(
    Id INT PRIMARY KEY IDENTITY ,
    [Name] NVARCHAR(50) NOT NULL ,
    Surname NVARCHAR(50) NOT NULL ,
 
    CONSTRAINT CK_Curators_Name CHECK([Name] != ' '),
    CONSTRAINT CK_Curators_Surname CHECK(Surname != ' ')
)
 
CREATE TABLE Faculties
(
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(100) NOT NULL ,
    Financing MONEY NOT NULL DEFAULT(0),
 
    CONSTRAINT CK_Faculties_Name CHECK([NAME] != ' '),
    CONSTRAINT UQ_Faculties_Name UNIQUE([Name]),
    CONSTRAINT CK_Faculties_Financing CHECK(Financing>=0)
)
 
CREATE TABLE Departments
(
    Id INT PRIMARY KEY IDENTITY,
    Financing MONEY NOT NULL  DEFAULT(0),
    [Name] NVARCHAR(100) NOT NULL ,
    FacultyId INT NOT NULL ,
 
    CONSTRAINT CK_Departments_Financing CHECK(Financing >=0),
    CONSTRAINT CK_Departments_Name CHECK([Name] != ' '),
    CONSTRAINT UQ_Departments_Name  UNIQUE([Name]),
    CONSTRAINT FK_Departments_FacultyId FOREIGN KEY (FacultyId) REFERENCES Faculties(Id)
)
 
CREATE TABLE Groups
(
   Id INT PRIMARY KEY IDENTITY,
   [Name] NVARCHAR(50) NOT NULL  UNIQUE,
   [Year] INT NOT NULL ,
   DepartmentId INT  NOT NULL,
  
   CONSTRAINT CK_Groups_Year CHECK([Year]>0 AND [Year] <= 5),
   CONSTRAINT CK_Groups_Name CHECK([Name] != ' '),
   CONSTRAINT UQ_Groups_Name UNIQUE([Name]),
   CONSTRAINT FK_Groups_DepartmentId FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
)
 
CREATE TABLE GroupsCurators
(
    Id INT PRIMARY KEY IDENTITY,
    CuratorId INT NOT NULL,
    GroupId INT NOT NULL,
 
    CONSTRAINT FK_GroupsCurators_CuratorId FOREIGN KEY (CuratorId) REFERENCES Curators(Id),
    CONSTRAINT FK_GroupsCurators_GroupId FOREIGN KEY (GroupId) REFERENCES Groups(Id)
)
 
 
CREATE TABLE Subjects
(
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(100) NOT NULL,
 
    CONSTRAINT CK_Subjects_Name CHECK([Name] != ' ' ),
    CONSTRAINT UQ_Subjects_Name UNIQUE([Name])
)
 
CREATE TABLE Teachers
(
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(100) NOT NULL ,
    Surname NVARCHAR(100) NOT NULL ,    
    Salary MONEY NOT NULL,
    
    CONSTRAINT CK_Teachers_Name CHECK([NAME] != ' '),
    CONSTRAINT CK_Teachers_Salary CHECK(Salary>0),
    CONSTRAINT CK_Teachers_Surname CHECK(Surname != ' ') 
)
 
CREATE TABLE Lectures
(
    Id INT PRIMARY KEY IDENTITY,
    LectureRoom NVARCHAR(100) NOT NULL,
    SubjectId INT NOT NULL,
    TeacherId  INT NOT NULL,
 
    CONSTRAINT CK_Lectures_LectureRoom CHECK(LectureRoom != ' '),
    CONSTRAINT FK_Lectures_SubjectId FOREIGN KEY (SubjectId) REFERENCES Subjects(Id),
    CONSTRAINT FK_Lectures_TeacherId FOREIGN KEY (TeacherId) REFERENCES Teachers(Id)
)
 
CREATE TABLE GroupsLectures
(
    Id INT PRIMARY KEY IDENTITY,
    GroupId INT NOT NULL,
    LectureId INT NOT NULL,
 
    CONSTRAINT FK_GroupsLectures_GroupId FOREIGN KEY (GroupId) REFERENCES Groups(Id),
    CONSTRAINT FK_GroupsLectures_LectureId FOREIGN KEY (LectureId) REFERENCES Lectures(Id)
)
 
-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
 
INSERT INTO Curators ([Name], Surname) VALUES ('Mersey', 'Derle');
INSERT INTO Curators ([Name], Surname) VALUES ('Roland', 'Hemms');
INSERT INTO Curators ([Name], Surname) VALUES ('Emelita', 'Older');
INSERT INTO Curators ([Name], Surname) VALUES ('Doretta', 'Newbury');
INSERT INTO Curators ([Name], Surname) VALUES ('Ulises', 'Manuello');
INSERT INTO Curators ([Name], Surname) VALUES ('Corie', 'Petel');
INSERT INTO Curators ([Name], Surname) VALUES ('Peggi', 'Corps');
INSERT INTO Curators ([Name], Surname) VALUES ('Mabelle', 'Churchlow');
INSERT INTO Curators ([Name], Surname) VALUES ('Loralie', 'Flury');
INSERT INTO Curators ([Name], Surname) VALUES ('Pavlov', 'Taudevin');
INSERT INTO Curators ([Name], Surname) VALUES ('Arlina', 'Sennett');
INSERT INTO Curators ([Name], Surname) VALUES ('Stanley', 'Cleeve');
 
INSERT INTO Faculties  VALUES ('Software Development','$38950');
INSERT INTO Faculties  VALUES ('Computer Graphics and Design','$14021');
INSERT INTO Faculties  VALUES ('Networks and Cybersecurity','$20711');
 
INSERT INTO Departments (Financing, [Name],FacultyId) VALUES ('$47310.22', 'Java',1);
INSERT INTO Departments (Financing, [Name],FacultyId) VALUES ('$31680.44', 'C++',1);
INSERT INTO Departments (Financing, [Name],FacultyId) VALUES ('$41680.44', 'C#',1);
INSERT INTO Departments (Financing, [Name],FacultyId) VALUES ('$12310.22', 'Photoshop',2);
INSERT INTO Departments (Financing, [Name],FacultyId) VALUES ('$8680.44', 'Gravit Designer',2);
INSERT INTO Departments (Financing, [Name],FacultyId) VALUES ('$11680.44', 'Autodesk SketchBook',2);
INSERT INTO Departments (Financing, [Name],FacultyId) VALUES ('$28310.22', 'Cybersecurity',3);
INSERT INTO Departments (Financing, [Name],FacultyId) VALUES ('$27680.44', 'Networks',3);
INSERT INTO Departments (Financing, [Name],FacultyId) VALUES ('$21680.44', 'Administration',3);
 
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FSDM_3911_ru', 1, 5);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('P107', 1, 2);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FSDM_3911_az', 1, 3);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FSDM_1911_ru', 5, 4);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FSDM_1911_az', 2, 2);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FBM_2916_ru', 3, 5);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FBM_2916_az', 4, 2);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FBM_4916_ru',  5, 4);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FBM_4916_az',  6, 1);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FSDM_6911_ru', 7, 1);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FSDM_6911_az', 8, 3);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FSDM_5911_ru',  9, 4);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FSDM_5911_az',  7, 3);
 
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES ( 3, 10);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES ( 5, 8);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES (11, 2);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES ( 6, 7);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES (  1, 12);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES ( 7, 6);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES (8, 5);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES ( 9, 4);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES (  2, 11);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES ( 10, 3);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES ( 4, 9);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES ( 12, 1);
 
INSERT INTO Subjects ([Name]) VALUES ( 'Mastering Java Machine Learning');
INSERT INTO Subjects ([Name]) VALUES ( 'Learn C the Hard Way');
INSERT INTO Subjects ([Name]) VALUES ( 'C# 8.0 and .NET Core 5.0');
INSERT INTO Subjects ([Name]) VALUES ( 'The Adobe Photoshop CC Book for Digital Photographers');
INSERT INTO Subjects ([Name]) VALUES ('Gravit Designer User Guide');
INSERT INTO Subjects ([Name]) VALUES ( '‎Autodesk SketchBook in 2011');
INSERT INTO Subjects ([Name]) VALUES ( 'Practical Malware Analysis:');
INSERT INTO Subjects ([Name]) VALUES ( 'Computer Networks (5th Edition)');
INSERT INTO Subjects ([Name]) VALUES ( 'Administrative Thinkers');
 
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Minor', 'Dodgshun','$1825.81');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Elmer', 'Scallan',  '$1823.41');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Jason', 'Scholey', '$1646.63');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Sybil', 'Gibbins',  '$1077.84');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Ardene', 'Drake', '$1446.59');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Gib', 'Thick',  '$1230.39');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Guenevere', 'Martin', '$1158.87');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Jilli', 'Maber','$1497.38');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Foster', 'Pallesen', '$1854.09');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Lissi', 'McIvor',  '$956.88');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Denny', 'Truluck', '$1225.12');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Gordon', 'Leare',  '$678.96');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Agnesse', 'Carnalan', '$1093.26');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Rodi', 'Coveney','$1459.54');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Lucho', 'Kreber',  '$1920.77');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Georgina', 'Lasselle',  '$601.21');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Maggee', 'Camps',  '$1352.94');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Drusy', 'Maly',  '$1568.70');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Jaime', 'Mileham', '$706.83');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Evangelin', 'Heustace', '$632.83');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Gabie', 'Baseley',  '$1083.40');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Derick', 'MacKintosh', '$659.30');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Augustine', 'Turpey', '$1415.32');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Fee', 'Skyrm',  '$1717.07');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Gabi', 'Symson',  '$1462.21');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Russell', 'Scothron',  '$1943.55');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Clarette', 'MacKeeg',  '$1556.48');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Rolfe', 'Marconi',  '$1484.97');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Eyde', 'Senecaut',  '$1831.47');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Elizabet', 'Jaquemar',  '$1183.21');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Jemmy', 'Brehault',  '$725.61');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Cloris', 'Scay',  '$810.88');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Modesty', 'Lacase',  '$902.14');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Merv', 'Brammar',  '$754.72');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Obie', 'Pulster', '$1297.58');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Jimmy', 'Laughlan',  '$1160.77');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Elke', 'Merriton', '$1077.31');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Pip', 'Lafoy', '$1483.53');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Sande', 'Newall',  '$1644.35');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Adolphus', 'Nottram', '$1403.70');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Everard', 'Clewlowe',  '$631.92');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Caro', 'Lyes', '$1020.15');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Gabby', 'Bernardt', '$967.90');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Susy', 'Kettlestring',  '$1807.43');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Brittaney', 'Bridgeland',  '$1007.38');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Ogden', 'Gumery', '$1376.90');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Lorrin', 'Torbet', '$602.27');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Malia', 'Fransson', '$981.20');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Leroi', 'Glandfield', '$1315.66');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Robbyn', 'Caudray',  '$1047.56');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Trip', 'Hallworth',  '$779.75');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Gerek', 'Robelow',  '$1338.09');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Fritz', 'Horribine','$1363.41');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Kelley', 'Murrow', '$787.76');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Lorne', 'McMurty', '$1258.62');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Malva', 'Jiroudek', '$700.32');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Jemimah', 'Boothman', '$670.61');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Sawyere', 'Newman', '$1171.59');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Isabelle', 'Warne', '$1500.96');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Packston', 'Killingback', '$930.02');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Stephani', 'Shelford',  '$1134.14');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Matthew', 'Iglesia', '$1148.40');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Cathryn', 'Laverock', '$947.53');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Kerr', 'Lukovic',  '$1766.67');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Janine', 'Letts',  '$1061.88');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Rees', 'Forgan','$692.65');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Georges', 'Cicerone', '$1181.71');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Lianne', 'Bendare',  '$1221.89');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Amata', 'Dobey', '$1030.10');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Edy', 'Steanyng', '$1293.19');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Kippie', 'Tweedell',  '$1584.27');
INSERT INTO Teachers ([Name], Surname, Salary) VALUES ('Kerrie', 'Spenceley', '$1163.57');
 
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 2',  5, 8);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 3', 9, 2);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 4',  6, 7);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 5',   1, 12);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 6',  7, 6);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 7', 8, 5);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 8',  9, 4);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 9',   2, 11);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 1', 3, 10);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 1', 3, 44);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 1', 3, 56);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 1', 3, 23);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 1', 3, 22);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 1', 3, 35);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 10',  3, 3);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 11',  4, 9);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 12',  6, 1);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 2',  5, 33);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 3', 9, 21);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 4',  6, 13);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 5',   1, 14);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 6',  7, 15);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 7', 8, 16);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 8',  9, 17);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 9',   2, 16);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 10',  3, 19);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 11',  4, 20);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 12',  6, 21);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 2',  5, 24);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 3', 9, 25);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 4',  6, 26);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 5',   1, 27);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 6',  7, 28);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 7', 8, 29);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 8',  9, 30);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 9',   2, 31);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 10',  3, 32);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 11',  4, 33);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 12',  6, 34);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 2',  5, 36);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 3', 9, 37);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 4',  6, 38);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 5',   1, 33);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 6',  7, 34);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 7', 8, 33);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 8',  9, 40);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 9',   2, 41);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 10',  3, 42);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 11',  4, 42);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 12',  6, 43);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 2',  5, 45);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 3', 9, 46);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 4',  6, 47);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 5',   1, 48);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 6',  7, 49);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 7', 8, 50);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 8',  9, 51);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 9',   2, 52);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 10',  3, 53);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 11',  4, 54);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 12',  6, 55);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 2',  5, 57);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 3', 9, 58);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 4',  6, 59);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 5',   1, 60);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 6',  7, 61);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 7', 8, 62);
INSERT INTO Lectures (LectureRoom,SubjectId,TeacherId) VALUES ('Room # 8',  9, 63);
 
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 3, 9);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 5, 8);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (11, 2);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 6, 7);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (  1, 11);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 7, 6);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (8, 5);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 9, 4);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (  2, 11);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 10, 3);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 4, 9);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 11, 1);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 3, 12);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 5, 13);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (11, 14);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 6, 15);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (  1, 16);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 7, 17);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (8, 18);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 9, 19);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (  2, 21);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 10, 20);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 4, 22);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 11, 23);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 3, 24);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 5, 25);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (11, 26);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 6, 27);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (  1, 28);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 7, 29);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (8, 30);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 9, 31);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (  2, 32);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 10,33);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 4, 34);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 11, 35);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 3, 36);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 5, 37);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (11, 38);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 6, 39);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (  1, 40);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 7, 41);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (8, 42);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 9, 43);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (  2, 44);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 10,45);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 4, 46);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 11, 47);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 3, 8);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 5, 7);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (11, 1);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 6, 6);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (  1, 10);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 7, 5);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (8, 4);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 9, 3);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (  2, 44);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 10, 2);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 4, 8);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 11, 11);

-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------

--ЗАПРОСЫ

--1. Вывести все возможные пары строк преподавателей и групп. 

SELECT Teachers.Name + ' ' + Teachers.Surname , Groups.Name FROM Groups
JOIN GroupsLectures ON GroupsLectures.GroupId = Groups.Id
JOIN Lectures ON Lectures.Id = GroupsLectures.LectureId
JOIN Teachers ON Lectures.TeacherId = Teachers.Id
order by Teachers.Name + ' ' + Teachers.Surname

--2. Вывести названия факультетов, фонд финансирования кафедр которых превышает фонд финансирования факультета. 

SELECT Faculties.Name , MAX(Faculties.Financing), SUM(Departments.Financing) FROM Faculties
JOIN Departments ON Departments.FacultyId = Faculties.Id WHERE
(Departments.Financing)> (Faculties.Financing) GROUP BY Faculties.Name

--3. Вывести фамилии кураторов групп и названия групп, которые они курируют. 

SELECT Curators.Surname + ' ' + Groups.Name FROM Groups
JOIN GroupsCurators ON GroupsCurators.GroupId = Groups.Id
Join Curators ON GroupsCurators.CuratorId = Curators.Id

--4. Вывести имена и фамилии преподавателей, которые читают лекции у группы “FSDM_3911_az”. 

SELECT Teachers.Name + ' ' + Teachers.Surname , Groups.Name FROM Groups
JOIN GroupsLectures ON GroupsLectures.GroupId = Groups.Id
JOIN Lectures ON Lectures.Id = GroupsLectures.LectureId
JOIN Teachers ON Lectures.TeacherId = Teachers.Id
WHERE Groups.Name = ('FSDM_3911_az')

--5. Вывести фамилии преподавателей и названия факультетов на которых они читают лекции. 

SELECT Teachers.Surname + ' ' + Faculties.Name FROM Faculties
JOIN Departments ON Departments.FacultyId = Faculties.Id
JOIN Groups ON Groups.DepartmentId = Departments.Id
JOIN GroupsLectures ON GroupsLectures.GroupId = Groups.Id
JOIN Lectures ON Lectures.Id = GroupsLectures.LectureId
JOIN Teachers ON Lectures.TeacherId = Teachers.Id

--6. Вывести названия кафедр и названия групп, которые к ним относятся. 

SELECT Departments.Name + ' ' + Groups.Name FROM Departments
JOIN Groups ON Groups.DepartmentId = Departments.Id

--7. Вывести названия дисциплин, которые читает преподаватель “Minor Dodgshun”. 

SELECT Subjects.Name + ' ' + Teachers.Name + ' ' + Teachers.Surname FROM  Teachers
JOIN Lectures ON Lectures.TeacherId = Teachers.Id
JOIN Subjects ON Lectures.SubjectId = Subjects.Id
WHERE Teachers.Name = 'Minor' AND Teachers.Surname = 'Dodgshun'; 

--8. Вывести названия кафедр, на которых читается дисциплина “C# 8.0 and .NET Core 5.0”.

SELECT Departments.Name + ' ' + Subjects.Name FROM  Departments
JOIN Groups ON Groups.DepartmentId = Departments.Id
JOIN GroupsLectures ON GroupsLectures.GroupId = Groups.Id
JOIN Subjects ON LectureId = Subjects.Id
WHERE Subjects.Name = ('C# 8.0 and .NET Core 5.0');

--9. Вывести названия групп, которые относятся к факультету “Software Development”. 

SELECT Groups.Name + Faculties.Name FROM Faculties
JOIN Departments ON Departments.FacultyId = Faculties.Id
JOIN Groups ON Groups.DepartmentId = Departments.Id
WHERE Faculties.Name = ('Software Development');

--10. Вывести названия групп 5-го курса, а также название факультетов, к которым они относятся. 

SELECT Groups.Name + ' ' + Faculties.Name FROM Faculties 
JOIN Departments ON Departments.FacultyId = Faculties.Id
JOIN Groups ON Groups.DepartmentId = Departments.Id
WHERE Groups.Year = (5)


--11. Вывести полные имена преподавателей и лекции, 
--которые они читают (названия дисциплин и групп), 
--причем отобрать только те лекции, которые читаются в аудитории “FSDM_1911_az”.

--SELECT Teachers.Name + ' ' + Teachers.Surname , Subjects.Name , Groups.Name FROM Groups, Teachers
--JOIN Lectures ON Lectures.TeacherId = Teachers.Id
--JOIN Subjects ON Lectures.SubjectId = Subjects.Id
--JOIN GroupsLectures ON GroupsLectures.GroupId = GroupId
----JOIN GroupsLectures ON GroupsLectures.LectureId = LectureId
--WHERE Groups.Name = ('FSDM_1911_az')
--order by Teachers.Name + ' ' + Teachers.Surname + ' ' + Subjects.Name + Groups.Name