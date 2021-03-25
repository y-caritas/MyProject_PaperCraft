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
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Open+Sans&display=swap" rel="stylesheet">
  <title>캐러셀</title>
 
  <style>
 
    * {
      margin: 0; padding: 0;
      
    }
 
    /* carousel 시작 */
    
     #demo {
     width: 1200px;
     height: 200px;
      display: block;
       margin: auto;
     }
    .carousel-item {
      position: relative; 
      
      
    }
    .carousel-caption {
      width: 80%; position: absolute; margin: 0 auto;
      left: 10%; top: 15%;
    }
    .carousel-caption h1 {
      font-family:  'Open Sans', 'Noto Sans KR', sans-serif ;
      width: 80%; text-align: left; font-size: 45px; padding-bottom: 10px;
      animation-delay: 0.5s; 
    }
    .carousel-caption p {
      width: 80%; text-align: left; font-size: 14px;
      color: #f6f6f6; padding-bottom: 10px;
      animation-delay: 0.4s;
    }
    .carousel-caption .learn-btn {
      position: absolute; left: 0; width: 130px; height: 40px;
      animation-delay: 1.2s;
    }
    .carousel-caption .learn-btn:hover {
      background-color: ;
    }
    /* carousel 애니메이션 효과 - animation-delay는 바로 위쪽에 */
    .animated {
      -webkit-animation-duration: 1s;
      animation-duration: 1s;
      -webkit-animation-fill-mode: both;
      animation-fill-mode: both;
    }
    .fadeInDown  {
      animation-name: fadeInDown;
    }
    .fadeInUp  {
      animation-name: fadeInUp;
    }
    @keyframes fadeInDown {
      0% {
        opacity: 0;
        -webkit-transform: translateY(-20px);
        -ms-transform: translateY(-20px);
        transform: translateY(-20px);
      }
      100% {
        opacity: 1;
        -webkit-transform: translateY(0);
        -ms-transform: translateY(0);
        transform: translateY(0);
      }
    }
    @keyframes fadeInUp {
      0% {
        opacity: 0;
        -webkit-transform: translateY(20px);
        -ms-transform: translateY(20px);
        transform: translateY(20px);
      }
      100% {
        opacity: 1;
        -webkit-transform: translateY(0);
        -ms-transform: translateY(0);
        transform: translateY(0);
      }
    }
    

  </style>
  

</head>
<body>

  <%@ include file="header.jsp" %>
<!-- 캐러셀 -->
<div id="demo" class="carousel slide align-center" data-ride="carousel" > 
  <div class="carousel-inner"> 
   
    <!-- 슬라이드 쇼 --> 
    <div class="carousel-item active"> <!--가로--> 
      <img class="d-block w-100" src= "img/mood.jpg" alt="First slide"> 
      <div class="carousel-caption d-none d-md-block">
        <h1 class="fadeInDown animated">당신의 밤이 가치 있기를</h1>
        <p class="fadeInDown animated"></p>
       <a href="#" > <button type="button" class="btn btn-outline-light learn-btn fadeInUp animated" >제품 보러가기</button></a>
       
      </div>
    </div>
    <div class="carousel-item"> 
      <img class="d-block w-100" src="img/glass.jpg" alt="Second slide"> 
      <div class="carousel-caption d-none d-md-block">
        <h1 class="fadeInDown animated">늘 당신의 곁에 함께하기를</h1>
        <p class="fadeInDown animated"></p>
         <a href="#" ><button type="button" class="btn btn-outline-light learn-btn fadeInUp animated" >제품 보러가기</button></a>
      
      </div>
    </div> 
    <div class="carousel-item"> 
      <img class="d-block w-100" src="img/card.jpg" alt="Third slide"> 
      <div class="carousel-caption d-none d-md-block">
        <h1 class="fadeInDown animated">소중한 마음이 전해지기를</h1>
        <p class="fadeInDown animated"></p>
      <a href="#"> <button type="button" class="btn btn-outline-light learn-btn fadeInUp animated" >제품 보러가기</button></a>
      </div>
    </div> 
    <!-- / 슬라이드 쇼 끝 --> 
    <!-- 왼쪽 오른쪽 화살표 버튼 --> 
    <a class="carousel-control-prev" href="#demo" data-slide="prev"> 
      <span class="carousel-control-prev-icon" aria-hidden="true"></span> 
      <!-- <span>Previous</span>  -->
    </a> 
    <a class="carousel-control-next" href="#demo" data-slide="next"> 
      <span class="carousel-control-next-icon" aria-hidden="true"></span> 
      <!-- <span>Next</span>  -->
    </a> <!-- / 화살표 버튼 끝 --> 
    <!-- 인디케이터 --> 
    <ul class="carousel-indicators"> 
      <li data-target="#demo" data-slide-to="0" class="active"></li> 
      <!--0번부터시작--> 
      <li data-target="#demo" data-slide-to="1"></li> 
      <li data-target="#demo" data-slide-to="2"></li> 
    </ul> <!-- 인디케이터 끝 --> 
  </div>
</div>
   <%@ include file="footer.jsp" %>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  <script> 
    $('.carousel').carousel({ 
        interval: 4500, //기본 5초 
        keyboard: true,
        pause: 'hover',
        slide: false,
        wrap: true,
        touch: true
    }) 
 
  </script>
  
  
</body>

</html>
