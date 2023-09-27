<%--
  Created by IntelliJ IDEA.
  User: 박재성
  Date: 2023-09-27
  Time: 오전 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h4>내 방문 횟수 ${sessionScope.count} 번</h4>

    <h4>서버에 방문 횟수 ${applicationScope.count} 번</h4>
</body>
</html>
