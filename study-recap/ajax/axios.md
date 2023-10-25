# Axios
* #### Axios는 JavaScript에서 HTTP 요청을 할 때 사용되는 라이브러리이다.
* AJAX를 더 쉽고 편리하게 사용할 수 있도록 만든 라이브러리
* Promise 기반: 비동기 HTTP요청을 쉽게 처리할 수 있음.
* 취소 토큰: 진행 중인 요청을 취소할 수 있음.
* 자동 형변환 : JSON 데이터를 자동으로 JavaScript 객체로 변환해줌.
* 요약하자면, axios는 HTTP의 요청을 비동기로 처리한다.


## Promise란?
* JavaScript(클라이언트 사이드)에서 비동기 작업을 다루기 위한 *객체*이다.
* axios의 각 요청메서드(get, post, put, delete 등)는 Promise 객체를 반환한다.
* 이 Promise 객체를 통해 HTTP 요청의 성공 또는 실패에 따라 추가적인 작업을 수행할 수 있음
* 추가적인 작업에서는 '.then()'또는 '.catch()'메서드를 사용하여 이를 구현할 수 있음. 

### 예시 코드
```html
    <button onclick="ajax1()">button1</button> // 버튼 클릭 시 ajax() 메서드 실행
    <script>
        function ajax1(){
            axios.get("/main38/sub1");      // http get 요청을 비동기로 axios에서 발생시킴
        }
    </script>
```
* get 외에도 post, put, delete 등이 있음

## CRUD와 HTTP 메서드
* CRUD는 Create, Read, Update, Delete의 약자로, 데이터를 다루는 네 가지 기본 작업을 나타낸다.
* HTTP 메서드인 get, post, put, delete는 각각 CRUD 작업과 대응됨.
    * Create : 새로운 데이터를 생성하는 작업. 이 작업은 HTTP의 'POST'와 연관된다.
    * Read : 데이터를 읽어오는 작어이며, HTTP의 'GET'메서드와 연관된다.
    * Update : 이미 존재하는 데이터를 수정하는 작업이다. HTTP의 'PUT'또는 'PATCH'와 연관된다.
      * PUT은 데이터를 완전히 대체하는 역할(덮어버림)을 하며, PATCH는 부분 수정을 하는 메서드이다.
    * Delete : 데이터를 삭제하는 작업이다. HTTP의 'DELETE'메서드와 연관된다.
* 위와 같이 CRUD 작업은 특정 HTTP 메서드와 연관될 수 있으며, 이를 통해 클라이언트와 서버 간 어떤 종류의 데이터 작업을 수행할 것인지 약속할 수 있음. 

-----------------------------------------------------------------------------------------

## .then() 메서드 (Promise가 성공한 경우 호출되는 메서드)
* axios.get(), post() 등의 수행이 완료된 후(HTTP 요청을 생성한 상태를 말함) Promise 객체를 반환한다.
* .then()은 Promise가 성공적으로 완료되었을 때 실행될 콜백 함수를 등록하는데 사용된다.
* 즉, http 요청메세지의 생성이 완료된 후에 수행할 작업을 .then() 메서드로 수행한다.
* .then() 메서드의 로직이 다 수행되고, 이 메서드에서 또 다시 *Promise 객체를 반환한다.* (연속적으로 추가적인 작업을 수행하기 위해서)
* Promise 객체가 성공적으로 생성되면, Promise에는 response객체를 포함하는데, response 객체에는 아래와 같은 여러 프로퍼티를 가지고 있다.
  * data: 서버에서 반환한 데이터 (파싱된 json 객체)
  * status : http 상태코드 
  * headers : http의 헤더 등 

