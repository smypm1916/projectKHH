<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div {
	border: 1px solid;
}

.header {
	height: 100px;
}

.nav {
	height: 70px;
}

.content {
	margin-top: 100px;
	margin-left: 100px;
	margin-right: 100px;
	height: 2000px;
	border: none;
}

.footer {
	height: 200px;
}

.profile-field {
	display: flex;
	margin: 30px
}

.profile-circle img {
	border-radius: 50%;
	width: 170px;
	height: 170px;
}

.review-list {
	display: flex;
	justify-content: flex-end;
}

.review-comment {
	font-size: 20px;
	font-weight: bolder;
	color: grey;
	display: flex;
}

.like-list {
	display: flex;
	justify-content: flex-end;
}

.like-place-list {
	display: inline-block;
	text-align: center;
}

.like-place-list img {
	width: 300px;
	height: 300px;
	border-radius: 12px; /* 모서리 둥글게 */
	border: 2px solid #ddd; /* 얇은 테두리 */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 그림자 효과 */
	transition: transform 0.3s, box-shadow 0.3s; /* 애니메이션 효과 */
}

.like-place-list:hover img {
	transform: scale(1.05); /* 호버 시 확대 효과 */
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3); /* 호버 시 그림자 강조 */
}

.like-place-list-field {
	display: flex;
	overflow: hidden;
}

.myShop_information_list {
	display: inline-block;
	text-align: center;
	width: 320px;
}

.myShop_information_list img {
	width: 300px;
	height: 300px;
	border-radius: 12px; /* 모서리 둥글게 */
	border: 2px solid #ddd; /* 얇은 테두리 */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 그림자 효과 */
	transition: transform 0.3s, box-shadow 0.3s; /* 애니메이션 효과 */
}
.myShop_information_list:hover img {
	transform: scale(1.05); /* 호버 시 확대 효과 */
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3); /* 호버 시 그림자 강조 */
}

.myShop_information_list_field {
	display: flex;
	overflow: hidden;
}
.change_profile {
	height: 50px;
	padding: 10px 20px; /* 버튼 내부 여백 */
	font-size: 16px; /* 텍스트 크기 */
	font-weight: bold; /* 텍스트 두께 */
	color: #ffffff; /* 텍스트 색상 */
	background-color: #007bff; /* 버튼 배경색 */
	border: none; /* 테두리 제거 */
	border-radius: 8px; /* 모서리 둥글게 */
	cursor: pointer; /* 마우스 오버 시 포인터 표시 */
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 약간의 그림자 */
	transition: background-color 0.3s, transform 0.2s; /* 애니메이션 효과 */
}

