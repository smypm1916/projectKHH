<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>

    <link rel="stylesheet" href="../../css/signup/sm_signup3.css">

    <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

</head>

<body>
<header>
    <a href="HomeC"><img alt="" src="../../image/logo_header.png"></a>
</header>

<h1>점주 회원가입</h1>

<div class="main-body">
    <%--    이메일, 닉네임 중복체크--%>

    <div class="signup-flow" style="">
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

        <h1>점주 회원 가입</h1>
        <p>필요한 정보 입력 후에 다음 버튼을 입력해주세요.</p>

        <form action="owner_signUp_check.jsp" method="post">

            <!-- 회원 유형 선택 -->
            <div class="form-group">
                <div class="input-wrapper">
                    <br>
                    <label for="name"><b>이름</b></label>
                    <input type="text" id="name" name="name" placeholder="이름" required>
                </div>

                <div class="input-wrapper">
                    <br>
                    <label for="email-domain"><b>이메일</b></label>
                    <input type="text" id="email-domain" name="email-domain" placeholder="example" required>
                    &nbsp;@&nbsp;
                    <label for="email-service"></label>
                    <select name="email-service" id="email-service" required>
                        <option value="naver.com">naver.com</option>
                        <option value="yahoo.co.jp">yahoo.co.jp</option>
                        <option value="google.com">google.com</option>
                        <option value="daum.net">daum.net</option>
                        <option value="hotmail.com">hotmail.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                    </select>
                    <button type="button" id="email-check-button">중복체크</button>
                    <span id="email-message" class="email-message" style="display: none;"></span>
                </div>

                <div class="input-wrapper">
                    <br>
                    <label for="nickname"><b>닉네임</b></label>
                    <input type="text" id="nickname" name="nickname" placeholder="닉네임" required>
                    <button type="button" id="nickname-check-button">중복체크</button>
                    <span id="nickname-message" class="nickname-message" style="display: none"></span>

                </div>

                <div class="input-wrapper">
                    <br>
                    <label for="tel"><b>전화번호</b></label>
                    <input type="text" id="tel" name="tel" placeholder="휴대폰 번호" required>

                </div>

                <div class="input-wrapper">
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
                    <input type="hidden" id="formatted-birthdate" name="birthdate">
                </div>

                <div class="input-wrapper">
                    <br>
                    <label for="password"><b>비밀번호</b></label>
                    <input type="text" id="password" name="password" placeholder="영문+숫자 8~16자 이내" required>
                    <br><br>
                    <label for="passwordCheck"><b>비밀번호 확인</b></label>
                    <input type="text" id="passwordCheck" name="passwordCheck" placeholder="한　번 더 입력해주세요" required>
                </div>

                <div class="btn-wrapper">
                    <br>
                    <button type="submit"
                            style=""
                            class="util-btn"
                            name="submit">입력 확인
                    </button>
                    <br>
                    <button class="util-btn" type="button" onclick="history.back();">
                        유저 유형 다시 선택
                    </button>
                </div>
            </div>
        </form>
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
</div>
<script src="../../js/signup/signup.js"></script>
</body>
</html>
