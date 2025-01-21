<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Shop List</title>
	<style>
		body {
			font-family: Arial, sans-serif;
			background-color: #f4f4f4;
			margin: 0;
			padding: 0;
			color: #333;
		}

		.container {
			width: 80%;
			margin: 50px auto;
		}

		.shop-card {
			background-color: #fff;
			border-radius: 8px;
			box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
			margin-bottom: 40px;
			overflow: hidden;
			display: flex;
			flex-direction: column;
			padding: 20px;
		}

		/* 메인 사진 스타일 */
		.main-img {
			width: 100%;
			height: 400px;
			object-fit: cover;
			border-radius: 8px;
			margin-bottom: 20px;
		}

		/* 서브 사진을 6개 배치하는 부분 */
		.sub-img {
			display: grid;
			grid-template-columns: repeat(3, 1fr); /* 한 줄에 3개씩 */
			gap: 10px; /* 사진 간의 간격 */
			margin-bottom: 20px;
		}

		.sub-img img {
			width: 100%;
			height: 120px;
			object-fit: cover;
			border-radius: 8px;
		}

		.shop-info {
			padding: 20px;
			display: flex;
			flex-direction: column;
			justify-content: space-between;
			flex-grow: 1;
		}

		.shop-name {
			font-size: 2em; /* 글씨 크기 크게 */
			font-weight: bold;
			color: #007BFF;
			cursor: pointer;
			margin-bottom: 15px;
			text-align: center;
			line-height: 1.4;
		}

		.shop-name:hover {
			text-decoration: underline;
		}

		.shop-description {
			font-size: 1.2em; /* 글씨 크기 크게 */
			color: #555;
			line-height: 1.8;
			margin-bottom: 20px;
		}

		.shop-details {
			display: flex;
			justify-content: space-between;
			font-size: 1.1em;
			color: #777;
			margin-bottom: 15px;
		}

		.shop-details div {
			width: 48%;
		}

		.shop-time, .shop-access {
			font-weight: bold;
			color: #333;
		}

		/* 주소 타입 디자인 추가 */
		.shop-addrtype {
			font-size: 1.2em;
			font-weight: bold;
			color: black;
			padding: 5px 15px;
			border-radius: 25px;
			text-align: center;
			margin-bottom: 20px;

		}

		/* 반응형 디자인 - 화면이 좁아지면 서브사진이 2개씩 표시됨 */
		@media (max-width: 768px) {
			.sub-img {
				grid-template-columns: repeat(2, 1fr); /* 작은 화면에서 2개씩 */
			}
		}

		@media (max-width: 480px) {
			.sub-img {
				grid-template-columns: 1fr; /* 아주 작은 화면에서 1개씩 */
			}
		}
	</style>
</head>
<body>

<div class="container">
	<c:forEach var="shop" items="${shops}">
		<!-- 주소 타입 표시 -->
		<div class="shop-addrtype">#${shop.shop_addrtype}</div>

		<div class="shop-card">
			<!-- 메인 사진 -->
			<img class="main-img" src="https://tabiiro.jp/lpimg/gourmet/309597/main/img1.jpg" alt="메인사진">

			<!-- 서브 사진 6개 -->
			<div class="sub-img">
				<img src="https://tabiiro.jp/lpimg/gourmet/309597/main/img1.jpg" alt="서브사진 1">
				<img src="https://tabiiro.jp/lpimg/gourmet/309597/main/img2.jpg" alt="서브사진 2">
				<img src="https://tabiiro.jp/lpimg/gourmet/309597/main/img3.jpg" alt="서브사진 3">
				<img src="https://tabiiro.jp/lpimg/gourmet/309597/main/img4.jpg" alt="서브사진 4">
				<img src="https://tabiiro.jp/lpimg/gourmet/309597/main/img5.jpg" alt="서브사진 5">
				<img src="https://tabiiro.jp/lpimg/gourmet/309597/main/img6.jpg" alt="서브사진 6">
			</div>

			<!-- 상점 정보 -->
			<div class="shop-info">
				<div class="shop-name" onclick="location.href='ShopDetailC?no=${shop.shop_no}'">${shop.shop_name}</div>
				<div class="shop-description">${shop.shop_content}</div>
				<div class="shop-details">
					<div class="shop-time">${shop.shop_opentime}</div>
					<div class="shop-access">${shop.shop_addr}</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>

</body>
</html>
