use w3schools;
-- aggregate function(집계함수, 집합함수, 그룹함수)
-- MAX, MIN, COUNT, SUM, AVG 등이 있음.

-- MAX 최대값
SELECT MAX(Price) FROM products;
SELECT * FROM products ORDER BY Price DESC;
SELECT ProductName, MAX(Price) FROM products;

-- 가장 높은 금액의 price 조회
SELECT * FROM products
WHERE Price=(SELECT MAX(Price) FROM products);


-- MIN(최솟값)
SELECT MIN(Price) FROM products;

-- 가장 낮은 수의 Price를 검색
SELECT * FROM products
WHERE Price = (SELECT MIN(Price) FROM products);


-- 예) 가장 어린 직원명 조회
SELECT CONCAT(LastName, FirstName), BirthDate
FROM employees
WHERE BirthDate= (SELECT MAX(BirthDate) FROM employees);
-- 예) 가장 나이 많은 직원명 조회
SELECT CONCAT(LastName, FirstName), BirthDate
FROM employees
WHERE BirthDate= (SELECT MIN(BirthDate) FROM employees);


-- COUNT : 갯수
SELECT * FROM employees;
SELECT COUNT(EmployeeID) FROM employees;    -- 기본키는 자동증가 하므로 10
SELECT COUNT(LastName) FROM employees;      -- 10
SELECT COUNT(FirstName) FROM employees;     -- 9 NULL이라서 포함안됨

-- NULL은 집계함수에서 포함하지 않음
INSERT INTO employees(LastName)
VALUE ('흥민');

SELECT MIN(BirthDate) FROM employees;
SELECT MAX(BirthDate) FROM employees;

INSERT INTO products (ProductName)
VALUE ('커피');

SELECT * FROM products ORDER BY 1 DESC ;
-- null 값 포함되지 않음
SELECT MIN(Price) FROM products;
-- null인경우 price에 0 값을 대입
SELECT MIN(IFNULL(Price, 0)) FROM products;

SELECT *
FROM products
WHERE IFNULL(Price, 0) = (SELECT MIN(IFNULL(Price, 0)) FROM products);

-- SUM: 합
SELECT * FROM products;
-- 마찬가지로 null값은 포함되지 않음
SELECT SUM(Price) FROM products;

-- Order Detail의 퀀티티의 총합을 구하기
SELECT SUM(od.Quantity)
FROM orders o JOIN  orderdetails od
ON o.OrderID = od.OrderID
WHERE o.OrderDate = '1996-07-04';

-- 예) 96년 7월 4일 매출액 구하기
SELECT SUM(p.price*od.Quantity)
FROM orders o JOIN orderdetails od
ON o.OrderID = od.OrderID
JOIN products p
ON p.ProductID = od.ProductID
WHERE o.OrderDate = '1996-07-04';

-- AVG : 평균
SELECT AVG(Price) FROM products; -- 28.866364
SELECT SUM(Price) FROM products; -- 2222.71
SELECT COUNT(ProductID) FROM products; -- 78
-- 2222.71 / 78 은 avg값과 동일하지 않음. 집계함수에서 NULL을 계산하지 않기 떄문

-- GROUP BY