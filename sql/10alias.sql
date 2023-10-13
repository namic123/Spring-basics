SELECT * FROM employees;
SELECT EmployeeID, LastName FROM employees;

-- AS : 컬럼명(테이블명) 변경
SELECT EmployeeID AS id, LastName AS name FROM employees;

SELECT EmployeeID, CONCAT(FirstName, ' ',LastName) AS fullname FROM employees;
SELECT EmployeeID, CONCAT(FirstName, ' ',LastName) AS `full name` FROM employees;

-- 공급자의 이름, 주소
SELECT SupplierName AS `공급자 이름`, CONCAT(Address, City, Country) AS 주소, Phone AS 전화번호 FROM suppliers;

-- 테이블명에 별칭(Alias)를 주기
SELECT p.ProductName, c.CategoryID
FROM products AS p JOIN categories AS c ON p.CategoryID = c.CategoryID;

SELECT p.ProductName FROM products p;