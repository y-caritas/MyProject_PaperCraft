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
  
  <link href="<%= request.getContextPath() %>/CSS/headerCss.css?ver=2" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/CSS/jointermsCss.css?ver=2" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/CSS/contactCss.css?ver=2" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/CSS/footerCss.css?ver=2" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/CSS/mainCss.css?ver=2" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/CSS/introductionCss.css?ver=2" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/CSS/faqCss.css?ver=2" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/CSS/inquiryListCss.css?ver=2" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/CSS/notice_listCss.css?ver=2" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/CSS/notice_contentCss.css?ver=2" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/CSS/LoginCss.css?ver=2" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/CSS/inquiryWriteCss.css?ver=2" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/CSS/inquiryContentCss.css?ver=2" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/CSS/joinCss.css?ver=4" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/CSS/orderFormCss.css?ver=2" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/CSS/orderCompletionCss.css?ver=2" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/CSS/detail_pageCss.css?ver=2" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/CSS/listviewCss.css?ver=2" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/CSS/product_detailCss.css?ver=2" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/CSS/joinwelcomeCss.css?ver=2" rel="stylesheet">
 	
  <link href="<%= request.getContextPath() %>/CSS/adminSideBarCss.css?ver=2" rel="stylesheet">
  
  <script>
  	function goBack() {
  		window.history.back();
  	}
  </script>
  
</head>
<body>
  <header>
    <c:if test="${member_id == null}">
      <div class="submenu">
        <span> <a href="<%= request.getContextPath() %>/main.jsp">Home</a></span>
        <span> <a href="<%= request.getContextPath() %>/member/login.jsp">Login</a></span>
        <span><a href="<%= request.getContextPath() %>/member/join_terms.jsp">Join</a></span>
      </div>
    </c:if>
    <c:if test="${member_id != null}">
      <div class="submenu">
        <span><a href="<%= request.getContextPath() %>/main.jsp">Home</a></span>
        <span class="dropdown"><a>Account</a>
          <span class="dropdown_menu" style="width:60px; margin: 0;">
            <c:if test="${ member_id == 'admin' }">
            <a href="<%= request.getContextPath() %>/admin/adminFaqList.do">AdminPage</a>
            </c:if>
            <a href="#">OrderDetail</a>
            <a href="one_to_one_inquiry.do">MyPage</a>
            <a href="logout.do">Logout</a>
          </span>
        </span>
        <span><a href="<%= request.getContextPath() %>/myPage/cart.do">Cart</a></span>
      </div>
    </c:if>
    <div id="logo">
      <a href="<%= request.getContextPath() %>/main.jsp"><img src="<%= request.getContextPath() %>/img/로고 후보5(Quicksand).png" alt="로고" style="width:388px; height:102px;"></a>
    </div>
    <div class="navbar">
        <span class="dropdown">Brand
        <span class="dropdown_menu" style="width:170px;">
          <a href="<%= request.getContextPath() %>/brand/introduction.jsp">회사소개</a>
          <a href="<%= request.getContextPath() %>/brand/contact_us.jsp">오시는길</a>
        </span>
      </span>
      <span class="dropdown">Product
        <span class="dropdown_menu" style="width:170px;">
          <a href="<%= request.getContextPath() %>/product/listview.do?product_category=01&orderby=01">무드등</a>
          <a href="<%= request.getContextPath() %>/product/listview.do?product_category=02&orderby=01">유리돔</a>
          <a href="<%= request.getContextPath() %>/product/listview.do?product_category=03&orderby=01">카드/액자</a>
          <a href="<%= request.getContextPath() %>/product/listview.do?product_category=04&orderby=01">도구</a>
        </span>
      </span>
      <span class="dropdown">Community
        <span class="dropdown_menu" style="width:170px;">
          <a href="inquiryList.do">주문제작 / 문의</a>
          <a href="faq_list.do">FAQ</a>
          <a href="noticelist.do">공지사항</a>
        </span>
      </span>
    </div>
  </header>
