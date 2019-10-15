CREATE DATABASE employees;
USE employees; 

create table jobIndex(
    jobId int AUTO_INCREMENT,
    jobTitle char(50) NOT NULL,
    PRIMARY KEY (jobId)
);

INSERT jobIndex(jobTitle) 
VALUE('Producer'), ('Director'),
('Writer'), ('Actor'),
('Fans'), ('Executive Producer');

create table employees(
    employeeID int AUTO_INCREMENT,
    lastName char(50) NOT NULL,
    firstName char(50) NOT NULL,
    email char(50) NOT NULL,
    reportsTo int,
    jobId int,
    PRIMARY KEY (employeeID),
    foreign key (reportsTo) REFERENCES employees(employeeID),
    foreign key (jobId) REFERENCES jobIndex(jobId)
);
(SELECT employeeID FROM employees WHERE employeeID=3)
(SELECT employeeID FROM employees WHERE employeeID=3)
(SELECT employeeID FROM employees WHERE employeeID=1)
(SELECT employeeID FROM employees WHERE employeeID=2)

INSERT employees(lastName, firstName, email, reportsTo, jobId) VALUE
('Carter', 'John', 'carterj@mail.co', NULL, (SELECT jobId FROM jobIndex WHERE jobId=1)),
('Travolta', 'John', 'travj@mail.co', NULL, (SELECT jobId FROM jobIndex WHERE jobId=2)),
('Carter', 'Peggy', 'carterj@mail.co', NULL, (SELECT jobId FROM jobIndex WHERE jobId=3)),
('Connor', 'John', 'connj@mail.co', NULL, (SELECT jobId FROM jobIndex WHERE jobId=2)),
('Johnson', 'Rian', 'jrian@mail.co', NULL, (SELECT jobId FROM jobIndex WHERE jobId=4)),
('Rogers', 'Steve', 'cap@mail.co', NULL, (SELECT jobId FROM jobIndex WHERE jobId=2)),
('Evans', 'Chris', 'evanc@mail.co', NULL, (SELECT jobId FROM jobIndex WHERE jobId=1)),
('Pratt', 'Chris', 'prc@mail.co', NULL, (SELECT jobId FROM jobIndex WHERE jobId=5)),
('Hemsworth', 'Chris', 'lebowski@mail.co', NULL, (SELECT jobId FROM jobIndex WHERE jobId=3)),
('Hemsworth', 'Liam', 'hliam@mail.co', NULL, (SELECT jobId FROM jobIndex WHERE jobId=4)),
('Feige', 'Kevin', 'kfeige@mail.co', NULL, (SELECT jobId FROM jobIndex WHERE jobId=6)),
('Miller', 'George', 'trafj@mail.co', NULL, NULL);


create database library;

use library;

create table books(
    bookID int AUTO_INCREMENT,
    bookTitle char(50) NOT NULL,
    authorName char(50) NOT NULL,
    borrowedStatus ENUM ('borrowed', 'available') NOT NULL,
    PRIMARY KEY(bookID)
);

create table users(
    userID int AUTO_INCREMENT,
    userName char(50) NOT NULL,
    numberOfBorrowing int NOT NULL,
    numberOfReturning int NOT NULL,
    PRIMARY KEY(userID)
);

create table flow(
    flowID int AUTO_INCREMENT,
    userIDBorrowing int NOT NULL,
    bookIDBorrowed int NOT NULL,
    borrowDate date NOT NULL,
    returnDate date,
    PRIMARY KEY(flowID),
    FOREIGN KEY(userIDBorrowing) REFERENCES users(userID),
    FOREIGN KEY(bookIDBorrowed) REFERENCES books(bookID)
);
