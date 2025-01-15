<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* div{
border : 1px solid;
} */
.header{
height: 100px;
}
.nav{
height: 70px;
}
.content{
margin-top: 100px;
margin-left: 100px;
margin-right: 100px;
height: 1000px;
border: none;
}
/* 스타일 설정 */
        .form-container {
            width: 80%;
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background-color: #f9f9f9;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            font-size: 14px;
            display: block;
            margin-bottom: 5px;
        }

        .form-group input, .form-group textarea {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .form-group input[type="file"] {
            padding: 0;
        }

        .form-group button {
            padding: 10px 15px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        .form-group button:hover {
            background-color: #45a049;
        }

        .menu-container {
            margin-top: 20px;
        }

        .menu-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        .menu-item input {
            width: 45%;
        }

        .menu-item button {
            margin-top: 5px;
        }
.footer{
height: 200px;
}
</style>
</head>
<body>
<div class="container">
<div class="header">
header
</div>
<div class="nav">
nav
</div>
<div class="content">

<div class="form-container">
        <h2>가게 정보 등록</h2>

        <form action="ShopRegC" method="POST" enctype="multipart/form-data">
            
            <!-- 가게 사진 -->
            <div class="form-group">
                <label for="storeImage">가게 사진</label>
                <input type="file" id="storeImage" name="storeImage" accept="image/*" required />
            </div>

            <!-- 가게 이름 -->
            <div class="form-group">
                <label for="storeName">가게 이름</label>
                <input type="text" id="storeName" name="storeName" placeholder="가게 이름을 입력하세요" required />
            </div>

            <!-- 가게 소개문 -->
            <div class="form-group">
                <label for="storeDescription">가게 소개</label>
                <textarea id="storeDescription" name="storeDescription" placeholder="가게에 대해 소개해주세요" rows="4" required></textarea>
            </div>

            <!-- 가게 주소 -->
            <div class="form-group">
                <label for="storeAddress">가게 주소</label>
                <input type="text" id="storeAddress" name="storeAddress" placeholder="가게 주소를 입력하세요" required />
            </div>

            <!-- 가게 전화번호 -->
            <div class="form-group">
                <label for="storePhone">가게 전화번호</label>
                <input type="tel" id="storePhone" name="storePhone" placeholder="가게 전화번호를 입력하세요 (숫자만, 11자리)" 
                       pattern="[0-9]{11}" maxlength="11" oninput="this.value=this.value.replace(/[^0-9]/g,'');" required />
            </div>

            <!-- 가게 영업시간 -->
            <div class="form-group">
                <label for="storeHoursStart">영업 시작 시간</label>
                <input type="time" id="storeHoursStart" name="storeHoursStart" required />
            </div>

            <div class="form-group">
                <label for="storeHoursEnd">영업 종료 시간</label>
                <input type="time" id="storeHoursEnd" name="storeHoursEnd" required />
            </div>

            <!-- 가게 메뉴 입력 -->
            <div class="form-group">
                <label for="storeMenu">가게 메뉴</label>
                <div class="menu-container" id="menuContainer">
                    <div class="menu-item">
                        <input type="text" name="menuName[]" placeholder="메뉴명" required />
                        <input type="number" name="menuPrice[]" placeholder="가격" required />
                    </div>
                </div>
                <button type="button" onclick="addMenuItem()">메뉴 추가</button>
            </div>

            <div class="form-group">
                <button type="submit">가게 등록</button>
            </div>
        </form>
    </div>

    <script>
        function addMenuItem() {
            // 새로운 메뉴 항목 추가
            var menuContainer = document.getElementById('menuContainer');
            var newMenuItem = document.createElement('div');
            newMenuItem.classList.add('menu-item');

            newMenuItem.innerHTML = `
                <input type="text" name="menuName[]" placeholder="메뉴명" required />
                <input type="number" name="menuPrice[]" placeholder="가격" required />
            `;

            menuContainer.appendChild(newMenuItem);
        }
    </script>





</div>
<div class="footer">
footer
</div>
</div>
</body>
</html>