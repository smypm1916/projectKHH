<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/css/userMyPage.css">
<head>
	<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="ProfileUpdateController" method="post" enctype="multipart/form-data">
	<div class="mypage" style="border: none;">

				<h1>MyPage</h1>
				<h2>내 프로필</h2>
			</div>
			<hr>


			<div class="profile">

				<div class="profile-field" style="border: none;">
					<div class="profile-circle">
						<img id="profileImg" src="/jsp/UserProfile/img/${user_picture}"
							alt="">
					</div>
					<div style="border: none; align-content: baseline;  margin-left: 30px; margin-bottom: 10px;">
					<span>
						<h2> 대식가 (${sessionScope.user.user_nickname})
							(${sessionScope.user.user_email}) 님 (🖐🏻'-' )</h2>
						 맛집러버 ${sessionScope.user.user_nickname} 님, 오늘은 어떤 맛집을 찾아볼까요? 🍫͜
						(ᵔ ̮ ᵔ)›
					</span>
					</div>
					<div style="border: none; margin-left: 225px;
    margin-top: -30px; align-content: center;" >
							<input type="button" value="프로필 수정하기" onclick="location.href='ProfileUpdateController?no='${user_email}">
					</div>
				</div>
			</div>

			<br> <br>

			<div class="review-list" style="border: none;">
				<h2 style="margin-inline-end: auto;">작성한 맛리뷰</h2>
				<div style="border: none;">
					<h3> <a onclick="location.href='UserReviewC'"> 더보기 > </a></h3>
				</div>
			</div>
			<hr>
				<c:forEach items="${reviews}" var="review">

			<div class="review-comment" style="border: none;">
				<span>🦀🍴</span> [${review.shop_name}]  ${review.review_content} | ${review.review_date} |${review.review_nickname}
			</div>
				</c:forEach>

			<br> <br>

			<div class="reservation-list" style="border: none;">
				<h2 style="margin-inline-end: auto;">예약한 가게</h2>
				<div style="border: none;">
					<h3> <a onclick="location.href='UserReservationC'"> 더보기 > </a></h3>
				</div>
			</div>
			<hr>
			<br>


			<div class="reserv-place-list-field">
			<c:forEach items="${myreservations}" var="myreservation">
				<div class="reserv-place-list">
					<img
						src="${myreservation.shop_image}"
						alt="">
					<!-- SHOP_IMAGE > SHOP_IMAGE 필드 -->
					<div style="border: none;">
						<h2>${myreservation.shop_name}</h2>
					</div>
					<div style="border: none;">
						<h3> [완료] ${myreservation.reservation_date} / ${myreservation.reservation_people} 명</h3>
					</div>
				</div>
			</c:forEach>


			</div>
			<br> <br>



			<div class="like-list" style="border: none;">

				<h2 style="margin-inline-end: auto;">좋아요한 가게</h2>
				<div style="border: none;">
					<h3><a onclick="location.href='UserScrapC'"> 더보기 ></a></h3>
				</div>
			</div>
			<hr>
			<br>


			<div class="like-place-list-field">
			<c:forEach items="${scraps}" var="scrap">
				<div class="like-place-list">
					<img
						src="${scrap.shop_image}"
						alt="place-name">
					<div style="border: none;">
						<h2><span>🍴</span> ${scrap.shop_name}</h2>
					</div>
				</div>
			</c:forEach>


			</div>
</form>


</body>
</html>