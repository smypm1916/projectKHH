<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%--<!DOCTYPE html>--%>
<%--<html lang="ko">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>회원가입</title>--%>
<%--    <link rel="stylesheet" type="text/css" href="../../css/index.css"/>--%>
<%--    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>--%>
<%--</head>--%>

<%--<body>--%>
<%--<header class="header">--%>
<%--    <div class="header-container">--%>
<%--        <h1><a href="/HomeC">急に腹が減ってきた〜KHH~</a></h1>--%>
<%--    </div>--%>
<%--</header>--%>

<%--<div class="main-body">--%>
<%--    <!-- 회원가입 단계 표시 -->--%>
<%--    <section class="signup-flow">--%>
<%--        <ul class="signup-steps">--%>
<%--            <li class="active">--%>
<%--                <span class="signup-step-no">1</span>--%>
<%--                <p class="signup-step-title">정보 입력</p>--%>
<%--            </li>--%>
<%--            <li>--%>
<%--                <span class="signup-step-no">2</span>--%>
<%--                <p class="signup-step-title">입력 정보 확인</p>--%>
<%--            </li>--%>
<%--            <li>--%>
<%--                <span class="signup-step-no">3</span>--%>
<%--                <p class="signup-step-title">등록 완료</p>--%>
<%--            </li>--%>
<%--        </ul>--%>
<%--    </section>--%>

<%--    <!-- 회원가입 폼 -->--%>
<%--    <section class="signup-form">--%>
<%--        <h2>회원가입</h2>--%>
<%--        <p>필요한 정보를 입력 후 버튼을 눌러주세요.</p>--%>
<%--        <form action="SignUpC" method="post">--%>
<%--            <!-- 이름 -->--%>
<%--            <div class="form-group">--%>
<%--                <label for="name"><b>이름</b></label>--%>
<%--                <input type="text" id="name" name="name" placeholder="이름" required>--%>
<%--            </div>--%>

<%--            <!-- 이메일 -->--%>
<%--            <div class="form-group">--%>
<%--                <label for="email-domain"><b>이메일</b></label>--%>
<%--                <input type="text" id="email-domain" name="email-domain" placeholder="example" required>--%>
<%--                <span>@</span>--%>
<%--                <select name="email-service" id="email-service" required>--%>
<%--                    <option value="naver.com">naver.com</option>--%>
<%--                    <option value="google.com">google.com</option>--%>
<%--                    <option value="daum.net">daum.net</option>--%>
<%--                    <option value="hotmail.com">hotmail.com</option>--%>
<%--                    <option value="hanmail.net">hanmail.net</option>--%>
<%--                </select>--%>
<%--            </div>--%>

<%--            <!-- 닉네임 -->--%>
<%--            <div class="form-group">--%>
<%--                <label for="nickname"><b>닉네임</b></label>--%>
<%--                <input type="text" id="nickname" name="nickname" placeholder="닉네임" required>--%>
<%--                <button type="button">중복체크</button>--%>
<%--            </div>--%>

<%--            <!-- 전화번호 -->--%>
<%--            <div class="form-group">--%>
<%--                <label for="tel"><b>전화번호</b></label>--%>
<%--                <input type="tel" id="tel" name="tel" placeholder="휴대폰 번호" required>--%>
<%--            </div>--%>

<%--            <!-- 성별 -->--%>
<%--            <div class="form-group">--%>
<%--                <label><b>성별</b></label>--%>
<%--                <div class="radio-group">--%>
<%--                    <input type="radio" id="gender1" name="gender" value="male" checked>--%>
<%--                    <label for="gender1">남성</label>--%>
<%--                    <input type="radio" id="gender2" name="gender" value="female">--%>
<%--                    <label for="gender2">여성</label>--%>
<%--                    <input type="radio" id="gender3" name="gender" value="other">--%>
<%--                    <label for="gender3">무응답</label>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <!-- 생년월일 -->--%>
<%--            <div class="form-group">--%>
<%--                <label><b>생년월일</b></label>--%>
<%--                <div class="birth-group">--%>
<%--                    <select name="birth-year" id="birth-year" required>--%>
<%--                        <option value="">--</option>--%>
<%--                        <!-- 년도 옵션 추가 -->--%>
<%--                    </select>--%>
<%--                    <label>년</label>--%>
<%--                    <select name="birth-month" id="birth-month" required>--%>
<%--                        <option value="">--</option>--%>
<%--                        <!-- 월 옵션 추가 -->--%>
<%--                    </select>--%>
<%--                    <label>월</label>--%>
<%--                    <select name="birth-day" id="birth-day" required>--%>
<%--                        <option value="">--</option>--%>
<%--                        <!-- 일 옵션 추가 -->--%>
<%--                    </select>--%>
<%--                    <label>일</label>--%>
<%--                </div>--%>
<%--                <p>※ 한번 입력하면 수정할 수 없습니다.</p>--%>
<%--            </div>--%>

<%--            <!-- 주소 -->--%>
<%--            <div class="form-group">--%>
<%--                <label for="address"><b>주소</b></label>--%>
<%--                <input type="text" id="address" name="address" readonly>--%>
<%--                <button type="button" onclick="openPostalCode()">주소 찾기</button>--%>
<%--            </div>--%>
<%--            <div class="form-group">--%>
<%--                <label for="address-detail"><b>상세 주소</b></label>--%>
<%--                <input type="text" id="address-detail" name="address-detail">--%>
<%--            </div>--%>

