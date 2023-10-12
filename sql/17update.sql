SELECT * FROM products;
SELECT * FROM products WHERE ProductID = 1;

UPDATE products
SET ProductName = '차이즈',
    Unit = '10박스',
    Price = 36.00
WHERE ProductID = 1;

-- WHERE절이 없어서 실행 안됨
UPDATE products
SET ProductName = '두부김치';

-- 예) 1Q번 고객의 이름 수정하기
UPDATE customers
SET CustomerName = '박재성'
WHERE CustomerID = 1;

SELECT * FROM customers;
-- 예) 5번 직원이 NOTES 변경
UPDATE employees
SET Notes = '블라블라'
WHERE EmployeeID = 5;
SELECT * FROM employees;


-- 예) 1번 공급자의 전화번호, 주소 변경
UPDATE suppliers
SET Phone = 01012312345,
    Address = '인천'
WHERE SupplierID = 1;
SELECT * FROM suppliers;

-- 다음
SELECT * FROM products;
SELECT * FROM products WHERE CategoryID = 1;


UPDATE products
SET Price = Price*3
WHERE CategoryID = 1;

SELECT * FROM employees;