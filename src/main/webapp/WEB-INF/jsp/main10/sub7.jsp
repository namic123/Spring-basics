<%--
  Created by IntelliJ IDEA.
  User: 박재성
  Date: 2023-09-25
  Time: 오전 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>el의 연산자</h3>
<h4>산술 연산자</h4>
<h4>+, -, *, /, %</h4>

<hr>
<h5>+ 더하기</h5>
<p>${a}+${b}= ${a+b}</p>
<p>${c}+${d}= ${c+d}</p>
<h5>- 뺄샘</h5>
<p>${a}-${b}= ${a-b}</p>
<p>${c}-${d}= ${c-d}</p>
<h5>* 곱하기</h5>
<p>${a}*${b}= ${a*b}</p>
<p>${c}*${d}= ${c*d}</p>
<h5>/ 나누기</h5>
<p>${a}/${b}= ${a div b}</p>
<p>${c}/${d}= ${c div d}</p>

<h5>% : 나머지 연산(modulo, remainder)</h5>
<p>${b}%${a} = ${b%a}</p>
<p>${c}%${a} = ${c%a}</p>
<p>${d}%${a} = ${d%a}</p>
<p>${b}%${a} = ${b mod a}</p>
<p>${c}%${a} = ${c mod a}</p>
<p>${d}%${a} = ${d mod a}</p>


<h5>() : 우선 순위 높음</h5>
<p>${a * b - c}</p>
<p>${a * (b - c)}</p>
<p>${(a * b) - c}</p>

<hr>

<h3>2~9단</h3>
<c:forEach begin="2" end="9" var="i">
    <div>${i}단</div>
    <c:forEach begin="1" end="9" var="j">
        <span>${i}*${j}=${i*j}</span>
    </c:forEach>
    <br/>
</c:forEach>
<h3>9~2단</h3>
<c:forEach begin="0" end="7" var="k">
    <div>${9-k}단</div>
    <c:forEach begin="1" end="9" var="l">
        <span>${9-k}*${l}=${(9-k)*l} / </span>
    </c:forEach>
    <br/>
</c:forEach>

</body>
</html>
