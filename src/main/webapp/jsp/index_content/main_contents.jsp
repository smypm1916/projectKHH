<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%--with gpt--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Map and Shop Lists</title>
    <link rel="stylesheet" type="text/css" href="../../css/index_ver.0.4.css?v=1.0">

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
<h1>맛집 찾아보기</h1>

<div class="main-body">

    <div class="content-wrapper" style="display: flex; flex-direction: row;">

        <%--        지도 --%>
        <div class="hokkaido-map" id="hokkaido-map" style="flex: 1; border: 1px solid black;">
            <img src="../../image/hokkaido.png" alt="Hokkaido Map">
        </div>

        <div class="shop-list" id="shop-list">
            <p>Restaurant Lists</p>
            <ul class="shop-items" id="shop-items"></ul>
            <%--            간이 가게 리스트 출력--%>
            <c:forEach var="sl" items="${simpleList}">
                <div class="simpleList" onclick="location.href='ShopDetailC?no=${sl}';">
                    <ul>
                        <li style="display: none"><span>${sl.shop_no}</span></li>
                        <li><span>${sl.shop_name}</span><br></li>
                        <li><span>${sl.shop_tel}</span></li>
                        <li><span>${sl.shop_opentime}</span></li>
                    </ul>
                </div>
                <%--                <li>${simpleList.shop_addrtype}</li> --%>
                <%--                연관 지역 가게리스트만 출현하니 필요없을듯--%>
            </c:forEach>

        </div>
    </div>
</div>
<script src="../../js/default.js"></script>
</body>
</html>


