# Statement(인터페이스)
* static(정적) SQL을 사용하기 위한 인터페이스 

## Static SQL에서 연산자를 사용하면 문제점
* 사용자에 의해 원치않는 결과가 생길 수 있음
* 예를들어 사용자에게 input을 통해 입력받은 값으로 WHERE 절에 대입할 수 있는 코드가 있다고 가정한다.
* 이는 사용자가 입력한대로 SQL문이 작성되기 때문에 위험하다.
* 즉, 악의적인 SQL문을 실행되게 함으로써 데이터베이스를 비정상적으로 조작하게 하며, 이것을 SQL injection이라고함.


## PreparedStatement
* SQL Injection 공격을 방지하고 DB 성능을 최적화하기 위한 기술
* Statement에서 향상된 인터페이스
* SQL 쿼리가 실행되기 전 DB 서버에 미리 컴파일됨.
* 즉, SQL 쿼리의 실행 계획을 db서버에서 미리 준비함.
* SQL 쿼리 내에서 '?' 변수를 사용하여 동적인 값을 전달할 수 있음.


```java
       String sql = """
                SELECT customerId, customerName, country
                FROM customers
                WHERE customerId = ?    
                """;

        Connection connection = dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        // excute 하기 전에 '?'에 들어갈 값을 할당해주어야 한다. 
        preparedStatement.setString(1, "3");  // SQL의 물음표를 채우는 메서드, 첫 번째 파라미터에는 쿼리 인덱스, 두 번째 파라미터에는 할당할 값.
//        statement.setInt(1, 3);
        ResultSet resultSet = preparedStatement.executeQuery();
```
