-- GROUP BY : 그룹함수 사용 시 그룹함수의 범위(그룹) 지정
SELECT MAX(Price)
FROM products;

-- 전체 컬럼의 MAX price를 구하는게 아닌
-- CategoryID 기준으로 max price를 구함.
-- 즉 해당 CategoryId의 max price를 구해줌.
SELECT CategoryId, MAX(Price)
 FROM products
GROUP BY CategoryID;

SELECT CategoryID,MAX(Price), MIN(Price)
FROM products
GROUP BY CategoryID
ORDER BY MAX(Price) DESC;

SELECT o.OrderDate, SUM(p.Price * od.Quantity) AS 매출액
FROM products p JOIN orderdetails od
on p.ProductID = od.ProductID
JOIN orders o
ON od.OrderID = o.OrderID
GROUP BY o.OrderDate
ORDER BY o.OrderDate;

-- 예) 직원별 총 주문 처리액 조회
--     직원명, 직원별 주문 처리액
SELECT e.LastName, e.FirstName, SUM(p.Price * od.Quantity) `총 처리금액`
FROM employees e JOIN orders o ON e.EmployeeID = o.EmployeeID
                 JOIN orderdetails od ON o.OrderID = od.OrderID
                 JOIN products p ON p.ProductID = od.ProductID
WHERE o.OrderDate >= '1996-08-01' AND o.OrderDate < '1996-09-01'
GROUP BY e.EmployeeID
ORDER BY `총 처리금액` DESC ;



-- 예) 고객별 총 주문 금액 조회
--     고객명, 고객별 주문 금액
SELECT c.CustomerName, SUM(p.Price * od.Quantity) `총 주문금액`
FROM customers c JOIN orders o ON c.CustomerID = o.CustomerID
                 JOIN orderdetails od ON o.OrderID = od.OrderID
                 JOIN products p ON od.ProductID = p.ProductID
GROUP BY c.CustomerID
ORDER BY 2 DESC;

-- 직원별 주문 처리액 조회
SELECT CONCAT(LastName, ' ', FirstName), SUM(p.Price * od.Quantity) AS 주문처리액
FROM employees e
JOIN orders o ON e.EmployeeID = o.EmployeeID
JOIN orderdetails od ON o.OrderID = od.OrderID
JOIN products p ON p.ProductID = od.ProductID
GROUP BY e.EmployeeID;


-- 고객별 총 주문 금액 조회
-- 고객명, 고객별 주문 굼액
SELECT c.CustomerID,c.CustomerName, SUM(p.Price * od.Quantity) AS 주문금액
FROM customers c
JOIN orders o ON c.CustomerID = o.CustomerID
JOIN orderdetails od ON o.OrderID = od.OrderID
JOIN products p ON p.ProductID = od.ProductID
GROUP BY c.CustomerID
ORDER BY c.CustomerID;


-- 10만 달러 이상 소비한 고객 조회
-- 예) 직원별 총 주문 처리액 조회
--     직원명, 직원별 주문 처리액
SELECT e.LastName, e.FirstName, SUM(p.Price * od.Quantity) `총 처리금액`
FROM employees e JOIN orders o ON e.EmployeeID = o.EmployeeID
                 JOIN orderdetails od ON o.OrderID = od.OrderID
                 JOIN products p ON p.ProductID = od.ProductID
WHERE o.OrderDate >= '1996-08-01' AND o.OrderDate < '1996-09-01'
GROUP BY e.EmployeeID
ORDER BY `총 처리금액` DESC ;



-- 예) 고객별 총 주문 금액 조회
--     고객명, 고객별 주문 금액
SELECT c.CustomerName, SUM(p.Price * od.Quantity) `총 주문금액`
FROM customers c JOIN orders o ON c.CustomerID = o.CustomerID
                 JOIN orderdetails od ON o.OrderID = od.OrderID
                 JOIN products p ON od.ProductID = p.ProductID
GROUP BY c.CustomerID)


-- 10만 달러 이상 소비한 고객 조회
SELECT * FROM
    (SELECT c.CustomerName, SUM(p.Price * od.Quantity) `총 주문금액`
     FROM customers c JOIN orders o ON c.CustomerID = o.CustomerID
                      JOIN orderdetails od ON o.OrderID = od.OrderID
                      JOIN products p ON od.ProductID = p.ProductID
     GROUP BY c.CustomerID) t1
WHERE t1.`총 주문금액` >= 100000;


-- HAVING
SELECT * FROM
    (SELECT c.CustomerName, SUM(p.Price * od.Quantity) `총 주문금액`
     FROM customers c JOIN orders o ON c.CustomerID = o.CustomerID
                      JOIN orderdetails od ON o.OrderID = od.OrderID
                      JOIN products p ON od.ProductID = p.ProductID
     GROUP BY c.CustomerID) t1
    HAVING `총 주문금액` >= 100000
    ORDER BY `총 주문금액` DESC;

-- 예) 총 처리 금액이 10만 달러 미만인 직원 조회
-- orders, orderDetails, products, employees
SELECT CONCAT(LastName, ' ', FirstName), SUM(p.Price * od.Quantity) `총 주문금액`
     FROM employees e JOIN orders o ON e.EmployeeID = o.CustomerID
                      JOIN orderdetails od ON o.OrderID = od.OrderID
                      JOIN products p ON od.ProductID = p.ProductID
     GROUP BY e.EmployeeID
HAVING `총 주문금액` <= 100000
ORDER BY `총 주문금액` DESC;