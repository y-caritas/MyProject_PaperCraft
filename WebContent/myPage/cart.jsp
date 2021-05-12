<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<c:import url="/header.jsp"></c:import>
<style>
#order-btn{
 border: none;}
#order-chk{
margin-top:10px;
padding-top:10px;
}

.sidebar{

margin-top:100px;
max-width:200px;
margin-left:20px;
border-radius:10px;
position: sticky;
top:0;

}

#inquiryListWrap{
max-width:1200px;
width:100%;
margin:0 auto;

}
.sidebar a {

text-decoration: none;
color: #818181;
}
.sidebar a:hover{
text-decoration: none;
color: #818181;
}


.section-wrap {
margin-left: 30px;
padding-left: 40px;
text-align: center;

}

#writeBtn{
margin: 0 auto;	
text-align: right;
width: 1000px;

}

    #writeBtn button {
      border: solid 0.5px #e3e3e4;
      font-size: 0.9em;
      padding: 5px;
      cursor: pointer;
    }
</style>


<script>
  var cartVAR = {
    product_price : null,
    total_price : null,
    total_price_view : null,

    convert : function (arg) {
      this.product_price = arg + "_product_price";      
      this.total_price = arg + "_total_price";
      this.total_price_view = arg + "_total_price_view";
    },
    plus : function (arg) {      
      this.convert(arg);
      var count = document.getElementById(arg).value;
      count++;
      document.getElementById(arg).value = count;
      document.getElementById(cartVAR.total_price).value = document.getElementById(cartVAR.product_price).value * count;
      document.getElementById(cartVAR.total_price_view).innerText = document.getElementById(cartVAR.total_price).value;
      updateCart();
    },
    minus : function (arg) {    
      this.convert(arg);
      var count = document.getElementById(arg).value;
      if (count > 1) {
      count--;
      document.getElementById(arg).value = count;
      document.getElementById(cartVAR.total_price).value = document.getElementById(cartVAR.product_price).value * count;
      document.getElementById(cartVAR.total_price_view).innerText = document.getElementById(cartVAR.total_price).value;
    }
      updateCart();
    }
  }


  function updateCart(){
    var result = 0;
    var cartTables = document.getElementsByClassName('total_price');
    for(var i=0; i<cartTables.length; i++){
      result += parseInt(cartTables[i].value);
    }    
    document.getElementById('result').innerText = result+"원";
    document.getElementById('result_value').value = result;
  }
  window.onload = () => {
	    updateCart();
  }
  function CheckForm(Join){
      
      var isCartChk = false;
      var arr_Cart = document.getElementsByName("cart_target[]");
      for(var i=0;i<arr_Cart.length;i++){
          if(arr_Cart[i].checked == true) {
        	  isCartChk = true;
              return isCartChk;
          }
      }
  
      if(!isCartChk){
          alert("상품을 한개 이상 선택해주세요.");
          return isCartChk;
      }

  }
  function submitCart(){
	  
	  updateCart();
      var frm = document.cart;
	  if(CheckForm(frm) === true){
      var arr_Cart = document.getElementsByName("cart_target[]");
      var arr_Cart_idx = document.getElementsByName("cart_idx[]");
      var arr_Cart_p_img = document.getElementsByName("cart_p_img[]");
      var arr_Cart_p_count = document.getElementsByName("cart_p_count[]");
      var arr_Cart_p_total = document.getElementsByName("cart_p_total_price[]");
      
      var checked_idx = [];
      var checked_p_idx = [];
      var checked_p_img = [];
      var checked_p_count = [];
      var checked_p_total = [];

      for(var i=0;i<arr_Cart.length;i++){
          if(arr_Cart[i].checked == true) {
          checked_idx.push(arr_Cart_idx[i].value);
          checked_p_idx.push(arr_Cart[i].value);
    	  checked_p_img.push(arr_Cart_p_img[i].value);
    	  checked_p_count.push(arr_Cart_p_count[i].value);
    	  checked_p_total.push(arr_Cart_p_total[i].value);
          }
      }
      frm.checked_idx.value = checked_idx;
      frm.checked_p_idx.value = checked_p_idx;
      frm.checked_p_img.value = checked_p_img;
      frm.checked_p_count.value = checked_p_count;
      frm.checked_p_total.value = checked_p_total;
      frm.submit();
	  }
  }
  



  </script>
<div class="container-fluid">
  <div class="row flex-nowrap">


<div class="col-md-2 sidebar">
<!-- 사이드 바 메뉴-->
  <!-- 패널 타이틀1 -->
