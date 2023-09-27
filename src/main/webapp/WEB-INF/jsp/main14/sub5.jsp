<%--
  Created by IntelliJ IDEA.
  User: 박재성
  Date: 2023-09-26
  Time: 오후 3:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/main14/sub6" method="post">
    <div>
        <label for="input1">아이디:</label>
        <input type="text" id="input1" name="username">
    </div>
    <div>
        <label for="input2">비밀번호:</label>
        <input type="password" id="input2" name="password">
    </div>
    <button>전송</button>
</form>
</body>
</html>
