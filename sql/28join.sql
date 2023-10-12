USE w3schools;
SELECT * FROM products;
SELECT * FROM categories;

-- chais 상품의 카데고리명은?
SELECT CategoryID FROM products WHERE ProductName = 'chais';


SELECT CategoryName FROM categories WHERE CategoryID = 1;

-- JOIN : 두개의 테이블 결합
SELECT * FROM categories, products;
SELECT * FROM categories JOIN products;

SELECT COUNT(*) FROM categories;    -- 8개
SELECT COUNT(*) FROM products;      -- 77개


-- 77 * 8 = 616
SELECT COUNT(*) FROM categories,products;
SELECT COUNT(*) FROM categories JOIN products;


--

CREATE TABLE table_a (
                         product_id INT PRIMARY KEY AUTO_INCREMENT,
                         product_name VARCHAR(20),
                         category_id INT
);
CREATE TABLE table_b (
                         category_id INT PRIMARY KEY AUTO_INCREMENT,
                         category_name VARCHAR(20)
);
INSERT INTO table_b (category_name)
VALUES ('음료수'), ('반찬');
INSERT INTO table_a (product_name, category_id)
VALUES ('콜라', 1),
       ('사이다', 1),
       ('제육', 2),
       ('돈까스', 2),
       ('두부', 2);

SELECT *
FROM table_a JOIN table_b;

-- 두 테이블 결합하면
--  조회된 레코드 수는 A테이블 row * B테이블 row
--        컬럼 수는 A테이블 열 + B테이블 열

SELECT * FROM table_a;
SELECT *
FROM table_a JOIN table_b
WHERE product_name = '콜라'
  AND table_a.category_id = table_b.category_id;
-- 컬럼명이 하나의 테이블에만 있을 때 테이블명 생략 가능
-- 같은 컬럼명이 여러테이블에 있다면 테이블 명 작성

SELECT *
FROM table_a JOIN table_b
    ON table_a.category_id = table_b.category_id    -- join 조건
    WHERE product_name = '콜라';

SELECT ProductName, ProductID, CategoryName
FROM products p JOIN categories c
ON p.CategoryID = c.CategoryID
WHERE ProductName = 'chais';

-- 예) chais 상품의 공급자명, 전화번호
SELECT ProductName, SupplierName, Phone
FROM products p JOIN suppliers s
ON p.ProductID = s.SupplierID
WHERE ProductName = 'chais';

-- 예) 1996년 7월 4일에 주문한 고객명(customers, orders)
SELECT CustomerName
FROM orders o JOIN customers c
ON o.CustomerID = c.CustomerID
WHERE OrderDate = '1996-07-04';
-- 예) 1996년 7월 4일에 주문을 담당한 직원명(employees, orders)
SELECT lastname, firstname
FROM employees e JOIN orders o
ON  o.EmployeeID = e.EmployeeID
WHERE OrderDate = '1996-07-04';

SELECT * FROM products;
-- 3개 테이블 조회
SELECT *
FROM products, suppliers, categories;

SELECT COUNT(*)
FROM products, suppliers, categories;

SELECT *
FROM products p
    JOIN suppliers s ON p.SupplierID = s.SupplierID
    JOIN categories c ON p.CategoryID = c.CategoryID
WHERE p.ProductName = 'chais';

-- 예) 'Chang' 상품의 공급자명, 카테고리명 조회
SELECT SupplierName, CategoryName
    FROM products p
        JOIN suppliers s
        ON p.SupplierID = s.SupplierID
        JOIN categories c
        ON p.CategoryID = c.CategoryID
WHERE ProductName = 'Chang';

-- 예) 1996년 7월 9일에 주문한 고객명과 처리한 직원명
SELECT LastName,FirstName , CustomerName
FROM orders o
JOIN customers c ON o.CustomerID = c.CustomerID
JOIN employees e ON o.EmployeeID = e.EmployeeID
WHERE o.OrderDate = '1996-07-09';

-- 예) 1996년 7월 9일 주문한 상품명(orders, orderDetail, products)
SELECT ProductName
FROM orders o
JOIN orderdetails od ON o.OrderID = od.OrderID
JOIN products p ON od.ProductID = p.ProductID
WHERE OrderDate = '1996-07-09';

-- 예) 'chang' 상품이 주문된 날짜들
SELECT OrderDate, ProductName, CustomerName, CONCAT(e.FirstName, ' ',e.LastName)
FROM products p
    JOIN orderdetails od ON p.ProductID = od.ProductID
    JOIN orders o ON od.OrderID = o.OrderID
    JOIN customers c ON o.CustomerID = c.CustomerID
    JOIN employees e ON o.EmployeeID = e.EmployeeID
WHERE ProductName = 'Chang';