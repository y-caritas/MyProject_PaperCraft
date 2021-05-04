<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
  <head>
  <meta charset="UTF-8">
  <title>상품 등록</title>
  <link href="<%= request.getContextPath() %>/CSS/adminSideBarCss.css?ver=1" rel="stylesheet">  
  <link href="<%= request.getContextPath() %>/CSS/admin_productRegistrationCss.css?ver=1" rel="stylesheet">  
  <script type="text/javascript" src="<%= request.getContextPath() %>/smarteditor2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
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
 
var oEditors = [];
var oEditors2 = [];
var oEditors3 = [];
 
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "product_introduction",          
          sSkinURI: "../smarteditor2/SmartEditor2Skin.html",  
          htParams : {
              bUseToolbar : true,              
              bUseVerticalResizer : true,              
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
                   
              }
          }, 
          fOnAppLoad : function(){              
              oEditors.getById["product_introduction"].exec("PASTE_HTML", [""]);
          },
          fCreator: "createSEditor2"
      });      
  
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors2,
          elPlaceHolder: "product_delivery_policy", 
          sSkinURI: "../smarteditor2/SmartEditor2Skin.html",  
          htParams : {
              bUseToolbar : true,              
              bUseVerticalResizer : true,              
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
                   
              }
          }, 
          fOnAppLoad : function(){
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
              oEditors2.getById["product_delivery_policy"].exec("PASTE_HTML", [""]);
          },
          fCreator: "createSEditor2"
      });
  
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors3,
          elPlaceHolder: "product_swap_policy", 
          sSkinURI: "../smarteditor2/SmartEditor2Skin.html",  
          htParams : {
              bUseToolbar : true,              
              bUseVerticalResizer : true,              
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
                   
              }
          }, 
          fOnAppLoad : function(){              
              oEditors3.getById["product_swap_policy"].exec("PASTE_HTML", [""]);
          },
          fCreator: "createSEditor2"
      });
 
      
      //저장버튼 클릭시 form 전송
      $("#modifybtn").click(function(){
    	  
          oEditors.getById["product_introduction"].exec("UPDATE_CONTENTS_FIELD", []);          
          oEditors2.getById["product_delivery_policy"].exec("UPDATE_CONTENTS_FIELD", []);          
          oEditors3.getById["product_swap_policy"].exec("UPDATE_CONTENTS_FIELD", []); 
    	  
    	  if(document.adminProduct.product_category.value.length == 0) {
    			alert("카테고리를 선택해주세요.");
    			adminProduct.product_category.focus();
    			return false;
    		}
    		
    		if(document.adminProduct.product_name.value.length == 0) {
    			alert("상품명을 작성해주세요");
    			adminProduct.product_name.focus();
    			return false;
    		}
    		
    		if(document.adminProduct.product_price.value.length == 0) {
    			alert("판매 가격을 작성해주세요.");
    			adminProduct.product_price.focus();
    			return false;
    		}    		
    		if(document.adminProduct.product_note.value.length == 0) {
    			alert("상품 소개글을 작성해주세요.");
    			adminProduct.product_note.focus();
    			return false;
    		}
    		if(document.adminProduct.product_listImg.value.length == 0) {
    			alert("상품 이미지를 등록해주세요.");
    			adminProduct.product_listImg.focus();
    			return false;
    		}
    		if(document.adminProduct.product_introImg.value.length == 0) {
    			alert("상품 이미지를 등록해주세요.");
    			adminProduct.product_introImg.focus();
    			return false;
    		}
    		
          $("#fromsubmit").submit();
      });    
});
</script>

  </head>
