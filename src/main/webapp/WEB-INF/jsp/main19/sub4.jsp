<%--
  Created by IntelliJ IDEA.
  User: 박재성
  Date: 2023-10-04
  Time: 오후 3:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table style="border-collapse: collapse; border: 1px solid black; width: 100%">
    <tr>
        <th style="background-color: #eeeeee">CustomerID</th>
        <th style="background-color: #eeeeee">CustomerName</th>
        <th style="background-color: #eeeeee">City</th>
        <th style="background-color: #eeeeee">Country</th>
    </tr>
    <c:forEach items="${customers}" var="customer">
        <tr>
            <td>${customer.id}</td>
            <td>${customer.name}</td>
            <td>${customer.city}</td>
            <td>${customer.country}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
