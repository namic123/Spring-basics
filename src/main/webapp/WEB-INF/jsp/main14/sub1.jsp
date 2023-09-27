<%--
  Created by IntelliJ IDEA.
  User: 박재성
  Date: 2023-09-26
  Time: 오후 2:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>암호 전송</h1>
<hr>
<h3>get 방식</h3>
<form action="/main14/sub2" method="get">
    <div>
        id :
        <input type="text" name="id">
    </div>
    <div>
        password :
        <input type="password" name="password">
    </div>
    <button>전송</button>
</form>
<hr>
<h3>post 방식</h3>
<form action="/main14/sub2" method="post">
    <div>
        id :
        <input type="text" name="id">
    </div>
    <div>
        password :
        <input type="password" name="password">
    </div>
    <button>전송</button>
</form>
</body>
</html>
