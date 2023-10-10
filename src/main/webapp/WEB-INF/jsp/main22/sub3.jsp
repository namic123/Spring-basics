<%--
  Created by IntelliJ IDEA.
  User: 박재성
  Date: 2023-10-06
  Time: 오후 2:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
    <style>
        body{display: flex; flex-direction: column; justify-content: center;
        align-items: center;}
        a{
            text-decoration: none;
        }
        table {
            border-collapse: collapse;
        }
        th{
            background: wheat;
        }
        td{
            background: beige;
        }
        th, td {
            border: 3px solid tomato;
            font-size: 15px;
            font-weight: bold;
        }
        .active {

            color: tomato;
        }
    </style>
</head>
<body>
<table>
    <h3>고객 정보</h3>
    <tr>
        <th>ID</th>
        <th>NAME</th>
    </tr>

    <c:forEach items="${customerList}" var="customer">
        <tr>
            <td>${customer.id}</td>
            <td>${customer.name}</td>
        </tr>
    </c:forEach>
</table>
<div>
    <c:if test="${leftPageNumber != 1}">
        <a href="/main22/sub3?p=1"><< 맨 앞</a> |
    </c:if>
    <c:if test="${prevPageNumber > 0}">
    <a href="/main22/sub3?p=${prevPageNumber}">이전</a> |
    </c:if>
        <c:forEach begin="${leftPageNumber}" end="${rightPageNumber}" var="pageNumber">
        <a
                <c:if test="${pageNumber == currentPage}">
                    class="active"
                </c:if>
                href="/main22/sub3?p=${pageNumber}">${pageNumber}</a>
        |
    </c:forEach>
    <c:if test="${lastPageNumber >= nextPageNumber}">
    <a href="/main22/sub3?p=${nextPageNumber}">다음</a> |
    </c:if>
    <c:if test="${rightPageNumber != lastPageNumber}">
        <a href="/main22/sub3?p=${lastPageNumber}">맨 뒤 >></a>
    </c:if>
        </div>
<script>
    <%--const cp = "<c:out value='${currentPage}'>";--%>
    <%--const prev = document.querySelector(".prev-a");--%>
    <%--const next = document.querySelector(".next-a");--%>
    <%--if(cp > next){--%>
    <%--    next.style.display ="none";--%>
    <%--    prev.style.display="inline";--%>

    <%--}else{--%>

    <%--prev.style.display ="none";--%>
    <%--next.style.display="inline ";--%>

    <%--}--%>
</script>
</body>
</html>
