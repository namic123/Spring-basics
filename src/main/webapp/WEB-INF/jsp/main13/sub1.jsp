<%--
  Created by IntelliJ IDEA.
  User: 박재성
  Date: 2023-09-26
  Time: 오전 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>input 요소들</h3>
<form action="/main13/sub2">
<%--  div*10>input[name=param$]--%>
  <div>
    텍스 입력 인풋
    <input type="text" name="param1">
  </div>
  <div>
    <%--password--%>
    비밀번호 형태 인풋
    <input type="password" name="param2">
  </div>
  <div>
<%--date--%>
    날짜 선택 인풋
    <input type="date" name="param3">
  </div>
  <div>
<%--button--%>
    버튼 형태 인풋
    <input type="button" name="param4" value="어떤 버튼">
  </div>
  <div>
<%--number--%>
    숫자만 받는 인풋
    <input type="number" name="param5">
  </div>
  <div>
<%--submit--%>
    제출 받는 인풋
    <input type="submit" name="param6" value="회원가입">
  </div>
  <div>
    라디오 박스
    <input type="radio" name="param7">
  </div>
  <div>
    라디오 박스2 하나만 선택 가능
    <input type="radio" name="param7">
  </div>
  <div>
    체크 박스
    <input type="checkbox" name="param8">
  </div>
  <div>
    체크 박스 : 여러 개 선택가능
    <input type="checkbox" name="param8">
  </div>
  <div>
    히든 박스 // 현재 눈에 보이지 않음
    <input type="hidden" name="param9" value="some value">
  </div>
  <button>전송</button>
</form>
<hr>
<form action="/main13/sub2">
 <div>
  <input type="text" name="param1" value="son">
 </div>
  <div>
    <input type="text" name="param2" placeholder="이름을 입력해주세요.">
  </div>
  <div>
    <input type="text" maxlength="5">
  </div>
  <div>
    <input type="text" required>
  </div>
  <div>
    readonly : 값 변경 불가
    <input type="text" readonly value="son">
  </div>
  <div>
    disable: 전송 불가
    <input type="text" name="param4" value="son" disabled>
  </div>
  <div>
    <input type="text" pattern="\d{3}" name="param5">
  </div>

  <div>
    <input type="checkbox" name="param6" checked>
  </div>
  <div>
    <input type="checkbox" name="param6">
  </div>
  <div>
    <input type="radio" name="param7">
  </div>
  <div>
    <input type="radio" name="param7" checked>
  </div>
  <div>
    <input type="file" multiple>
  </div>

  <button>전송</button>
</form>

<hr>
<form action="/main13/sub2">
  <label for="input1">
    주소
  </label>
  <input id="input1" type="text">
  <br>
<%--  div>div*3>label[for=check$]>lorem^input:c#check$--%>
  <div>
    <div>
      <label for="check1">Lorem.</label>
      <input type="checkbox" name="" id="check1">
    </div>
    <div>
      <label for="check2">In.</label>
      <input type="checkbox" name="" id="check2">
    </div>
    <div>
      <label for="check3">Illum?</label>
      <input type="checkbox" name="" id="check3">
    </div>
  </div>
  <input type="submit">
</form>
</body>
</html>
