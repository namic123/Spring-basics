<%--
  Created by IntelliJ IDEA.
  User: 박재성
  Date: 2023-10-04
  Time: 오후 4:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid black;
            align-items: center;
        }

        th {
            background-color: aqua;
        }

    </style>
</head>
<body>
<table>
    <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>UNIT</th>
        <th>PRICE</th>
    </tr>
    <c:forEach items="${customerList}" var="customer">
        <tr>
            <td>${customer.id}</td>
            <td>${customer.name}</td>
            <td>${customer.unit}</td>
            <td>${customer.price}</td>

        </tr>
    </c:forEach>
</table>
</body>
</html>
