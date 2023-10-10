<%--
  Created by IntelliJ IDEA.
  User: 박재성
  Date: 2023-10-10
  Time: 오후 2:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="">
서플라이어 이름<input type="text" name="supName">
    <br>
계약명 <input type="text" name="conName"><br>
주소<input type="text" name="address"><br>
지역<input type="text" name="city"><br>
코드<input type="text" name="pc"><br>
나라<input type="text" name="country"><br>
번호<input type="text" name="phone"><br>
    <button>입력</button>
</form>
<table>
    <tr>
        <th>id</th>
        <th>supName</th>
        <th>conName</th>
        <th>address</th>
        <th>city</th>
        <th>pc</th>
        <th>country</th>
        <th>phone</th>
    </tr>
    <c:forEach items="${supList}" var="sup">
        <tr>
            <td>${sup.id}</td>
            <td>${sup.name}</td>
            <td>${sup.con}</td>
            <td>${sup.addr}</td>
            <td>${sup.cit}</td>
            <td>${sup.pcode}</td>
            <td>${sup.contry}</td>
            <td>${sup.ph}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
