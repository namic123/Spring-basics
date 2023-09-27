<%--
  Created by IntelliJ IDEA.
  User: 박재성
  Date: 2023-09-26
  Time: 오후 2:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/main13/sub14">
    <div>
    <select name="hobby" id="">
        <option value="soccer">축구</option>
        <option value="baseball">야구</option>
        <option value="basketball">농구</option>
    </select>
    </div>
    <div>
<%--        select[name=food][multiple]>option[value]*5--%>
    <select name="food" id="" multiple="">
        <option value="pizza">피자</option>
        <option value="coffee">커피</option>
        <option value="burger">버거</option>
        <option value="beef">소고기</option>
        <option value="pork">돼지고기</option>
    </select>

    </div>
    <button>선택</button>
</form>
</body>
</html>
