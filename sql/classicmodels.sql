/*
	Generar las sentencias SQL para mostrar las órdenes completas por cliente
		a. Consultar las tablas por separado
      	b. Crear los JOINS necesarios para obtener las órdenes completas por cliente
     	c. Crear la vista con la consulta del paso previo
*/

-- A
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM offices;
SELECT * FROM orderdetails;
SELECT * FROM orders;
SELECT * FROM payments;
SELECT * FROM productlines;
SELECT * FROM products;


-- B
SELECT 
	customers.customerNumber, customers.customerName, customers.contactLastName,
    orders.orderNumber, orders.orderDate,
    orderdetails.priceEach, orderdetails.quantityOrdered,
    products.productCode, products.productName, products.buyPrice
FROM customers
JOIN orders
ON customers.customerNumber = orders.customerNumber
JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
JOIN products
ON orderdetails.productCode = products.productCode;


-- C
CREATE VIEW ordenesCompletasClientes AS
SELECT
	customers.customerNumber, customers.customerName, customers.contactLastName,
    orders.orderNumber, orders.orderDate,
    orderdetails.priceEach, orderdetails.quantityOrdered,
    products.productCode, products.productName, products.buyPrice
FROM customers
JOIN orders
ON customers.customerNumber = orders.customerNumber
JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
JOIN products
ON orderdetails.productCode = products.productCode;


    
    
    