# JSON(Java Object Notation)
* 데이터를 교환하는 데 사용되는 텍스트 기반 형식
* JSON의 구조는 문자열 형태로 되어있음. (JSON text)
```json lines
'{
"name":"jones"
}'
```
* JSON의 두 가지 기본 구조
1. 객체 - 키와 값 쌍의 모음
```json
{
  "name": "John",
  "age": 30
}
```
2. 배열 - 값의 순서가 있는 리스트
```json
[1, "hello", true]
```

# JSON 직렬화 
* JSON 직렬화란? 복잡한 데이터 구조를 JSON 형식의 문자열 형태로 변환하는 과정을 의미한다.

직렬화
```json
    {name: "lee", age:33, score: 8.9}
    -> 직렬화 '{"name": "lee", "age":33, "score": 8.9}'
```
역직렬화(또는 파싱)
```json
    '{"name": "lee", "age":33, "score": 8.9}'
    -> 파싱 {name="lee", age=33, score=8.9}
```

*참고* @RequestBody는 HTTP 요청 본문을 Java 객체로 역직렬화하는 데 사용된다. @RequestBody는 주로 @RestController와 함꼐 사용되어 JSON, XML 등의 형식의 데이터를 자바 객체로 매핑한다.


### 요청, 응답 데이터 전송 흐름
1. 클라이언트 측에서 요청을 보낼때 JavaScript 객체를 직렬화(JSON 형태의 문자열 변환)하여, 서버에 전송되고 서버에서 Java객체로 파싱
2. 마찬가지로 서버에서 응답을 보낼 때도 JSON 형식의 문자열로 직렬화하여 보내고, 클라이언트 측에서는 JavaScript 형식의 객체로 파싱하여 데이터를 쓴다.

