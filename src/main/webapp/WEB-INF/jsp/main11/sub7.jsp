<%--
  Created by IntelliJ IDEA.
  User: 박재성
  Date: 2023-09-25
  Time: 오후 2:02
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
            border: 1px solid black;
            width: 100%;
        }
        th {
            background-color: #eee;
        }
        th, td {
            padding: 5px;
        }
    </style>
</head>
<body>
<c:choose>
        <c:when test="${param.show}">
            <table>
                <tr>
                    <th>ID</th>
                    <th>FIRST NAME</th>
                    <th>LAST NAME</th>
                    <th>CLASS</th>
                    <th>PHONE</th>
                </tr>
                <c:forEach items="${tableList}" var="item">

                    <tr>
                        <td>${item.id}</td>
                        <td>${item.firstName}</td>
                        <td>${item.lastName}</td>
                        <td>${item.className}</td>
                        <td>${item.phoneNumber}</td>
                    </tr>

                </c:forEach>
            </table>
        </c:when>
        <c:otherwise>
            <p>데이터가 없습니다.</p>
        </c:otherwise>
</c:choose>
</body>
</html>
