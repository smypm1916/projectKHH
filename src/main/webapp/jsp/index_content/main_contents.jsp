<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%--with gpt--%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Map and Shop Lists</title>
    <link rel="stylesheet" type="text/css" href="../../css/index_ver.0.4.css">

    <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <style>
        .content-wrapper {
            display: flex;
            flex-direction: row;
        }

        .hokkaido-map {
            position: relative;
            flex: 1;
            border: 1px solid black;
            height: auto; /* 고정 높이 제거 */
            width: 100%; /* 부모 컨테이너의 크기에 맞춤 */
            aspect-ratio: 4 / 3; /* 지도 이미지의 비율 유지 */
            max-width: 960px; /* 최대 너비 제한 */
            margin: auto; /* 가운데 정렬 */
        }

        .hokkaido-map img {
            width: 100%;
            height: 100%;
            object-fit: contain; /* 이미지를 컨테이너에 맞게 조정 */
        }

        .map-pointer {
            position: absolute;
            width: 20px;
            height: 20px;
            background-color: red;
            border: 2px solid white;
            border-radius: 50%;
            cursor: pointer;
            transform: translate(-50%, -50%);
            transition: transform 0.2s ease, background-color 0.2s ease;
        }

        .map-pointer:hover {
            background-color: blue;
            transform: translate(-50%, -50%) scale(1.2);
        }

        .shop-list {
            border: 1px solid black;
            background-color: #F5DEB3;
            overflow-y: scroll;
            max-height: 100%;
            align-items: center;
            transition: width 1s ease;
        }

        .reduced {
            flex: 0.4 !important;
        }

        .visible {
            flex: 0.6 !important;
            transition: width 0.8s ease;
        }
    </style>

</head>

<body>
<h1>맛집 찾아보기</h1>

<div class="main-body">

    <div class="content-wrapper" style="display: flex; flex-direction: row;">

        <%--        지도 --%>
        <div class="hokkaido-map" id="hokkaido-map"
             style="flex: 1; border: 1px solid black; height: 720px; width: 960px;">
            <img src="../../image/hokkaido.png" alt="Hokkaido Map" style="height:auto; width: 100%;">
            <!-- 포인터 추가 -->
            <div class="map-pointer" data-region="도호쿠" style="top: 33%; left: 48%;"></div>
            <div class="map-pointer" data-region="도토" style="top: 50%; left: 62%;"></div>
            <div class="map-pointer" data-region="도오" style="top: 62%; left: 39%;"></div>
            <div class="map-pointer" data-region="도난" style="top: 88%; left: 24%;"></div>
        </div>

        <div class="shop-list" id="shop-list"
             style="background-color: #F5DEB3; overflow-y: scroll; max-height: 100%; align-items: center;">
            <h1>식당 일람</h1>
            <c:forEach var="sl" items="${simpleList}">
                <div class="simpleList"
                     style="border-top: 1px solid black; border-bottom: 1px solid black; background-color: floralwhite;"
                     onclick="location.href='ShopAddrTypeC?no=${sl}';">
                    <ul style="list-style: none">
                        <li style="display: none;"><span>${sl.shop_no}</span></li>
                        <li style="list-style: none;"><a
                                style="font-size: 20pt; font-weight: bold;"
                                href='ShopDetailC?no=${sl.shop_no}'>${sl.shop_name}</a><br></li>
                        <li style="list-style: none;"><span>${sl.shop_tel}</span></li>
                        <li style="list-style: none;"><span>${sl.shop_opentime}</span></li>
                    </ul>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<script src="../../js/default.js"></script>
</body>
</html>


