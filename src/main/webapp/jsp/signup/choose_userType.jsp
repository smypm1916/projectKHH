<%--
  Created by IntelliJ IDEA.
  User: svyet
  Date: 2025/01/14
  Time: 18:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../../css/index_ver.0.4.css?v=1.0">

    <link rel="stylesheet" href="../../css/signup/signUp.css">


</head>
<body>

<header class="header">
    <div class="title">
        <h1><a href="/HomeC">急に腹が減ってきた~~KHH~~</a></h1>
    </div>
</header>

<h1 style="display: flex; justify-content: center"><b>회원 유형</b></h1>

<form action="SignUpC">
    <div class="form-wrapper-userType" style="display: flex; align-items: center; justify-content: center;">
        <button type="button" onclick="ToSignUp('customer')">일반 회원</button>
        <button type="button" onclick="ToSignUp('owner')">점주 회원</button>
    </div>
</form>

<script>
    function ToSignUp(userType) {
        if (userType === 'customer') {
            location.href = '/jsp/signup/user_signUp.jsp';
        } else if (userType === 'owner') {
            location.href = '/jsp/signup/owner_signUp.jsp';
        }
    }
</script>

</body>
</html>
