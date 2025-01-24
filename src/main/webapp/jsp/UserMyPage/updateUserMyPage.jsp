<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/userMyPage/updateUserMyPage.css">
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<form action="ProfileUpdateController" method="post" enctype="multipart/form-data">
    <div class="profile">
        <div class="profile-field" style="border: none;">
            <div class="profile-circle">
                <!-- 기존 프로필 사진 표시 -->
                    <img src="../image/korosan.jpg">
                <%--<c:if test="${sessionScope.user.user_picture} != null">
                    <img id="profileImg" src="image/${sessionScope.user.user_picture}" alt="프로필 사진">
                </c:if>--%>
                <!-- 파일 업로드 버튼 -->
                <label for="newImg" class="camera-icon">
                    <i class="fa fa-camera"></i>
                </label>
                <input id="newImg" name="newImg" type="file" hidden>
            </div>

            <div class="profile-message">
					<span>
						<h2> 대식가 <input style="width: 100px" name="user_nickname"
                                        value="${sessionScope.user.user_nickname}">
							(${sessionScope.user.user_email}) 님 (🖐🏻'-' )</h2>
						 맛집러버 ${sessionScope.user.user_nickname} 님, <br>오늘은 어떤 맛집을 찾아볼까요? 🍫͜
						(ᵔ ̮ ᵔ)›
					</span>
            </div>
            <div class="profile-updateBtn">
                <%--							<input type="button" value="수정 완료하기">--%>
                <button>수정하기</button>
            </div>
        </div>
    </div>
</form>

<%--<div class="review-list" style="border: none;">
    <h2 style="margin-inline-end: auto;">작성한 맛리뷰</h2>
    <div style="border: none;">
        <h3><a onclick="location.href='UserReviewC'"> 더보기 > </a></h3>
    </div>
</div>
<c:forEach items="${reviews}" var="review">

    <div class="review-comment" style="border: none;">
        <span>🦀🍴</span> [${review.shop_name}] ${review.review_content} | ${review.review_date}
        |${review.review_nickname}
    </div>
</c:forEach>--%>

<%--<div class="reservation-list" style="border: none;">
    <h2 style="margin-inline-end: auto;">예약한 가게</h2>
    <div style="border: none;">
        <h3><a onclick="location.href='UserReservationC'"> 더보기 > </a></h3>
    </div>
</div>
<div class="reserv-place-list-field">
    <c:forEach items="${myreservations}" var="myreservation">
        <div class="reserv-place-list">
            <img
                    src="image/${myreservation.shop_image}"
                    alt="">
            <!-- SHOP_IMAGE > SHOP_IMAGE 필드 -->
            <div style="border: none;">
                <h2>🍴</h2>
                    <h2>${myreservation.shop_name}</h2>
            </div>
            <div style="border: none;">
                <h3> [완료] ${myreservation.reservation_date} / ${myreservation.reservation_people} 명</h3>
            </div>
        </div>
    </c:forEach>
</div>--%>

<%--<div class="like-list" style="border: none;">
    <h2 style="margin-inline-end: auto;">좋아요한 가게</h2>
    <div style="border: none;">
        <h3><a onclick="location.href='UserScrapC'"> 더보기 ></a></h3>
    </div>
</div>
<div class="like-place-list-field">
    <c:forEach items="${scraps}" var="scrap">
        <div class="like-place-list">
            <img
                    src="image/${scrap.shop_image}"
                    alt="place-name">
            <div style="border: none;">
                <h2>💘</h2>
                <h2> ${scrap.shop_name}</h2>
            </div>
        </div>
    </c:forEach>
</div>--%>

<%--&lt;%&ndash;	<script>&ndash;%&gt;--%>
<%--&lt;%&ndash;		// 요소 참조&ndash;%&gt;--%>
<%--&lt;%&ndash;		const profileContainer = document.getElementById('profileImg');&ndash;%&gt;--%>
<%--&lt;%&ndash;		const fileInput = document.querySelector("input[name='newImg']");&ndash;%&gt;--%>
<%--&lt;%&ndash;		console.log(profileContainer)&ndash;%&gt;--%>
<%--&lt;%&ndash;		console.log(fileInput)&ndash;%&gt;--%>
<%--&lt;%&ndash;		const profileImg = document.getElementById('profile-img');&ndash;%&gt;--%>

<%--&lt;%&ndash;		// 프로필 클릭 이벤트&ndash;%&gt;--%>
<%--&lt;%&ndash;		profileContainer.addEventListener('click', () => {&ndash;%&gt;--%>
<%--&lt;%&ndash;		fileInput.click(); // 파일 선택 창 열기&ndash;%&gt;--%>
<%--&lt;%&ndash;	});&ndash;%&gt;--%>
<%--</script>--%>
</body>
</html>