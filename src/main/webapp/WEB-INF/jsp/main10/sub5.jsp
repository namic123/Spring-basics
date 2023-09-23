<%--
  Created by IntelliJ IDEA.
  User: 박재성
  Date: 2023-09-22
  Time: 오후 2:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach begin="0" end="3" var="i">
    <p>food list : ${foodList[i]}</p>
</c:forEach>

<hr>

<c:forEach items="${names}" var = "name">
    <p>name list : ${name}</p>
</c:forEach>


<style>
    .box{
        border:1px solid black;
        margin: 5px;
        padding:10px;
        display:flex;

    }
    .box>div{
        border:2px solid orange;
        margin-left:10px;
        align-items: center;
    }
    .box>div:first-child{
        padding: 10px;
    }
    .box>div>div{
        margin:10px;
        display: flex;
    }
</style>
<%--
varStatus
- 반복문의 상태
--%>
<hr>
<c:forEach begin="0" end="3" var="n" varStatus="s">
    <div class="box">
        <div class="content1">
            ${n}
        </div>
        <div class="content2">
             <div>count :${s.count}</div>
             <div>index :${s.index}</div>
             <div>current :${s.current}</div>
             <div>first :${s.first}</div>
             <div>last :${s.last}</div>
        </div>
    </div>
</c:forEach>
<hr>
<c:forEach items="${names}" var="name" varStatus="">
    <div class="box">
        <div>
            ${name}
        </div>
        <div>
            <div>count :${s.count}</div>
            <div>index :${s.index}</div>
            <div>current :${s.current}</div>
            <div>first :${s.first}</div>
            <div>last :${s.last}</div>
        </div>
    </div>
</c:forEach>

<hr>
<ul>
<c:forEach items="${foodList}" var="food" varStatus="f">
        <li>${f.count} : ${f.current}</li>
</c:forEach>
</ul>
</body>
</html>
