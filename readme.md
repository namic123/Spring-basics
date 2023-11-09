# Spring MVC basics for study Skill Stack
# Spring
  
* ## Spring-boot
 * ### Bean
 * ### Configuration
 * ### DI(Dependency Injection)
  * #### Component  
  * #### Autowired

* ### Controller 
  * #### WebRequest
   * Http 요청 정보 제공, 요청을 처리하는 헤더, 쿼리 매개변수 등의 데이터 접근 가능 
  * #### HttpSession
   * http session을 관리, 사용자 상태 정보를 서버에 저장하고, 각 사용자의 요청 간 데이터를 유지 관리에 사용 
  * #### ServletContext
   * 애플리케이션 실행 환경 정보를 제공, 웹 앱 전역 정보 및 설정 관리, 서블릿과 JSP가 공유하는 리소스에 접근 
  * #### RequestMapping
   * 요청 URL 처리 메서드 매핑 역할  
   * #### GetMapping
    * http GET 요청 처리할 메서드에 적용
   * #### PostMapping
    * http POST 요청 처리할 메서드에 적용
   * #### PutMapping
    * http PUT 요청 처리할 메서드에 적용 
   * #### DeleteMapping
    * http DELETE 요청 처리할 메서드에 적용 
  * #### PathVariable
   * url 경로에서 변수를 추출하는 데 사용, 메서드의 매개변수에 이 어노테이션 적용하여 동적 url 경로 처리
  * #### RequestParam
   * 요청 파라미터(query string)를 메서드의 매개변수에 바인딩하는 데 사용
  * #### RedirectAttirbutes
   * 리다이렉트 시점에 데이터를 전달할 때 사용되는 객체, 또는 리다이렉트 후 특정 데이터 유지에도 사용 
  * #### ResponseBody
   * 메서드의 반환 값을 응답 본문(body)으로 사용하도록 지시, JSON 또는 XML 형식으로 직렬화
   * 뷰 리졸버(JSP, Thymeleaf 등)를 거치지 않고 http 메세지 컨버터를 통해 직접 응답 데이터를 구성 
  * #### RequestBody
   * 메서드 파라미터에서 사용되며, HTTP 요청 본문의 내용을 Java 객체로 바인딩
   * 요청된 JSON, XML등 데이터를 해당 어노테이션이 붙은 매개변수에 바인딩 
  * #### ResponseEntity
   * HTTP 응답 전체를 나타내는 객체
   * 상태코드, 헤더, 응답 본문 등을 포함하여 반환
   * REST API  구현 시 사용되며, 예외 처리 및 다양한 http 상태코드를 반환할 필요가 있을 경우 사용 
 
* ### Model
 * 비즈니스 로직 및 데이터를 포함 
 * 데이터 처리와 관련된 로직을 캡슐화
 
* ### View
 * 사용자에게 보여지는 인터페이스
 * HTML, JSP, Thymeleaf등의 템플릿 엔진 
 * #### jsp

* ### Service
 * 비즈니스 로직을 처리하는 서비스 계층 클래스
 * 즉, 비즈니스 규칙과 데이터 처리 로직을 포함하여, DB와 상호작용을 추상화함.
 * 컨트롤러와 모델 사이에서 중간 역할을 하며, 주로 Controller에서 전달된 요청을 처리하여 model에 전달
 * #### @Service
  * 이 어노테이션으로 표시된 클래스는 Spring 컨테이너에 의해 관리
  * 비즈니스 로직, 트랜잭션 관리를 담당
 * #### @Transactional
  * 해당 영역의 작업을 하나의 트랜잭션으로 묶는 역할을함.
  * DB 작업의 일관성, 무결성 보장과 오류 발생 시 자동 롤백 지원 


* ### DTO(Data Transfer Object)
 * 데이터 전송을 위해 사용되는 객체
 * 여러 계층(예: 컨트롤러, 서비스, 데이터 액세스 계층) 간 객체의 속성을 통해 데이터를 교환
 * ORM(객체-관계 매핑), DB 레코드와 java 객체 간의 매핑을 지원

--------------------------------------------------------------------------------------------------------------
# Database
* ### jdbc
 * #### Connection
 * #### Statement
 * #### ResultSet
 * #### PreparedStatement
* ### SQL(Maria DB)
 * select
 * where
 * not
 * compare
 * and or
 * between
 * in
 * arithmetic
 * alias
 * orderby
 * limit
 * paging
 * like
 * insert
 * delete
 * update
 * create
 * null
 * data-type
 * table
 * nomalization
 * primary key
 * foriegn key
 * cardinality
 * join
 * subquery
 * union
 * aggregate-function
 * groupby
 * having
 * alter-table
 * transaction
* ### myBatis (DAO)
 * #### @Mapper
 * #### @Options
 * #### @Select
 * #### @Update
 * #### @Insert
 * #### @Delete
--------------------------------------------------------------------------------------------------------------

* # AJAX
 * ### Axios
  * promise
  * axios.httpMethod()(get, post, delete, put)
  * .then, .catch, .finally
  * response 객체
* ### JSON
 * #### 직렬화, 역직렬화(파싱) 
--------------------------------------------------------------------------------------------------------------
* # Lombok
--------------------------------------------------------------------------------------------------------------
* # AWS
--------------------------------------------------------------------------------------------------------------
* # git
