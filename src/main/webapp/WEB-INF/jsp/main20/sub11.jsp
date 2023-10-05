<%--
  Created by IntelliJ IDEA.
  User: 박재성
  Date: 2023-10-05
  Time: 오후 4:27
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
        <th style="background-color: #eeeeee">Country</th>
        <th style="background-color: #eeeeee">SupplierId</th>
        <th style="background-color: #eeeeee">SupplierName</th>
        <th style="background-color: #eeeeee">Phone</th>
    </tr>
    <c:forEach items="${suppliers}" var="supplier">
        <tr>
            <td>${supplier.country}</td>
            <td>${supplier.id}</td>
            <td>${supplier.name}</td>
            <td>${supplier.phone}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
