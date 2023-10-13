USE mydb1;

-- 테이블 만들기
-- 문법
CREATE TABLE 테이블명(
    컬럼명 컬럼타입,
    컬럼명 컬럼타입
);

-- 테이블명, 컬럼명,작성 관습(회사마다 다름)
-- lower_snake_case
-- UPPER_SNAKE_CASE
-- UpperCamelCase
-- lowerCamelCase

-- 테이블 생성
CREATE TABLE my_table1(
    col_name1 varchar(100),  -- 컬럼
    col_name2 varchar(100),
    col_name3 varchar(100)
);

SELECT * FROM my_table1;
-- 컬럼에 레코드 추가
INSERT INTO my_table1(col_name1, col_name2, col_name3)
    VALUE('김민재','손흥민','이강인');

DROP TABLE my_table1;

-- 예) my_table2 만들기, 컬럼은 4개, 모든 컬럼타입은 varchar(10)

CREATE TABLE my_table2(
    name varchar(10),
    age varchar(10),
    address varchar(10)
);

INSERT INTO my_table2(name, age, address)
VALUE ('박재성','28','인천');

SELECT * FROM my_table2;


-- 컬럼 타입
-- 정수
-- 문자열
-- 실수
-- 날짜(날짜, 시간)