<%--
  Created by IntelliJ IDEA.
  User: 박재성
  Date: 2023-09-25
  Time: 오후 2:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>form 요소</h1>
    <form>
        <input type="text" name="param1">
        <br/>
        <input type="password" name="param2">
        <br/>
        <button>전송</button>
    </form>
<%-- name=lee&age=44&address=seoul&email=abc%40gmail.com   --%>
    <form>
        <input type="text" name="name">
        <br/>
        <input type="text" name="age"><br/>
        <input type="text" name="address"><br/>
        <input type="text" name="email"><br/>
        <button>전송</button>
    </form>
    <h3>action 속성: request 파라미터들을 어디로 보낼 지 결정</h3>
    <p>action 속성이 없거나 빈문자열인 경우 현재 경로</p>
    <form action="https://naver.com/search.naver">
        <input type="text" name="q">
        <br>
        <button>전송</button>
    </form>
    <form action="https://google.com/search">
        <p>구글에서 검색</p>
        <input type="text" name="query">
        <br>
        <button>전송</button>
    </form>
    <form action="https://search.daum.net/search">
        <p>다음에서 검색</p>
        <input type="text" name="q">
        <br>
        <button>전송</button>
    </form>


    <hr>
<h1>action 속성값: /로 시작하는 경우 path가 결정됨</h1>
    <form action="/">
        <input type="text" name="email">
        <button>전송</button>
    </form>
<%----%>
    <hr>
    <form action="/main12/sub2">
        <p>sub2로 이동하기</p>
        <p>나이를 입력하시오</p>
        <input type="text" name="age">
        <button>전송</button>
    </form>

    <hr>
<h1>action 속성 값 : / 도 아니고 protocol(scheme)이 아니면 현재 페이지의 상대 경로</h1>
<h1>path에서 마지막 / 기준</h1>
    <form action="/main12/sub2">
        <input type="text" name="email">
        <button>전송</button>
    </form>
    <form action="sub3">
        <p>sub3</p>
        <input type="text" name="email">
        <button>전송</button>
    </form>
    <hr>
<%--.. : 한 경로 위--%>
    <form action="..">
        <input type="text" name="age">
    <button>전송</button>
    </form>
</body>
</html>
