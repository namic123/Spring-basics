<%--
  Created by IntelliJ IDEA.
  User: 박재성
  Date: 2023-09-25
  Time: 오후 12:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:choose>
    <c:when test="${param.age >= 20}">
        <p>투표가 가능합니다.</p>
    </c:when>
    <c:when test="${param.age < 20}">
        <p>투표가 불가능합니다.</p>
    </c:when>
    <c:otherwise>
        <p>age 값을 입력해주세요.</p>
    </c:otherwise>
</c:choose>
</body>
</html>
