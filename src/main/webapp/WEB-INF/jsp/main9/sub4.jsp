<%--
  Created by IntelliJ IDEA.
  User: 박재성
  Date: 2023-09-22
  Time: 오전 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>${attr3["name"]}</h3>
<h3>${attr3["my name"]}</h3>
<h3>${attr3["your-name"]}</h3>


<hr>
<h1>${myMap}</h1>
<h1>${myMap["son"]}</h1>
<h1>${myMap["lee"]}</h1>
<h1>${myMap["park"]}</h1>

<hr>

<h3>${myMap.son}</h3>
<h3>${myMap.lee}</h3>
<h3>${myMap.park}</h3>

<hr>

<h3>${cityMap.seoul}</h3>
<h3>${cityMap.busan}</h3>
<h3>${color.red}</h3>
<h3>${color.blue}</h3>
<h3>${color["black"]}</h3>
</body>
</html>
