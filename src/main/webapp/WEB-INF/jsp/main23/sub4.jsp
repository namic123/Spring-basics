<%--
  Created by IntelliJ IDEA.
  User: 박재성
  Date: 2023-10-10
  Time: 오전 11:15
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
                }
                th {
                        background-color: skyblue;
                }
                table, th, td {
                        border: 1px solid black;
                }
                td{
                        background-color: wheat;
                }
        </style>
</head>
<body>
<form action="">
        <div>
                검색 조건
                <select name="t" id="">
                        <option value="lname">Last Name</option>
                        <option value="fname">First Name</option>
                        <option value="notes">Notes</option>
                </select>
        </div>
        <div>
                검색어
                <input type="text" name="k" value="">
        </div>
        <div>
                <button>조회</button>
        </div>
</form>
<table>
        <tr>
                <th>직원 lastname</th>
                <th>직원 firstname</th>
                <th>직원 note</th>
        </tr>
        <c:forEach items="${employeeList}" var="list">
                <tr>
                        <td>${list.firstName}</td>
                        <td>${list.lastName}</td>
                        <td>${list.notes}</td>
                </tr>
        </c:forEach>
</table>
</body>
</html>
