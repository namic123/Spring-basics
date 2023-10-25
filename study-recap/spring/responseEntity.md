# ResponseEntity
* 응답 코드와 응답 본문을 작성할 수 있는 객체 
* 즉, 이 클래스를 사용하면 응답 헤더, 상태 코드, 본문 등을 모두 포함한 HTTP 응답을 제어할 수 있는 객체이다.
* Entity의 사전적 의미는 '본체' 또는 '실재'를 의미
* 즉, ResponseEntity는 http 응답의 본체를 작성한다는 의미를 담고 있음
* ResponseEntity는 제네릭 타입 클래스이다.
* 참고 : 반환타입이 ResponseEntity 이면 @ResponseBody를 생략 가능

*  
```java 
class example {
    @GetMapping("sub1")
    @ResponseBody // 반환타입이 ResponseEntity 이면 생략 가능
    public ResponseEntity method1() {
        // ResponseEntity
        // : 응답코드, 응답본문 작성 가능한 객체

        //  HTTP 상태 코드 400(Bad Request(클라이언트 오류))로 설정된 ResponseEntity 객체를 빌드하는 메서드 체인
        // http 상태 코드, 1xx, 2xx, 3xx, 4xx, 5xx
        return ResponseEntity.status(400).build();
    }
    @GetMapping("sub2")
    @ResponseBody
    public ResponseEntity method2() {
        // 상태코드 대신 상태코드의 내용으로 빌드하는 것도 가능
        // 400 응답 코드
        return ResponseEntity.badRequest().build();
        // .notFound().build; 404 응답 코드
        // .internalServerError().build(); 5xx의 서버 오류 응답 코드
        
    }
    
//  5xx 상태코드. 서버 사이드 오류 
    @GetMapping("sub3")
    public ResponseEntity method3() {
        return ResponseEntity.internalServerError().build();
    }
}


```

* ResponseEntity는 제네릭 타입 클래스이다. 
* 즉, 응답 본문의 타입을 결정할 수 있다.
```java
class Example{ 
    // 응답 본문이 String, 즉  "Hello World!"
    ResponseEntity<String> response = new ResponseEntity<>("Hello World!", HttpStatus.OK);
}
```

* dao(Data Access Object)와의 결합
```java
public class MyDto45 {
    private Integer id;
    private Double price;
    private String category;
    private String unit;
}

/*// dao 
// id를 쿼리스트링 등으로 입력 받아서 상품의 id, price category unit을 반환
@Select("""
            SELECT ProductID id, Price, CategoryName category, unit
            FROM w3schools.products p JOIN w3schools.categories c
            ON p.CategoryID = c.CategoryID
            WHERE ProductID = #{id}
        """)
MyDto45 selectProductById2(Integer id);
}*/

class Example{
    @GetMapping("sub4")
    public ResponseEntity<MyDto45> method4(Integer id) {   // MyDto45 객체의 프로퍼티를 응답 메세지로 반환  
        MyDto45 data = dao.selectProductById2(id); // 리퀘스트 파라미터로 받은 id로 database 작업 처리

//        return ResponseEntity.status(200).body(data);
//        return ResponseEntity.ok().body(data);
//        return ResponseEntity.ok(data);
        if (data == null) { // 요청에서 전달된 data가 없는 경우 404코드 발생
            return ResponseEntity.notFound().build();
        } else {    // data가 전달되고 존재하는 경우, data(MyDto45의 프로퍼티)를 응답 메세지에 포함.
            return ResponseEntity.ok(data);
        }
    }
}
```