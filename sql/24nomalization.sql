-- normalization : 정규화
-- 예) 이름, 최종학력, 특기
CREATE TABLE my_table21_person
(
    name    VARCHAR(100) NOT NULL,
    schools VARCHAR(100),
    skill   VARCHAR(1000)
);
INSERT INTO my_table21_person (name, schools, skill)
    VALUE ('손흥민', '대학', '축구, 노래');


INSERT INTO my_table21_person (name, schools, skill)
    VALUE ('이강인', '대학원', '야구, 농구');


INSERT INTO my_table21_person (name, schools, skill)
    VALUE ('김민재', '대학원', '배구');


SELECT *
FROM my_table21_person;

CREATE TABLE my_table22_person
(
    name    VARCHAR(20) NOT NULL,
    schools VARCHAR(100),
    skill1  VARCHAR(100),
    skill2  VARCHAR(100),
    skill3  VARCHAR(100)
);

-- 책 209쪽 규칙1
-- 원자적 데잍로 구성된 테이블은 같은 타입의 데이터를 여러 열에 가질 수 없다.
INSERT INTO my_table22_person (name, schools, skill1, skill2, skill3)
    VALUE ('손흥민', '대학교', '축구', '노래', NULL);

INSERT INTO my_table22_person (name, schools, skill1, skill2, skill3)
    VALUE ('이강인', '대학원', '야구', '노래', NULL);

INSERT INTO my_table22_person (name, schools, skill1, skill2, skill3)
    VALUE ('김민재', '대학원', '배구', NULL, NULL);


SELECT *
FROM my_table22_person;


CREATE TABLE my_table23_person
(
    name    VARCHAR(20) NOT NULL,
    schools VARCHAR(100),
    skill   VARCHAR(100)
);

INSERT INTO my_table23_person(name, schools, skill)
    VALUE ('흥민', '대학', '축구');


INSERT INTO my_table23_person(name, schools, skill)
    VALUE ('흥민', '대학', '노래');


INSERT INTO my_table23_person(name, schools, skill)
    VALUE ('강인', '대학', '야구');


INSERT INTO my_table23_person(name, schools, skill)
    VALUE ('강인', '대학', '야구');

-- key : 각 행을 구분하는 컬럼(들)

-- 책 215 정규화
-- 각 행의 데이터들은 원자적 값을 가져야 한다.
-- 각 행은 유일 무이한 식별자인 기본키(primary key)를 가지고 있어야 한다.

CREATE TABLE my_table24_person
(
    ssn    VARCHAR(10) NOT NULL UNIQUE,
    name   VARCHAR(10) NOT NULL,
    school VARCHAR(10),
    skill  VARCHAR(10)
);


-- 책 216쪽 ~
-- 기본키 조건
-- 기본키는 NULL이 될 수 없다.
-- 기본키는 값이 레코드가 삽입될 때 값이 있어야함.
-- 기본키는 간결해야 함.
-- 기본키의 값은 변경이 불가

CREATE TABLE my_table25person
(
    id INT NOT NULL UNIQUE AUTO_INCREMENT,  -- AUTO_INCREMENT: 자동으로 1씩 증가. (유일성) 만족 및 레코드가 삽입될 때 값이 있어야 하는 조건에 만족함.
    ssn    VARCHAR(10) NOT NULL UNIQUE,
    name   VARCHAR(10) NOT NULL,
    school VARCHAR(10),
    skill  VARCHAR(10)
);

DROP TABLE my_table25person;


CREATE TABLE my_table25_person
(
    id INT NOT NULL UNIQUE AUTO_INCREMENT,  -- AUTO_INCREMENT: 자동으로 1씩 증가. (유일성) 만족 및 레코드가 삽입될 때 값이 있어야 하는 조건에 만족함.
    ssn    VARCHAR(10) NOT NULL,
    name   VARCHAR(10) NOT NULL,
    school VARCHAR(10),
    skill  VARCHAR(10)
);

INSERT INTO my_table25_person (ssn, name, school, skill)
    VALUE ('080101', '흥민', '대학', '축구');
INSERT INTO my_table25_person (ssn, name, school, skill)
    VALUE ('080101', '흥민', '대학', '노래');
INSERT INTO my_table25_person (ssn, name, school, skill)
    VALUE ('090101', '강인', '대학', '농구');
INSERT INTO my_table25_person (ssn, name, school, skill)
    VALUE ('090101', '흥민', '대학', '축구');

SELECT * FROM my_table25_person;


CREATE TABLE my_table26_person
(
    id INT PRIMARY KEY AUTO_INCREMENT,  -- PRIMARY KEY : NOT NULL + UNIQUE
    ssn    VARCHAR(10) NOT NULL,
    name   VARCHAR(10) NOT NULL,
    school VARCHAR(10),
    skill  VARCHAR(10)
);
DESC my_table25_person;
DESC my_table26_person;
