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


.reservation-list {
	display: flex;
	justify-content: flex-end;
}

.reserv-place-list {
	display: flex;
	text-align: center;
	border: none;
	margin: 20px;
}

.reserv-place-list img {
	width: 300px;
	height: 300px;
}

.reserv-place-list-field {
	display: flex;
	overflow: hidden;
}

.calendar-container {
	margin: 20px 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	border: 1px solid #ddd;
	border-radius: 10px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	padding: 20px;
	background-color: #f9f9f9;
}

.calendar {
	display: grid;
	grid-template-columns: repeat(7, 1fr);
	gap: 5px;
	width: 100%;
	max-width: 400px;
	text-align: center;
}

.calendar div {
	padding: 10px 0;
	border-radius: 5px;
}

.calendar .day-header {
	font-weight: bold;
	background-color: #007bff;
	color: white;
}

.calendar .day {
	border: 1px solid #ddd;
	background-color: #f1f1f1;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.calendar .day:hover {
	background-color: #e0e0e0;
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

			<div class="reservation-list" style="border: none;">
				<h2 style="margin-inline-end: auto;">예약한 가게</h2>
			</div>
			<br>
			<div class="reservation-list" style="border: none; display: flex; justify-content: center">
				<input type="button" value="새로운 예약 추가">
			</div>

			<!-- Calendar Section -->
			<div class="calendar-container">
				<h3>달력</h3>
				<div class="calendar">
					<div class="day-header">일</div>
					<div class="day-header">월</div>
					<div class="day-header">화</div>
					<div class="day-header">수</div>
					<div class="day-header">목</div>
					<div class="day-header">금</div>
					<div class="day-header">토</div>
					<!-- Example for February -->
					<div></div>
					<div></div>
					<div></div>
					<div></div>
					<div class="day">1</div>
					<div class="day">2</div>
					<div class="day">3</div>
					<div class="day">4</div>
					<div class="day">5</div>
					<div class="day">6</div>
					<div class="day">7</div>
					<div class="day">8</div>
					<div class="day">9</div>
					<div class="day">10</div>
					<div class="day">11</div>
					<div class="day">12</div>
					<div class="day">13</div>
					<div class="day">14</div>
					<div class="day">15</div>
					<div class="day">16</div>
					<div class="day">17</div>
					<div class="day">18</div>
					<div class="day">19</div>
					<div class="day">20</div>
					<div class="day">21</div>
					<div class="day">22</div>
					<div class="day">23</div>
					<div class="day">24</div>
					<div class="day">25</div>
					<div class="day">26</div>
					<div class="day">27</div>
					<div class="day">28</div>
				</div>
			</div>



			<div class="reserv-place-list-field" style="border: solid 1px;">
				<div class="reserv-place-list">
					<img
						src="https://mblogthumb-phinf.pstatic.net/MjAxODA3MDVfNDAg/MDAxNTMwNzU3MjEyNjQ0.RNprD67cJ2AOWI2GmRVprWVv7qtNI-d3WsN-XhRLTLIg.hpd6lxFA6mkoZ-78fN-zmiLtxAv9H3iP_Jxs6bF7XCEg.PNG.witchstudio/image.png?type=w800"
						alt="place-name">
					<div style="border: none; text-align: left; margin-left: 30px">
						<h2>예약한 가게명</h2>
						<h2>예약일시/예약인원</h2>
				<div  style="border: none;">
						<h3>예약자 이름 : 000</h3>
						<h3>예약자 전화번호 : 000  </h3>

					</div>
					</div>
				</div>
						<div  style="border: none; align-content: center;">
					<input type="button" value="예약 변경">
					</div>
			</div>






		</div>

	<div class="footer">footer</div>
	</div>
</body>
</html>