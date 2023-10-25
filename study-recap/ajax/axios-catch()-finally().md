# .catch()
* .then()은 http 요청이 성공했을 때 수행되는 메서드
* 반면에, catch()는 실패 했을 때 수행하는 메서드이다.


# .finally() 
* HTTP 요청 성공, 실패 여부와는 상관없이 무조건 실행되는 메서드 
* 이멧드는 인자로 콜백 함수를 받으며, 해당 콜백 함수는 어떠한 매개변수도 전달받지 않는다.

### .catch() 활용 예제
```javascript
    <button onclick="ajax1()">button1</button>
    <script>
        function ajax1() {
            axios.get("/main39/sub1")
                .then(() => console.log("성공"))  // 성공했을 경우 실행
                .catch(() => console.log("실패"));   // 실패 했을 때 수행

        }
    </script>
```
* 요청 실패한 경우, 상태코드를 받아오고 그에 따른 작업 수행 예제
```javascript
        function ajax3() {
            axios.get("/main39/sub2")
                .catch(function (error) {   // 상태 코드 400으로 가정
                    console.log(error); // 실패에 대한 응답 결과가 포함되어 있음
                    console.log(error.response.status); // response객체에 status 프로퍼티
                    let status = error.response.status; // let status = 400;
                    if (status >= 400 && status < 500) { // 상태 코드에 따른 작업 수행 
                        console.log("요청이 잘 못되었습니다.");
                    } else if (status >= 500 && status <= 599) {
                        console.log("서버에서 오류가 발생하였습니다.");
                    }
                });
        }
<button onclick="ajax4()">button4</button>
<p id="result1"></p>
<script>
    function ajax4() {
    // 400번대 응답이면 #result1 요소에 "잘못된 요청" 출력
    // 500번대 응답이면 #resutt1 요소에 "서버 에러" 출력
    axios.get("/main39/sub3")
        .catch(function (error) {
            const code = error.response.status; // 응답 코드 저장
            let message = "";   
            if (400 <= code && code < 500) { // 400번대 응답 코드일 경우
                message = "잘못된 요청"; 
            } else if (500 <= code) {   // 500 번대 응답일 경우
                message = "서버 에러";
            }
            document.querySelector("#result1").textContent = message; // message에 할당된 값을 출력
        })
    
}
</script>
```
```HTML
    <input type="text" id="input1" value="30">
    <button onclick="ajax5()">button5</button>
    <script>
        function ajax5() {
            const pid = document.getElementById("input1").value; // 인풋 값을 저장
            axios.get("/main39/sub4?id=" + pid) // 입력받은 pid를 쿼리 스트링에 포함 시켜 GET요청
                .then(response => response.data) // 요청 성공한 경우 응답 객체의 data를 반환
                .then(data => console.log(data)) // 위에서 반환된 data를 console.log
                .catch(error => console.log(error));    // 요청 실패한 경우 응답 객체를 console.log
        }
    </script>
```

### .finally() 활용 예제 
```javascript
        function ajax6() {
            axios.get("/main39/sub5")
                .then(() => console.log("성공#"))
                .catch(() => console.log("실패!"))
                .finally(() => console.log("항상$$$$"))
        }
```