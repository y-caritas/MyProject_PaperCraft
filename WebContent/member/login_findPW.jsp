<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <title>Basic Template</title>
    
     <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Open+Sans&display=swap" rel="stylesheet">
      <link href="<%= request.getContextPath() %>/CSS/LoginCss.css?ver=1" rel="stylesheet">
    
     </head>
  <body>
    <div class=" idFind align-middle" style="width:500px">
      <div class="card-title" style="margin-top:30px;">
        <h2 class="card-title text-center" style="color:#818181;">비밀번호 찾기</h2>
      </div>
    
      <div class="card-body">
        <form class="form-signin" method="POST"  action="pwFind.do" name="LoginMember" onSubmit="logincall();return false">      
        
         
          <input type="text" id="uid" name="member_id" class="form-control input-lg login-input"  placeholder="아이디를 입력하세요." required autofocus><BR>
          <input type="text" id="upw" name="member_email" class=" form-control input-lg login-input"  placeholder="이메일을 입력하세요." required><br>
          
         
          <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">확인</button>
        </form>
        
       
	
      

    </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>