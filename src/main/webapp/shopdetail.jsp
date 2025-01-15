<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>가게 정보와 리뷰</title>
    <style>
        /* div {
            border: 1px solid;
        }
 */
        .tab-menu {
            display: flex;
            justify-content: center;
            background-color: #333;
            padding: 10px 0;
        }

        .tab-menu button {
            background-color: #333;
            color: white;
            padding: 10px 20px;
            border: none;
            font-size: 16px;
            cursor: pointer;
        }

        .tab-menu button:hover {
            background-color: #575757;
        }

        .tab-menu button.active {
            background-color: #4CAF50; /* 클릭된 탭에 대한 색 */
        }

        /* 탭 내용 */
        .tab-content {
            display: none;
            padding: 20px;
            background-color: white;
            border-top: 2px solid #ddd;
        }

        .tab-content.active {
            display: block;
        }

        .shop-detail {
            margin: 20px;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 70%; /* 너비를 70%로 설정 */
            max-width: 1000px; /* 최대 너비를 1000px로 제한 (원하는 값으로 설정 가능) */
            margin-left: auto;
            margin-right: auto;
        }

        /* Center the main image */
        .main-img {
            display: flex;
            justify-content: center; /* Horizontal center */
            align-items: center; /* Vertical center */
            height: 300px;
            margin-bottom: 20px;
        }

        .main-img img {
            width: 300px;
            height: 300px;
            object-fit: cover;
            border-radius: 8px;
        }

        /* Center the sub-images */
        .sub-imgs {
            display: flex;
            justify-content: center;
            gap: 10px;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }

        .sub-img {
            display: flex;
            justify-content: center; /* Center image inside sub-img */
            align-items: center; /* Vertical center inside each sub-img */
            margin-right: 5px;
        }

        .sub-img img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 8px;
        }

        .shop-name {
            font-size: 30pt;
            font-weight: bold;
            color: #333;
            text-align: center;
            margin-bottom: 10px;
        }

        .shop-intro {
            font-size: 15pt;
            color: #555;
            text-align: center;
            margin-bottom: 20px;
        }

        .info {
            font-size: 20pt;
            font-weight: bold;
            color: gray;
            text-align: center;
            margin-bottom: 10px;
        }

        /* 정보 내용 스타일 */
        .shop-detail div {
            margin: 5px 0;
            font-size: 17pt;
            text-align: center;
        }

.menu-one {
    width: 700px; /* 원하는 너비로 설정 */
    margin: 20px auto; /* 위 아래 여백 20px, 좌우 자동으로 중앙 정렬 */
    border-bottom: dotted 1px;
}

