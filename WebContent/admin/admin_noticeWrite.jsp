<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
  <title>글쓰기</title>
  
  <script src="https://cdn.ckeditor.com/ckeditor5/27.0.0/classic/ckeditor.js"></script>
  <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
    
  <link href="<%= request.getContextPath() %>/CSS/adminSideBarCss.css?ver=1" rel="stylesheet">
	<link href="<%= request.getContextPath() %>/CSS/adminNoticeListCss.css?ver=1" rel="stylesheet">
	<link href="<%= request.getContextPath() %>/CSS/admin_noticeWriteCss.css?ver=1" rel="stylesheet">

  </head>
<body>
	<div id="sideBarContainer">
		<c:import url="./admin_sideBar.jsp"></c:import>
		
		<div id="admin_notice_title_container">
			<div id="admin_noticelist_title" style="width: 1000px;">
				<h3>| 공지사항 글쓰기</h3>
				<hr id="admin_hr"><br>
			</div>
		<form action="noticeWrite" onSubmit="return false;" name="Join_form_submit" method="POST">
			<div>
			<input id="admin_notice_writeTitle" type="text" name="notice_title" placeholder="제목을 입력해주세요.">
			
			<!-- CK에디터5 -->
			<div id="editor_section">
				<textarea id="editor" name="editor"></textarea>
			</div>

			</div>
			<div id="admin_notice_writebtn">
				<button>글쓰기</button>
			</div>
		</form>
		</div>
	</div>
<script>
    // 3. CKEditor5를 생성할 textarea 지정
    ClassicEditor
        .create( document.querySelector( '#editor' ) )
        .catch( error => {
            console.error( error );
        } );
    
    CKEDITOR.replace('editor', {
    	filebrowserUploadUrl: '../upload'
    });
    </script>
</body>
</html>