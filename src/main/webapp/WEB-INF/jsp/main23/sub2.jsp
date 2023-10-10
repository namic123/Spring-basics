<%--
  Created by IntelliJ IDEA.
  User: 박재성
  Date: 2023-10-10
  Time: 오전 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <h3>고객명 검색</h3>
    <form action="">
        검색어 <input type="text" name="k" placeholder="검색어를 입력하시오.">
        <button>검색</button>
    </form>
    <hr>
    <h3>검색한 키워드 '${keyword}'</h3>
    <ul>
    <c:forEach items="${customerList}" var="customer">
        <li>${customer}</li>
    </c:forEach>
    </ul>
</table>
</body>
</html>
