SELECT CustomerName, City, Country FROM customers;
SELECT CustomerName, City, Country FROM customers WHERE Country = 'spain';
SELECT CustomerName, City, Country FROM customers WHERE City = 'madrid';
SELECT CustomerName, City, Country FROM customers
                                   WHERE City = 'madrid' AND  Country = 'spain';
SELECT CustomerName, City, Country FROM customers
                                   WHERE NOT City = 'madrid' AND  Country = 'spain';
SELECT CustomerName, City, Country FROM customers
                                   WHERE NOT City = 'madrid' AND NOT Country = 'spain';
SELECT CustomerName, City, Country FROM customers
WHERE NOT (City = 'madrid' AND Country = 'spain');

-- OR 연산자
SELECT CustomerName, City, Country FROM customers
WHERE (City = 'madrid' OR Country = 'spain');

SELECT CustomerName, City, Country FROM customers
WHERE Country = 'UK' OR Country = 'spain';


SELECT * FROM products
WHERE Price >= 10.00 AND  Price<= 20.00;

SELECT * FROM customers
WHERE CustomerName >= 'c' AND  CustomerName < 'd';

SELECT * FROM employees
WHERE BirthDate >= '1958-01-01' AND BirthDate < '1959-01-01';


SELECT * FROM suppliers WHERE Country = 'sweden' OR Country ='Italy';
SELECT * FROM employees WHERE BirthDate >= '1963-08-01' AND BirthDate <= '1963-08-31';
SELECT * FROM products WHERE Price >= 100.0 AND Price <= 200.0;
SELECT * FROM orders WHERE OrderDate >= '1997-01-01' AND OrderDate >= '1997-12-31';


-- 여러 연산자 조합시 () 사용해서 우선순위 결정

-- 예) 10달러 미만, 100달러 이상
SELECT * FROM products WHERE (Price < 10 OR Price >= 100) AND (CategoryID = 1);
