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
    #faqWriteWrap {
      width: 730px;
      margin: 0 auto;
    }
    #faqWriteInputbox {
      display: flex;
      flex-direction: column;
      width: 700px;
      margin: 0 auto;
    }
    #faqWriteInputbox > input:focus, #faqWriteInputbox > textarea:focus {
      outline: none;
    }
    #faqWriteCategoryTitle {
      margin: 10px auto;
      width: 700px;
    }
    #faqWriteBtnWrap {
      display: flex;
      justify-content: center;
      margin: 20px auto;
    }
    .faqWriteBtn {
      margin: 0 5px;
      outline: none;
      font-size: 0.7em;
      padding: 5px;
      border: solid 0.5px #e3e3e4;
      cursor: pointer;
    }
    #faq_category {
    margin-left: 15px;
    margin-bottom: 10px;
    }
  </style>
</head>
<body>
  <div id="faqWriteWrap">
    <div id="faqWriteCategoryTitle">
      <h5>|자주하는 질문/답변 등록</h5>
      <hr>
    </div>
    <%
      if(request.getAttribute("faqResult") != null) {
    	  %><script>
    	  opener.location.reload();
    	  self.close();
    	  </script><%      }
    %>
    <form action="adminFaqWrite.do">
      <select name="faq_category" id="faq_category">
        <option value="faqProduct">상품</option>
        <option value="faqSwap">반품/교환</option>
        <option value="faqDelivery">배송</option>
      </select>
      <div id="faqWriteInputbox">
        <input type="text" name="faq_title" placeholder="제목을 입력하세요.">
        <textarea name="faq_content" id="faq_content" cols="100" rows="10" style="width:100%;"></textarea>
        <script type="text/javascript">
		  var oEditors = [];
		  nhn.husky.EZCreator.createInIFrame({
		   oAppRef: oEditors,
		   elPlaceHolder: "faq_content",
		   sSkinURI: "../smarteditor2/SmartEditor2Skin.html",
		   htParams : {
			   fOnBeforeUnload : function(){
				   
			   }
		   },
		   fOnAppLoad : function(){
			   oEditors.getById["faq_content"].exec("lOAD_CONTENTS_FIELD", []);
		   },
		   fCreator: "createSEditor2"
		  });
		</script>
      </div>
      <div id="faqWriteBtnWrap">
        <input class="faqWriteBtn" type="submit" onclick="faqWrite(); return false;" value="완료">
        <button type="button" onclick="faqConfirm()" class="faqWriteBtn">취소</button>
      </div>
      <script>
        function faqConfirm() {
          if(confirm("작성을 취소하시겠습니까?") == true) {
            self.close();
          }
        }
        
        function faqWrite() {
        	oEditors.getById["faq_content"].exec("UPDATE_CONTENTS_FIELD", []);
        	form.submit();
        }
      </script>
    </form>
  </div>
</body>
</html>