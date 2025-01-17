<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%--with gpt--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Map and Shop Lists</title>
    <link rel="stylesheet" type="text/css" href="../../css/index_ver0.2.css?v=1.0">

    <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <style>
        .reduced {
            flex: 0.4;
        }

        .visible {
            flex: 0.6 !important;
            transition: width 0.8s ease;
        }

        .shop-list {
            border: 1px solid black;
            overflow: hidden;
            width: 0;
            transition: width 0.5s ease;
        }
    </style>
</head>
<body>
<h1>Map and Shop Lists</h1>
<div class="main-body">
    <div class="content-wrapper" style="display: flex; flex-direction: row;">
        <div class="hokkaido-map" id="hokkaido-map" style="flex: 1; border: 1px solid black;">
            <img src="../../image/map_area_airport2_jp.jpg" alt="Hokkaido Map">
        </div>
        <div class="shop-list" id="shop-list">
            <p>Restaurant Lists</p>
            <ul class="shop-items" id="shop-items"></ul>
        </div>
    </div>
</div>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const map = document.getElementById('hokkaido-map');
        const shopList = document.getElementById('shop-list');
        const shopItems = document.getElementById('shop-items');

        // 가게 데이터 예제
        const shop = [
            {name: "가게 1", address: "서울특별시 강남구"},
            {name: "가게 2", address: "서울특별시 종로구"},
            {name: "가게 3", address: "서울특별시 서초구"},
        ];

        // 현재 상태를 저장할 변수
        let isListVisible = false;

        // 지도 클릭 이벤트
        map.addEventListener('click', () => {
            isListVisible = !isListVisible; // 상태를 토글

            if (isListVisible) {
                // 리스트 보이기
                map.classList.add('reduced');
                shopList.classList.add('visible');
                updateStoreList(shop, shopItems);
            } else {
                // 리스트 숨기기
                map.classList.remove('reduced');
                shopList.classList.remove('visible');
                shopItems.innerHTML = ""; // 리스트 초기화
            }
        });

        // 가게 리스트 업데이트 함수
        function updateStoreList(shop, shopItems) {
            shopItems.innerHTML = ""; // 기존 리스트 초기화
            shop.forEach(store => {
                console.log('updateStoreList called with data:', shop); // 데이터 확인
                const listItem = document.createElement('li');
                listItem.textContent = `${shop.name} - ${shop.address}`;
                shopItems.appendChild(listItem);
            });
        }
    });

</script>
</body>
</html>


