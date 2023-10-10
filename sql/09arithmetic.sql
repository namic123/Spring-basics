SELECT * FROM products WHERE ProductID = 1;
-- 산술 연산
SELECT price+1 FROM products WHERE ProductID = 1;
SELECT price - 10.5 FROM products WHERE ProductID = 1;
SELECT price * 3 FROM products WHERE ProductID = 1;
SELECT price / 5 FROM products WHERE ProductID = 1;


SELECT ProductName, price *2 FROM products;
-- 문자열 결합
SELECT CONCAT(ProductName,1), Price FROM products;


SELECT LastName,BirthDate FROM employees WHERE EmployeeID =1;
-- 날짜에 산술 연산, 정수형으로 반환
SELECT LastName,BirthDate+1 FROM employees WHERE EmployeeID =1;
-- 날짜를 증감하는 내장 함수(MARIA DB)
SELECT LastName, ADDDATE(BirthDate, INTERVAL 1 DAY )
FROM employees
WHERE EmployeeID =1;

SELECT * FROM employees;
SELECT EmployeeID,LastName,FirstName FROM employees;
SELECT EmployeeID, CONCAT(LastName, FirstName) FROM employees;
SELECT EmployeeID, CONCAT(LastName, ' ',FirstName) FROM employees;
SELECT EmployeeID, CONCAT(LastName, ' ',FirstName), ADDDATE(BirthDate, INTERVAL  1 YEAR ) FROM employees;

-- 예) 주문 수량 *2 RUFRHK WHGHL
SELECT Quantity *2 FROM orderdetails;
SELECT CONCAT(City,' ', Country) FROM customers