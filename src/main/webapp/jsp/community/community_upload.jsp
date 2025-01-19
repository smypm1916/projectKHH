<%--
  Created by IntelliJ IDEA.
  User: codms
  Date: 2025-01-17
  Time: 오후 3:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../css/community/community_upload.css">
    <script type="text/javascript" src="../../js/community/community.js"></script>
</head>
<body>
<h1>커뮤니티</h1>
<form action="CommunityUploadController" method="post" enctype="multipart/form-data">

  <div class="community_writer_div">
    <div class="title_writer">작성자</div>
    <div class="title_writer_nickname"><span>${param.nickname}</span></div>
  </div>

  <div class="community_title_div">
    <div class="title_title">제목</div>
    <div class="title_title_input"><input type="text" placeholder="제목을 입력하세요"></div>
  </div>

  <div class="community_content_div">
    <div class="content_title">내용</div>
    <div class="content_textarea"><textarea placeholder="내용을 입력하세요"></textarea></div>
  </div>



  <div class="community_image_div">
    <div class="image_title">이미지</div>
    <div class="image_input">
      <label for="file">
        <div class="btn-upload">이미지 업로드하기</div>
      </label>
      <input type="file" name="file" id="file" multiple="multiple" accept=".png, .jpg, .jpeg"></div>
  </div>

    <div class="community_uploadBtn_div">
      <button type="submit">등록하기</button>
      <button type="button" onclick="goToCommunityList()">목록으로</button>
    </div>
  </div>
</form>
</body>
</html>
