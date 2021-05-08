<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html lang="en">
<head>
     <!-- Required meta tags -->
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
     <!-- Bootstrap CSS -->
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
   
  <title>Document</title>
  <style>
  
 .idr-wrap{
  margin: 100px ;
  color: #818181;
  text-align: center;

 }
    .idr-body {
      margin: 40px 0 40px;
    
    }
  </style>
</head>
<body onresize="parent.resizeTo(800,600)" onload="parent.resizeTo(800,600)">


<div class="idr-wrap">  
  <div class="idr-title">

    <h2>비밀번호 찾기</h2>
    
  </div>
 
       <%
		String member_pw = (String)session.getAttribute("member_pw");		
	%>
    
    
  <!-- 성공시 이메일로 전송  -->	

	<c:if test ="${member_pw != null }">
	
	 <div class="idr-body">
    
    회원님께서 가입하신 이메일로 임시 비밀번호를 보내드렸습니다.    
    </div>
    
      <div class="idr-footer">
<button class="btn btn-secondary btn-"  onClick='window.close()'>확인</button>

  </div>
   </c:if> 
   
   
<!-- 실패시 아이디찾기 페이지 이동버튼  --> 
   
     
    <c:if test = "${member_pw == null }">
    
     <div class="idr-body">
    아이디와 이메일을 확인해주세요.
    </div>
    
     <div class="idr-footer">
<button class="btn btn-secondary btn-"  onClick="location.href='<%= request.getContextPath() %>/member/login_findPW.jsp' ">확인</button>



  </div>
    </c:if>
  
   
    
  </div>
  




<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>  

</body>
</html>