<div class="panel panel-info">
    <div class="panel-heading">
     
    </div>
    <!-- 사이드바 메뉴목록1 -->
    <ul class="list-group">
      <li class="list-group-item"><b>&nbsp&nbsp쇼핑정보</b></br></br>
      <a href="order_detail.do">&nbsp&nbsp  주문내역</a></br>
       <a href="cart.do">&nbsp&nbsp 장바구니</a></br>
        </li>
      
      
      <li class="list-group-item"><b>&nbsp&nbsp게시판이용</b></br></br>
         <a href="one_to_one_inquiry.do">&nbsp&nbsp 1:1문의</a></br>
         <a href="customizeList.do">&nbsp&nbsp 주문제작</a></br>
      
      
      </li>
      <li class="list-group-item"><b>&nbsp&nbsp계정관리</b></br></br>
         <a href="<%= request.getContextPath() %>/myPage/check_pw.jsp">&nbsp&nbsp 정보수정</a></br>
         <p></p>
          
       
      
      
      </li>
    </ul>
</div>
</div>




<div class="col-md-8  ">

<div class="section-wrap">

  <div class="categoryTitle">
      <h2>장바구니</h2>
      <hr class="dividingLine">
    </div>



<section id="inquiryListWrap">


<form name="cart" action="purchase.do" method="post">
  <table id="inquiryListTable"  style="border-bottom: none;">
    <tr class="inquiryTr">
      <th style="width:10%">번호</th>
      <th style="width:10%"></th>
      <th style="width:40%">상품정보</th>
      <th style="width:10%">판매가</th>
      <th style="width:10%">수량</th>
      <th style="width:10%">합계금액</th>
    </tr>
      
      <c:forEach var="cart" items="${cartList}" varStatus="status">  		   
      <tr>
      <td><input type="checkbox" name="cart_target[]" value="${cart.cart_p_idx}">${status.count}</td>
      <td>
        <div class="cart_titles">
          <img style="width:100px; height:100px;" class="" src="${cart.cart_p_img}" alt="">
          <input type="hidden" name="cart_idx[]" value="${ cart.cart_idx }">
          <input type="hidden" name="cart_p_img[]" value="${ cart.cart_p_img }">         
        </div>
      </td>
      <td>
        <div class="cart_btns">
          <h5>${cart.cart_p_name}</h5>       
          <input type="hidden" name="cart_p_name" value="${ cart.cart_p_name }">
        </div>
      </td>
      <td>       
        <h5 id="${cart.cart_idx}_price">${cart.cart_p_price}</h5>
      </td>
      
      <td>        
          <input type="button" value="-" id="minus" onclick="cartVAR.minus('${cart.cart_idx}')">
          <input name="cart_p_count[]" style="text-align: center;" type="text" size="1" value="${cart.cart_p_count}" id="${cart.cart_idx}">
          <input type="button" value="+" id="plus" onclick="cartVAR.plus('${cart.cart_idx}')">        
      </td>
      <td>
        <input name="cart_p_price" type="text" value="${cart.cart_p_price}" id="${cart.cart_idx}_product_price" hidden="hidden"/>
        <input name="cart_p_total_price[]" type="text" class="total_price" value="${cart.cart_p_total_price}" id="${cart.cart_idx}_total_price" hidden="hidden" />
        <h5 id="${cart.cart_idx}_total_price_view">${cart.cart_p_total_price}</h5>        
      </td>
		 </c:forEach>
    <tr>
    
      
    <tr>
      <td style="height: 100px;"> <button type="submit" formaction="cartDelete.do"  class="btn btn-secondary"> 선택삭제 </button> </td>
      <td></td><td></td>
      <td>
      <%--구매하기로 value값 넘길 name 설정하기 --%>
      <input name="purchase_total_value" id="result_value" type="text" value="" hidden="hidden"> </td>
      <td>상품 총 금액</td>
      <td><h4 id="result"></h1></td>
    </tr>
    <tr>
      <td></td><td></td>
      <td style="padding-left: 100px; padding-top: 100px;">
      <input type="hidden" name="checked_idx"/>
      <input type="hidden" name="checked_p_idx"/>
      <input type="hidden" name="checked_p_img"/>
      <input type="hidden" name="checked_p_count"/>
      <input type="hidden" name="checked_p_total"/>
      <button type="button" onclick="submitCart()" class="btn btn-dark">결제</button>&emsp;
      <button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
      </td><td></td><td></td><td></td>
    </tr>
    </table>    
    </form>
    </section>
       </div>
   
   <div class="col-md-2">
   </div>
   </div>
   </div>
   </div>

<c:import url="/footer.jsp"></c:import>
