<%--
  Created by IntelliJ IDEA.
  User: 박재성
  Date: 2023-09-25
  Time: 오후 12:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--요청파라미터 age--%>
<c:if test="${param.age>= 20}" var ="ageBool">
    <p>투표 가능합니다.</p>

</c:if>
<c:if test="${not ageBool}" >
    <p>투표 불가능합니다.</p>
</c:if>
<c:if test="${empty param.age}" >
    <p>나이를 입력하시오.</p>
</c:if>
</body>
</html>
