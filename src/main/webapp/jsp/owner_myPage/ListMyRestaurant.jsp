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
	height: 3500px;
	border: none;
}

.footer {
	height: 200px;
}

.profile-field {
	display: flex;
}

.profile-circle img {
	border-radius: 50%;
	width: 170px;
	height: 170px;
}

.myShop {
	display: flex;
	justify-content: flex-end;
}

.myShop_place_box {
	display: flex;
	text-align: center;
	border: none;
	margin: 20px;
}
.myShop_photo {
  border-radius: 12px; /* 모서리 둥글게 */
  border: 2px solid #ddd; /* 얇은 테두리 */
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 그림자 효과 */
  transition: transform 0.3s, box-shadow 0.3s; /* 애니메이션 효과 */
}

.myShop_photo:hover {
  transform: scale(1.05); /* 호버 시 확대 효과 */
  box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3); /* 호버 시 그림자 강조 */
}

.myShop_place_box img {
	width: 300px;
	height: 300px;
}

.myShop_container {
	display: flex;
	overflow: hidden;
	background-color: rgb(198, 232, 242);
}

.myShop_button_field {
	margin-left: auto;
}

.myShop-button {
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

.myShop-button:hover {
  background-color: #0056b3; /* 호버 시 배경색 변경 */
  transform: scale(1.05); /* 약간 확대 */
}

.myShop-button:active {
  background-color: #003d80; /* 클릭 시 배경색 변경 */
  transform: scale(0.95); /* 약간 축소 */
}

.bottom-list-num {
	text-align: center;
	item-align: center;
}

.text-box {
	margin-top: 20px;
	margin-left: 20px;
	margin-bottom: 40px;
}

.bottom-list-num {
	text-align: center;
	item-align: center;
}

.bottom-return-btn {
	text-align: center;
	item-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<div class="header">header</div>
		<div class="nav">nav</div>
		<div class="content">

			<div class="mypage" style="border: none;">
				<h1>MyPage (누르면 마이페이지 메인으로 이동)</h1>
			</div>
			<br>
			<hr>

			<div class="myShop" style="border: none;">
				<h1 style="margin-inline-end: auto;">내 가게</h1>
				<p style="display: flex; align-items: center; text-align: center">
					<a href="AddRestaurantC" style="text-decoration: none; color: black">
						<h2>가게를 추가</h2>
					</a>
				</p>
			</div>

			<br>

			<c:forEach var="res" items="${res}">
				<div class="myShop_container" style="border: solid 1px;">
					<div class="myShop_place_box">
						<img class="myShop_photo"
							 src="https://kr.savorjapan.com/gg/content_image/t0283_017.jpg"
							 alt="place-name">
						<div style="border: none; text-align: left; margin-left: 30px">
							<h2>
								<span>😋</span>${res.name}
							</h2>
							<div style="border: none;">
								<p>${res.address}</p>
								<p>${res.opentime}</p>
								<p>${res.phone}</p>
								<p>${res.explain}</p>

							</div>
						</div>
					</div>
					<div class="myShop_button_field" style="border: none; align-content: center;">
						<input onclick="location.href='DetailRestaurantC?no=${res.id}'" class="myShop-button" type="button" value="가게 정보 보기">
						<input onclick="location.href='Edit_myRestaurantC?no=${res.id}'" class="myShop-button" type="button" value="수정">
						<input onclick="location.href='Delete_myRestaurantC?no=${res.id}'" class="myShop-button" type="button" value="삭제">
					</div>
				</div>
			</c:forEach>

			<br> <br>

			<div class="bottom-list-num" style="border: none;">
				<h2>1 2 3 4 (나중에 구현) ></h2>
			</div>

			<div class="bottom-return-btn"
				style="border: none; align-content: center;">
				<input type="button" value="마이페이지로 돌아가기">
			</div>




		</div>

		<div class="footer">footer</div>
	</div>
</body>
</html>