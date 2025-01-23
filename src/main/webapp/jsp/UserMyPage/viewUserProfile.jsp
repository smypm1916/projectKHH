<%--
  Created by IntelliJ IDEA.
  User: codms
  Date: 2025-01-23
  Time: 오전 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/userMyPage/userMyPage.css">
</head>
<body>
<div class="profile-title"><h2>내 프로필</h2></div>
<div class="profile">
  <div class="profile-field" style="border: none;">
    <div class="profile-circle">
      <c:if test="${sessionScope.user.user_picture} != null">
        <img src="/image/${sessionScope.user.user_picture}" alt="프로필 사진">
      </c:if>
      <img src="../image/korosan.jpg">
    </div>
    <div class="profile-message">
						<span>
						<h2> 대식가 (${sessionScope.user.user_nickname})
							(${sessionScope.user.user_email}) 님 (🖐🏻'-' )</h2>
						 맛집러버 ${sessionScope.user.user_nickname} 님,<br> 오늘은 어떤 맛집을 찾아볼까요? 🍫͜
						(ᵔ ̮ ᵔ)›
					</span>
    </div>
    <div class="profile-updateBtn" style="align-content: center;">
      <input type="button" value="프로필 수정하기" onclick="location.href='ProfileUpdateController'">
    </div>
  </div>
</div>
</body>
</html>
