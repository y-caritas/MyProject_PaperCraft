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
    .inquiryAnswerInputbox {
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
      <div id="inquiryAnswerInputbox">      	
      	<br><br><br>        
        <h5>상품문의</h5><input style="width:100%;" name="product_i_title" type="text" value="" disabled>
        <h5>내용</h5>
        <textarea name="product_i_content" id="product_inquiry_content" cols="100" rows="10" style="width:100%; resize: none;" disabled></textarea>
      </div>
      <br>
      <div id="inquiryAnswerInputbox">        
        <h5>답변</h5>
        <textarea name="product_i_content" id="product_inquiry_content" cols="100" rows="10" style="width:100%; resize: none; background-color: white" disabled></textarea>
      </div>       
    

  </div>
</body>
</html>