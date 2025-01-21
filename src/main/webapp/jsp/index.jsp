<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>急に腹が減ってきた〜</title>
    <link rel="stylesheet" type="text/css" href="../css/index_ver.0.4.css?v=1.0">

    <%--    <link rel="stylesheet" type="text/css" href="<c:url value='/css/index.css' />">--%>
</head>

<body>

<%--메인페이지--%>
<div class="main-body">

    <%--    헤더--%>
    <header class="header">
        <div class="title">
            <h1><a href="/HomeC">KHH</a></h1>
        </div>
    </header>
    <%--        내비게이션바--%>
    <div class="global-nav">
        <ul class="nav-content">
            <li><a href=""> icon </a></li>
            <li class="no-action"><a href=""> | </a></li>
            <li><a href=""> 가게정보 </a></li>
            <li class="no-action"><a href=""> | </a></li>
            <li><a href=""> 커뮤니티 </a></li>
            <li class="no-action"><a href=""> | </a></li>
            <li><a href=""> 마이페이지 </a></li>
            <li class="no-action"><a href=""> | </a></li>
            <li>
                <button onclick="location.href=''"> 로그인</button>
            </li>
            <li class="no-action"><a href=""> | </a></li>
            <li>
                <button onclick="location.href='/jsp/signup/choose_userType.jsp'">회원가입</button>
            </li>
        </ul>
    </div>


    <%--    메인 콘텐츠--%>
    <section class="content" style="border: darksalmon 1px solid; border-radius: 10px;">

        <%--        지도 & 가게 페이지--%>
        <div style="position: relative">
            <br>
            <jsp:include page="${content}"/>
        </div>

        <%--공지사항--%>
        <div class="announcement">
            <h2>공지사항</h2>
            <ul>
                공지 리스트...
            </ul>
        </div>

        <%--        슬라이드1--%>
        <div class="slide1 container" style="border: darksalmon 1px solid; border-radius: 10px">
            <div class="slide1 content">
                <%--                店のランキング（仮）--%>
                <p>추천 가게</p>
            </div>
        </div>

        <%--        슬라이드2--%>
        <div class="slide2 container" style="border: darksalmon 1px solid; border-radius: 10px">
            <div class="slide2 content">
                <%--                広告のランキング（仮）--%>
                <p>좋아요 랭킹</p>
            </div>
        </div>

        <div class="fixed-nav"
             style="position: fixed; bottom: 30px; right: 30px; display: flex; flex-direction: row-reverse; align-items: center;">
            <div class="btn-page-top" style="display: block;"></div>
            <span style="width: 50px; height: 50px;
                         display: flex;
                         justify-content: center;
                         align-items: center;
                         background-color: #F5DEB3;
                         border-radius: 50%;
                         cursor: pointer;
                         box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                         font-size: 14px;
                         font-weight: bold;"
                  onclick="window.scrollTo(0,0);">맨 위로</span>
        </div>

        <%--        <div class="fixed-nav" style="position: fixed; bottom: 20px; right: 20px;">--%>
        <%--            <!-- SVG를 사용하여 텍스트를 원 경로에 따라 배치 -->--%>
        <%--            <svg width="100" height="100" style="transform-origin: center; animation: rotate 5s linear infinite;">--%>
        <%--                <circle id="circlePath" cx="50" cy="50" r="40" fill="none" stroke="transparent"></circle>--%>
        <%--                <text>--%>
        <%--                    <textPath href="#circlePath" startOffset="0%" text-anchor="start" fill="black">--%>
        <%--                        맨위로--%>
        <%--                    </textPath>--%>
        <%--                </text>--%>
        <%--            </svg>--%>

        <%--            <!-- 클릭 가능한 버튼 -->--%>
        <%--            <span style="position: absolute; width: 50px; height: 50px; top: 25px; left: 25px;--%>
        <%--                 background-color: #F5DEB3; border-radius: 50%;--%>
        <%--                 display: flex; justify-content: center; align-items: center;--%>
        <%--                 box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); cursor: pointer;"--%>
        <%--                  onclick="window.scrollTo(0,0);">--%>
        <%--        ⬆--%>
        <%--    </span>--%>
        <%--            <style>--%>
        <%--                @keyframes rotate {--%>
        <%--                    from {--%>
        <%--                        transform: rotate(0deg);--%>
        <%--                    }--%>
        <%--                    to {--%>
        <%--                        transform: rotate(360deg);--%>
        <%--                    }--%>
        <%--                }--%>
        <%--            </style>--%>

        <%--        </div>--%>


    </section>

    <%--        푸터--%>
    <div class="footer">
        <h2>footer</h2>
    </div>
</div>

<script>

</script>

</body>
</html>