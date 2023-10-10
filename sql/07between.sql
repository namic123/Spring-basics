-- between
SELECT * FROM products WHERE Price >= 10 and Price <= 15;
SELECT * FROM products WHERE Price BETWEEN 10 AND 15; -- 값 포함됨
SELECT * FROM products WHERE Price BETWEEN '10' AND '15'; -- 값 포함됨
SELECT * FROM products WHERE Price BETWEEN ? AND ?;

SELECT * FROM customers WHERE CustomerName BETWEEN 'a' AND 'b';
SELECT * FROM orders WHERE OrderDate BETWEEN '1996-01-01' AND '1996-12-31';


SELECT * FROM products WHERE Price BETWEEN 30 AND 40;
SELECT * FROM orders WHERE OrderDate BETWEEN '1998-02-01' AND '1998-02-28';
SELECT * FROM employees WHERE BirthDate BETWEEN '1958-09-01' AND '1958-09-31';





