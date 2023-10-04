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