<body>
	<div id="sideBarContainer">
		<c:import url="./admin_sideBar.jsp"></c:import>	
	
	<div style="margin-left: 30px;">
      <form id="fromsubmit" name="adminProduct" action="productRegister.do" method="POST" enctype="multipart/form-data">
      <div style="margin: 20px;">상품관리 > 상품등록
      </div>      
      <div>
        <b>상품 정보 입력</b>
      </div>
      
      <div class="input-group">
          <select name="product_category">
            <option value="" selected disabled>카테고리 선택</option>
            <option value="01">무드등</option>
            <option value="02">유리돔</option>
            <option value="03">카드/액자</option>
            <option value="04">도구</option>
          </select>&emsp;
        <input name="product_name" type="text" placeholder="상품을 입력하세요" class="form-control" >
      </div>

      <table class="input-group">
        <tr>
          <th style="height: 60px; text-align: center;">판매가격</th>
          <td style="text-align: center; "><input name="product_price" type="text" placeholder="가격"></td>
          <td></td>
        </tr>
        <tr>
          <th style="height: 60px; text-align: center;">옵션명</th>
          <td style="text-align: center; "><input name="option_detail" type="text" placeholder="옵션명"></td>
          <td style="text-align: center; "><input name="option_price" type="text" placeholder="가격"></td>          
        </tr>        
      </table>
      <div>
        <b>상품소개글</b>
      </div>
      <input style="width:850px; " name="product_note" class="form-control input-group"  type="text" placeholder="25자 이내로 소개글을 입력하세요.">
      <div>
        <b>상품이미지</b>
      </div>
      <div class="file_input">
        <table class="input-group">
          <tr>
            <th style="text-align: center;">상품 목록 이미지<br>000*000</th>
            <td>              
              <input name="product_listImg" type="text" readonly="readonly" title="File Route" id="file_route1" value="">
              <label>찾아보기<input type="file" name="imgfile" onchange="javascript:document.getElementById('file_route1').value=this.value">
              </label>
            </td>
          </tr>
          <tr>
            <th style="text-align: center;">상품 대표 이미지<br>000*000</th>
            <td>
              <input name="product_introImg" type="text" readonly="readonly" title="File Route" id="file_route2" value="">
              <label>찾아보기<input type="file" name="imgfile" onchange="javascript:document.getElementById('file_route2').value=this.value">
              </label>
            </td>
          </tr>
        </table>        
      </div>
      <div>
        <b>상품 상세 설명</b>         
        <textarea name="product_introduction" id="product_introduction" cols="126" rows="5"></textarea>    
      </div>        
      <div>
        <b>배송 안내</b>&nbsp;
        <%--radio 버튼 논의 필요 --%>
        <input type="radio" name="delivery_policy_category" value="01">공통 배송 안내 노출&nbsp;
        <input type="radio" name="delivery_policy_category" value="02">개별 배송 안내 작성        
        <textarea name="product_delivery_policy" id="product_delivery_policy" cols="126" rows="5"></textarea>
      </div>        
      <div>
        <b>교환 및 반품 안내</b>&nbsp;
        <input type="radio" name="swap_policy_category" value="01">공통 교환 및 반품 안내 노출&nbsp;
        <input type="radio" name="swap_policy_category" value="02">개별 교환 및 반품 안내 작성        
        <textarea name="product_swap_policy" id="product_swap_policy" cols="126" rows="5"></textarea>
      </div>
      <div style="text-align: center;">
        <table>
          <tr>
            <th style="text-align: center;"><b>상품 이력 관리</b></th>
            <th style="text-align: center;"><b>상품 메모</b></th>
          </tr>
          <tr>
            <td>
              <textarea name="product_record" cols="60" rows="4"></textarea>
            </td>
            <td>
              <textarea name="product_memo"  cols="60" rows="4"></textarea>
            </td>
          </tr>
        </table>
      </div>
      <div style="text-align: center; height: 100px; padding-top: 20px; padding-right: 40px; ">
        <button class="button" id="modifybtn" type="submit" class="btn btn-secondary">확인</button>&emsp;
        <button class="button" type="button" class="btn btn-dark" onclick="history.back()">취소</button>
      </div>
    </form>
    </div>
    </div>    
    </body>
</html>