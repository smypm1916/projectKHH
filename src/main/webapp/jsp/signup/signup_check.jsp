<%--
  Created by IntelliJ IDEA.
  User: svyet
  Date: 2025/01/14
  Time: 13:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../../css/index_ver.0.4.css?v=1.0">
    <link rel="stylesheet" href="../../css/signup/signup_ver.0.2.css">
    <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

</head>

<body>

<h1>입력 확인 페이지</h1>

<form action="/SignUpC">
    <button onclick="">회원 등록</button>
</form>
<button id="goBack">수정하기</button>
<script> document.getElementById('goBack').addEventListener('click', function () {
    window.history.back();
});</script>

</body>
</html>
