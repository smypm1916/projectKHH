// 출생연도
const currentYear = new Date().getFullYear();
const yearSelect = document.getElementById('birth-year');
for (let i = currentYear; i >= 1920; i--) {
    const option = document.createElement('option');
    option.value = i;
    option.textContent = i;
    yearSelect.appendChild(option);
}

// 출생월
const monthSelect = document.getElementById('birth-month');
for (let i = 1; i <= 12; i++) {
    const option = document.createElement('option');
    option.value = i;
    option.textContent = i;
    monthSelect.appendChild(option);
}

// 출생일
const daySelect = document.getElementById('birth-day');
for (let i = 1; i <= 31; i++) {
    const option = document.createElement('option');
    option.value = i;
    option.textContent = i;
    daySelect.appendChild(option);
}

// 우편번호 api
function openPostalCode() {
    new daum.Postcode({
        oncomplete: function (data) {
        }
    }).open();
}

document.addEventListener('DOMContentLoaded', () => {
    const customerRadio = document.getElementById('user-type-customer');
    const ownerRadio = document.getElementById('user-type-owner');
    const ownerFields = document.getElementById('owner-fields');

    // 이벤트 리스너 추가
    customerRadio.addEventListener('change', () => {
        ownerFields.style.display = 'none';
    });

    ownerRadio.addEventListener('change', () => {
        ownerFields.style.display = 'block';
    });
});