<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            background-color: #333;
            padding: 15px 0;
        }

        .tab-menu button {
            background-color: #333;
            color: white;
            padding: 12px 30px;
            border: none;
            font-size: 18px;
            cursor: pointer;
            border-radius: 5px;
            margin: 0 10px;
            transition: background-color 0.3s ease;
        }

        .tab-menu button:hover {
            background-color: #575757;
        }

        .tab-menu button.active {
            background-color: #4CAF50; /* 클릭된 탭 색상 */
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
            color: #333;
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
            font-size: 18px;
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
            background-color: #4CAF50;
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
            background-color: #45a049;
        }

        .like-count {
            margin-left: 10px;
            font-size: 16px;
            color: #555;
        }
    </style>
</head>
<body>

<div class="tab-menu">
    <button id="tab1" class="tab-button active" onclick="openTab(1)">가게정보</button>
    <button id="tab2" class="tab-button" onclick="openTab(2)">메뉴</button>
    <button id="tab3" class="tab-button" onclick="openTab(3)">리뷰</button>
</div>

<!-- 가게정보 -->
<div id="content1" class="tab-content active shop-detail">
    <div class="main-img">
        <img alt="" src="https://tabiiro.jp/lpimg/gourmet/303483/main/img4.jpg" width="300" height="300">
    </div>
    <div class="sub-imgs">
        <div class="sub-img">
            <img alt="" src="https://tabiiro.jp/lpimg/gourmet/303483/main/img4.jpg" width="150" height="150">
        </div>
        <div class="sub-img">
            <img alt="" src="https://tabiiro.jp/lpimg/gourmet/303483/main/img4.jpg" width="150" height="150">
        </div>
        <div class="sub-img">
            <img alt="" src="https://tabiiro.jp/lpimg/gourmet/303483/main/img4.jpg" width="150" height="150">
        </div>
    </div>
    <div class="shop-name">${shop.shop_name}</div>
    <div class="shop-intro">${shop.shop_content}</div>
    <div class="info">Information</div>
    <div>${shop.shop_name}</div>
    <div>
        <div>주소</div>
        <div>${shop.shop_addr}</div>
    </div>
    <div>
        <div>TEL</div>
        <div>${shop.shop_tel}</div>
    </div>
    <div>
        <div>영업시간</div>
        <div>${shop.shop_opentime}</div>
    </div>
    <div><button>예약하기</button></div>
</div>
<div id="content2" class="tab-content menu">
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
<div id="content3" class="tab-content review-section">
<c:forEach var="review" items="${reviews}">

        <div class="review">
            <div class="nickname">${review.review_nickname}</div>
            <div class="stars">
                <span class="star">&#9733;</span>
                <span class="star">&#9733;</span>
                <span class="star">&#9733;</span>
                <span class="star">&#9733;</span>
                <span class="star">&#9733;</span>
            </div>
            <div class="content">${review.review_content}</div>
            <div class="photo-container">
                <img src="https://via.placeholder.com/150x150" alt="review photo 1">
                <img src="https://via.placeholder.com/150x150" alt="review photo 2">
                <img src="https://via.placeholder.com/150x150" alt="review photo 3">
            </div>
            <button class="like-button" onclick="increaseLikeCount(this)">좋아요</button>
            <span class="like-count">0</span>
        </div>

</c:forEach>
</div>
<script>
    function openTab(tabNumber) {
        var contents = document.querySelectorAll('.tab-content');
        contents.forEach(function(content) {
            content.classList.remove('active');
        });

        var buttons = document.querySelectorAll('.tab-button');
        buttons.forEach(function(button) {
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