.change_profile:hover {
	background-color: #0056b3; /* 호버 시 배경색 변경 */
	transform: scale(1.05); /* 약간 확대 */
}
</style>
</head>
<body>
	<div class="container">
		<div class="header">header</div>
		<div class="nav">nav</div>
		<div class="content">

			<div class="mypage" style="border: none;">
				<h1>MyPage</h1>
				<hr>
				<h2>내 프로필</h2>
			</div>

			<div class="profile">

				<div class="profile-field" style="border: none;">
					<div class="profile-circle" style="border: none;">
						<img
							src="profilePhoto/zangetsu.jpg"
							alt="profile-img">
					</div>
					<div
						style="border: none; align-content: baseline; margin-left: 30px">
						<span>
							<h2>참월</h2>
							물러서면 퇴락이요. 겁먹으면 죽음이다.
						</span>
					</div>
					<div
						style="border: none; margin-left: auto; align-content: center;">
						<input class="change_profile" type="button" value="프로필 수정">
					</div>
				</div>
			</div>

			<br> <br>

			<div class="myShop_information" style="border: none;">
				<a style="text-decoration: none; color: black;"
					href="http://localhost/18_KHH_Test/ReservationPage.jsp">
					<h2 style="margin-inline-end: auto;">내 가게 정보</h2>
				</a>
			</div>

			<br>

			<div class="myShop_information_list_field">

				<div class="myShop_information_list">
					<img
						src="https://mblogthumb-phinf.pstatic.net/MjAxODA3MDVfNDAg/MDAxNTMwNzU3MjEyNjQ0.RNprD67cJ2AOWI2GmRVprWVv7qtNI-d3WsN-XhRLTLIg.hpd6lxFA6mkoZ-78fN-zmiLtxAv9H3iP_Jxs6bF7XCEg.PNG.witchstudio/image.png?type=w800"
						alt="place-name">
					<div style="border: none;">
						<h2>오이시 스시야</h2>
					</div>
					<div style="border: none;">
						<h3>도쿄도 시나가와구</h3>
						<h3>10:00 ~ 22:00</h3>
					</div>
				</div>

				<div class="myShop_information_list">
					<img src="https://kr.savorjapan.com/gg/content_image/t0283_017.jpg"
						alt="place-name">
					<div style="border: none;">
						<h2>무라카미 하코다테 본점</h2>
					</div>
					<div style="border: none;">
						<h3>도쿄도 세타가야구</h3>
						<h3>10:00 ~ 15:00</h3>
					</div>
				</div>

				<div class="myShop_information_list">
					<img src="https://kr.savorjapan.com/gg/content_image/t0283_005.jpg"
						alt="place-name">
					<div style="border: none;">
						<h2>라멘 삿포로 이치류안</h2>
					</div>
					<div style="border: none;">
						<h3>도쿄도 시부야</h3>
						<h3>10:00 ~ 24:00</h3>
					</div>
				</div>

				<div class="myShop_information_list">
					<img src="https://kr.savorjapan.com/gg/content_image/t0283_015.jpg"
						alt="place-name">
					<div style="border: none;">
						<h2>해산물 로바타야키</h2>
					</div>
					<div style="border: none;">
						<h3>도쿄도 시나가와구</h3>
						<h3>10:00 ~ 22:00</h3>
					</div>
				</div>

			</div>

			<br> <br>

			<hr>

			<div class="review-list" style="border: none;">
				<h2 style="margin-inline-end: auto;">예약리스트</h2>
				<div style="border: none;">
					<h3>
						<a href="http://localhost/18_KHH_Test/ReviewsPage.jsp"> 더보기 ></a>
					</h3>
				</div>
			</div>
			<hr>

			<div class="review-comment" style="border: none;">
				<span>🦀🍴</span> [ 예약정보 예시 ] 가게명 / 고객이름,인수 / 날짜,시간 / 전화번호
			</div>
			<div class="review-comment" style="border: none;">
				<span>🦀🍴</span> [ 예약정보 예시 ] 가게명 / 고객이름,인수 / 날짜,시간 / 전화번호
			</div>
			<div class="review-comment" style="border: none;">
				<span>🦀🍴</span> [ 예약정보 예시 ] 가게명 / 고객이름,인수 / 날짜,시간 / 전화번호
			</div>

			<br> <br>

			<hr>

			<div class="review-list" style="border: none;">
				<h2 style="margin-inline-end: auto;">리뷰리스트</h2>
				<div style="border: none;">
					<h3>
						<a href="http://localhost/18_KHH_Test/ReviewsPage.jsp"> 더보기 ></a>
					</h3>
				</div>
			</div>
			<hr>

			<div class="review-comment" style="border: none;">
				<span>🦀🍴</span> [ 리뷰정보 예시 ] 가게명 / 제목 / 게시일
			</div>
			<div class="review-comment" style="border: none;">
				<span>🦀🍴</span> [ 리뷰정보 예시 ] 가게명 / 제목 / 게시일
			</div>
			<div class="review-comment" style="border: none;">
				<span>🦀🍴</span> [ 리뷰정보 예시 ] 가게명 / 제목 / 게시일
			</div>

			<br> <br>


		</div>
		<div class="footer">footer</div>
	</div>
</body>
</html>