<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="../../css/community/community_detail.css">
</head>
<body>
<h1>커뮤니티</h1>
<div class="community_title_div">
  <div class="community_title"><h2>${com.title }</h2></div>
  <div class="community_PNBtn">
    <button>이전 글</button>&nbsp;&nbsp;
    <button>다음 글</button>
  </div>
</div>

<div class="community_profile_div">
  <div class="community_profile_image"><img alt="" src="../../image/user.png"></div>
  <div class="community_writer_div">
    <div class="community_writer">${com.nickname }</div>
    <div style="border:none;" class="community_dateNcnt">
      <div class="community_date">${com.date }</div>
      <div class="community_readcnt">조회수 ${com.readcnt }</div>
    </div>
  </div>
</div>

<hr>

<div class="community_content_div">
  <img src="../image/hokkaido.jpg">
  <div class="community_content">${com.content }</div>
</div>

<hr>

<div class="community_comment_div">
  <div class="comment_upload_div">
    <div class="comment_upload_title">댓글쓰기</div>
    <div class="comment_txtBox"><input type="text"></div>
    <div class="comment_uploadBtn"><button onclick="location.href='CommentUploadController'">등 록</button></div>
  </div>
  <div class="comment_list_div">
    <div class="comment_parent_div">
      <div class="comment_content_div">
        <div class="comment_nickname">작성자 닉네임</div>
        <div class="comment_date">작성일</div>
        <div class="comment_content">댓글내용</div>
      </div>
      <div class="comment_btn_div_other">
        <button>답글달기</button>
      </div>
      <div class="comment_btn_div_writer">
        <button>수정하기</button>
        <button>삭제하기</button>
      </div>
    </div>
    <div class="recomment_upload_div">
      <div class="comment_txtBox"><textarea></textarea></div>
      <div class="comment_uploadBtn"><button>등록</button></div>
    </div>
    <div class="comment_child_div">
      <div class="comment_content_div">
        <div class="comment_nickname">작성자 닉네임</div>
        <div class="comment_date">작성일</div>
        <div class="comment_content">댓글내용</div>
      </div>
      <div class="comment_btn_div_other">
        <button>답글달기</button>
      </div>
      <div class="comment_btn_div_writer">
        <button>수정하기</button>
        <button>삭제하기</button>
      </div>
    </div>
  </div>
  <div class="community_mainBtn_div"></div>
</div>
</body>
</html>
