<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<link rel="stylesheet" href="/css/userScrapPage.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>

<div class="mypage" style="border: none;">
	<h1 onclick="location.href='UserC'">MyPage </h1>
</div>
<br>
<hr>

			<div class="like-list" style="border: none;">
				<h2 style="margin-inline-end: auto;">좋아요한 가게</h2>
			</div>
			<br>


	<c:forEach items="${scraps}" var="scrap">
			<div class="like-place-list-field" style="border: solid 1px;">
				<div class="like-place-list">
					<img
						src="image/${scrap.shop_image}"
						alt="place-name">
					<div style="border: none; text-align: left; margin-left: 30px">
						<h1>😋${scrap.shop_name}  </h1>
						<div style="border: none;">

							<p>[가게 주소] </p>
							${scrap.shop_addr}
							<p>[가게 연락처]</p>
								${scrap.shop_tel}
							<p>[가게 소개] </p>
								${scrap.shop_content}

						</div>
					</div>
				</div>
				<div style="border: none; align-content: center; margin-left: 80px;">
					<input type="button" value="가게 정보 보기">
				</div>
			</div>
				</c:forEach>

			<br> <br>

			<div class="bottom-list-num" style="border: none;">
				<a href="UserScrapPageC?p=1"> << </a>
				<c:forEach begin = "1" end = "${pageCount }" var = "i">
					<a href="UserScrapPageC?p=${i }">[${i }] </a>
				</c:forEach>
				<a href="UserScrapPageC?p=${pageCount }"> >> </a>
			</div>

			<div class="bottom-return-btn"
				style="border: none; align-content: center;">
				<input onclick="location.href='UserC'" type="button" value="마이페이지로 돌아가기">
			</div>




</body>
</html>