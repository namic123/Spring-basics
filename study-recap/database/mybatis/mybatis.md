# MyBatis 
* 자바 웹 애플리케이션에서 데이터베이스와 상호 작용하기 위한 데이터베이스 엑세스 프레임 워크
* MyBatis는 SQL 쿼리를 DB에 보내고 결과를 매핑하는데 사용됨.

## SQL 매핑
* MyBatis는 SQL 쿼리를 XML파일 또는 에너테이션을 사용하여 관리할 수 있도록 지원

-------------------------------------------------------
# 에너테이션 방식 

## @Mapper
* Mapper 에너테이션은 MyBatis에서 인터페이스를 표시하는 데 사용
* 이 에너테이션을 사용하면 MyBatis는 해당 인터페이스를 자동으로 구현한 프록시 객체를 생성함.
* 프록시 객체는 실제 SQL 쿼리를 실행하는 메서드를 제공
* 즉, Mapper 에너테이션은 MyBatis에게 해당 인터페이스를 스캔하여 프록시 객체를 생성하도록 지시하는 역할을 함.

*참고* 프록시(대변인) 객체란? 해당 인터페이스의 메서드 호출이 있을 때 중간에서 메서드를 가로채서 조작하거나 여러 보조 역할을 한다.
* 즉, MyBatis에서 @Mapper 에너테이션을 사용하는 인터페이스는 실제로 MyBatis에 의해 생성된 프록시 객체로 대체가 되고, 
프록시 객체는 인터페이스의 메서드 호출을 가로채서 실제 SQL 쿼리를 실행하거나 보조 역할을 한다. 또한, MyBatis가 자동으로 SQL과 자바 객체 간의 매핑을 처리한다. 

## @Select
* Select 에너테이션은 MyBatis에서 SQL 쿼리를 지정 및 직접 정의하는 데 사용
* @Select() 인자 안에 SQL 쿼리를 작성하면 MyBatis에서 해당 쿼리를 사용자를 대신하여 DB에 실행하고 결과를 자바 객체에 매핑한다.

### 예시
```java
// 컨트롤러 예시
@Controller
@RequestMapping("main28")
// 생성자 의존성 주입 방식, 생성자가 없기 때문에 선언된 필드에 따른 생성자를 하나 만들어줌
// 생성자가 하나만 존재할 경우 @Autowired를 생략할 수 있음.
@RequiredArgsConstructor    
public class Controller28 {
    // @Mapper 에너테이션이 지정된 MyDao2 인터페이스를 구현한 프록시 객체가 담긴다.
    private final MyDao2 dao;   
    
    @GetMapping("sub1")
    public void method1(Integer id) throws Exception{
        // 아래 메서드는 실제로 프록시 객체에 정의된 메서드가 호출됨
        String name = dao.select(id);
        System.out.println("name = " + name);
    }

// MyBatis의 스캔 대상이 될 인터페이스를 @Mapper로 선언
// @Mapper가 선언된 인터페이스를 MyBatis에서 프록시 객체를 생성해줌
@Mapper 
public interface MyDao2 {
    @Select("""
    SELECT LastName From employees
    WHERE EmployeeID = #{id}   -- MyBatis에서 아래 메서드의 파라미터 값으로 대체해줌.
    """)
    String select(Integer id);
}
```