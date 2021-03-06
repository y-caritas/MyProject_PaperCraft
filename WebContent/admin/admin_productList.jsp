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
      <h3>| ?????? ?????? ??? ?????? </h3>
      <hr>
    </div>
    <div id="ordersearchbox">
      <div id="orderlistsection">        
        <form action="adminProductNameSearch.do" method="get">
          <div id="order1search">	      	
	        <b>?????????</b>
	        <input name="product_name" type="text">	      	
            <button type="submit">??????</button>
          </div>
        </form>
        <div class="fontRight margintop">
          <span>????????????</span>
        </div>
      </div>
      <!-- ???????????? -->
      <div>
        <div id="detsearchflex">
          <div class="detsearch">
            <div class="flexboxtitle">
              <span>????????????</span>              
              <span>?????? ?????????</span>
            </div>
            <form action="adminProductDetailSearch.do" method="POST">
            <div class="flexboxContent">
              <select name="product_category">
              <option value="" selected>????????????</option>
              <option value="01">?????????</option>
              <option value="02">?????????</option>
              <option value="03">??????/??????</option>
              <option value="04">??????</option>
            </select>
              <div class="flexboxContent1">                
                <input name="product_record[]" type="date">~<input name="product_record[]" type="date">
              </div>
            </div>
            </div>
            <div class="detsearch">
              <div class="flexboxtitle">                
                <span>?????? ??????</span>
              </div>
              <div class="flexboxContent1">                
                <input name="product_price[]" type="text"><span>??? ~ </span><input name="product_price[]" type="text"><span>???</span>
              </div>              
          </div>
        </div>
        <div class="detsearchBtn">
          <button type="submit">????????????</button>
        </div>
        </form>
      </div>
    </div>    
    <br>    
    <form action="adminProductDelete.do" method="POST">
    <table id="orderlistTable">
      <thead>
        <tr>
          <td>??????</td>
          <td>??????</td>
          <td>??????????????? ?????????</td>
          <td>????????????</td>
          <td>????????? (?????????)</td>          
          <td>??????</td>          
        </tr>
      </thead>
	  <c:forEach var="productList" items="${product_list}" varStatus="status">	 
      <tr class="tableContent">
        <td><input type="checkbox" name="product_idx[]" value="${productList.product_idx}" id=""></td>
        <td>${productList.product_idx}</td>
        <td>
    	<c:set var="product_category" value= "${productList.product_category}" />
		<c:choose>
		<c:when test="${ product_category eq '01' }">
		<span>[?????????]</span>
		</c:when>
		<c:when test="${ product_category eq '02' }">
		<span>[?????????]</span>
		</c:when>
		<c:when test="${ product_category eq '03' }">
		<span>[??????/??????]</span>
		</c:when>
		<c:when test="${ product_category eq '04' }">
		<span>[??????]</span>
		</c:when>			
		</c:choose>
        <span>${productList.product_name}</span>
		</td>
        <td>
        <span>${productList.product_price}</span>        
        </td>
        <td>${productList.product_record}</td>        
        <td><button type="button" onclick="javascript:location.href='adminProductView.do?product_idx=${productList.product_idx}'" class="btn btn-secondary">??????</button></td>        
      </tr>
      </c:forEach>
    <tr>
    <td><div>
      <button type="submit">??????</button>
    </div></td>
    </tr>
    </table>    
    </form>
  </div>		
</div>
</body>
</html>