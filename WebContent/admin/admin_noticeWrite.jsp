<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
  <title>글쓰기</title>
  
  <script type="text/javascript" src="<%= request.getContextPath() %>/smarteditor2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
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
			<input type="checkbox">&nbsp;<label>중요 공지</label><br>
			<input id="admin_notice_writeTitle" type="text" name="notice_title" placeholder="제목을 입력해주세요.">
			
			<!-- 스마트에디터 -->
			<div id="editor_section">
				<textarea name="notice_writeEditor" id="notice_writeEditor" cols="100" rows="10" style="width: 100%; height: 600px;">에디터 기본 삽입 글</textarea>
       	 <script type="text/javascript">
					  var oEditors = [];
					  nhn.husky.EZCreator.createInIFrame({
					   oAppRef: oEditors,
					   elPlaceHolder: "notice_writeEditor",
					   sSkinURI: "../smarteditor2/SmartEditor2Skin.html",
					   fCreator: "createSEditor2"
					  });
					</script>
			</div>

			</div>
			<div id="admin_notice_writebtn">
				<button>글쓰기</button>
			</div>
		</form>
		</div>
	</div>
</body>
</html>