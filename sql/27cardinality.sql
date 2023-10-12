USE mydb1;
-- 1:n

-- 1:1
CREATE TABLE my_table37_employee(
    id INT AUTO_INCREMENT PRIMARY KEY ,
    name VARCHAR(20),
    birth DATE

);
CREATE TABLE my_table38_employee_inf(
    id INT REFERENCES my_table37_employee(id),
    salary INT,
    address VARCHAR(20)
);

-- 책(350쪽)
-- n:m(다대다)
-- 다대다 관계는 1:n, 1:m

CREATE TABLE my_table39_person(
    id INT PRIMARY KEY  AUTO_INCREMENT,
    name VARCHAR(20)
);

CREATE TABLE my_table40_skill(
  id INT PRIMARY KEY AUTO_INCREMENT,
  skill_name VARCHAR(20)
);

CREATE TABLE my_table41_person_skill(
    person_id INT REFERENCES my_table39_person(id),
    skill_id INT REFERENCES my_table40_skill(id),
    PRIMARY KEY (person_id,skill_id)
);