# SQL 문법

## FROM
* 테이블을 지정

## SELECT
* 테이블의 컬럼을 지정

### FROM과 SELECT 조합
```sql
SELECT CustomerName, CustomerID, Country    -- 순서에 따라 컬럼이 나열되어 조회됨
FROM customers;
```

## DISTINCT
* 중복 제거
```sql
SELECT DISTINCT City, Country 
FROM  customers;  -- 69개 (중복 제거)
```

## COUNT 
* 행(row, record)의 수를 카운트
```sql
SELECT COUNT(DISTINCT Country) 
FROM customers;
```

## WHERE
* 컬럼에 조건을 부여하여 검색
```sql
-- 영국에 사는 고객의 이름과, 고객번호 조회
SELECT CustomerID, CustomerName FROM customers WHERE Country = 'UK';
```


## NOT 
* 부정연산
```sql
-- Country가 'Germany'가 아닌  CustomerName, Country 조회
SELECT CustomerName, Country FROM customers WHERE NOT Country = 'Germany';
```

## LIMIT ? OR LIMIT ? ?
* 결과 집합에서 반환할 행(row)의 수를 제한하는데 사용되는 법이다.
* 페이징 기능을 구현하는데 유용 
* 인덱스가 하나면 LIMIT 수만큼 데이터를 반환하고
* 인덱스가 두개면 첫 번째 인덱스에는 시작점, 두 번째 인덱스는 반환 갯수를 지정
```sql
-- 카페 게시판이라고 가정
SELECT CustomerID, CustomerName FROM customers
ORDER BY CustomerID
LIMIT 0, 10;    -- 1페이지의 10개

SELECT CustomerID, CustomerName FROM customers
ORDER BY CustomerID
LIMIT 10, 10;    -- 2페이지의 10개

SELECT CustomerID, CustomerName FROM customers
ORDER BY CustomerID
LIMIT 20, 10;    -- 3페이지의 10개

SELECT CustomerID, CustomerName FROM customers
ORDER BY CustomerID
LIMIT 90, 10;    -- 마지막 페이지 10개
```

## ORDER BY
* 데이터 순서를 지정하는 데 사용됨.
* 기본 값은 ASC(오름차순) 생략이 가능하다.
* DEC는 내림차순
```sql
-- 오름차순 (기본 값) 생략가능
SELECT * FROM products ORDER BY  CategoryID ASC;

-- 내림차순 DESC
SELECT * FROM products ORDER BY  CategoryID DESC;

SELECT * FROM products ORDER BY  CategoryID DESC, Price DESC;
```

## CONCAT 
* 레코드를 결합하여 반환 
```sql
SELECT CONCAT(City,' ', Country) FROM customers
```

## AS
* 테이블, 컬럼, 레코드에 변수명을 지정
```sql
SELECT EmployeeID, CONCAT(FirstName, ' ',LastName) AS fullname FROM employees;

-- 테이블명에 별칭(Alias)를 주기
SELECT p.ProductName, c.CategoryID
FROM products AS p JOIN categories AS c ON p.CategoryID = c.CategoryID
```


## LIKE 
* 특정 문자열을 검색할 때 사용하며, '%', '_' 기호와 같이 사용된다 
```sql
-- %는 특정 문자를 조회 
SELECT * FROM customers
WHERE CustomerName LIKE 'ch%';  -- ch로 시작하는 0개이상 문자

SELECT * FROM customers
WHERE CustomerName LIKE '%ch';  -- ch로 끝나는 0개이상 문자

-- _ 는 글자 갯수에 대한 조건 부여
SELECT * FROM employees
WHERE FirstName LIKE '_____';   -- _: 언더스크어 갯수만큼의 글자 (여기서 5개)

SELECT * FROM employees
WHERE LastName LIKE '____';   -- _: 4개의 문자 아무거나

SELECT * FROM employees
WHERE LastName LIKE '_e%';  -- 두 번째 글자가 e인 문자열(여기서는 아무글자 뒤에 2번째가 e만 붙으면됨.(두글자 x))

```
------------------------------------------------------

# DML

## INSERT INTO
* 테이블에 데이터를 추가
* 특정 컬럼에만 값을 넣을 때 컬럼명 나열 생략하면 안됨
*  나열된 컬럼명과 값의 순서, 갯수가 같아야함.
```sql
-- 모든 컬럼에 값 넣을 때 컬럼명 나열 생략 가능
INSERT INTO employees
    VALUE (12, '김','민재','2000-03-03', '사진12', '수비 잘함');

INSERT INTO employees(EmployeeID,LastName,FirstName)
VALUE (13, '박','지성'); 



```

## DELETE

## UPDATE
* 컬럼의 레코드(데이터를)를 수정
* WHERE절이 포함되지 않으면 실행되지 않음.
```sql
-- 예) 1Q번 고객의 이름 수정하기
UPDATE customers
SET CustomerName = '박재성'
WHERE CustomerID = 1;

SELECT * FROM customers;
-- 예) 5번 직원이 NOTES 변경
UPDATE employees
SET Notes = '블라블라'
WHERE EmployeeID = 5;
SELECT * FROM employees;


-- 예) 1번 공급자의 전화번호, 주소 변경
UPDATE suppliers
SET Phone = 01012312345,
    Address = '인천'
WHERE SupplierID = 1;
SELECT * FROM suppliers;
```

--------------------------------------------------------
# NULL