-- ORDER BY 정렬 기준
SELECT * FROM employees ORDER BY BirthDate;
-- 컬럼 인덱스로 접근 가능
SELECT * FROM employees ORDER BY 4;
SELECT EmployeeID, LastName, BirthDate FROM employees ORDER BY 3;

-- 활용 예제
SELECT * FROM products ORDER BY CategoryID;

--  CategoryID를 먼저 정렬하고, price를 정렬
SELECT * FROM products ORDER BY CategoryID, Price;
SELECT * FROM products ORDER BY 3, 4;


-- 오름차순 (기본 값) 생략가능
SELECT * FROM products ORDER BY  CategoryID ASC;

-- 내림차순 DESC
SELECT * FROM products ORDER BY  CategoryID DESC;

SELECT * FROM products ORDER BY  CategoryID DESC, Price DESC;


-- 예 ) 고객을 국가명 오름차순 조회
SELECT * FROM customers ORDER BY Country ASC;

-- 가격이 비싼 상품이 먼저 오도록 조히
SELECT * FROM products ORDER BY Price DESC;

-- 가장 어린 직원이 먼저 조회되도록 코드 작성
SELECT * FROM employees ORDER BY BirthDate DESC ;
