<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8");%>

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
    	<%	  	 	
  		if(request.getAttribute("confirm") != null){
		int confirm = (int)request.getAttribute("confirm");
		if(confirm == 1){			
			out.println("<script>alert('등록되었습니다.');</script>");
			out.println("<script>window.close();</script>");			
		}else{
			out.println("<script>alert('오류가 발생했습니다.');</script>");
			out.println("<script>window.close();</script>");
		}
  		}		
 	%> 	
</head>
<body>
  <div id="inquiryAnswerWrap">
    <div id="inquiryAnswerCategoryTitle">
      <h5>|상품문의</h5>
      <hr>
    </div>
    <form id="adminInquiryForm" action="productEnquiry.do" method="post">      
      <div id="inquiryAnswerInputbox">        
        <input name="product_i_title" type="text" placeholder="제목을 입력하세요."><br>
        <span style="margin-bottom:5px; font-size:0.7em;">작성자 아이디 : ${ session.memberId }</span>
        <textarea name="product_i_content" id="product_inquiry_content" cols="100" rows="10" style="width:100%;"></textarea>
        <script type="text/javascript">
		  var oEditors = [];
		  nhn.husky.EZCreator.createInIFrame({
		   oAppRef: oEditors,
		   elPlaceHolder: "product_inquiry_content",
		   sSkinURI: "../smarteditor2/SmartEditor2Skin.html",
		   htParams : {
			   fOnBeforeUnload : function(){
				   
			   }
		   },
		   fOnAppLoad : function(){
			   oEditors.getById["product_inquiry_content"].exec("lOAD_CONTENTS_FIELD", []);
		   },
		   fCreator: "createSEditor2"
		  });
		</script>
      </div>
      <div id="inquiryAnswerBtnWrap">
      	 <input name="product_idx" value="<%= request.getParameter("product_idx") %>" hidden="hidden">
         <input name="product_i_category" value="<%= request.getParameter("product_i_category") %>" hidden="hidden">
         <input name="product_i_name" value="<%= request.getParameter("product_i_name") %>" hidden="hidden">          
         <input name="product_i_img" value="<%= request.getParameter("product_i_img") %>" hidden="hidden">
         <input name="member_id" value="${ session.memberId }" hidden="hidden">
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
        	oEditors.getById["product_inquiry_content"].exec("UPDATE_CONTENTS_FIELD", []);
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