<%--
  Created by IntelliJ IDEA.
  User: 박재성
  Date: 2023-10-11
  Time: 오전 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>상품 지우기</h3>
<form action="/main25/sub2" method="post">
    번호
    <input type="number" name="pid" placeholder="상품번호를 입력하시오">
    <button>지우기</button>
</form>
</body>
</html>
