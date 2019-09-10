CREATE DATABASE academic;
USE academic;
CREATE TABLE `student` (
  `nim` int NOT NULL AUTO_INCREMENT,
  `nama` text NOT NULL,
  `gender` text NOT NULL,
  `birth_place` text NOT NULL,
  `birth_date` date NOT NULL,
  `telephone` text NOT NULL,
  `counselor` int NOT NULL,
  PRIMARY KEY (nim)
);
DESCRIBE student;

CREATE TABLE `lecturer` (
  `nip` INT NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `gender` text NOT NULL,
  `occupation` text NOT NULL,
  `interest` text NOT NULL,
  `telephone` text NOT NULL,
  PRIMARY KEY (nip)  
);
DESCRIBE lecturer;

CREATE TABLE `subject` (
  `course_code` int NOT NULL AUTO_INCREMENT,
  `course_name` text NOT NULL,
  `credits` int NOT NULL,
  `lecturer` text NOT NULL,
  `day` text NOT NULL,
  `hour` time NOT NULL,
  `class_room` text NOT NULL,
  PRIMARY KEY (course_code)
);
DESCRIBE subject;

CREATE TABLE `krs` (
  `krs_id` int NOT NULL AUTO_INCREMENT,
  `course_code` text NOT NULL,
  `nim` int NOT NULL,
  `year` int NOT NULL,
  `semester` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (krs_id)
);
DESCRIBE krs;

ALTER TABLE `lecturer` 
  MODIFY `nip` int NOT NULL,
  DROP PRIMARY KEY;

ALTER TABLE `lecturer` 
  MODIFY `nip` int NOT NULL AUTO_INCREMENT,
  ADD PRIMARY KEY (nip);

SELECT * FROM lecturer;

RENAME TABLE lecturer to professor;

ALTER TABLE `professor`
  CHANGE `name` `lec_name` text NOT NULL;

ALTER TABLE `professor`
  MODIFY `gender` ENUM('male', 'female') NOT NULL;

ALTER TABLE `student`
  MODIFY `gender` ENUM('male', 'female') NOT NULL;

ALTER TABLE `professor`
  MODIFY `telephone` int NOT NULL;

ALTER TABLE `student`
  MODIFY `telephone` int NOT NULL;
