<%--
  Created by IntelliJ IDEA.
  User: 박재성
  Date: 2023-10-20
  Time: 오전 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>직원등록</h3>
<div style="background-color: tomato">
    ${message}
</div>
<form action="/main32/sub4" method="post">
    <div>
        lastName
        <input type="text" name="lastName">
    </div>
    <div>
        firstName
        <input type="text" name="firstName">
    </div>
    <div>
        <button>등록</button>
    </div>
</form>
</body>
</html>
