-- Table structure for table parents
CREATE TABLE parents (
  ParentID SERIAL PRIMARY KEY,
  UserName VARCHAR(100) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  Password VARCHAR(255) NOT NULL,
  StudentClass VARCHAR(100) NOT NULL,
  SignUpDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Table structure for table parent_temp_password
CREATE TABLE parent_temp_password (
  id SERIAL PRIMARY KEY,
  child_name VARCHAR(255) NOT NULL,
  temp_password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Table structure for table staff
CREATE TABLE staff (
  id SERIAL PRIMARY KEY,
  UserName VARCHAR(100) NOT NULL,
  Email VARCHAR(255),
  Password VARCHAR(255) NOT NULL,
  Subject VARCHAR(255) NOT NULL,
  Gender VARCHAR(10) NOT NULL,
  Phone VARCHAR(15) NOT NULL
);

-- Table structure for table tbladmin
CREATE TABLE tbladmin (
  id SERIAL PRIMARY KEY,
  UserName VARCHAR(100) NOT NULL,
  Password VARCHAR(100) NOT NULL,
  updationDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Table structure for table tblclasses
CREATE TABLE tblclasses (
  id SERIAL PRIMARY KEY,
  ClassName VARCHAR(80) DEFAULT NULL,
  ClassNameNumeric INT NOT NULL,
  Section VARCHAR(5) NOT NULL,
  CreationDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UpdationDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Table structure for table tblresult
CREATE TABLE tblresult (
  id SERIAL PRIMARY KEY,
  StudentId INT,
  ClassId INT,
  SubjectId INT,
  marks INT,
  PostingDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UpdationDate TIMESTAMP
);

-- Table structure for table tblstudents
CREATE TABLE tblstudents (
  StudentId SERIAL PRIMARY KEY,
  StudentName VARCHAR(100) NOT NULL,
  RollId VARCHAR(100) NOT NULL,
  StudentEmail VARCHAR(100) NOT NULL,
  Gender VARCHAR(10) NOT NULL,
  DOB DATE NOT NULL,
  ClassId INT NOT NULL,
  RegDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UpdationDate TIMESTAMP,
  Status INT NOT NULL
);

-- Table structure for table tblsubjectcombination
CREATE TABLE tblsubjectcombination (
  id SERIAL PRIMARY KEY,
  ClassId INT NOT NULL,
  SubjectId INT NOT NULL,
  status INT DEFAULT NULL,
  CreationDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  Updationdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Sample data insertion for table parents
INSERT INTO parents (UserName, Email, Password, StudentClass)
SELECT 
    'Parent' || generate_series(1, 100) AS UserName,
    'parent' || generate_series(1, 100) || '@example.com' AS Email,
    'password' || generate_series(1, 100) AS Password,
    'Class' || (random() * 10 + 1)::int AS StudentClass
FROM generate_series(1, 100);

-- Sample data insertion for table parent_temp_password
INSERT INTO parent_temp_password (child_name, temp_password)
SELECT 
    'Child' || generate_series(1, 100) AS child_name,
    md5(random()::text) AS temp_password
FROM generate_series(1, 100);

-- Sample data insertion for table staff
INSERT INTO staff (UserName, Email, Password, Subject, Gender, Phone)
SELECT 
    'Staff' || generate_series(1, 100) AS UserName,
    'staff' || generate_series(1, 100) || '@example.com' AS Email,
    'password' || generate_series(1, 100) AS Password,
    'Subject' || (random() * 5 + 1)::int AS Subject,
    CASE WHEN random() > 0.5 THEN 'Male' ELSE 'Female' END AS Gender,
    '+1' || floor(random() * 1000000000)::text AS Phone
FROM generate_series(1, 100);

-- Sample data insertion for table tbladmin
INSERT INTO tbladmin (UserName, Password)
SELECT 
    'Admin' || generate_series(1, 100) AS UserName,
    'password' || generate_series(1, 100) AS Password
FROM generate_series(1, 100);

-- Sample data insertion for table tblclasses
INSERT INTO tblclasses (ClassName, ClassNameNumeric, Section)
SELECT 
    'Class' || floor(random() * 12 + 1)::int AS ClassName,
    floor(random() * 12 + 1)::int AS ClassNameNumeric,
    chr(trunc(random() * 26) + 65) AS Section
FROM generate_series(1, 100);

-- Sample data insertion for table tblresult
INSERT INTO tblresult (StudentId, ClassId, SubjectId, marks)
SELECT 
    floor(random() * 100 + 1)::int AS StudentId,
    floor(random() * 100 + 1)::int AS ClassId,
    floor(random() * 5 + 1)::int AS SubjectId,
    floor(random() * 100 + 1)::int AS marks
FROM generate_series(1, 100);

-- Sample data insertion for table tblstudents
INSERT INTO tblstudents (StudentName, RollId, StudentEmail, Gender, DOB, ClassId, Status)
SELECT 
    'Student' || generate_series(1, 100) AS StudentName,
    'Roll' || generate_series(1, 100) AS RollId,
    'student' || generate_series(1, 100) || '@example.com' AS StudentEmail,
    CASE WHEN random() > 0.5 THEN 'Male' ELSE 'Female' END AS Gender,
    (CURRENT_DATE - INTERVAL '10 years' * random())::date AS DOB,
    floor(random() * 100 + 1)::int AS ClassId,
    floor(random() * 2) AS Status
FROM generate_series(1, 100);

-- Sample data insertion for table tblsubjectcombination
INSERT INTO tblsubjectcombination (ClassId, SubjectId, status)
SELECT 
    floor(random() * 100 + 1)::int AS ClassId,
    floor(random() * 5 + 1)::int AS SubjectId,
    floor(random() * 2) AS status
FROM generate_series(1, 100);






DELIMITER //

CREATE TRIGGER after_student_insert
AFTER INSERT ON tblstudents
FOR EACH ROW
BEGIN
   INSERT INTO student_insertion_log (StudentId, StudentName, RollId, StudentEmail, Gender, DOB, ClassId, RegDate, UpdationDate, Status)
   VALUES (NEW.StudentId, NEW.StudentName, NEW.RollId, NEW.StudentEmail, NEW.Gender, NEW.DOB, NEW.ClassId, NEW.RegDate, NEW.UpdationDate, NEW.Status);
END //

DELIMITER ;
