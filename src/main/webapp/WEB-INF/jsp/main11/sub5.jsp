<%--
  Created by IntelliJ IDEA.
  User: 박재성
  Date: 2023-09-25
  Time: 오후 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>jstl choose, when, otherwise tag</h1>
<c:choose>
  <c:when test="false"><p>when 1번</p></c:when>
  <c:when test="false"><p>when 2번</p></c:when>
  <c:when test="false"><p>when 3번</p></c:when>
  <c:otherwise><p>when이 false일때 otherwise 실행</p></c:otherwise>
</c:choose>
</body>
</html>
