# @Options 
* 자동으로 생성된 기본키를 다루는 방법을 제공하는 어노테이션 

## useGeneratedKeys
* 이 속성은 자동으로 생성된 키를 사용할지 여부를 나타내는 속성이다.
* true로 설정하면 자동으로 생성된 키를 사용
* 반면, false는 사용하지 않음

## keyProperty
* 자동 생성 키를 저장할 Java 객체의 속성(프로퍼티)의 이름을 나타냄
* 레코드가 삽입된 후 생성된 키를 저장할 객체의 프로퍼티를 가리킴
* 객체의 필드 이름을 지정

```java
    @Insert("""
    INSERT INTO employees(LastName, FirstName)
    VALUE (#{lastName},#{firstName})
""")

    @Options(useGeneratedKeys = true, keyProperty = "id")
   int insert3(MyDto38 dto);
```