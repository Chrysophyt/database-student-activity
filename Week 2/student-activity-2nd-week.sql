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
(NULL, '2006-10-24', '2006-10-31', NULL, ' NOT SHIPPED', (SELECT customerNumber from customers where customerName='Murphy'), '2900.00'),
(NULL, '2006-11-1', '2006-11-21', NULL, ' NOT SHIPPED', (SELECT customerNumber from customers where customerName='Jonas'), '2200.00');

INSERT INTO `orderdetails` VALUES
((SELECT orderNumber FROM orders WHERE orderNumber='1'), (SELECT productCode from products WHERE productCode = '0000A01'), '2', '1600.00'),
((SELECT orderNumber FROM orders WHERE orderNumber='1'), (SELECT productCode from products WHERE productCode = '0000B02'), '2', '650.00'),
((SELECT orderNumber FROM orders WHERE orderNumber='1'), (SELECT productCode from products WHERE productCode = '0000C01'), '1', '650.00');

--display data--

SELECT orders.orderNumber as 
  customerNumber, customerName, addressLine1, addressLine2, 
  orders.orderNumber, orderDate, products.productCode, productName, 
  productFinish, quantityOrdered, productPrice, totalPrice, extendedPrice 
from 
  orders join customers join orderdetails join products 
on 
  customers.customerNumber = orders.customerNumber 
AND 
  orders.orderNumber = orderdetails.orderNumber 
AND 
  orderdetails.productCode=products.productCode;