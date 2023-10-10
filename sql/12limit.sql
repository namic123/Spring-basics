-- LIMIT 조회 레코드(행, row) 제한
SELECT * FROM customers;
SELECT * FROM customers
LIMIT 3;
SELECT * FROM employees
LIMIT 2;

SELECT * FROM employees
ORDER BY BirthDate
LIMIT 2;

SELECT * FROM products
ORDER BY Price DESC
LIMIT 10;

-- 예) 가장 어린 3명의 직원 조회
SELECT * FROM employees ORDER BY birthDate DESC LIMIT 3;
SELECT * FROM products WHERE CategoryID = 2 ORDER BY Price;


-- 0번 부터 3개
SELECT ProductName, Price
FROM products
order by Price
LIMIT 0, 3;

-- 1번 부터 3개
SELECT ProductName, Price
FROM products
order by Price
LIMIT 1, 3;

-- 2번 부터 3개
SELECT ProductName, Price
FROM products
order by Price
LIMIT 2, 3;

-- 3번 부터 3개
SELECT ProductName, Price
FROM products
order by Price
LIMIT 3, 3;


-- 페이지 나누기
SELECT CustomerID, CustomerName FROM customers
ORDER BY CustomerID; -- 91개 row가 있음

-- 카페 게시판이라고 가정
SELECT CustomerID, CustomerName FROM customers
ORDER BY CustomerID
LIMIT 0, 10;    -- 1페이지의 10개

SELECT CustomerID, CustomerName FROM customers
ORDER BY CustomerID
LIMIT 10, 10;    -- 2페이지의 10개

SELECT CustomerID, CustomerName FROM customers
ORDER BY CustomerID
LIMIT 20, 10;    -- 3페이지의 10개

SELECT CustomerID, CustomerName FROM customers
ORDER BY CustomerID
LIMIT 90, 10;    -- 마지막 페이지 10개

-- 공급자(suppliers)를 한 페이지에 5개씩 보여줄 때
SELECT * FROM suppliers ORDER BY SupplierID LIMIT 10, 5;

-- 한페이지가 N개의 레코드를 보여주면
-- m번째 페이지 조회
-- LIMIT(m-1)*n, n
