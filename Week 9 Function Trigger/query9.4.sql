DELIMITER $$
 
CREATE FUNCTION changeCur(
    curPrice decimal(10,2),
    rates decimal(10,2)
)
RETURNS decimal(10,2)
DETERMINISTIC
BEGIN
    DECLARE newPrice decimal(10,2);

    SET newPrice = curPrice*rates;

    RETURN newPrice;
END $$
 
DELIMITER ;

UPDATE payments, products, orderdetails
SET
    payments.amount = changeCur(payments.amount, 145.60),
    products.buyPrice = changeCur(products.buyPrice, 145.60),
    products.MSRP = changeCur(products.MSRP, 145.60),
    orderdetails.priceEach = changeCur(orderdetails.priceEach, 145.60)

UPDATE payments
SET
    payments.amount = changeCur(payments.amount, 145.60);

UPDATE products
SET 
    products.buyPrice = changeCur(products.buyPrice, 145.60),
    products.MSRP = changeCur(products.MSRP, 145.60);

UPDATE orderdetails
SET
    orderdetails.priceEach = changeCur(orderdetails.priceEach, 145.60);


DELIMITER $$
CREATE TRIGGER after_new_order_details
AFTER INSERT ON orderdetails
FOR EACH ROW
BEGIN
    UPDATE products SET quantityInStock = quantityInStock - NEW.quantityOrdered
    WHERE 
    products.productCode = NEW.productCode;
END$$
DELIMITER ;

INSERT INTO `orderdetails` VALUES
(10100, 'S10_1678', 30, '11844.56', 5);