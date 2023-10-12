-- 정규화 Normalization
-- 제 1 정규화 (FIRST NORMAL FORM) 1NF)
-- 원자적 데이터를 가진 테이블, PK 컬럼이 있어야 함.

-- ## 제 2 정규화 (SECOND NORMAL FORM) 2NF)
-- * 1NF + 부분적 함수 의존이 없어야 함.
-- * ### 부분적 함수 의존(partial functional dependency)
--   * 키가 아닌 컬럼의 값이 키 컬럼 일부에 종속되지 않아야 한다.
--   * 키의 일부가 변경되면 키가 아닌 컬럼이 변경되어야 하면 부분적 함수 의존
--
-- ## 제 3 정규화 (THIRD NORMAL FORM) 3NF)
-- * 2NF(함수적 종속성 X) + 이행적 종속이 없어야함.
-- * ### 이행적 종속(transiticve dependency)
--   * 키가 아닌 컬럼이 키가 아닌 다른 컬럼에 의존
--   * 즉, 키가 아닌 컬럼이 변경되면, 다른 키가 아닌 컬럼이 변경되어야 할때를 이행적 종속이 있다고 말함.

-- 예제) 입사 지원자
-- id(PK), 이름, 학교, 학교주소

USE mydb1;
CREATE TABLE my_table30_person
(
    id             INT PRIMARY KEY AUTO_INCREMENT,
    name           VARCHAR(10),
    school         VARCHAR(10),
    school_address VARCHAR(10)
);

INSERT INTO my_table30_person (name, school, school_address)
VALUES ('흥민', '서울대', '관악'),
       ('강인', '고려대', '안암'),
       ('민재', '연세대', '신촌'),
       ('지성', '고려대', '안암'),
       ('범근', '연세대', '신촌');

SELECT *
FROM my_table30_person;

-- 1,2 정규형은 만족, 즉 최소성 유일성, 함수적 종속(기본키 일부에 컬럼이 종속하는 것)은 없으나, 주소 컬럼이 학교 컬럼에 의존(이행적 종속) 하기 때문에 3은 만족하지 못함.

CREATE TABLE my_table31_person
(
    id     INT PRIMARY KEY AUTO_INCREMENT,
    name   VARCHAR(10),
    school VARCHAR(10)
);

CREATE TABLE my_table32_school
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(10),
    address VARCHAR(10)
);

INSERT INTO my_table31_person (name, school)
VALUES ('흥민', '서울대'),
       ('강인', '고려대'),
       ('민재', '연세대'),
       ('지성', '고려대'),
       ('범근', '연세대');

INSERT INTO my_table32_school (name, address)
VALUES ('서울대', '관악'),
       ('고려대', '안암'),
       ('연세대', '신촌'),
       ('고려대', '안암'),
       ('연세대', '신촌');

CREATE TABLE my_table33_person
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(10),
    school_id INT -- 한 테이블의 컬럼이 다른 테이블을 참조하면 pk를 사용해야함
);

CREATE TABLE my_table34_school
(
    id     INT PRIMARY KEY AUTO_INCREMENT,
    name   VARCHAR(10),
    address VARCHAR(10)
);

INSERT INTO my_table33_person(name, school_id)
VALUES ('흥민', 1),
       ('강인', 2),
       ('민재', 3);

INSERT INTO my_table34_school(name, address)
VALUES ('서울대', '관악'),
       ('연세대', '신촌'),
       ('고려대', '안암');

SELECT * FROM my_table34_school;

INSERT INTO my_table33_person(name, school_id)
VALUES ('지성' 4);

CREATE TABLE my_table35_person
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(10),
    school_id INT REFERENCES my_table36_school(id)
);
-- 한테이블의 컬럼이 다른 테이블을 참조하면 pk를 사용해야함
-- 이것을 외래키(foreign key) 제약사항이라고 말함.

CREATE TABLE my_table36_school
(
    id     INT PRIMARY KEY AUTO_INCREMENT,
    name   VARCHAR(10),
    address VARCHAR(10)
);

INSERT INTO my_table35_person(name, school_id)
VALUES ('흥민', 1),
       ('강인', 2),
       ('민재', 3);

INSERT INTO my_table36_school(name, address)
VALUES ('서울대', '관악'),
       ('연세대', '신촌'),
       ('고려대', '안암');

INSERT INTO my_table35_person(name, school_id)
VALUES ('지성', 4);   -- 참조 테이블인 36에 id가 4가 없으므로, 실행되지 않음

DELETE FROM my_table36_school WHERE id = 1; -- 35 테이블이 해당 id참조하고 있으므로 삭제가 불가함.

SELECT * FROM my_table35_person;

DESC my_table35_person;
SHOW CREATE TABLE my_table35_person;

-- 한테이블의 컬럼이 다른 테이블을 참조하면 pk를 사용해야함
-- 이것을 외래키(foreign key) 제약사항이라고 말함.
-- 외래키는 참조키, FK라고도 불림.