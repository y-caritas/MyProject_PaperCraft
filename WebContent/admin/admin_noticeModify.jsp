<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<c:import url="/admin/admin_sideBar.jsp"></c:import>		
		<div id="admin_notice_title_container">
			<div id="admin_noticelist_title" style="width: 1000px;">
				<h3>| 공지사항 수정하기</h3>
				<hr id="admin_hr"><br>
			</div>
		<form id="fromsubmit" action="admin_notice_modifyEdit.do" name="Join_form_submit" method="POST">
		<input type="hidden" name="notice_idx" value="${dto.notice_idx}"/>
			<div>
			<c:if test="${ dto.notice_pin eq 1 }">
			<input type="checkbox" name="importchk" value="1" checked="checked">&nbsp;<label>중요 공지</label><br>
			</c:if>
			<c:if test="${ dto.notice_pin ne 1 }">
			<input type="checkbox" name="importchk" value="1">&nbsp;<label>중요 공지</label><br>
			</c:if>
			<input id="admin_notice_writeTitle" type="text" name="notice_title" value="${ dto.notice_title }">
			
			<!-- 스마트에디터 -->
			<div id="editor_section">
				<textarea name="notice_writeEditor" id="notice_writeEditor" cols="100" rows="10" style="width: 100%; height: 600px;">${dto.notice_content }</textarea>
       	 <script type="text/javascript">
					  var oEditors = [];
					  nhn.husky.EZCreator.createInIFrame({
					   oAppRef: oEditors,
					   elPlaceHolder: "notice_writeEditor",
					   sSkinURI: "../smarteditor2/SmartEditor2Skin.html",
					   fCreator: "createSEditor2",
						 htParams: { 
							 fOnBeforeUnload : function(){
									
							 }
					  },
				      fOnAppLoad : function(){
				          //textarea 내용을 에디터상에 바로 뿌려주고자 할때 사용
				          oEditors.getById["notice_writeEditor"].exec("PASTE_HTML", [""]);
				      },
				      fCreator: "createSEditor2"
					  });
					</script>
			</div>

			</div>
			<div id="admin_notice_writebtn">
				<button id="modifybtn" onclick="submitchk();">수정하기</button>&nbsp;&nbsp;
				<button type="button" onclick="chkbtn();">목록</button>
			</div>
		</form>
		</div>
	</div>
<script>
    $(window).on("beforeunload", function() {
        return "작성중인 글이 존재합니다. 페이지를 나가시겠습니까?";
    });

    $("#fromsubmit").on("submit", function() {
        $(window).off("beforeunload");
    });
    
    function chkbtn() {
    	if(confirm("작성중인 글이 존재합니다. 페이지를 나가시겠습니까?") == true) {
    		location.href = "admin_notice_list.do";
    	}else {
    		return false;
    	}
    	
    }
    
    function submitchk() {
    	alert("저장되었습니다.");
    }
    
    $("#modifybtn").click(function(){ 
		  oEditors.getById["notice_writeEditor"].exec("UPDATE_CONTENTS_FIELD", []);
		  $("#fromsubmit").submit();
		  });
	// 수정
</script> 
</body>
</html>