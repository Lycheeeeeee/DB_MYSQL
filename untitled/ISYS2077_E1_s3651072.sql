CREATE TABLE Position (code VARCHAR(3) PRIMARY KEY , title VARCHAR(40), income INTEGER);
CREATE TABLE Project (respectiveCode INTEGER PRIMARY KEY , projectName VARCHAR (50), clientName VARCHAR(30), projectDescription TEXT);
CREATE TABLE Employee (respectiveNumber INTEGER PRIMARY KEY , name VARCHAR(30), currentPosition VARCHAR(3), departmentCode VARCHAR(3));
CREATE TABLE Department(respectiveCode VARCHAR(3) PRIMARY KEY , name VARCHAR (40), location VARCHAR(50), directorOfEmployeeNumber VARCHAR(3));
CREATE TABLE Deliverables(employeeNumber VARCHAR(4), deliverableName VARCHAR (50), date DATE, projectCode VARCHAR(4));
INSERT INTO Position (code, title, income) VALUES
  ('CA1', 'CEO', 10000),
  ('CB1','Engineering Director', 6000 ),
  ('CC1','Software Developer', 2000),
  ('CD1','Hardware Engineer',1500);
INSERT INTO Employee(respectiveNumber, name, currentPosition, departmentCode) VALUES
  (1231,'Dora Lee','CA1','DE1'),
  (3458,'Anna Nguyen','CB1','DE3'),
  (2712,'Anne Minh','CC1','DE4'),
  (9020,'William Nguyen','DE2');
INSERT INTO Department(respectiveCode, name, location, directorOfEmployeeNumber) VALUES
  ('DE3', 'Software Development', '42,Nguyen Van Linh, Da Nang',3458),
  ('DE1','Sales HCMC', '12, Nguyen Hue, Ho Chi Minh City', 1231),
  ('DE2', 'Analysis Team', '27, Ton Duc Thang, Ha Noi',9020),
  ('DE4','Maketing Agency', '09, Nguyen Van Thu, Thua Thien Hue',2712);
INSERT INTO Project(respectiveCode, projectName, clientName, projectDescription) VALUES
  (4512,'The Sims go to University', 'Edward Nguyen', 'This game, transcribe the worldly acclaimed Sims game to
  the university environment. You can attend classes, do you assignments and pass exams. You can also [...]'),
  (4569,'Hello Kitty go to college','Vilardimir Vo', ' is a fictional character produced by the Japanese company Sanrio,
  created by Yuko Shimizu and currently designed by Yuko Yamaguchi. According to her backstory, she is a perpetual
  3rd-grade student who lives outside London.'),
  (3823,'Batman go to kindergarten','Michelle Tran','Batman is a fictional superhero appearing in American comic books
   published by DC Comics.'),
  (1568,'Dota 2 project', 'Selana Huynh','Defense of the Ancients (DotA) is a multiplayer online battle arena (MOBA)
  mod for the video game Warcraft III: Reign of Chaos and its expansion, Warcraft III: The Frozen Throne.');
INSERT INTO Deliverables(employeeNumber, deliverableName, date, projectCode) VALUES
  (1231, 'patch 1.26', 2016-07-30,4512),
  (3458,'Holiday DLC', 2016-08-12, 4512),
  (2712, 'First day', 2016-9-05,3823),
  (9020, 'Weekend escape', 2016-10-24,3823);
ALTER TABLE Employee ADD CONSTRAINT fk_employee1 FOREIGN KEY (currentPosition) references Position(code);
ALTER TABLE Employee ADD CONSTRAINT fk_employee2 FOREIGN KEY (departmentCode) references Department(respectiveCode);
ALTER TABLE Department ADD CONSTRAINT fk_department FOREIGN KEY (directorOfEmployeeNumber) references Employee(respectiveNumber);
ALTER TABLE Deliverables ADD CONSTRAINT fk_deliverables1 FOREIGN KEY (employeeNumber) references Employee(respectiveNumber);
ALTER TABLE Deliverables ADD CONSTRAINT fk_deliverables2 FOREIGN KEY (projectCode) references Project(respectiveCode);

