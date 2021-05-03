<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <c:import url="/header.jsp"></c:import>
  
  <!-- 캐러셀 -->
<div id="demo" class="carousel slide align-center" data-ride="carousel" > 
  <div class="carousel-inner"> 
   
    <!-- 슬라이드 쇼 --> 
    <div class="carousel-item active"> <!--가로--> 
      <img class="d-block w-100" src= "<%= request.getContextPath() %>/img/mood.jpg" alt="First slide"> 
      <div class="carousel-caption d-none d-md-block">
        <h1 class="fadeInDown animated">당신의 밤이 가치 있기를</h1>
        <p class="fadeInDown animated"></p>
       <a href="#" > <button type="button" class="btn btn-outline-light learn-btn fadeInUp animated" >제품 보러가기</button></a>
       
      </div>
    </div>
    <div class="carousel-item"> 
      <img class="d-block w-100" src="<%= request.getContextPath() %>/img/glass.jpg" alt="Second slide"> 
      <div class="carousel-caption d-none d-md-block">
        <h1 class="fadeInDown animated">늘 당신의 곁에 함께하기를</h1>
        <p class="fadeInDown animated"></p>
         <a href="#" ><button type="button" class="btn btn-outline-light learn-btn fadeInUp animated" >제품 보러가기</button></a>
      
      </div>
    </div> 
    <div class="carousel-item"> 
      <img class="d-block w-100" src="<%= request.getContextPath() %>/img/card.jpg" alt="Third slide"> 
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
  
<c:import url="/footer.jsp"></c:import>
