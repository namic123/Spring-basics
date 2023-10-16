USE w3schools;

-- ALTER TABLE: 테이블 수정

-- 컬럼 추가, 변경, 삭제

-- 제약 사항 변경
-- NOT NULL, UNIQUE, PRIMARY KEY, DEFAULT, FOREIGN KEY

-- 컬럼 추가
ALTER TABLE products
ADD COLUMN col1 INT;

ALTER TABLE products
ADD COLUMN col2 VARCHAR(10);

-- 중간에 컬럼 추가
ALTER TABLE products
ADD COLUMN col3 VARCHAR(10) AFTER ProductName;

-- 첫 번째에 추가
ALTER TABLE products
ADD COLUMN col4 VARCHAR(10) FIRST ;

ALTER TABLE products
ADD COLUMN col5 INT
    NOT NULL DEFAULT 1 REFERENCES employees(EmployeeID);

DESC products;

-- 예) 직원테이블에 salay 컬럼 마지막에 추가
-- data type은 dec(10,2), null 허용안하고, default값은 0.00
ALTER TABLE employees
ADD COLUMN Salary DEC(10,2)
NOT NULL DEFAULT 0.00;

DESC employees;

-- 컬럼 삭제
ALTER TABLE products
DROP COLUMN col1;


-- 예) products 테이블에서 col2 컬럼 삭제
ALTER TABLE products
DROP COLUMN col2;

DESC products;


-- 컬럼 변경(type)
ALTER TABLE products
MODIFY COLUMN col3 INT; -- 원래 데이터 타입이 varchar였으나 int로 변환

-- 주의할 점 컬럼의 레코드에 값이 하나라도 존재한다면 수정 불가
INSERT INTO  products(col4)
VALUE ('pizza');

SELECT * FROM products ORDER BY ProductID DESC;

ALTER TABLE products
MODIFY COLUMN col4 INT; -- VARCHAR 값이 컬럼에 들어가 있으므로 수정불가.


ALTER TABLE products
    MODIFY COLUMN col4 INT; -- VARCHAR 값이 컬럼에 들어가 있으므로 수정불가.

ALTER TABLE products
MODIFY COLUMN col4 VARCHAR(10) -- 줄이는건 위험

