CREATE DATABASE furniture_company;
USE furniture_company;

CREATE TABLE `customers` (
  `customerNumber` int(11) NOT NULL AUTO_INCREMENT,
  `customerName` varchar(50) NOT NULL,
  `addressLine1` varchar(50) NOT NULL,
  `addressLine2` varchar(50) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `postalCode` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`customerNumber`)
);

CREATE TABLE `products` (
  `productCode` varchar(15) NOT NULL,
  `productName` varchar(70) NOT NULL,
  `productFinish` varchar(50) NOT NULL,
  `productPrice` float(10, 2) NOT NULL,
  PRIMARY KEY (`productCode`)
);

CREATE TABLE `orders` (
  `orderNumber` int(11) NOT NULL AUTO_INCREMENT,
  `orderDate` date NOT NULL,
  `requiredDate` date NOT NULL,
  `shippedDate` date DEFAULT NULL,
  `status` varchar(15) NOT NULL,
  `customerNumber` int(11) NOT NULL,
  `extendedPrice` float(12, 2) NOT NULL,
  PRIMARY KEY (orderNumber),
  FOREIGN KEY (customerNumber) REFERENCES customers(customerNumber)
);

CREATE TABLE `orderdetails` (
  `orderNumber` int(11) NOT NULL,
  `productCode` varchar(15) NOT NULL,
  `quantityOrdered` int(11) NOT NULL,
  `totalPrice` float(12, 2) NOT NULL,
  FOREIGN KEY (orderNumber) REFERENCES orders(orderNumber),
  FOREIGN KEY (productCode) REFERENCES products(productCode)
);

--insert data--

INSERT INTO `customers` VALUES 
( NULL,'Chrystian', '54, rue Royale',NULL ,'Las Vegas', 'Nevada', '44000'),
( NULL,'Ferguson', '636 St Kilda Road',NULL ,'Melbourne', 'Victoria', '3004'),
( NULL,'Jonas', 'Erling Skakkes gate 78',NULL ,'Stavern', NULL, '4110'),
( NULL,'Murphy', '5557 North Pendale Street',NULL ,'San Francisco', 'California', '94217'),
( NULL,'Berglund', 'Berguvsvägen  8',NULL ,'Luleå', NULL, 'S-958 22');

INSERT INTO `products` VALUES 
( '0000A01', 'Dining Table', 'Natural Ash', '800.00'),
( '0000A02', 'Dining Table', 'Cherry', '850.00'),
( '0000B01', 'Writers Desk', 'Natural Ash', '300.00'),
( '0000B02', 'Writers Desk', 'Cherry', '325.00'),
( '0000C01', 'Entertainment Center', 'Natural Maple', '650.00'),
( '0000C02', 'Entertainment Center', 'Cherry', '605.00');


INSERT INTO `orders` VALUES 
(NULL, '2006-10-24', '2006-10-31', '2006-10-28', 'DELIVERED', (SELECT customerNumber from customers where customerName='Murphy'), '2900.00'),
(NULL, '2006-11-1', '2006-11-21', '2006-11-15', 'ON TRANSIT', (SELECT customerNumber from customers where customerName='Jonas'), '2200.00'),
(NULL, '2007-01-9', '2007-01-16', '2007-01-15', 'ON TRANSIT', (SELECT customerNumber from customers where customerName='Chrystian'), '2510.00'),
(NULL, '2007-01-11', '2007-01-21', NULL, 'ON PACKAGING', (SELECT customerNumber from customers where customerName='Berglund'), '1775.00'),
(NULL, '2007-01-12', '2007-01-31', NULL, 'NOT SHIPPED', (SELECT customerNumber from customers where customerName='Ferguson'), '1875.00');

--Murphy order--
INSERT INTO `orderdetails` VALUES
((SELECT orderNumber FROM orders WHERE orderNumber='1'), (SELECT productCode from products WHERE productCode = '0000A01'), '2', '1600.00'),
((SELECT orderNumber FROM orders WHERE orderNumber='1'), (SELECT productCode from products WHERE productCode = '0000B02'), '2', '650.00'),
((SELECT orderNumber FROM orders WHERE orderNumber='1'), (SELECT productCode from products WHERE productCode = '0000C01'), '1', '650.00');

--Jonas order--
INSERT INTO `orderdetails` VALUES
((SELECT orderNumber FROM orders WHERE orderNumber='2'), (SELECT productCode from products WHERE productCode = '0000A01'), '2', '1600.00'),
((SELECT orderNumber FROM orders WHERE orderNumber='2'), (SELECT productCode from products WHERE productCode = '0000B01'), '2', '600.00');

--Chrystian order--
INSERT INTO `orderdetails` VALUES
((SELECT orderNumber FROM orders WHERE orderNumber='3'), (SELECT productCode from products WHERE productCode = '0000C01'), '2', '1300.00'),
((SELECT orderNumber FROM orders WHERE orderNumber='3'), (SELECT productCode from products WHERE productCode = '0000C02'), '2', '1210.00');

--Berglund order--
INSERT INTO `orderdetails` VALUES
((SELECT orderNumber FROM orders WHERE orderNumber='4'), (SELECT productCode from products WHERE productCode = '0000A01'), '1', '800.00'),
((SELECT orderNumber FROM orders WHERE orderNumber='4'), (SELECT productCode from products WHERE productCode = '0000B02'), '1', '325.00'),
((SELECT orderNumber FROM orders WHERE orderNumber='4'), (SELECT productCode from products WHERE productCode = '0000C01'), '1', '650.00');

--Ferguson order--
INSERT INTO `orderdetails` VALUES
((SELECT orderNumber FROM orders WHERE orderNumber='5'), (SELECT productCode from products WHERE productCode = '0000B01'), '3', '900.00'),
((SELECT orderNumber FROM orders WHERE orderNumber='5'), (SELECT productCode from products WHERE productCode = '0000B02'), '1', '325.00'),
((SELECT orderNumber FROM orders WHERE orderNumber='5'), (SELECT productCode from products WHERE productCode = '0000C01'), '1', '650.00');

--display all order data--

SELECT
  ord.customerNumber, customerName, addressLine1, addressLine2, 
  ord.orderNumber, orderDate, ordd.productCode, productName, 
  productFinish, quantityOrdered, productPrice, totalPrice, extendedPrice 
from 
  orders as ord 
  inner join customers as cstmr   on ord.customerNumber = cstmr.customerNumber
  inner join orderdetails as ordd on ord.orderNumber = ordd.orderNumber
  inner join products as prd      on ordd.productCode = prd.productCode
ORDER BY ord.orderNumber;

--display murphy order data--

SELECT
  ord.customerNumber, customerName, addressLine1, addressLine2, 
  ord.orderNumber, orderDate, ordd.productCode, productName, 
  productFinish, quantityOrdered, productPrice, totalPrice, extendedPrice 
from 
  orders as ord 
  inner join customers as cstmr   on ord.customerNumber = cstmr.customerNumber
  inner join orderdetails as ordd on ord.orderNumber = ordd.orderNumber
  inner join products as prd      on ordd.productCode = prd.productCode
where cstmr.customerNumber = '4'