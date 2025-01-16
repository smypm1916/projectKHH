<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>

    <link rel="stylesheet" type="text/css" href="../../css/index_ver0.2.css?v=1.0">
    <link rel="stylesheet" href="../../css/signup/signUp.css">

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

        <h1>점주 회원 가입</h1>
        <p>필요한 정보 입력 후에 다음 버튼을 입력해주세요.</p>

        <form action="SignUpC" method="post">

            <!-- 회원 유형 선택 -->
            <div class="form-group">
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
                    <br>
                    <button onclick="">
                        중복체크
                    </button>
                    <span class="validCheck-message" style="display: none">s
                </span>
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
                    <label for="password"><b>비밀번호</b></label>
                    <input type="text" id="password" name="password" placeholder="영문+숫자 8~16자 이내" required>
                    <br><br>
                    <label for="passwordCheck"><b>비밀번호 확인</b></label>
                    <input type="text" id="passwordCheck" name="passwordCheck" placeholder="한번 더 입력해주세요" required>
                </div>

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
            </div>
        </form>
    </div>
</div>
<script src="../../js/signup/signup.js"></script>
</body>
</html>
