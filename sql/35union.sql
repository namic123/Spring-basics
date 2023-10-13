USE w3schools;
SELECT Country FROM suppliers;



-- 합집합 UNION (기본으로 중복제거)
SELECT Country FROM customers
UNION
SELECT Country FROM suppliers;

-- 중복 제거 없이
SELECT Country FROM customers
UNION ALL
SELECT Country FROM suppliers;

-- 주의: 열의 개수는 맞아야 함.
SELECT CustomerName,Country, City FROM customers
UNION
SELECT SupplierName, Country FROM suppliers;

-- 열의 갯수가 일치 OK
SELECT CustomerName,Country, City FROM customers
UNION
SELECT SupplierName, Country, City FROM suppliers;

-- 예) 직원의 lastName과 firstName을 name이라는 하나의 컬럼으로 조회
SELECT CONCAT(FirstName,' ',LastName) as name FROM employees;

--

USE mydb1;
SELECT *
FROM my_table44_a a LEFT JOIN my_table45_b b
                              ON a.col1 = b.col1
UNION
SELECT *
FROM my_table44_a a RIGHT JOIN my_table45_b b
                               ON a.col1 = b.col1;

-- LFET OUTER JOIN
SELECT *
FROM my_table44_a a LEFT JOIN my_table45_b b
                              ON a.col1 = b.col1;
-- RIGHT OUTER JOIN
SELECT *
FROM my_table44_a a RIGHT JOIN my_table45_b b
                               ON a.col1 = b.col1;