.menu-nameprice {
    display: flex;
    justify-content: space-between; /* 두 요소를 양쪽 끝에 배치 */
    align-items: center; /* 세로 중앙 정렬 */
    border-bottom: solid 1px;
}

        .footer {
            height: 200px;
            text-align: center;
            background-color: #f1f1f1;
            padding-top: 80px;
            font-size: 14px;
            color: #777;
        }

        /* 리뷰 섹션 스타일 */
        .review-section {
            margin: 50px auto;
            width: 80%;
            max-width: 800px;
        }

        .review {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
        }

        .nickname {
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }

        .stars {
            margin-top: 5px;
        }

        .star {
            color: #ffcc00;
            font-size: 20px;
        }

        .content {
            font-size: 14px;
            color: #666;
            margin-top: 10px;
        }

        .photo-container {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            margin-top: 10px;
        }

        .photo-container img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 8px;
        }

        .review button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            margin-top: 10px;
        }

        .review button:hover {
            background-color: #45a049;
        }

        .like-button {
            background-color: #ffcc00;
            color: white;
            border: none;
            padding: 8px 15px;
            font-size: 14px;
            cursor: pointer;
            border-radius: 5px;
        }

        .like-button:hover {
            background-color: #e6b800;
        }

        .like-count {
            margin-left: 10px;
            font-size: 14px;
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

    <div class="header">
        header
    </div>
    <div class="nav">
        nav
    </div>
    <div class="content">

        <!-- 가게정보 -->
        <div id="content1" class="tab-content active shop-detail">
            <div class="main-img">
                <img alt="" src="https://tabiiro.jp/lpimg/gourmet/303483/main/img4.jpg" width="300" height="300">
            </div>
            <div style="display: flex;" class="sub-imgs">
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
            <div class="shop-name">北海道しべちゃ 星空の黒牛 加工・直売所(가게명)</div>
            <div class="shop-intro">摩周湖の清らかな水を湛える広大な牧場。ここで誕生したのが、上質な黒毛和牛と体が大きなホルスタイン種を掛け合わせた「星空の黒牛」。ジューシーで歯ごたえのある赤身、豊かなコクを持つ脂身のハーモニーが格別。</div>
            <div class="info">Information</div>
            <div>北海道しべちゃ 星空の黒牛 加工・直売所(가게명)</div>
            <div>
                <div>주소</div>
                <div>北海道川上郡標茶町多和466-1</div>
            </div>
            <div>
                <div>TEL</div>
                <div>0154-85-0010</div>
            </div>
            <div>
                <div>영업시간</div>
                <div>10:00～15:00（お肉の受け渡しは18:00まで）</div>
            </div>
            <div><button>예약하기</button></div>
        </div>

        <!-- 메뉴 -->
        <div id="content2" class="tab-content menu">
            <div class="menu-one">
                <div class="menu-nameprice">
                    <div class="menu-name">サーロイン(100g)</div>
                    <div>900円</div>
                </div>
                <div>（ステーキ・すき焼き・しゃぶしゃぶ・ブロック）<br><br></div>
            </div>
            <div class="menu-one">
                <div class="menu-nameprice">
                    <div class="menu-name">リブロース(100g)</div>
                    <div>850円</div>
                </div>
                <div>（ステーキ・すき焼き・しゃぶしゃぶ・ブロック）<br><br></div>
            </div>
            <div class="menu-one">
                <div class="menu-nameprice">
                    <div class="menu-name">ヒレ(100g)</div>
                    <div>1200円</div>
                </div>
                <div>（ステーキ・すき焼き・しゃぶしゃぶ・ブロック）<br><br></div>
            </div>
        </div>

        <!-- 리뷰 -->
        <div id="content3" class="tab-content review-section">
            <div class="review">
                <div class="nickname">홍길동</div>
                <div class="stars">
                    <span class="star">&#9733;</span>
                    <span class="star">&#9733;</span>
                    <span class="star">&#9733;</span>
                    <span class="star">&#9733;</span>
                    <span class="star">&#9733;</span>
                </div>
                <div class="content">
                    이 가게의 고기는 정말 맛있고 신선합니다. 또 방문하고 싶어요! 직원들도 친절하고, 분위기도 좋았어요.
                </div>
                <!-- 여러 사진 -->
                <div class="photo-container">
                    <img src="https://via.placeholder.com/150x150" alt="review photo 1">
                    <img src="https://via.placeholder.com/150x150" alt="review photo 2">
                    <img src="https://via.placeholder.com/150x150" alt="review photo 3">
                </div>
                <button class="like-button" onclick="increaseLikeCount(this)">좋아요</button>
                <span class="like-count">0</span>
            </div>

            <div class="review">
                <div class="nickname">김철수</div>
                <div class="stars">
                    <span class="star">&#9733;</span>
                    <span class="star">&#9733;</span>
                    <span class="star">&#9733;</span>
                    <span class="star">&#9733;</span>
                    <span class="star">&#9734;</span>
                </div>
                <div class="content">
                    고기의 질감이 좋고 맛도 괜찮았어요. 다만, 가격이 조금 비쌌던 점이 아쉽습니다.
                </div>
                <!-- 여러 사진 -->
                <div class="photo-container">
                    <img src="https://tblg.k-img.com/restaurant/images/Rvw/269064/150x150_square_8a332cde77a1fa37892b49d564ba1f3d.jpg" alt="review photo 1">
                    <img src="https://tblg.k-img.com/restaurant/images/Rvw/269064/150x150_square_8a332cde77a1fa37892b49d564ba1f3d.jpg" alt="review photo 2">
                    <img src="https://tblg.k-img.com/restaurant/images/Rvw/269064/150x150_square_85cf2f431ac3c607d795b90bd762df68.jpg" alt="review photo 3">
                </div>
                <button class="like-button" onclick="increaseLikeCount(this)">좋아요</button>
                <span class="like-count">0</span>
            </div>
        </div>

    </div>

    <div class="footer">
        footer
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
