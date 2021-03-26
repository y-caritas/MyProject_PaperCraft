<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    
  <title>Document</title>
  
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Open+Sans&display=swap" rel="stylesheet">
  
  <link href="<%= request.getContextPath() %>/CSS/headerCss.css?ver=1" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/CSS/contactCss.css?ver=1" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/CSS/footerCss.css?ver=1" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/CSS/mainCss.css?ver=1" rel="stylesheet">
  
</head>
<body>
  <header>
    <c:if test="${member_id == null}">
      <div class="submenu">
        <span><a href="#">Home</a></span>
        <span><a href="#">Login</a></span>
        <span><a href="#">Join</a></span>
      </div>
    </c:if>
    <c:if test="${member_id != null}">
      <div class="submenu">
        <span><a href="#">Home</a></span>
        <span class="dropdown"><a href="#">Account</a>
          <span class="dropdown_menu" style="width:60px;">
            <a href="#">OrderDetail</a>
            <a href="#">MyPage</a>
            <a href="#">Logout</a>
          </span>
        </span>
        <span><a href="#">Cart</a></span>
      </div>
    </c:if>
    <div id="logo">
      <img src="<%= request.getContextPath() %>/img/로고 후보5(Quicksand).png" alt="로고" style="width:388px; height:102px;">
    </div>
    <div class="navbar">
      <span class="dropdown">Brand
        <span class="dropdown_menu" style="width:100px;">
          <a href="#">회사소개</a>
          <a href="brand/contact_us.jsp">오시는길</a>
        </span>
      </span>
      <span class="dropdown">Product
        <span class="dropdown_menu" style="width:100px;">
          <a href="#">무드등</a>
          <a href="#">유리돔</a>
          <a href="#">카드/액자</a>
          <a href="#">도구</a>
        </span>
      </span>
      <span class="dropdown">Community
        <span class="dropdown_menu" style="width:100px;">
          <a href="#">주문제작 및 1:1문의</a>
          <a href="#">FAQ</a>
          <a href="#">공지사항</a>
        </span>
      </span>
    </div>
  </header>
