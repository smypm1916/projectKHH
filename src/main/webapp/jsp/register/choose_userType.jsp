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

<label><b>회원 유형</b></label>
<div>
    <input type="radio" id="user-type-customer" name="user-type" value="customer" checked>
    <label for="user-type-customer">일반 회원</label>
    <input type="radio" id="user-type-owner" name="user-type" value="owner">
    <label for="user-type-owner">레스토랑 점주</label>
</div>

<jsp:include page=""/>

</body>
</html>
