<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <script type="text/javascript" src="<%= request.getContextPath() %>/smarteditor2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
  <style>
    * {
      margin: 0;
      color: #818181;
    }
    #inquiryAnswerWrap {
      width: 730px;
      margin: 0 auto;
    }
    #inquiryAnswerInputbox {
      display: flex;
      flex-direction: column;
      width: 700px;
      margin: 0 auto;
    }
    #inquiryAnswerCategoryTitle {
      margin: 10px auto;
      width: 700px;
    }
    #inquiryAnswerBtnWrap {
      display: flex;
      justify-content: center;
      margin: 20px auto;
    }
    .inquiryAnswerBtn {
      margin: 0 5px;
      outline: none;
      font-size: 0.7em;
      padding: 5px;
      border: solid 0.5px #e3e3e4;
      cursor: pointer;
    }
  </style>
</head>
<body>
  <div id="inquiryAnswerWrap">
    <div id="inquiryAnswerCategoryTitle">
      <h5>|주문제작/문의 답변 등록</h5>
      <hr>
    </div>
    <%
      if(request.getParameter("answerResult") != null) {
    	  %><script>window.opener.location.href="adminInquiryContent.do?inquiry_idx="+${ param.answerIdx }; self.close();</script><%
      }
    %>
    <form id="adminInquiryForm" action="adminInquiryAnswerWrite.do" method="post">
      <input type="hidden" name="inquiry_idx" value="${ param.inquiry_idx }">
      <div id="inquiryAnswerInputbox">
        <span style="margin-bottom:5px; font-size:0.7em;">작성자 아이디 : ${ session.memberId }</span>
        <textarea name="inquiry_a_content" id="inquiry_a_content" cols="100" rows="10" style="width:100%;"></textarea>
        <script type="text/javascript">
		  var oEditors = [];
		  nhn.husky.EZCreator.createInIFrame({
		   oAppRef: oEditors,
		   elPlaceHolder: "inquiry_a_content",
		   sSkinURI: "../smarteditor2/SmartEditor2Skin.html",
		   htParams : {
			   fOnBeforeUnload : function(){
				   
			   }
		   },
		   fOnAppLoad : function(){
			   oEditors.getById["inquiry_a_content"].exec("lOAD_CONTENTS_FIELD", []);
		   },
		   fCreator: "createSEditor2"
		  });
		</script>
		<c:if test="${ param.inquiry_category == 1 }">
		<input type="hidden" name="inquiry_a_title" id="inquiry_a_title" value="주문제작 답변입니다.">
		</c:if>
		<c:if test="${ param.inquiry_category == 2 }">
		<input type="hidden" name="inquiry_a_title" id="inquiry_a_title" value="1:1문의 답변입니다.">
		</c:if>
      </div>
      <div id="inquiryAnswerBtnWrap">
        <input class="inquiryAnswerBtn" type="submit" value="완료" onclick="answerTitle(); return false;">
        <button type="button" onclick="inquiryAnswerConfirm()" class="inquiryAnswerBtn">취소</button>
      </div>
    </form>
    <script>
        function inquiryAnswerConfirm() {
          if(confirm("작성을 취소하시겠습니까?") == true) {
            self.close();
          }
        }
        
        function answerTitle() {
        	oEditors.getById["inquiry_a_content"].exec("UPDATE_CONTENTS_FIELD", []);
/*         	var inquiry_a_content = document.getElementById('inquiry_a_content');
        	var inquiry_a_title = document.getElementById('inquiry_a_title');
        	var titleLength = 15;
        	
        	if(inquiry_a_content.value.length > titleLength) {
        		inquiry_a_title.value = inquiry_a_content.substr(0, titleLength) + "..."; 
        	} */
        	form.submit();
        }
      </script>
  </div>
</body>
</html>