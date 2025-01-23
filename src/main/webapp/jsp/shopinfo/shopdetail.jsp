<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>가게 정보와 리뷰</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        /* 탭 메뉴 스타일 */
        .tab-menu {
            display: flex;
            justify-content: center;
            background-color: #d4c6b5; /* 연갈색 배경 */
            padding: 15px 0;
            border-bottom: 2px solid #b6a58d; /* 뮤트한 연갈색 테두리 */
        }

        .tab-menu button {
            background-color: #d4c6b5; /* 연갈색 */
            color: #5e4b3c; /* 부드러운 갈색 텍스트 */
            padding: 12px 30px;
            border: none;
            font-size: 18px;
            cursor: pointer;
            border-radius: 5px;
            margin: 0 10px;
            transition: background-color 0.3s ease;
        }

        .tab-menu button:hover {
            background-color: #bba78f; /* 마우스 오버 시 색상 */
        }

        .tab-menu button.active {
            background-color: #9f8c75; /* 클릭된 탭 색상 */
            color: white; /* 클릭된 탭 텍스트 색상 */
        }

        /* 탭 내용 */
        .tab-content {
            display: none;
            padding: 30px;
            background-color: white;
            border-top: 2px solid #ddd;
            max-width: 1200px;
            margin: 20px auto;
            border-radius: 10px;
        }

        .tab-content.active {
            display: block;
        }

        .shop-detail {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            padding: 30px;
            text-align: center;
            margin-bottom: 30px;
        }

        .main-img img {
            width: 300px;
            height: 300px;
            object-fit: cover;
            border-radius: 10px;
        }

        .sub-imgs {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }

        .sub-img img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 10px;
        }

        .shop-name {
            font-size: 32px;
            font-weight: bold;
            color: #5e4b3c; /* 부드러운 갈색 텍스트 */
            margin-top: 20px;
        }

        .shop-intro {
            font-size: 16px;
            color: #555;
            margin-top: 15px;
        }

        .info {
            font-size: 24px;
            color: #333;
            margin-top: 30px;
            font-weight: bold;
        }

        .info div {
            margin: 8px 0;
            font-size: 20pt;
        }

        .info-content {
            font-size: 20pt;
            margin: 40px;
        }

        .info-content div {
            border-bottom: 1px #cccccc dotted;
            margin-left: 150px;
            margin-right: 150px;
            margin-top: 20px;
        }

        .menu-one {
            width: 800px;
            margin: 30px auto;
            border-bottom: dotted 1px #ccc;
            padding-bottom: 20px;
        }

        .menu-nameprice {
            display: flex;
            justify-content: space-between;
            font-size: 20px;
            margin-bottom: 10px;
        }

        .menu-type {
            font-size: 18px;
            color: #555;
        }

        .footer {
            height: 150px;
            text-align: center;
            background-color: #f1f1f1;
            padding-top: 50px;
            font-size: 14px;
            color: #777;
        }

        /* 리뷰 섹션 */
        .review-section {
            margin: 50px auto;
            width: 80%;
            max-width: 1000px;
        }

        .review {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 25px;
            margin-bottom: 25px;
        }

        .nickname {
            font-size: 20px;
            font-weight: bold;
            color: #333;
        }

        .stars {
            margin-top: 10px;
        }

        .star {
            color: #ffcc00;
            font-size: 22px;
        }

        .star2 {
            color: #BDBDBD;
            font-size: 22px;
        }

        .content {
            font-size: 16px;
            color: #666;
            margin-top: 15px;
            text-align: left;
        }

        .photo-container {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
            margin-top: 10px;
        }

        .photo-container img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 8px;
        }

        .like-button {
            background-color: #9f8c75; /* 뮤트한 연갈색 */
            color: white;
            border: none;
            padding: 12px 25px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            margin-top: 10px;
            transition: background-color 0.3s;
        }

        .like-button:hover {
            background-color: #8b7a5a; /* 버튼 호버 시 색상 */
        }

        .like-count {
            margin-left: 10px;
            font-size: 16px;
            color: #555;
        }
    </style>
