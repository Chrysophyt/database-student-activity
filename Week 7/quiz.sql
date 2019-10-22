create database quiz;
use quiz;

create table buyer(
    name char(50) NOT NULL,
    budget int NOT NULL
);

create table property(
    adress char(50) NOT NULL,
    price int NOT NULL
);

INSERT buyer value 
('Smith', '100000'),
('Jones', '150000'),
('Green', '80000');

INSERT property value
('15 High St', '85000'),
('12 Queen St', '125000'),
('87 Oak Row', '175000');

CREATE TABLE candidate(
    name char(50) NOT NULL,
    budget int NOT NULL,
    adress char(50) NOT NULL,
    price int NOT NULL
)

INSERT INTO candidate(name, budget, adress, price)
SELECT buyer.name, buyer.budget, property.adress, property.price 
FROM buyer, property
WHERE buyer.budget > property.price;