예시 코드
```html
<!--  then 메서드 활용 예제  -->
<!--  then 메서드 기본 -->

        <button onclick="ajax2()">button2</button> <!--클릭 시 ajax2() 메서드 실행-->
        <script>
          function ajax2(){
          axios.get("/main38/sub2") /* HTTP 요청 메세지를 '비동기'로 생성시킴 */
                  .then(function (response){ /* http 요청이 성공적으로 수행되면, promise 객체에 의해 .then에 response 객체를 전달  */
                    console.log("응답 받은 후 해야하는 일");
                    console.log(response.data);     // response 객체의 data 프로퍼티
                    console.log(response.status); // response 객체의 상태코드 프로퍼티
                    console.log(response.statusText); // response 객체의 상태코드 텍스트 프로퍼티
                    console.log(response.headers); // response 객체의 headers 프로퍼티
                    console.log(response.config); // response 객체의 config 프로퍼티
                  });   // 수행이 완료된 후에 promise객체를 반환.
        }


          <!--  then 메서드, response 객체와 dto 객체 활용-->
          
        // sub3의 리턴 값이 DTO이고, then 프로퍼티의 data에 dto의 속성들을 다룰 수 있음.
        // 즉, 흐름이 axios.get을 통해 main38/sub3 컨트롤러에 요청을 보내고, sub3의 컨트롤러에서 DTO 객체를 응답값으로 반환
        // 반환 받은 DTO객체의 프로퍼티를 promise 객체가 response 객체로 전달하고, 이 객체의 프로퍼티인 data에 dto 객체를 담음
        // data 프로퍼티를 통해 dto 객체를 호출할 수 있음.  
          <button onclick="ajax3()">button3</button>
          <script>
            function ajax3(){
            axios.get("/main38/sub3")
                    .then(function (res){
                      console.log(res.data);
                      console.log(res.data.age);    
                      console.log(res.data.name);
                    });
          }


          <!--  then 메서드, 인풋으로 데이터를 받아서 쿼리 스트링으로 날린 다음 DB 작업하기 -->
              <div>
                  <input type="text" id="input1">
                      <button onclick="ajax5()">button5</button>
                      <script>
                          function ajax5(){
                          const pid = document.querySelector("#input1").value;
                          axios.get("/main38/sub5?id="+pid)
                          .then(function (response){
                          const product= response.data;
                          console.log(product.ProductID);
                          console.log(product.ProductName);
                          console.log(product.Price);
                          console.log(product.Unit);

                      })
                      }
        </script>
</div>

<!--  then 메서드, 연속 추가 작업 -->
<div>
  <button onclick="ajax6()">button6</button>
  <script>
    function ajax6(){
      axios.get("/main38/sub2")
              .then(function (){
                console.log("응답 완료 후 실행");
              })  // promise 객체를 반환
              .then(function (){  // 반환된 promise 객체를 통해 연속적으로 추가작업을 수행할 수 있음.
                console.log("그 다음 실행");
              })  // promise 객체를 반환
              .then(function (){
                console.log("또, 그 다음 실행");
              })
    }
  </script>
</div>

<!--  then 메서드, 연속 추가 작업 -->
<!--  .then 메서드는 Promise 객체를 반환한다. -->
<div>
  <button onclick="ajax7()">button7</button>
  <script>
    function ajax7(){
      axios.get("/main38/sub2")
              .then(function (){
                console.log("첫 함수")
                return "abcd";
              })  // promise 객체를 반환
              .then(function (param){  // 직전 함수의 리턴 값이 파라미터로 들어옴
                console.log("두번째 함수")
                console.log(param)  // "abcd"
                return 1234;
              })  // promise 객체를 반환
              .then(function (param){
                console.log(param) // 1234
              })

    }
  </script>
</div>
<div>
  <button onclick="ajax8()">button8</button>
  <script>
    function ajax8(){
      axios.get("/main38/sub2")
              .then(function (response){  // 서버의 응답 값이 파라미터로 들어옴
                console.log("첫번째 함수")
                return response.data;   // hello world
              })  // promise 객체를 반환
              .then(function (param){  // 직전 함수의 리턴 값이 파라미터로 들어옴
                console.log("두번째 함수")
                console.log(param)  // hello world
              })
    }
  </script>
</div>

<!-- then 메서드, arrow function 활용 -->
<div>
  <button onclick="ajax9()">button9</button>
  <script>
    function ajax9(){
      axios.get("/main38/sub2")
              .then(response =>  response.data) // arrow function, 리턴 키워드 생략 가능, 파라미터 1개이므로 괄호 생략 가능
              .then(data=> console.log(data))
    }
  </script>
</div>

<div>
  <button onclick="ajax10()">button10</button>
  <script>
    function ajax10(){
      axios.get("/main38/sub4")
              .then(response => response.data)
              .then(data => console.log(data.list[1]))    // lee
    }
  </script>
</div>
```

