<%--
  Created by IntelliJ IDEA.
  User: 박재성
  Date: 2023-09-25
  Time: 오후 4:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <c:if test="${not empty param.name}">
        ${param.name} 검색 결과입니다.
        <form action="sub5">
            <button>다시 검색하러가기.</button>
        </form>
    </c:if>
</body>
</html>
