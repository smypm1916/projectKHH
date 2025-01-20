<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/css/userReviewsPage.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="mypage" style="border: none;">
	<h1 onclick="location.href='UserC'">MyPage </h1>
</div>
<br>
<hr>
			<div class="review-list" style="border: none;">
				<h2 style="margin-inline-end: auto;">작성한 맛리뷰</h2>
			</div>


			<br>
			<br>
			<br>
			<br>


<%--		<hr>--%>
			<div class="review-comment" style="border: none;">
				<c:forEach items="${reviews}" var="review">
				<span>🦀🍴</span>
				<a href="https://kr.savorjapan.com/contents/discover-oishii-japan/if-you-re-looking-for-a-good-drink-in-shinjuku-these-are-the-places-to-be-10-izakaya/"> ${review.shop_name} |
					${review.review_content} | ${review.review_date} | ${review.review_nickname} </a>
				<!-- 글주소 (편집 가능한)  -->
			<hr>
				</c:forEach>
			</div>
			<!--  글리스트 넘길수있게  -->


		
			<br> <br>
			<div class="bottom-list-num" style="border: none;">  <h2> 1 2 3 4 (나중에 구현) > </h2>


				<br>
			<div class="bottom-return-btn"
				 style="border: none; align-content: center;">
				<input onclick="location.href='UserC'" type="button" value="마이페이지로 돌아가기">
			</div>
			</div>



</body>
</html>