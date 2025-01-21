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


.bottom-list-num {
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
				<h1>MyPage  (누르면 마이페이지 메인으로 이동)</h1>
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

			<div class="review-comment" style="border: none;">
				<span>🦀🍴</span> [ 맛리뷰 예시 ] 가게명 / 제목 or 텍스트 일부 / 게시일
			</div>
			
		<hr>
			<div class="review-comment" style="border: none;">
				<span>🦀🍴</span> 
				<a href="https://kr.savorjapan.com/contents/discover-oishii-japan/if-you-re-looking-for-a-good-drink-in-shinjuku-these-are-the-places-to-be-10-izakaya/"> 홋카이도넘버원 (北海道ナンバーワン) | 찾았습니다. 존맛탱 홍게집....! 홍게 속살이 꽉
				차있는 숨은 골목 .. | 2025.01.10</a>
				<!-- 글주소 (편집 가능한)  -->
			</div>
					<hr>
			
			<div class="review-comment" style="border: none;">
				<span>🦀🍴</span> 우유빙수 (ミルクかき氷) | 산처럼 쌓인 우유 빙수가 인상적인 디저트 맛집입니다. 만족만족
				대만족! | 2025.01.10
			</div>

		<hr>
			<div class="review-comment" style="border: none;">
				<span>🦀🍴</span> 우유빙수 (ミルクかき氷) | 산처럼 쌓인 우유 빙수가 인상적인 디저트 맛집입니다. 만족만족
				대만족! | 2025.01.10
			</div>
			
			<!--  글리스트 넘길수있게  -->
			
			
			
			
		
			<br> <br>
			<div class="bottom-list-num" style="border: none;">  <h2> 1 2 3 4 (나중에 구현) > </h2>   </div>

	



		</div>
		<div class="footer">footer</div>
	</div>
</body>
</html>