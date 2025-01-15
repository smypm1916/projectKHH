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
</head>
<body>

<h1><b>회원 유형</b></h1>

<form action="SignUpC">
    <div>
        <button type="button" onclick="ToSignUp('customer')">일반 회원</button>
        <button type="button" onclick="ToSignUp('owner')">점주 회원</button>
    </div>
</form>

<script>
    function ToSignUp(userType) {
        if (userType === 'customer') {
            location.href = '/jsp/register/user_signUp.jsp';
        } else if (userType === 'owner') {
            location.href = '/jsp/register/owner_signUp.jsp';
        }
    }
</script>

</body>
</html>
