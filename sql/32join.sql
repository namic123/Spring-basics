
USE w3schools;

SELECT *
FROM employees e1 JOIN employees e2;

SELECT e1.LastName, e1.BirthDate, e2.LastName, e2.BirthDate
FROM employees e1 JOIN employees e2
WHERE e1.BirthDate < e2.BirthDate
AND e2.LastName = 'Leverling';


-- 예) 'Ipoh Coffee'보다 비싼 상품명 조회
SELECT p1.ProductName, p1.Price, p2.ProductName, p2.Price
FROM products p1 JOIN  products p2
WHERE p1.Price > p2.Price
AND p2.ProductName = 'Ipoh Coffee';

-- 175 , 183, 181

SELECT BirthDate FROM employees
WHERE LastName = 'Leverling';

SELECT LastName, FirstName, BirthDate FROM employees
WHERE BirthDate < '1963-08-30';

SELECT LastName, FirstName, BirthDate FROM employees
WHERE BirthDate<(SELECT BirthDate FROM employees
                                  WHERE LastName ='Leverling');

-- subquery
-- 행1개 열1개
SELECT BirthDate FROM employees
WHERE LastName = 'Leverling';

-- 행 여러개 열 1개
SELECT ShipperID FROM orders WHERE OrderDate = '1996-07-08';
SELECT CustomerName FROM customers WHERE Country = 'mexico';

-- 행 여러개 열 여러개
SELECT CustomerID, CustomerName FROM customers WHERE Country ='mexico';

-- 행 1개 열2개 예제
-- Tofu 상품을 공급하는 공급자명
SELECT SupplierID FROM products WHERE ProductName = 'tofu';
SELECT SupplierID, SupplierName FROM suppliers
WHERE SupplierID=6;

SELECT SupplierID, SupplierName FROM suppliers
WHERE SupplierID = (SELECT  SupplierID from products WHERE ProductName ='tofu');

SELECT p.SupplierID, s.SupplierName FROM suppliers s
    JOIN products p ON s.SupplierID = p.ProductID
WHERE p.ProductName = 'tofu';

-- 여러행 1개열
-- maxico 고객이 주문한 일자들 조회
SELECT CustomerID FROM customers WHERE Country='mexico';
SELECT OrderDate FROM orders WHERE CustomerID in(2,3,13,58,80);

SELECT OrderDate FROM orders WHERE CustomerID IN(SELECT CustomerID FROM customers WHERE Country ='mexico');

-- 예) 1번 카테고리에 있는 상품이 주문된 주문번호(orderDetails. products)
SELECT OrderID FROM orderdetails
               WHERE ProductID
                         IN(SELECT products.ProductID FROM products WHERE CategoryID = 1);
