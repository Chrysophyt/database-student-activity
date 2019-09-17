
CREATE TABLE `students` (
  `no` int,
  `nim` int NOT NULL AUTO_INCREMENT,
  `nama` text NOT NULL,
  `city` text NOT NULL,
  `age` int NOT NULL,
  `ipk` float(2,1) NOT NULL,
  `department` text,
  Primary Key (nim)
);

ALTER TABLE students AUTO_INCREMENT = 12345;

INSERT INTO `students` VALUES 
(NULL, NULL, 'Adi', 'Jakarta',       '17', '2.5', 'Math'),
(NULL, NULL, 'Ani', 'Yogyakarta',    '20', '2.1', 'Math'),
(NULL, NULL, 'Ari', 'Surabaya',      '18', '2.5', 'Computer'),
(NULL, NULL, 'Ali', 'Banjarmasin',   '20', '3.5', 'Computer'),
(NULL, NULL, 'Abi', 'Medan',         '17', '3.7', 'Computer'),
(NULL, NULL, 'Budi', 'Jakarta',      '19', '3.8', 'Computer'),
(NULL, NULL, 'Boni', 'Yogyakarta',   '20', '3.2', 'Computer'),
(NULL, NULL, 'Bobi', 'Surabaya',     '17', '2.7', 'Computer'),
(NULL, NULL, 'Beni', 'Banjarmasin',  '18', '2.3', 'Computer'),
(NULL, NULL, 'Cepi', 'Jakarta',      '20', '2.2', NULL),
(NULL, NULL, 'Coni', 'Yogyakarta',   '22', '2.6', NULL),
(NULL, NULL, 'Ceki', 'Surabaya',     '21', '2.5', 'Math'),
(NULL, NULL, 'Dodi', 'Jakarta',      '20', '3.1', 'Math'),
(NULL, NULL, 'Didi', 'Yogyakarta',   '19', '3.2', 'Physics'),
(NULL, NULL, 'Deri', 'Surabaya',     '19', '3.3', 'Physics'),
(NULL, NULL, 'Eli', 'Jakarta',       '20', '2.9', 'Physics'),
(NULL, NULL, 'Endah', 'Yogyakarta',  '18', '2.8', 'Physics'),
(NULL, NULL, 'Feni', 'Jakarta',      '17', '2.7', NULL),
(NULL, NULL, 'Farah', 'Yogyakarta',  '18', '3.5', NULL),
(NULL, NULL, 'Fandi', 'Surabaya',    '19', '3.4', NULL);

update `students` set `no` = (nim-12344);

select distinct city from students;
select nama from students where department ='Computer';


