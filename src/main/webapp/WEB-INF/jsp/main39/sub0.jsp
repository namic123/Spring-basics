<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-10-25
  Time: 오후 12:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>
<body>
<div>
    <button onclick="ajax1()">button1</button>
    <script>
        function ajax1() {
            axios.get("/main39/sub1")
                .then(() => console.log("성공"))  // 성공했을 경우 실행
                .catch(() => console.log("실패"));   // 실패 했을 때 수행

        }
    </script>
</div>
<div>
    <button onclick="ajax2()">button2</button>
    <script>
        function ajax2() {
            axios.get("/main39/sub2")
                .then(() => console.log("성공"))
                .catch(() => console.log("실패")) // 실패 시 실행되는 메소드
        }
    </script>
</div>
<div>
    <button onclick="ajax3()">button3</button>
    <script>
        function ajax3() {
            axios.get("/main39/sub2")
                .catch(function (error) {
                    console.log(error);
                    console.log(error.response.status);
                    let status = error.response.status;
                    if (status >= 400 && status < 500) {
                        console.log("요청이 잘 못되었습니다.");
                    } else if (status >= 500 && status <= 599) {
                        console.log("서버에서 오류가 발생하였습니다.");
                    }
                });
        }
    </script>
</div>
<div>
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
                    document.querySelector("#result1").textContent = message;
                });
        }
    </script>
</div>
<div>
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
</div>
<div>
    <button onclick="ajax6()">button6</button>
    <script>
        function ajax6() {
            axios.get("/main39/sub5")
                .then(() => console.log("성공#"))
                .catch(() => console.log("실패!"))
                .finally(() => console.log("항상$$$$"))
        }
    </script>
</div>
<hr>
<div>
    <h3>직원 등록</h3>
    <div>
        <input type="text" id="firstNameInput" placeholder="first name">
    </div>
    <div>
        <input type="text" id="lastNameInput" placeholder="last name">
    </div>
    <div>
        <input type="date" id="birthInput">
    </div>
    <div>
        <textarea id="notesTextArea" cols="30" rows="10" placeholder="notes"></textarea>
    </div>
    <div>
        <button onclick="ajax7AddEmployee()" id="button1">등록</button>
    </div>
    <p id="result2"></p>
    <script>
        function ajax7AddEmployee() {
            const button1 = document.getElementById("button1");
            button1.setAttribute("disabled", "disabled"); // 여러번 등록을 방지하기 위한 메서드
            // 즉, button을 클릭한 후 .setAttribute가 실행되고 button이 비활성화됨.
            const lastName = document.getElementById("lastNameInput").value;
            const firstName = document.getElementById("firstNameInput").value;
            const birthDate = document.getElementById("birthInput").value;
            const notes = document.getElementById("notesTextArea").value;

            axios.post("/main39/sub6", {
                lastName, firstName, birthDate, notes   // 서버에 전달할 데이터
            })
                .then(() => {
                    // 성공했을 때 (2xx 응답)
                    document.getElementById("result2").textContent = "등록 성공";
                })
                .catch((error) => {
                    // 실패했을 때 (2xx 외 응답)
                    const code = error.response.status;
                    if (400 <= code && code < 500) {
                        document.getElementById("result2").textContent = "잘못된 입력"
                    } else if (500 <= code) {
                        document.getElementById("result2").textContent = "서버 오류"
                    }
                })
                .finally(() => {
                    // 항상 실행
                    button1.removeAttribute("disabled");    // 최종적으로 버튼을 비활성화 처리
                })
        }
    </script>
</div>
</body>
</html>
