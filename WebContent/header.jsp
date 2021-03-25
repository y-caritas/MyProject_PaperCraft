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
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Open+Sans&display=swap" rel="stylesheet">
  <style>
    * {
      margin : 0;
    }
    #logo {
      margin: 3% auto;
      display: flex;
      justify-content: center;
    }
    .navbar {
      display: flex;
      justify-content: center;
      color: #818181;
      height: 50px;
      font-family: 'Open Sans', 'Noto Sans KR', sans-serif;
    }
    .navbar > span {
      margin : 0 10%;
    }
    .dropdown {
      position: relative;
    }
    .dropdown_menu {
      display : flex;
      display: none;
      position: absolute;
    }
    .submenu {
      display: flex;
      justify-content: flex-end;
      font-size: 0.5em;
      margin : 10px 0;
      height: 20px;
    }
    .submenu > span {
      display: inline-block;
      width: 60px;
      text-align: center;
    }
    .submenu a {
      text-decoration: none;
      color: #222222;
    }
    .dropdown_menu a {
      display: block;
      text-decoration: none;
      color: #818181;
      padding: 5px;
      font-size: 0.9em;
    }
    .navbar > span {
      display: inline-block;
      width: 100px;
      text-align: center;
    }
    .dropdown:hover .dropdown_menu {
      display: block;
      text-align: center;
      z-index: 99;
      background-color: rgb(255, 255, 255);
      
    }
    .dropdown_menu a:hover {
      background-color: #E3E3E4;
    }
    
  </style>
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
          <a href="#">오시는길</a>
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
  
</body>
</html>