<%--
  Created by IntelliJ IDEA.
  User: 박재성
  Date: 2023-09-22
  Time: 오후 2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>forEach tag</h1>
    <p>Contents 반복 출력</p>
    <p>주요 attribute: begin, end, var, items, varStatus가 있다.</p>
    <%--
    begin과 end 포함해서 반복
    end는 begin보다 커야함
    begin은 0이상이어야 함.(음수x)
    --%>
    <c:forEach begin="0" end="3">
        <li>Lorem ipsum.</li>
    </c:forEach>

    <hr>
<c:forEach begin="0" end="2" var="num">
    <li>num : ${num}</li>
</c:forEach>

    <%--begin~end 사이 숫자를 num 변수에 할당--%>
    <hr>
    <c:forEach begin="0" end="2" var="num">
        <li>car : ${myList[num]}</li>
    </c:forEach>

    <%--myList의 요소를 var=item에 담아서 출력 (향상된 for문)--%>
    <hr>
    <c:forEach items="${myList}" var="item">
        <li>item : ${item}</li>
    </c:forEach>
</body>
</html>
