<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/css/userMyPage.css">
<head>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
	<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="ProfileUpdateController" method="post" enctype="multipart/form-data">
			<div class="mypage" style="border: none;">
				<h1>MyPage</h1>
				<h2>내 프로필 </h2>
			</div>
			<hr>


	<div class="profile">
		<div class="profile-field" style="border: none;">
			<div class="profile-circle">
				<img id="profileImg" src="/jsp/UserProfile/img/${user_picture}"
					 alt="">


				<!-- 카메라 아이콘 -->
				<label  for="newImg"  class="camera-icon">
					<i class="fa fa-camera" aria-hidden="true"></i> <!-- Font Awesome 카메라 아이콘 -->
				</label>

				<!-- 파일 업로드 -->
				<input id="newImg" name="newImg" type="file" hidden>
			</div>

	<div style="border: none; align-content: baseline;  margin-left: 30px; margin-bottom: 10px;">
					<span>
						<h2> 대식가 <input style="width: 100px" name="user_nickname" value = "${sessionScope.user.user_nickname}">
							(${sessionScope.user.user_email}) 님 (🖐🏻'-' )</h2>
						 맛집러버 ${sessionScope.user.user_nickname} 님, 오늘은 어떤 맛집을 찾아볼까요? 🍫͜
						(ᵔ ̮ ᵔ)›
					</span>

					</div>
					<div style="border: none; margin-left: 225px; margin-top: -30px; align-content: center;" >
<%--							<input type="button" value="수정 완료하기">--%>
						<button style="background-color: #000000; /* 검정 버튼 */
    color: #ffffff; /* 하얀 글씨 */
    border: none;
    padding: 6px 12px; /* 크기 축소 */
    cursor: pointer;
    font-size: 12px;
    border-radius: 4px;">수정하기</button>
					</div>
		</div>
	</div>
</form>
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

	<script>
		// 요소 참조
		const profileContainer = document.getElementById('profileImg');
		const fileInput = document.querySelector("input[name='newImg']");
		console.log(profileContainer)
		console.log(fileInput)
		const profileImg = document.getElementById('profile-img');

		// 프로필 클릭 이벤트
		profileContainer.addEventListener('click', () => {
		fileInput.click(); // 파일 선택 창 열기
	});
</script>

</body>
</html>