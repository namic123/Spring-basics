USE mydb1;
-- 컬럼 타입 (DB마다 다름.)
-- 정수, 실수 (숫자형)
-- 문자열
-- 날짜(날짜, 시간)

-- 정수 : int
CREATE TABLE my_table3(
    col int
);
INSERT INTO my_table3 (col)
VALUE (2932);
INSERT INTO my_table3(col)
VALUE ('2341');

-- 불가
INSERT INTO my_table3(col)
VALUE ('two');

SELECT * FROM my_table3;


-- 실수 :DEC(decimal)
CREATE TABLE my_table4(
    col1 DEC
);

INSERT INTO my_table4(col1)
VALUE (3.243223);   -- 실수를 넣었으나 출력했을 때 3이나옴

SELECT * FROM my_table4;
CREATE TABLE my_table5(
    col1 DEC(5,3) -- 총길이 5, 소숫점이하 길이 3
);

INSERT INTO my_table5 (col1)
VALUE (10.123);

INSERT INTO my_table5 (col1)
    VALUE (10.1234);    -- 총 5자리가 넘었으므로 10.123만 출력

INSERT INTO my_table5 (col1)
    VALUE (100.123);    -- 오류

SELECT * FROM my_table5;


-- 예) my_table6 만들기
-- age 컬럼은 정수 타입
-- score 컬럼 총길이 7 소수점이하 길이 2

CREATE TABLE my_table6(
    age INTEGER,
    score DECIMAL(7,2)
);

INSERT INTO my_table6(age, score)
VALUE (28, 12324.44);

INSERT INTO my_table6(age, score)
    VALUE (28, 123.443);

SELECT * FROM my_table6;


-- 문자열 : VARCHAR : 가변길이 문자열
CREATE TABLE my_table7(
    col1 VARCHAR(1),
    col2 VARCHAR(2),
    col3 VARCHAR(16000)
);

CREATE TABLE my_table8(
    col1 VARCHAR(8000),
    col2 VARCHAR(8000)
);

INSERT INTO my_table7(col1, col2, col3)
    VALUE ('가','가나','가나다라마바사아자차카타파함');

SELECT * FROM my_table7;


-- 테이블 만들기 예제
-- 예) my_table9 만들기
-- name 문자열 최대길이 100자
-- 주소 문자열 최대길이 200자
-- 전화번호 문자열 최대길이 100자

CREATE TABLE my_table9(
    name VARCHAR(100),
    address VARCHAR(200),
    phone_number VARCHAR(100)
);

INSERT INTO my_table9(name, address, phone_number)
VALUE ('재성','마계도시 인천','대충 전화번호 끄적끄적');

SELECT * FROM my_table9;


-- DATE type 날짜
CREATE TABLE my_table10(
    col1 DATE
);
INSERT INTO my_table10(col1)
VALUE ('1990-01-01');


INSERT INTO my_table10(col1)
    VALUE (NOW());


SELECT * FROM my_table10;

-- 날짜 시간:DATETIME
CREATE TABLE my_table11(
    col1 DATETIME
);
INSERT INTO my_table11 (col1)
VALUE ('2000-01-01 14:05:12');

SELECT * FROM my_table11;

INSERT INTO my_table11(col1)
VALUE (NOW()); -- 현재 날짜시간

SELECT NOW();

SELECT * FROM my_table11;