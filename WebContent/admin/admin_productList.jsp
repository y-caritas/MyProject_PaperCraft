<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="<%= request.getContextPath() %>/CSS/adminSideBarCss.css?ver=1" rel="stylesheet">

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #ordersection {
      width: 1000px;
      margin-left: 15px;
      margin-top: 15px;
    }
    #ordersearchbox {
      border: 1px solid #bfbfbf;
      margin-top: 20px;
    }
    #orderlistsection {
      border-bottom: 1px solid #bfbfbf;
    }
    #detsearchflex {
      display: flex;
      flex-direction: row;
    }
    .detsearch {
      width: 495px;
      height: 80px;
      display: flex;
      flex-direction: row;
    }
    .detsearchBtn {
      text-align: center;
      margin-bottom: 15px;
    }
    .detsearchBtn button {
      width: 100px;
      height: 30px;
    }
    #orderlistTable {
      border-collapse: collapse;
      border-spacing: 0;
      width: 1000px;
    }
    .fontRight {
      text-align: right;
      font-size: 14px;
      font-weight: bold;
    }
    #order1search {
      text-align: center;
    }
    #order1search button {
      height: 25px;
      vertical-align: middle;
      width: 60px;
    }
    .margintop {
      margin-top: 20px;
    }
    #orderlistsection > span {
      font-size: 14px;
      font-weight: bold;
    }
    button {
      border: none;
      background-color: #f1f3f4;
      outline: 1;
    }
    button:hover {
      background-color: #bfbfbf;
      color: white;
    }
    input[type=text] {
      width: 80px;
    }
    .flexboxtitle {
      display: flex;
      flex-direction: column;
      width: 200px;
      text-align: center;
    }
    .flexboxtitle span {
      margin-bottom: 5px;
    }
    .flexboxContent {
      display: flex;
      flex-direction: column;
      text-align: center;
    }
    .flexboxContent input, .flexboxContent1 input {
      margin-bottom: 5px;
    }
    thead {
      border-top: 2px solid #bfbfbf;
      border-bottom: 2px solid #bfbfbf;
      background-color: #f1f3f4;
      text-align: center;
    }
    thead > tr > td {
      height: 30px;
    }
    .tableContent {
      border-bottom: 1px solid #cfcfcf;
      text-align: center;
    }
    .tableContent > td {
      height: 25px;
    }
    #orderconfirmBtn {
      text-align: center;
      margin-top: 20px;
    }
    #orderconfirmBtn button {
      height: 35px;
    }
    a {
      color: black;
      text-decoration: none;
    }
    a:hover {
      color: #bfbfbf;
    }

</style>
</head>
<body>
	<div id="sideBarContainer">
		<c:import url="./admin_sideBar.jsp"></c:import>
		
		  <div id="ordersection">
    <div id="orderlisthead">
      <h3>| 상품 검색 및 삭제</h3>
      <hr>
    </div>
    <div id="ordersearchbox">
      <div id="orderlistsection">        
        <form action="adminProductNameSearch.do" method="get">
          <div id="order1search">	      	
	        <b>상품명</b>
	        <input name="product_name" type="text">	      	
            <button type="submit">검색</button>
          </div>
        </form>
        <div class="fontRight margintop">
          <span>상세검색</span>
        </div>
      </div>
      <!-- 상세검색 -->
      <div>
        <div id="detsearchflex">
          <div class="detsearch">
            <div class="flexboxtitle">
              <span>카테고리</span>              
              <span>상품 등록일</span>
            </div>
            <form action="adminProductDetailSearch.do" method="POST">
            <div class="flexboxContent">
              <select name="product_category">
              <option value="" selected disabled>카테고리 선택</option>
              <option value="01">무드등</option>
              <option value="02">유리돔</option>
              <option value="03">카드/액자</option>
              <option value="04">도구</option>
            </select>
              <div class="flexboxContent1">                
                <input name="product_record[]" type="date">~<input name="product_record[]" type="date">
              </div>
            </div>
            </div>
            <div class="detsearch">
              <div class="flexboxtitle">                
                <span>판매 금액</span>
              </div>
              <div class="flexboxContent1">                
                <input name="product_price[]" type="text"><span>원 ~ </span><input name="product_price[]" type="text"><span>원</span>
              </div>              
          </div>
        </div>
        <div class="detsearchBtn">
          <button type="submit">상세검색</button>
        </div>
        </form>
      </div>
    </div>    
    <br>
    <div class="fontRight">
      <span class="tabletitle">총 000건의 검색 결과가 있습니다.</span>
    </div>
    <form action="adminProductDelete.do" method="get">
    <table id="orderlistTable">
      <thead>
        <tr>
          <td>선택</td>
          <td>번호</td>
          <td>카테고리와 상품명</td>
          <td>판매가격 (적립금)</td>
          <td>등록일 (수정일)</td>          
          <td>아이디</td>
          <td>조회수</td>
          <td>수정</td>          
        </tr>
      </thead>
	  <%-- <c:forEach var="productList" items="${product_list}" varStatus="status">	 
      <tr class="tableContent">
        <td><input type="checkbox" name="product_idx" value="productList.product_idx" id=""></td>
        <td>${status.count}</td>
        <td>
        <span>[productList.product_category]</span>
        <span>productList.product_name</span>
		</td>
        <td>
        <span>productList.product_price</span>
        <span>[적립금]</span>
        </td>
        <td>productList.product_record</td>
        <td>[아이디]</td>
        <td>[조회수]</td>        
        <td><button type="button" onclick="productModify.do?product_idx=productList.product_idx" class="btn btn-secondary">수정</button></td>        
      </tr>
      </c:forEach>--%> 
        <tr class="tableContent">
        <td><input type="checkbox" name="product_idx" value="productList.product_idx" id=""></td>
        <td>${status.count}</td>
        <td>
        <span>[productList.product_category]</span>
        <span>productList.product_name</span>
		</td>
        <td>
        <span>productList.product_price</span>
        <h5>[적립금]</h5>
        </td>
        <td>productList.product_record</td>
        <td>[아이디]</td>
        <td>[조회수]</td>        
        <td><button type="button" onclick=" location.href='adminProductView.do?product_idx=productList.product_idx' " class="btn btn-secondary">수정</button></td>        
      </tr>
    </table>
    <div>
      <button type="submit">삭제</button>
    </div>
    </form>
  </div>		
</div>
</body>
</html>