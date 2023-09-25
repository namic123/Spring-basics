<%--
  Created by IntelliJ IDEA.
  User: 박재성
  Date: 2023-09-25
  Time: 오전 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${(not empty param.dan) && (param.dan >= 2 && param.dan <= 9)}" var="multiTable">
    <c:forEach begin="1" end="9" var ="i">
        <div>${param.dan}을 입력하셨습니다.</div>
        <span>${param.dan} x ${i} = ${param.dan * i}</span>
    </c:forEach>
</c:if>
<c:if test="${not multiTable}">
    <p>2~9 사이 숫자를 입력해주세요</p>
</c:if>
</body>
</html>
