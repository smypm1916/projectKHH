<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/css/userReservationPage.css">
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
			<div class="mypage" style="border: none;">
				<h1 onclick="location.href='UserC'">MyPage </h1>
			</div>
			<br>
			<hr>

			<div class="reservation-list" style="border: none;">
				<h2 style="margin-inline-end: auto;">예약한 가게</h2>
			</div>
			<br>


<c:forEach items="${myreservations}" var="myreservation">
			<div class="reserv-place-list-field" style="border: solid 1px;">
				<div class="reserv-place-list">
					<img
						src="image/${myreservation.shop_image}" alt="place-name">
					<div style="border: none; text-align: left;">


						<h1>😋${myreservation.shop_name}</h1>
						<p>[가게 주소]</p>
							${myreservation.shop_addr} <!-- h2 태그로 가게 주소 적용 -->
						<p>[가게 연락처]</p>
							${myreservation.shop_tel}
						<br>
						<br>
						<div style="border: none;">
						<h3>[예약일정] ${myreservation.reservation_date}</h3> <!-- h2 태그로 예약일정 적용 -->
						<h3>[예약인원] ${myreservation.reservation_people} 명</h3> <!-- h2 태그로 예약인원 적용 -->
							<h3>[예약자 이름] ${myreservation.reservation_name}</h3>
							<h3>[예약자 전화번호] ${myreservation.reservation_tel}</h3>
						</div>
					</div>
				</div>
				<div style="border: none; align-content: center; margin-left: 60px;">
					<input type="button" value="예약 정보 보기">
				</div>
			</div>
</c:forEach>
			<br> <br>

			<div class="bottom-list-num" style="border: none;">
				<a href="UserReservationPageC?p=1"> <<  </a>
				<c:forEach begin = "1" end = "${pageCount }" var = "i">
					<a href="UserReservationPageC?p=${i }">[${i }] </a>
				</c:forEach>
				<a href="UserReservationPageC?p=${pageCount }"> >> </a>
			</div>

			<div class="bottom-return-btn"
				style="border: none; align-content: center;">
				<input onclick="location.href='UserC'" type="button" value="마이페이지로 돌아가기">
			</div>



</body>
</html>