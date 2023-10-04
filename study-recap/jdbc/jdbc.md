# jdbc란
* 자바에서 데이터베이스에 접속할 수 있도록 하는 자바 API
* 자바 기반이므로, 자바 코드에서 동작한다. 

# 데이터베이스 설정 정보 연결
* shift+shift에서 application.properties
* spring.datasource.url=
  * 데이터베이스 서버의 주소와 포트 데이터베이스 이름을 지정
  * JDBC URL 형식을 따름
  * 예시 : jdbc:mysql://localhost:3306/mydb
  * 여기서 "localhost"는 데이터베이스 서버의 호스트명이고, "3306"은 포트 번호, "mydb"는 데이터베이스 이름
* spring.datasource.username=
  * 데이터베이스 연결 시 사용할 사용자 이름을 지정
  * 데이터베이스 연결 인증을 위해 사용
* spring.datasource.password=
  * 데이터베이스 연결 시 사용할 암호
* 추가

------------------------------------------------------------------

# JDBC의 활용 (Controller와 직접 연결)

## 데이터베이스 연결 설정
```sql
Connection connection = DriverManager.getConnection(url, username, password);
```
* JDBC api에서 데이터베이스와의 연결을 수립하기 위한 메서드
* 이 메서드를 호출하면 데이터베이스에 대한 연결 객체를 반환한다.
* JDBC를 사용하여 데이터베이스와 상호작용할 떄 데이터베이스에 연결하는 첫 번째 단계.
* 연결에 성공하면 **'연결 객체'** 를 반환
* 이 연결 객체는 데이터베이스와의 통신을 위한 핵심 객체로, sql 쿼리를 실행하고 db 트랜잭션을 관리하는 데 사용.

## Statment 객체 생성 
```sql 
Statement statement = connection.createStatement();
```
* Connection 객체를 기반으로 SQL 쿼리를 실행하기 위한 Statment 객체를 생성
* SQL 쿼리를 실행하고 DB로부터 결과를 받아오는 데 사용된다.

## SQL 쿼리 실행 및 결과 획득
```sql
        String sql = """
                        SELECT customerName
                        FROM customers
                        WHERE customerID =1
                """;
               
ResultSet resultSet = statement.executeQuery(sql);
```
* 파라미터의 sql은 실행할 SQL 쿼리를 나타내는 문자열
* executeQuery() 이 메서드는 주어진 SQL 쿼리를 실행하고 **결과 집합**(테이블)을 반환한다.
* 이 결과 집합에는 쿼리의 실행결과가 포함되며, SELECT문 또는 데이터 조회 쿼리의 경우 결과 데이터를 검색하기 위해 사용.


## 즉, 위 코드들은 데이터베이스와의 연결 설정 후, 실행할 쿼리를 Statement 객체를 통해 실행하고, 결과를 ResultSet 객체로 받아오는 과정을 수행.
* 이후에는 ResultSet 객체를 사용하여 결과 데이터를 검색하고 처리할 수 있다.


-----------------------------------------------------------------------
# ResultSet
* 테이블 형식의 데이터의 행을 가리키는 커서를 포함하고 있음
* 초기 커서는 첫 번째 행, 바로 전을 가리킨다. (첫 행 검색 준비 상태)
* 다음 행으로 옮겨가는 메서드 : next()


## **참고** 컬럼에는 순서가 있지만, 각각의 튜플(레코드)에는 순서가 없다
