-- INSERT INTO tableName (columnName1, columnName2, ...)
-- VALUES (value1, value2 ...)

INSERT INTO employees(EmployeeID, LastName, FirstName, BirthDate, Photo, Notes)
VALUE (10, '손', '흥민', '2000-01-01', '사진10', 'eql 득점왕');

SELECT * FROM employees ORDER BY EmployeeID DESC;

INSERT INTO employees(employeeid, lastname, firstname, birthdate, photo, notes)
    VALUE(11, '이', '강인', '2000-02-02', '사진11', '드리블 잘함');


-- 모든 컬럼에 값 넣을 때 컬럼명 나열 생략 가능
INSERT INTO employees
VALUE (12, '김','민재','2000-03-03', '사진12', '수비 잘함');

SELECT * FROM employees ORDER BY EmployeeID DESC;

-- 특정 컬럼에만 값을 넣을 때 컬럼명 나열 생략하면 안됨
INSERT INTO employees(EmployeeID,LastName,FirstName)
VALUE (13, '박','지성'); -- 나열된 컬럼명과 값으 순서, 갯수가 같아야함.

SELECT * FROM employees ORDER BY EmployeeID DESC;

INSERT INTO employees(EmployeeID, FirstName, LastName)
VALUE (14, '차', '범근');  -- 순서가 다름.

# INSERT INTO employees(EmployeeID, FirstName, LastName)
#     VALUE (15, '김','두식', '하늘을 난다.');  컬럼명과 값의 갯수가 다름. 오류

-- 값의 타입에 따라 넣는 방법이 다름.
INSERT INTO employees (EmployeeID)
    VALUE (15); -- 권장

INSERT INTO employees (EmployeeID)
    VALUE ('16'); -- 되긴 됨...

INSERT INTO employees (LastName)
    VALUE ('son');

INSERT INTO employees (LastName)
    VALUE ('10000'); -- 따옴표 사용 권장

INSERT INTO employees (LastName)
    VALUE (10000); -- 되긴 됨...

INSERT INTO employees (BirthDate)
    VALUE ('2000-01-01');

SELECT * FROM employees ORDER BY EmployeeID DESC;


INSERT INTO products (Price)
    VALUE (20.10);

INSERT INTO products (Price)
    VALUE ('30.33'); -- 되긴 됨...

INSERT INTO products (Price)
    VALUE ('thirteen');

SELECT * FROM products ORDER BY ProductID DESC;

INSERT INTO products(productid, productname, supplierid, categoryid, unit, price)
VALUE (80, 'dumbell', 30, 10, '100boxes', 500.0);

INSERT INTO products(productname, supplierid, categoryid, unit, price)
    VALUE('babell', 40, 30, '500boxes',5000.0);

SELECT * FROM suppliers ORDER BY 1 DESC;
