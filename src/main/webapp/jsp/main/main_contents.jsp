<%--
  Created by IntelliJ IDEA.
  User: svyet
  Date: 2025/01/09
  Time: 19:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../../css/index.css">
    <style>
        .reduced {
            flex: 0.5; /* 지도의 크기를 줄임 */
        }

        .visible {
            width: 300px; /* 가게 리스트 영역을 보이게 설정 */
        }
    </style>
</head>

<body>

<h1>map and shop lists!(main page)</h1>
<div class="main-body">
    <p>body</p>
    <div class="content-wrapper" style="display: flex; flex-direction: row; transition: transform 0.5s ease;">
        <span>wrapper</span>
        <div class="hokkaido-map" id="hokkaido-map" style="flex: 1; border: 1px solid black;">
            <img src="../../imgs/map_area_airport2_jp.jpg" alt="">
            <p>map</p>
        </div>
        <div class="shop-list" id="shop-list"
             style="border: 1px solid black; overflow: hidden; width: 0; transition: transform 0.5s ease;">
            <p>restaurant lists</p>
            <ul class="shop-items" id="shop-items">
                <div class="shop-infos">
                    <p>infos</p>
                </div>
            </ul>
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

        // 지도 클릭 이벤트
        map.addEventListener('click', () => {
            // 레이아웃 변경
            map.classList.add('reduced');
            shopList.classList.add('visible');

            // 가게 리스트 표시
            updateStoreList(shop, shopItems);
        });

        // 가게 리스트 업데이트 함수
        function updateStoreList(shop, shopItems) {
            shopItems.innerHTML = ""; // 기존 리스트 초기화
            shop.forEach(store => {
                const listItem = document.createElement('li');
                listItem.textContent = `${store.name} - ${store.address}`;
                shopItems.appendChild(listItem);
            });
        }
    });
</script>
</body>
</html>
