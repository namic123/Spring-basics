-- SELECT: 데이터 조회(읽기, 검색, 가져오기)
SELECT * FROM w3schools.customers;
SELECT * FROM w3schools.employees;
SELECT * FROM w3schools.products;

SELECT * FROM customers;
SELECT * FROM customers;

SELECT * FROM categories;
SELECT * FROM orderdetails;
SELECT * FROM orders;
SELECT * FROM  products;
SELECT * FROM  shippers;
SELECT * FROM  suppliers;


--
SELECT CustomerName -- column 명 나열
FROM customers -- table 명 나열
;

SELECT CustomerID, CustomerName    -- 컬럼을 선택
FROM customers;
SELECT CustomerID, CustomerName, Country
FROM customers;
SELECT CustomerName, CustomerID, Country    -- 순서에 따라 컬럼이 나열되어 조회됨
FROM customers;

SELECT * -- 전체 컬럼을 조회
FROM customers;

-- 예제 1) 직원(employees)의 lastName, firstName, birthDate 조회
SELECT LastName, FirstName, BirthDate
FROM employees;

-- 예제 2) 상품(Products)의 이름(productName), 단위(unit), 가격(price)조회
SELECT ProductName, Unit, Price
FROM products;

-- 예제 3) 공급자(suppliers)의 이름(supplierName), 주소(address), 국가(country) 조회
SELECT SupplierName, Address, Country
FROM suppliers;


-- 고객테이블의 국가 컬럼 조회
SELECT Country FROM customers;

-- DISTINCT 중복 제거
SELECT DISTINCT Country FROM customers; -- 중복 제거 후 21개 row

SELECT City, Country FROM customers;    -- 91개
SELECT DISTINCT City, Country FROM  customers;  -- 69개 (중복 제거)

-- COUNT : 행(row, record)의 수
SELECT COUNT(Country) FROM customers;
SELECT COUNT(DISTINCT Country) FROM customers;

SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM employees;
SELECT COUNT(*) FROM orders;