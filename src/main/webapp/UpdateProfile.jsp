<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div {
	border: 1px solid;
}

.header {
	height: 100px;
}

.nav {
	height: 70px;
}

.content {
	margin-top: 100px;
	margin-left: 100px;
	margin-right: 100px;
	height: 2000px;
	border: none;
}

.footer {
	height: 200px;
}

.profile-field {
	display: flex;
	margin: 30px;
	height: 250px;
}

.profile-circle {
	display: flex;
	flex-direction: column;
}

.profile-circle img {
	border-radius: 50%;
	width: 170px;
	height: 170px;
}

.add_image_button {
	height: 50px;
	padding: 10px 20px; /* 버튼 내부 여백 */
	font-size: 16px; /* 텍스트 크기 */
	font-weight: bold; /* 텍스트 두께 */
	color: #ffffff; /* 텍스트 색상 */
	background-color: #007bff; /* 버튼 배경색 */
	border: none; /* 테두리 제거 */
	border-radius: 8px; /* 모서리 둥글게 */
	cursor: pointer; /* 마우스 오버 시 포인터 표시 */
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 약간의 그림자 */
	transition: background-color 0.3s, transform 0.2s; /* 애니메이션 효과 */
}

.add_image_button:hover {
	background-color: #0056b3; /* 호버 시 배경색 변경 */
	transform: scale(1.05); /* 약간 확대 */
}

.change_profile {
	height: 50px;
	padding: 10px 20px;
	font-size: 16px;
	font-weight: bold;
	color: #ffffff;
	background-color: #007bff;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	transition: background-color 0.3s, transform 0.2s;
}

.change_profile:hover {
	background-color: #0056b3; /* 호버 시 배경색 변경 */
	transform: scale(1.05); /* 약간 확대 */
}

.myProfile_button_box {
	display: flex;
	justify-content: center;
	gap: 10px;
	border: none;
	margin-top: 10px;
}

.myProfile_button_box button {
	height: 50px;
	padding: 10px 20px;
	font-size: 16px;
	font-weight: bold;
	color: #ffffff;
	background-color: #007bff;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	transition: background-color 0.3s, transform 0.2s;
}

.myProfile_button_box:hover button {
	background-color: #0056b3; /* 호버 시 배경색 변경 */
	transform: scale(1.05); /* 약간 확대 */
}
</style>
</head>
<body>
	<div class="container">
		<div class="header">header</div>
		<div class="nav">nav</div>
		<div class="content">

			<div class="mypage" style="border: none;">
				<h1>MyPage</h1>
				<hr>
				<h2>프로필 편집</h2>
			</div>

			<div class="profile">

				<div class="profile-field" style="border: none;">
					<div class="profile-circle" style="border: none;">
						<img
							id="previewImage"
							src="https://c4.wallpaperflare.com/wallpaper/375/927/608/bleach-zangetsu-bleach-wallpaper-preview.jpg"
							alt="place-name" width="480" height="320"> <input
							type="file" id="fileInput" style="display: none;"
							onchange="changeImage(event, 'previewImage')">
							<br>
						<button class="add_image_button"
							onclick="document.getElementById('fileInput').click();">
							프로필사진을 선택</button>
					</div>
					<div
						style="border: none; align-content: baseline; margin-left: 30px">
							<p>
								이름을 입력 <br>
							</p>
							<input> <br> <br>
							<p>
								물러서면 퇴락이요. 겁먹으면 죽음이다.
							</p>
							<input> <br> <br>
					</div>

				</div>
			</div>
			<div class="myProfile_button_box" style="border: none;">
				<button id="cancel_info">취소</button>
				<button id="complete_info">수정완료</button>
			</div>

			
		<script type="text/javascript">
		function changeImage(event, previewImageId) {
			const input = event.target;
			const previewImage = document.getElementById(previewImageId);

			if (input.files && input.files[0]) {
				const reader = new FileReader();

				reader.onload = function(e) {
					previewImage.src = e.target.result; // 이미지 소스를 선택한 파일로 변경
				};

				reader.readAsDataURL(input.files[0]); // 파일 읽기
			}
		}
		</script>

		</div>
		<div class="footer">footer</div>
	</div>
</body>
</html>