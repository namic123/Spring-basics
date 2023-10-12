-- DATABASE 또는 SCHEME (예: w3schools) : 테이블들이 있는 공간
-- DATABASE 만들기
CREATE DATABASE mydb1;
CREATE SCHEMA mydb2;

-- 테이블 조회
SELECT * FROM mydb1.table_name;
SELECT * FROM w3schools.customers;
SELECT * FROM w3schools.products;


-- DATABASE 옮기는 명령어
USE mydb1;

-- DATABASE 옮기는 명령어
USE w3schools;
SELECT * FROM products;

-- DATABASE 지우기
DROP DATABASE mydb2;
USE mydb1;
DROP DATABASE mydb1;

CREATE DATABASE mydb1;