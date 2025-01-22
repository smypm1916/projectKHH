document.addEventListener("DOMContentLoaded", () => {
    /** 공통 함수: DOM 요소 선택 */
    function selectElement(id) {
        return document.getElementById(id);
    }

    /** Year, Month, Day Select Initialization */
    function initializeYearMonthDay() {
        const yearSelect = selectElement("birth-year");
        const monthSelect = selectElement("birth-month");
        const daySelect = selectElement("birth-day");
        const currentYear = new Date().getFullYear();

        // 연도 추가
        for (let year = currentYear; year >= 1920; year--) {
            yearSelect.appendChild(new Option(year, year));
        }

        // 월 추가
        for (let month = 1; month <= 12; month++) {
            monthSelect.appendChild(new Option(month, month));
        }

        // 일 갱신
        function updateDays() {
            const year = parseInt(yearSelect.value, 10);
            const month = parseInt(monthSelect.value, 10);

            if (isNaN(year) || isNaN(month)) {
                daySelect.innerHTML = '<option value="">-- --</option>';
                return;
            }

            const lastDay = new Date(year, month, 0).getDate();
            daySelect.innerHTML = '<option value="">-- --</option>';
            for (let day = 1; day <= lastDay; day++) {
                daySelect.appendChild(new Option(day, day));
            }
        }

        yearSelect.addEventListener("change", updateDays);
        monthSelect.addEventListener("change", updateDays);
        updateDays();
    }

    /** 중복 체크 및 유효성 검사 */
    function initializeDuplicateCheck() {
        const emailDomainInput = selectElement("email-domain");
        const emailServiceSelect = selectElement("email-service");
        const emailCheckButton = selectElement("email-check-button");
        const emailMessage = selectElement("email-message");
        const nicknameInput = selectElement("nickname");
        const nicknameCheckButton = selectElement("nickname-check-button");
        const nicknameMessage = selectElement("nickname-message");

        // 실시간 이메일 유효성 검사
        emailDomainInput.addEventListener("input", () => {
            if (emailDomainInput.value.includes("@")) {
                emailMessage.textContent = "이메일의 @ 앞 부분에 '@' 문자를 포함할 수 없습니다.";
                emailMessage.style.color = "red";
                emailMessage.style.display = "inline";
            } else {
                emailMessage.textContent = "";
                emailMessage.style.display = "none";
            }
        });

        // 중복 체크 공통 함수
        function CheckDuplicate(type, value, messageElement) {
            fetch("/CheckDuplicateC", {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded",
                },
                body: `type=${encodeURIComponent(type)}&value=${encodeURIComponent(value)}`,
            })
                .then((response) => {
                    if (!response.ok) throw new Error("서버 응답 오류");
                    return response.json();
                })
                .then((data) => {
                    if (data.exists) {
                        messageElement.textContent = `이미 존재하는 ${type === "email" ? "이메일" : "닉네임"}입니다.`;
                        messageElement.style.color = "red";
                    } else {
                        messageElement.textContent = `사용 가능한 ${type === "email" ? "이메일" : "닉네임"}입니다.`;
                        messageElement.style.color = "green";
                    }
                    messageElement.style.display = "inline";
                })
                .catch((error) => {
                    console.error("중복 체크 요청 오류:", error);
                    alert("오류가 발생했습니다. 다시 시도해주세요.");
                });
        }

        // 이메일 유효성 검사
        emailCheckButton.addEventListener("click", () => {
            const emailDomain = emailDomainInput.value;
            const emailService = emailServiceSelect.value;

            if (!emailDomain) {
                emailMessage.textContent = "이메일의 @ 앞 부분을 입력해주세요.";
                emailMessage.style.color = "red";
                emailMessage.style.display = "inline";
                return;
            }

            if (emailDomain.includes("@")) {
                emailMessage.textContent = "이메일의 @ 앞 부분에 '@' 문자를 포함할 수 없습니다.";
                emailMessage.style.color = "red";
                emailMessage.style.display = "inline";
                return;
            }

            const email = `${emailDomain}@${emailService}`;
            CheckDuplicate("email", email, emailMessage);
        });

        // 닉네임 중복 체크
        nicknameCheckButton.addEventListener("click", () => {
            const nickname = nicknameInput.value;

            if (!nickname) {
                nicknameMessage.textContent = "닉네임을 입력해주세요.";
                nicknameMessage.style.color = "red";
                nicknameMessage.style.display = "inline";
                return;
            }

            CheckDuplicate("nickname", nickname, nicknameMessage);
        });
    }

    /** 비밀번호 유효성 검사 */
    function initializePasswordValidation() {
        const passwordInput = selectElement("password");
        const passwordCheckInput = selectElement("passwordCheck");
        const passwordMessage = document.createElement("span");
        const passwordCheckMessage = document.createElement("span");

        passwordMessage.style.color = "red";
        passwordCheckMessage.style.color = "red";

        passwordInput.parentNode.appendChild(passwordMessage);
        passwordCheckInput.parentNode.appendChild(passwordCheckMessage);

        function validatePassword() {
            const password = passwordInput.value;
            const regex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$/;

            if (!regex.test(password)) {
                passwordMessage.textContent = "비밀번호는 영문과 숫자를 포함한 8~16자리여야 합니다.";
                return false;
            }
            passwordMessage.textContent = "";
            return true;
        }

        function validatePasswordMatch() {
            const password = passwordInput.value;
            const passwordCheck = passwordCheckInput.value;

            if (passwordCheck === "") {
                passwordCheckMessage.textContent = "";
                passwordCheckInput.setCustomValidity("");
            } else if (password !== passwordCheck) {
                passwordCheckMessage.textContent = "비밀번호가 일치하지 않습니다.";
                passwordCheckInput.setCustomValidity("비밀번호가 일치하지 않습니다.");
            } else {
                passwordCheckMessage.textContent = "";
                passwordCheckInput.setCustomValidity("");
            }
        }

        passwordInput.addEventListener("input", () => {
            validatePassword();
            validatePasswordMatch();
        });

        passwordCheckInput.addEventListener("input", validatePasswordMatch);
    }

    // Initialize All Features
    initializeYearMonthDay();
    initializeDuplicateCheck();
    initializePasswordValidation();
});
