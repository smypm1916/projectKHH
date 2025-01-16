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
				<h2>내 프로필 수정(완료버전)</h2>
			</div>
			<hr>


			<div class="profile">

				<div class="profile-field" style="border: none;">
					<div class="profile-circle" style="border: none;">
						<img id="profileImg"
							src="/jsp/UserProfile/img/${user_picture}"
							alt="profile-img">
						<input name="newImg" hidden type="file">
						<input type="hidden" name="user_picture" value="${sessionScope.user.user_picture}">
					</div>
					<div style="border: none; align-content: baseline;  margin-left: 30px; margin-bottom: 10px;">
					<span>
						<h2> 대식가 <input style="width: 100px" name="user_nickname" value = "${sessionScope.user.user_nickname}">
							(${sessionScope.user.user_email}) 님 (🖐🏻'-' )</h2>
						 맛집러버 <input  style="width: 100px" name="user_nickname" value ="${sessionScope.user.user_nickname}">님, 오늘은 어떤 맛집을 찾아볼까요? 🍫͜
						(ᵔ ̮ ᵔ)›
					</span>

					</div>
					<div style="border: none; margin-left: 225px;
    margin-top: -30px; align-content: center;" >
							<input type="button" value="수정 완료하기" onclick="location.href='HomeController?no='${user_email}">
					</div>
				</div>
			</div>

			<br> <br>

			<div class="review-list" style="border: none;">
				<h2 style="margin-inline-end: auto;">작성한 맛리뷰</h2>
				<div style="border: none;">
					<h3> <a href="UserReviewC" > 더보기 > </a></h3>
				</div>
			</div>
			<hr>

			<div class="review-comment" style="border: none;">
				<span>🦀🍴</span> [ 맛리뷰 예시 ] 가게명 / 제목 or 텍스트 일부 / 게시일
			</div>
			<div class="review-comment" style="border: none;">
				<span>🦀🍴</span> ${review_shop}| ${review_content} | ${review_date}
			</div>
			<div class="review-comment" style="border: none;">
				<span>🦀🍴</span> ${review_shop}| ${review_content} | ${review_date}
			</div>

			<br> <br>

			<div class="reservation-list" style="border: none;">
				<h2 style="margin-inline-end: auto;">예약한 가게</h2>
				<div style="border: none;">
					<h3> <a href="UserReservationC"> 더보기 > </a></h3>
				</div>
			</div>
			<hr>
			<br>



			<div class="reserv-place-list-field">

				<div class="reserv-place-list">
					<img
						src="https://mblogthumb-phinf.pstatic.net/MjAxODA3MDVfNDAg/MDAxNTMwNzU3MjEyNjQ0.RNprD67cJ2AOWI2GmRVprWVv7qtNI-d3WsN-XhRLTLIg.hpd6lxFA6mkoZ-78fN-zmiLtxAv9H3iP_Jxs6bF7XCEg.PNG.witchstudio/image.png?type=w800"
						alt="place-name">
					<div style="border: none;">
						<h2>예약한 가게명</h2>
					</div>
					<div style="border: none;">
						<h3>예약일시 / 예약 인원</h3>
					</div>
				</div>


				<div class="reserv-place-list">
					<img src="https://kr.savorjapan.com/gg/content_image/t0283_017.jpg"
						alt="place-name">
					<div style="border: none;">
						<h2> ${reservation_shop} </h2>
					</div>
					<div style="border: none;">
						<h3>${reservation_date} / ${reservation_people}</h3>
					</div>
				</div>


				<div class="reserv-place-list">
					<img src="https://kr.savorjapan.com/gg/content_image/t0283_005.jpg"
						alt="place-name">
					<div style="border: none;">
						<h2>라멘 삿포로 이치류안</h2>
					</div>
					<div style="border: none;">
						<h3>2025.01.11 19:00 / 1명</h3>
					</div>
				</div>

				<div class="reserv-place-list">
					<img src="https://kr.savorjapan.com/gg/content_image/t0283_015.jpg"
						alt="place-name">
					<div style="border: none;">
						<h2>해산물 로바타야키</h2>
					</div>
					<div style="border: none;">
						<h3>2025.02.11 15:00 / 1명</h3>
					</div>
				</div>


			</div>

			<br> <br>



			<div class="like-list" style="border: none;">

				<h2 style="margin-inline-end: auto;">좋아요한 가게</h2>
				<div style="border: none;">
					<h3><a href="UserScrapC"> 더보기 ></a></h3>
				</div>
			</div>
			<hr>
			<br>


			<div class="like-place-list-field">
				<div class="like-place-list">
					<img
						src="https://mblogthumb-phinf.pstatic.net/MjAxODA3MDVfNDAg/MDAxNTMwNzU3MjEyNjQ0.RNprD67cJ2AOWI2GmRVprWVv7qtNI-d3WsN-XhRLTLIg.hpd6lxFA6mkoZ-78fN-zmiLtxAv9H3iP_Jxs6bF7XCEg.PNG.witchstudio/image.png?type=w800"
						alt="place-name">
					<div style="border: none;">
						<h2><span>🍴</span> 유저가 좋아한 가게명</h2>
					</div>
				</div>


				<div class="like-place-list">
					<img src="https://kr.savorjapan.com/gg/content_image/t0283_017.jpg"
						alt="place-name">
					<div style="border: none;">
						<h2><span>🍴</span> ${scrap_shop}</h2>
					</div>
				</div>


				<div class="like-place-list">
					<img src="https://kr.savorjapan.com/gg/content_image/t0283_005.jpg"
						alt="place-name">
					<div style="border: none;">
						<h2><span>🍴</span> 라멘 삿포로 이치류안</h2>
					</div>
				</div>

				<div class="like-place-list">
					<img src="https://kr.savorjapan.com/gg/content_image/t0283_015.jpg"
						alt="place-name">
					<div style="border: none;">
						<h2><span>🍴</span> 해산물 로바타야키</h2>
					</div>
				</div>


			</div>
</form>
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