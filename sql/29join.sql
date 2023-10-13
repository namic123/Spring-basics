USE w3schools;
SELECT *
FROM products p JOIN suppliers s
     ON p.SupplierID = s.SupplierID ;

-- using : 두 개의 테이블이 내부 조인으로 조인 될 때 조인하고자 하는
-- 두 테이블의 컬럼명이 같을 경우 조인 조건을 길게 적지 않고 간단하게 적을 수 있도록 하는 역할
SELECT *
FROM products p JOIN suppliers s
    USING (SupplierID);

-- natrual join  Natural Join을 사용하면 공통된 속성을 찾아 같은 값을 갖는 항목끼리 결합시켜준다.
-- 만약 같은 값을 갖는 항목이 없다면 해당 항목은 제외한다.
SELECT *
FROM products p NATURAL JOIN suppliers s;


