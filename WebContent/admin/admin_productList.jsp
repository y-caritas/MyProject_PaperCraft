<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
  <title>상품 등록</title>
  
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Open+Sans&display=swap" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    
  <link href="<%= request.getContextPath() %>/CSS/adminSideBarCss.css?ver=1" rel="stylesheet">  
  <link href="<%= request.getContextPath() %>/CSS/admin_productListCss.css?ver=1" rel="stylesheet">  

  </head>
<body>
	<div id="sideBarContainer">
		<c:import url="./admin_sideBar.jsp"></c:import>
	<div>
	    <div>
  <form name="productList" action="productList.do" method="POST">
    <div style="margin: 20px;">상품관리 > 상품목록
    </div>  
    <div >
      <div style="text-align: center; padding-top: 20px;">
        <b>상품명</b>
        <input type="text">
      </div><hr>
      <div>
        <table>
          <tr>
            <th>
            <b>카테고리</b>
            <select name="product_category">
              <option value="" selected disabled>카테고리 선택</option>
              <option value="01">무드등</option>
              <option value="02">유리돔</option>
              <option value="03">카드/액자</option>
              <option value="04">도구</option>
            </select>
            </th>
            <th>
              <b>판매가격</b>
              <input name="product_price_01" style="width: 90px; height: 25px;" type="text">~
              <input name="product_price_02" style="width: 90px; height: 25px;" type="text">
            </th>            
          </tr>
          <tr>
            <th>
            <b>상품등록일</b>
            <input name="product_record_01" style="width: 90px; height: 25px;" type="text">~
            <input name="product_record_02" style="width: 90px; height: 25px;" type="text">
            </th>
          </tr>
        </table>
        <div style="text-align: center; margin: 20px;">
          <button type="submit" class="btn btn-dark">검색</button>
        </div>
    </div>
    </div>
  </form>
  <form action="productListDelete.do" method="POST">
    <table id="inquiryListTable">
      <tr class="inquiryTr">
        <th style="width:10%">번호</th>
        <th style="width:40%">카테고리와 상품명</th>
        <th style="width:20%">판매가격(적립금)</th>
        <th style="width:10%">등록일(수정일)</th>        
        <th style="width:10%">조회수</th>
        <th style="width:10%">수정</th>
      </tr>            
      <!-- <c:forEach var="productList" items="${product_list}" varStatus="status">  		   
           <tr>
        <td><input type="checkbox" name="product_idx" value="productList.product_idx" id="">&nbsp;${status.count}</td>
        <td>
          <h6>productList.product_category</h6>
          <h5>productList.product_name</h5>
        </td>
        <td>
          <div>
            <h6>{적립금}</h6>
            <h5>productList.product_price</h5>          
          </div>
        </td>
        <td>productList.product_record</td>
        <td>{조회수}</td>
        <td>          
          <button type="button" onclick="#GET방식 주소/?product_idx=productList.product_idx" class="btn btn-secondary">수정</button>
        </td>
      </tr>
		 </c:forEach> -->
      <tr>
        <td><input type="checkbox" name="product_idx" id="">&nbsp;1</td>
        <td>
          <h6>{카테고리}</h6>
          <h5>PRODUCT_NAME</h5>
        </td>
        <td>
          <div>
            <h6>{적립금}</h6>
            <h5>$10000</h5>          
          </div>
        </td>
        <td>2021-04-16</td>
        <td>0</td>
        <td>          
          <button type="button" onclick="#" class="btn btn-secondary">수정</button>
        </td>
      </tr>
      <tr>
        <td><input type="checkbox" name="product_idx" id="">&nbsp;2</td>
        <td>
          <h6>{카테고리}</h6>
          <h5>PRODUCT_NAME</h5>
        </td>
        <td>
          <div>
            <h6>{적립금}</h6>
            <h5>$10000</h5>          
          </div>
        </td>
        <td>2021-04-16</td>
        <td>0</td>
        <td>          
          <button type="button" onclick="#" class="btn btn-secondary">수정</button>
        </td>
      </tr>
      <tr>
        <td><input type="checkbox" name="product_idx" id="">&nbsp;3</td>
        <td>
          <h6>{카테고리}</h6>
          <h5>PRODUCT_NAME</h5>
        </td>
        <td>
          <div>
            <h6>{적립금}</h6>
            <h5>$10000</h5>          
          </div>
        </td>
        <td>2021-04-16</td>
        <td>0</td>
        <td>          
          <button type="button" onclick="#" class="btn btn-secondary">수정</button>
        </td>
      </tr>      
    </table>
    <button type="submit" onclick="#" class="btn btn-dark">선택삭제</button>
    </form>
</div>


</body>
</html>