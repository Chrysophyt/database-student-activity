
CREATE TABLE `students` (
  `no` int,
  `nim` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
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

select distinct 
  city 
from 
  students;


select 
  name 
from 
  students 
where 
  department ='Computer';

select 
  nim, name, age, city 
from 
  students
order by
  age desc;

select 
  name, age
from 
  students
where
  city = 'Jakarta'
order by
  age asc
limit 3;

select 
  name, ipk
from 
  students
where
  city = 'Jakarta' AND ipk < '2.5';

select 
  name, city
from 
  students
where
  not(city = 'Yogyakarta') AND not (city = 'Jakarta'); 

select
  name, age, ipk
from
  students
where
  ipk > '2.5' AND ipk<'3.5'; 

select
  name
from
  students
where
  name like '%a%';

select
  nim
from
  students
where
  department is null;
