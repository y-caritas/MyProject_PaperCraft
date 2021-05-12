<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	String product_idx =  request.getParameter("product_idx");	
%>


<!DOCTYPE html>
<html>
  <head>
  <meta charset="UTF-8">
  <title>상품 수정</title>
  <link href="<%= request.getContextPath() %>/CSS/adminSideBarCss.css?ver=1" rel="stylesheet">  
  <link href="<%= request.getContextPath() %>/CSS/admin_productRegistrationCss.css?ver=1" rel="stylesheet"> 
  
  <style>
  .button {

    width:70px;
    background-color: #818181;
    border: none;
    color:#fff;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    font-size: 15px;
    cursor: pointer;
	border-radius:10px; 
}
  </style>
  <script type="text/javascript">      
      function confirm() {	    	  
          
    	  if(document.adminProduct.product_category.value.length == 0) {
    			alert("카테고리를 선택해주세요.");    			
    			return false;
    		}
    		
    		if(document.adminProduct.product_name.value.length == 0) {
    			alert("상품명을 작성해주세요");    			
    			return false;
    		}
    		
    		if(document.adminProduct.product_price.value.length == 0) {
    			alert("판매 가격을 작성해주세요.");    			
    			return false;
    		}    		
    		if(document.adminProduct.product_note.value.length == 0) {
    			alert("상품 소개글을 작성해주세요.");    			
    			return false;
    		}
    		if(document.adminProduct.product_listImg.value.length == 0) {
    			alert("상품 이미지를 등록해주세요.");    			
    			return false;
    		}
    		if(document.adminProduct.product_introImg.value.length == 0) {
    			alert("상품 이미지를 등록해주세요.");    			
    			return false;
    		}
    		if(document.adminProduct.product_introduction.value.length == 0) {
    			alert("상세 설명 이미지를 등록해주세요.");    			
    			return false;
    		}
    		if(document.adminProduct.delivery_policy_category.value.length == 0) {
    			alert("배송 안내를 선택해주세요.");    			
    			return false;
    		}
    		if(document.adminProduct.swap_policy_category.value.length == 0) {
    			alert("교환 안내를 선택해주세요.");    			
    			return false;
    		}
          return true;
      }
</script>

  </head>
<body>
	<div id="sideBarContainer">
		<c:import url="./admin_sideBar.jsp"></c:import>	
	
	<div style="margin-left: 30px;">
	  <form id="fromsubmit" name="adminProduct" action="adminProductModify.do" method="POST" enctype="multipart/form-data">      
      <div style="margin: 20px;">상품관리 > 상품수정
      </div>      
      <div>
        <b>상품 정보 입력</b> <h5>상품번호 = <%= product_idx %></h5>
      </div>
      
      <div class="input-group">
      	  <input name="product_idx" value="<%= product_idx %>" hidden="hidden">
          <select name="product_category">
            <option value="" selected disabled>카테고리 선택</option>
            <option value="01">무드등</option>
            <option value="02">유리돔</option>
            <option value="03">카드/액자</option>
            <option value="04">도구</option>
          </select>&emsp;
        <input name="product_name" type="text" placeholder="상품을 입력하세요" value="${productDto.product_name}" class="form-control" >
      </div>

      <table class="input-group">
        <tr>
          <th style="height: 60px; text-align: center;">판매가격</th>
          <td style="text-align: center; "><input name="product_price" value="${productDto.product_price}" type="text" placeholder="가격"></td>
          <td></td>
        </tr>
        <tr>
          <th style="height: 60px; text-align: center;" hidden="hidden">옵션명</th>
          <input name="option_idx" value="${optionDto.option_idx}" hidden="hidden">
          <td style="text-align: center; "><input name="option_detail" type="text" placeholder="옵션명" value="${optionDto.option_detail}" hidden="hidden"></td>
          <td style="text-align: center; "><input name="option_price" type="text" placeholder="가격" value="${optionDto.option_price}" hidden="hidden"></td>          
        </tr>        
      </table>
      <div>
        <b>상품소개글</b>
      </div>
      <input style="width:830px;" value="${productDto.product_note}" name="product_note" class="form-control input-group"  type="text" placeholder="25자 이내로 소개글을 입력하세요.">
      <div>
        <b>상품이미지</b>
      </div>
      <div class="file_input">
        <table class="input-group">
          <tr>
            <th style="text-align: center;">상품 목록 이미지</th>
            <td>              
              <input name="product_listImg" value="${productDto.product_listImg}" type="text" readonly="readonly" title="File Route" id="file_route1" value="">
              <label>찾아보기<input type="file" name="imgfile" onchange="javascript:document.getElementById('file_route1').value=this.value">
              </label>
            </td>
          </tr>
          <tr>
            <th style="text-align: center;">상품 대표 이미지</th>
            <td>
              <input name="product_introImg" value="${productDto.product_introImg}" type="text" readonly="readonly" title="File Route" id="file_route2" value="">
              <label>찾아보기<input type="file" name="imgfile" onchange="javascript:document.getElementById('file_route2').value=this.value">
              </label>
            </td>
          </tr>
		  <tr>
            <th style="text-align: center;">상품 상세 설명</th>
            <td>
              <input name="product_introduction" value="${productDto.product_introduction}" type="text" readonly="readonly" title="File Route" id="file_route3" value="">
              <label>찾아보기<input type="file" name="imgfile" onchange="javascript:document.getElementById('file_route3').value=this.value">
              </label>
            </td>
          </tr>
        </table>        
      </div>         
      <div>
        <b>배송 안내</b>&nbsp;&nbsp;
        <input type="radio" name="delivery_policy_category" value="01">공통 배송 안내 노출&nbsp;&nbsp;&nbsp;
        <input type="radio" name="delivery_policy_category" value="02">개별 배송 안내 작성
      </div><br>        
      <div>
        <b>교환 및 반품 안내</b>&nbsp;&nbsp;
        <input type="radio" name="swap_policy_category" value="01">공통 교환 및 반품 안내 노출&nbsp;&nbsp;&nbsp;
        <input type="radio" name="swap_policy_category" value="02">개별 교환 및 반품 안내 작성
      </div><br>
      <div>
        <b>상품이력</b>
      </div><br>
      <textarea name="product_memo"  cols="120" rows="6" disabled>${productDto.product_record}</textarea><br><br>   
      <div>
        <b>상품메모</b>
      </div><br>
      <textarea name="product_memo"  cols="120" rows="6">${productDto.product_memo}</textarea>      
      <div style="text-align: center; height: 100px; padding-top: 20px; padding-right: 40px; ">
        <button class="button" id="modifybtn" type="submit" class="btn btn-secondary">확인</button>&emsp;
        <button class="button" type="button" class="btn btn-dark" onclick="history.back()">취소</button>
      </div>
    </form>
    </div>
    </div>    
    </body>
</html>