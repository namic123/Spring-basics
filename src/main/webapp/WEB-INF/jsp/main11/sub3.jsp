<%--
  Created by IntelliJ IDEA.
  User: 박재성
  Date: 2023-09-25
  Time: 오전 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--if를 사용 시 test가 필수적으로 작성 되어야 함--%>
<%--test가 true인 경우 실행되고 false 이면 실행이 안됨--%>
    <c:if test="true">
        <p>출력 :)</p>
    </c:if>
<c:if test="">
    <p>출력 안됨 :(</p>
</c:if>
<hr>
<c:if test="${param.name eq 'son'}">
    <p>hello son</p>
</c:if>
<hr>
<c:if test="${param.name eq 'son'}" var="isSon">
    <p>hello son</p>
</c:if>
<c:if test="${isSon}">
    <p>여전히 son</p>
</c:if>
<c:if test="${not isSon}">
    <p>son이 아님</p>
</c:if>

</body>
</html>
