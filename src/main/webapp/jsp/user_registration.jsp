<%--
  Created by IntelliJ IDEA.
  User: svyet
  Date: 2025/01/09
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>회원가입</title>
</head>
<body>
<h1>회원가입</h1>
<div class="main-body" style="display: flex; flex-direction: column; align-items: center; background: rgb(244,243,236)">
    <div class="signup-form" style="background-color:white">
        <form action="SignUpC" method="post">
            <div>
                <br>
                <label for="name"><b>이름</b></label>
                <input type="text" id="name" name="name">
            </div>
            <div>
                <br>
                <label for="email"><b>이메일</b></label>
                <input type="text" id="email" name="email">
            </div>
            <div>
                <br>
                <label for="gender"><b>성별</b></label>
                <input type="radio" id="gender" name="gender" value="male">
            </div>
            <div>
                <br>
                <label for="birth"><b>생년월일</b></label>
                <select name="birth" id="birth"></select>
            </div>
            <div>
                <br>
                <label for="password"><b>비밀번호</b></label>
                <input type="text" id="password" name="password">
                <label for="passwordCheck"><b>비밀번호 확인</b></label>
                <input type="text" id="passwordCheck" name="passwordCheack">
            </div>

            <div style="display: flex; justify-content: center;">
                <br>
                <button type="button" style="border-radius: 20%; width:50px; height: 20px; display: inline-block; flex-wrap: wrap" onclick="">회원가입</button>
            </div>
        </form>
    </div>
</body>
</html>
