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
						src="${myreservation.shop_image}" alt="place-name">
					<div style="border: none; text-align: left; margin-left: 30px">
						<h1>
							<span>😋</span> ${myreservation.shop_name}
							<br>
							 <p>예약일정 : ${myreservation.reservation_date} </p>
							 <p>예약인원 : ${myreservation.reservation_people} 명</p>
						</h1>
						<div style="border: none;">
							<h2> 가게 주소 : ${myreservation.shop_addr}</h2>
							<p> 가게 연락처 : ${myreservation.shop_tel}</p>
							<p>예약자 이름 : ${myreservation.reservation_name}</p>
							<p>예약자 전화번호 : ${myreservation.reservation_tel}</p>

						</div>
					</div>
				</div>
				<div style="border: none; align-content: center; margin-left: 80px;">
					<input type="button" value="가게 정보 보기">
				</div>
			</div>
</c:forEach>
			<br> <br>

			<div class="bottom-list-num" style="border: none;">
				<a href="UserReservationPageC?p=1"> << </a>
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