<%--            <!-- 비밀번호 -->--%>
<%--            <div class="form-group">--%>
<%--                <label for="password"><b>비밀번호</b></label>--%>
<%--                <input type="password" id="password" name="password" placeholder="영문+숫자 8~16자 이내" required>--%>
<%--                <label for="password-check"><b>비밀번호 확인</b></label>--%>
<%--                <input type="password" id="password-check" name="password-check" placeholder="비밀번호 확인" required>--%>
<%--            </div>--%>

<%--            <!-- 버튼 -->--%>
<%--            <div class="btn-wrapper">--%>
<%--                <button type="submit">입력 확인</button>--%>
<%--                <a href="/HomeC" class="btn-back">돌아가기</a>--%>
<%--            </div>--%>
<%--        </form>--%>
<%--    </section>--%>
<%--</div>--%>

<%--<script src="../../js/signup.js"></script>--%>
<%--</body>--%>
<%--</html>--%>


<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>

    <link rel="stylesheet" type="text/css" href="../../css/index.css"/>

    <!-- Daum Postalcode API -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>

<body>

<header class="header">
    <h1 style="display: flex; justify-content: center">
        <a href="/HomeC">急に腹が減ってきた〜KHH~</a>
    </h1>
</header>

<h1>회원가입</h1>

<div class="main-body">
    <%--    이메일, 닉네임 중복체크--%>

    <div class="signup-flow" style="display: flex; justify-content: center;">
        <ul>
            <div class="signup-flow-no">1</div>
            <p class="signup-flow-title">정보 입력</p>
        </ul>
        <ul>
            <div class="signup-flow-no">2</div>
            <p class="signup-flow-title">입력 정보 확인</p>
        </ul>
        <ul>
            <div class="signup-flow-no">3</div>
            <p class="signup-flow-title">등록 완료</p>
        </ul>
    </div>

    <div class="signup-form" style="background-color:white; width: 70%; margin: auto; height:100%">


        <p>필요한 정보 입력 후에 다음 버튼을 입력해주세요.</p>

        <form action="SignUpC" method="post">

            <!-- 회원 유형 선택 -->
            <div class="form-group">

            </div>

            <div>
                <br>
                <label for="name"><b>이름</b></label>
                <input type="text" id="name" name="name" placeholder="이름" required>
            </div>

            <div>
                <br>
                <label for="email-domail"><b>이메일</b></label>
                <input type="text" id="email-domail" name="email-domain" placeholder="example" required>
                &nbsp;<span>@</span>&nbsp;
                <label for="email-service"></label>
                <select name="email-service" id="email-service" required>
                    <option value="naver.com">naver.com</option>
                    <option value="google.com">google.com</option>
                    <option value="daum.net">daum.net</option>
                    <option value="hotmail.com">hotmail.com</option>
                    <option value="hanmail.net">hanmail.net</option>
                </select>
                <%--                @이후 select--%>
            </div>

            <div>
                <br>
                <label for="nickname"><b>닉네임</b></label>
                <input type="text" id="nickname" name="nickname" placeholder="닉네임" required>
                <button onclick="">
                    중복체크
                </button>
                <span class="validCheck-message" style="display: none">s
                </span>
            </div>

            <div>
                <br>
                <label for="tel"><b>전화번호</b></label>
                <input type="text" id="tel" name="tel" placeholder="휴대폰 번호" required>

            </div>

            <div>
                <br>
                <input type="radio" id="gender1" name="gender" value="m" checked="checked" required="required"/>
                <label for="gender1"><b>남성</b></label>
                <input type="radio" id="gender2" name=gender value="f" required>
                <label for="gender2"><b>여성</b></label>
<%--                <input type="radio" id="gender3" name="gender" value="other" required>--%>
<%--                <label for="gender3"><b>무응답</b></label>--%>
            </div>

            <div>
                <br>
                <span><b>생년월일</b></span>
                <div>
                    <select name="birth-year" id="birth-year" required>
                        <option value="">-- --</option>
                    </select>
                    <label for="birth-year">년</label>&nbsp;
                    <select name="birth-month" id="birth-month" required>
                        <option value="">-- --</option>
                    </select>
                    <label for="birth-month">월</label>&nbsp;
                    <select name="birth-day" id="birth-day" required>
                        <option value="">-- --</option>
                    </select>
                    <label for="birth-day">일</label>&nbsp;
                    <p>*** 한번 입력하면 수정할 수 없습니다. ***</p>
                </div>
            </div>

            <div>
                <br>
                <label for="address"><b>주소</b></label>
                <input type="text" id="address" name="address" disabled required>
                <button onclick="openPostalCode()">
                    주소 찾기
                </button>
            </div>
            <div>
                <label for="address-detail"><b>상세 주소</b></label>
                <input type="text" id="address-detail" name="address-detail">
            </div>

            <div>
                <br>
                <label for="password"><b>비밀번호</b></label>
                <input type="text" id="password" name="password" placeholder="영문+숫자 8~16자 이내" required>
                <br><br>
                <label for="passwordCheck"><b>비밀번호 확인</b></label>
                <input type="text" id="passwordCheck" name="passwordCheck" placeholder="한번 더 입력해주세요" required>
            </div>

            <br>

            <div style="display: flex; justify-content: center;" class="btn-wrapper"
                 style="text-align: center; display: flex; flex-direction: row; justify-content: space-between; width: 100%; max-width: 520px; margin: 50px auto 0;">
                <br>
                <button type="submit"
                        style="border-radius: 20%; width:50px; height: 20px; display: flex; flex-wrap: wrap; flex-direction: row"
                        class="util-btn"
                        name="submit" onclick="location.href='signup_check.jsp'">입력 확인
                    <br>
                    <a href="HomeC" class="util-btn">돌아가기</a>
                </button>
            </div>
        </form>
    </div>
</div>
<script src="../../js/signup.js"></script>
</body>
</html>
