SELECT * FROM customers
WHERE CustomerName = 'Around the Horn';

SELECT * FROM customers
WHERE CustomerName LIKE '%ch%';

-- LIKE: 검색
-- %, _ 기호와 함께 사용 됨

-- % 기호
SELECT * FROM customers
WHERE CustomerName LIKE 'ch%';  -- ch로 시작하는 0개이상 문자

SELECT * FROM customers
WHERE CustomerName LIKE '%ch';  -- ch로 끝나는 0개이상 문자
SELECT * FROM customers
WHERE CustomerName LIKE '%er';  -- er로 끝나는 0개이상 문자

SELECT * FROM customers
WHERE CustomerName LIKE '%er%';  -- 중간에 er이 있는 0개이상 문자

-- _ 기호
SELECT * FROM employees
WHERE FirstName LIKE '_____';   -- _: 언더스크어 갯수만큼의 글자 (여기서 5개)

SELECT * FROM employees
WHERE LastName LIKE '____';   -- _: 4개의 문자 아무거나

SELECT * FROM employees
WHERE LastName LIKE '_e%';  -- 두 번째 글자가 e인 문자열(여기서는 아무글자 뒤에 2번째가 e만 붙으면됨.(두글자 x))


-- 예) ch로 시작하는 상품명 조회
SELECT * FROM products
WHERE ProductName LIKE 'ch%';
-- 예) es로 끝나는 상품명 조회
SELECT * FROM products
WHERE ProductName LIKE '%es';
-- 예 ) 중간에 use가 있는 상품명 조회;
SELECT * FROM products
WHERE ProductName LIKE '%use%';
-- 예) 두번째 글자가 u인 상품명 조회
SELECT * FROM products
WHERE ProductName LIKE '_u%';


SELECT * FROM customers
WHERE CustomerName LIKE '%red%';

SELECT * FROM customers
WHERE ContactName LIKE '%red%';