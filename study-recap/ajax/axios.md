# Axios
* #### Axios는 JavaScript에서 HTTP 요청을 할 때 사용되는 라이브러리이다.
* AJAX를 더 쉽고 편리하게 사용할 수 있도록 만든 javaScript 라이브러리
* Promise 기반: 비동기 HTTP요청을 쉽게 처리할 수 있음.
* 취소 토큰: 진행 중인 요청을 취소할 수 있음.
* 자동 형변환 : JSON 데이터를 자동으로 JavaScript 객체로 변환해줌.
* 요약하자면, axios는 HTTP의 요청을 비동기로 처리한다.


## Promise란?
* JavaScript(클라이언트 사이드)에서 비동기 작업을 다루기 위한 *객체*이다.
* axios의 각 요청메서드(get, post, put, delete 등)는 Promise 객체를 반환한다.
* 이 Promise 객체를 통해 HTTP 요청의 성공 또는 실패에 따라 추가적인 작업을 수행할 수 있음
* 추가적인 작업에서는 '.then()'또는 '.catch()'메서드를 사용하여 이를 구현할 수 있음. 

## axios의 요청 메서드
* HTTP 요청 메세지를 비동기로 처리하기 위한 메서드를 지원한다. 
  * axios.request(config)
  * axios.get(url[, config])
  * axios.delete(url[, config])
  * axios.head(url[, config])
  * axios.options(url[, config])
  * axios.post(url[, data[, config]])
  * axios.put(url[, data[, config]])
  * axios.patch(url[, data[, config]])
출처: axios API - https://axios-http.com/kr/docs/api_intro

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

## axios의 추가 수행 메서드
* .then() : axios.get(), post() 등의 수행이 완료(성공한 경우)된 후(HTTP 요청을 수행한 상태를 말함) Promise 객체를 반환한다.
* .finally() :
* .catch() : HTTP 요청이 실패했을 때 실행됨.