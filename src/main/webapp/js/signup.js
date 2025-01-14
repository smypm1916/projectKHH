function openPostalCode() {
    new daum.Postcode({
        oncomplete: function (data) {
        }
    }).open();
}