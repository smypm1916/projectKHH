<%--
  Created by IntelliJ IDEA.
  User: MiNN
  Date: 2025-01-22(수)
  Time: 오전 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title> 가게정보 | KHH </title>

    <c:set var="now" value="<%=new java.util.Date()%>" />

</head>
<body>

    <p> ${resList} </p>

    <form action="AddRestaurantReviewC">
        <div>
            <div>
                <div> <label for="restaurant_name"> 가게 이름 </label>
                    <input id="restaurant_name" name="restaurant_name">
                </div>
                <div> <label for="review_content"> 후기 내용 </label>
                    <input id="review_content" name="review_content">
                </div>
                <div> <label for="review_date"> 작성 날짜 </label>
                    <span id="review_date"> <fmt:formatDate value="${now}" pattern="yyyy-MM-dd hh:mm:ss" /> </span>
                </div>
                <div> <label for="review_nickname"> 작성자 </label>
                    <input id="review_nickname" name="review_nickname">
                </div>
                <div> <label for="review_star"> 별점 </label>
                    <div id="review_star">
                    1 <input name="review_star" type="radio" value="1">
                    <input name="review_star" type="radio" value="2">
                    <input name="review_star" type="radio" value="3">
                    <input name="review_star" type="radio" value="4">
                    <input aria-selected="true" name="review_star" type="radio" value="5"> 5
                    </div>
                </div>
                <div> <label for="review_image"> 이미지 </label>
                    <input id="review_image" name="review_image" type="file" multiple accept=".jpg,.jpeg,.png,.gif,.webp">
                </div>
                <div> <button> 등록 </button> </div>
            </div>

        </div>
    </form>

</body>
</html>
