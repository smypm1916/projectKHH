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
	margin-left: 300px;
	margin-right: 300px;
	height: 1000px;
	border: none;
}

.shop-one {
	width: 900px;
	height: 800px;
}

.shop-img-div {
	display: flex;
	width: 100%;
	height: 300px;
}

.main-img-div {
	width: 60%;
	height: 100%; /* 원하는 높이를 설정 */
	position: relative; /* 위치를 제어할 수 있도록 합니다. */
	margin-right: 10px;
}

.main-img-div img {
	width: 100%; /* div의 너비에 맞게 이미지를 채웁니다. */
	height: 100%; /* div의 높이에 맞게 이미지를 채웁니다. */
	object-fit: cover; /* 이미지 비율을 유지하면서 div를 꽉 채웁니다. */
}

.sub-main-div {
	width: 40%;
	height: 100%;
	position: relative; /* 위치를 제어할 수 있도록 합니다. */
}
.sub-img-div{
	border:none;
	display: flex;
	width:100%;
	height: 33%;
}
.sub-img-div div{
	border: none;
	margin-top: 5px;
	margin-right: 5px;
	margin-bottom: 10px;
	width:50%;
}
.sub-img-div img {
	width: 100%; /* 한 개의 이미지를 가로로 꽉 채웁니다. */
	height: 100%;
	object-fit: cover; /* 이미지 비율을 유지하면서 꽉 채우도록 합니다. */
}
.shop-img-row {
	display: flex;
	width: 100%;
	margin-bottom: 5px; /* 행 간격 */
}

.shop-sub-img {
	width: 100%; /* 한 개의 이미지를 가로로 꽉 채웁니다. */
	height: 100px;
	object-fit: cover; /* 이미지 비율을 유지하면서 꽉 채우도록 합니다. */
}
.shop-name{
	text-align: center;
	font-weight: bold;
}
.shop-explanation{
	width: 50%;
}
.shop-detail{
	width: 50%;
}

.shop-time{
	width: 50%;
}
.shop-access{
	width: 50%;
}
.footer {
	height: 200px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="header">header</div>
		<div class="nav">nav</div>
		<div class="content">

			<div class="shop-one">
				<div class="shop-img-div">
					<div class="main-img-div">
						<img alt=""
							src="https://tabiiro.jp/lpimg/gourmet/309597/main/img1.jpg">
					</div>
					<div class="sub-main-div">
						<div class="sub-img-div">
							<div><img alt=""
							src="https://tabiiro.jp/lpimg/gourmet/309597/main/img1.jpg"></div>
							<div><img alt=""
							src="https://tabiiro.jp/lpimg/gourmet/309597/main/img1.jpg"></div>
						</div>
						<div class="sub-img-div">
							<div><img alt=""
							src="https://tabiiro.jp/lpimg/gourmet/309597/main/img1.jpg"></div>
							<div><img alt=""
							src="https://tabiiro.jp/lpimg/gourmet/309597/main/img1.jpg"></div>
						</div>
						<div class="sub-img-div">
							<div><img alt=""
							src="https://tabiiro.jp/lpimg/gourmet/309597/main/img1.jpg"></div>
							<div><img alt=""
							src="https://tabiiro.jp/lpimg/gourmet/309597/main/img1.jpg"></div>
						</div>
					</div>

				</div>
				<div>#和食</div>
				<div class="shop-name">割烹居酒屋そのまま(가게명)</div>
				<div style="display: flex;">
					<div class="shop-explanation">가게설명</div>
					<div class="shop-detail">
						<button>점포상세</button>
					</div>
				</div>

				<div style="display: flex;">
					<div class="shop-time">
					영업시간<br>
					17:00～22:30（フードLO22:00、ドリンクLO22:30）
					</div>
					<div class="shop-access">
					住所<br>
					北海道～～～
					</div>
				</div>
			</div>
			<div class="shop-one">
				<div class="shop-img-div">
					<div class="main-img-div">
						<img alt=""
							src="https://tabiiro.jp/lpimg/gourmet/309597/main/img1.jpg">
					</div>
					<div class="sub-main-div">
						<div class="sub-img-div">
							<div><img alt=""
							src="https://tabiiro.jp/lpimg/gourmet/309597/main/img1.jpg"></div>
							<div><img alt=""
							src="https://tabiiro.jp/lpimg/gourmet/309597/main/img1.jpg"></div>
						</div>
						<div class="sub-img-div">
							<div><img alt=""
							src="https://tabiiro.jp/lpimg/gourmet/309597/main/img1.jpg"></div>
							<div><img alt=""
							src="https://tabiiro.jp/lpimg/gourmet/309597/main/img1.jpg"></div>
						</div>
						<div class="sub-img-div">
							<div><img alt=""
							src="https://tabiiro.jp/lpimg/gourmet/309597/main/img1.jpg"></div>
							<div><img alt=""
							src="https://tabiiro.jp/lpimg/gourmet/309597/main/img1.jpg"></div>
						</div>
					</div>

				</div>
				<div class="shop-name">割烹居酒屋そのまま(가게명)</div>
				<div style="display: flex;">
					<div class="shop-explanation">가게설명</div>
					<div class="shop-detail">
						<button>점포상세</button>
					</div>
				</div>

				<div style="display: flex;">
					<div class="shop-time">
					영업시간<br>
					17:00～22:30（フードLO22:00、ドリンクLO22:30）
					</div>
					<div class="shop-access">
					오시는길<br>
					電車：JR横浜支社伊東線来宮駅より徒歩約11分、JR東海道本線・伊東線・東海道新幹線熱海駅より徒歩約12分、バス：伊豆東海バス本町商店街停留所・銀座（海岸）停留所・銀座停留所より徒歩約2分
					</div>
				</div>
			</div>



		</div>
		<div class="footer">footer</div>
	</div>
</body>
</html>