</head>
<body>

<!-- 가게 이름과 이미지 항상 위에 위치 -->
<div class="shop-detail">
    <div class="main-img">
        <img alt="" src="image/${shop.main_image}" width="300" height="300">
    </div>
    <div class="shop-name">${shop.shop_name}</div>
    <div class="shop-intro">${shop.shop_content}</div>
    <div class="sub-imgs">
        <c:forEach items="${shop.sub_image}" var="sub">
            <div class="sub-img">
                <img alt="" src="image/${sub}" width="150" height="150">
            </div>
        </c:forEach>
    </div>
</div>

<!-- 탭 메뉴 -->
<div class="tab-menu">
    <button id="tab1" class="tab-button active" onclick="openTab(1)">가게정보</button>
    <button id="tab2" class="tab-button" onclick="openTab(2)">메뉴</button>
    <button id="tab3" class="tab-button" onclick="openTab(3)">리뷰</button>
</div>

<!-- 탭 내용 -->
<!-- 가게정보 -->
<div id="content1" class="tab-content active">
    <div class="info">Information</div>
    <div class="info-content">
        <div style="display: flex; width: 1150px;">${shop.shop_name}</div>
        <div style="display: flex; width: 1150px;">
            <div style="width:250px">주소</div>
            <div style="font-size:20px">${shop.shop_addr}</div>
        </div>
        <div style="display: flex; width: 1150px;">
            <div style="width:250px">TEL</div>
            <div style="font-size:20px">${shop.shop_tel}</div>
        </div>
        <div style="display: flex; width: 1150px;">
            <div style="width:250px">영업시간</div>
            <div style="font-size:20px">${shop.shop_opentime}</div>
        </div>
    </div>
    <div>
        <button>예약하기</button>
    </div>
</div>

<!-- 메뉴 -->
<div id="content2" class="tab-content">
    <c:forEach var="menu" items="${menus}">
        <div class="menu-one">
            <div class="menu-nameprice">
                <div class="menu-name">${menu.menu_name}</div>
                <div>${menu.menu_price}</div>
            </div>
            <div class="menu-type">${menu.menu_type}</div>
        </div>
    </c:forEach>
</div>

<!-- 리뷰 -->
<div id="content3" class="tab-content review-section">
    <c:forEach var="reviews" items="${review}">
        <div class="review">
            <div class="nickname">${reviews.review_nickname}</div>
            <c:forEach var="i" begin="1" end="${reviews.review_star}">
                <span class="star">★</span> <!-- 별을 채운 부분 -->
            </c:forEach>
            <c:forEach var="i" begin="${reviews.review_star + 1}" end="5">
                <span class="star2">★</span> <!-- 빈 별 부분 -->
            </c:forEach>
                <%--<div class="stars">
                    <span class="star">&#9733;</span>
                    <span class="star">&#9733;</span>
                    <span class="star">&#9733;</span>
                    <span class="star">&#9733;</span>
                    <span class="star">&#9733;</span>
                </div>--%>
            <div class="content">${reviews.review_content}</div>
            <div class="photo-container">
                <img src="image/${reviews.review_image}" alt="review photo 3">
            </div>
            <button class="like-button" onclick="increaseLikeCount(this)">좋아요</button>
            <span class="like-count">0</span>
        </div>
    </c:forEach>
</div>

<script>
    function openTab(tabNumber) {
        var contents = document.querySelectorAll('.tab-content');
        contents.forEach(function (content) {
            content.classList.remove('active');
        });

        var buttons = document.querySelectorAll('.tab-button');
        buttons.forEach(function (button) {
            button.classList.remove('active');
        });

        document.getElementById('content' + tabNumber).classList.add('active');
        document.getElementById('tab' + tabNumber).classList.add('active');
    }

    function increaseLikeCount(button) {
        var likeCountSpan = button.nextElementSibling;
        var currentCount = parseInt(likeCountSpan.textContent);
        likeCountSpan.textContent = currentCount + 1;
    }
</script>

</body>
</html>
