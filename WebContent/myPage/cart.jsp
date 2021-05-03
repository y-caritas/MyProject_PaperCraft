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
  var cartOptionVAR = {
    option_price : null,
    total_price : null,
    total_price_view : null,

    convert : function (arg) {
      this.option_price = arg + "_price";      
      this.total_price = arg + "_total_price";
      this.total_price_view = arg + "_total_price_view";
    },
    plus : function (arg) {      
      this.convert(arg);
      var count = document.getElementById(arg).value;
      count++;
      document.getElementById(arg).value = count;
      document.getElementById(cartOptionVAR.total_price).value = document.getElementById(cartOptionVAR.option_price).value * count;
      document.getElementById(cartOptionVAR.total_price_view).innerText = document.getElementById(cartOptionVAR.total_price).value;
      updateCart();
    },
    minus : function (arg) {    
      this.convert(arg);
      var count = document.getElementById(arg).value;
      if (count > 1) {
      count--;
      document.getElementById(arg).value = count;
      document.getElementById(cartOptionVAR.total_price).value = document.getElementById(cartOptionVAR.option_price).value * count;
      document.getElementById(cartOptionVAR.total_price_view).innerText = document.getElementById(cartOptionVAR.total_price).value;
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
    document.getElementById('result').innerText = "$"+result;
  }
  window.onload = () => {
    updateCart();
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
       <a href="#">&nbsp&nbsp 장바구니</a></br>
        </li>
      
      
      <li class="list-group-item"><b>&nbsp&nbsp게시판이용</b></br></br>
         <a href="one_to_one_inquiry.do">&nbsp&nbsp 1:1문의</a></br>
         <a href="<%=request.getContextPath()%>/myPage/customize_inquiry.jsp">&nbsp&nbsp 주문제작</a></br>
      
      
      </li>
      <li class="list-group-item"><b>&nbsp&nbsp계정관리</b></br></br>
         <a href="<%=request.getContextPath()%>/myPage/info_modify.jsp">&nbsp&nbsp 정보수정</a></br>
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


<form action="">
  <table id="inquiryListTable"  style="border-bottom: none;">
    <tr class="inquiryTr">
      <th style="width:10%">번호</th>
      <th style="width:10%"></th>
      <th style="width:40%">상품정보</th>
      <th style="width:10%">판매가</th>
      <th style="width:10%">수량</th>
      <th style="width:10%">합계금액</th>
    </tr>
      <!-- 장바구니 기능구현시 장바구니 테이블과 오더 테이블과 테스트 필요. -->
      <!-- <c:forEach var="cart" items="${cart_list}" varStatus="status">  		   
      <tr>
      <td><input type="checkbox" name="cart_target" id="">${status.count}</td>
      <td>
        <div class="cart_titles">
          <img class="" src="{cart.cart_p_img}" alt="">          
        </div>
      </td>
      <td>
        <div class="cart_btns">
          <h5>{cart.cart_p_name}</h5>
          <h5>{cart.cart_o_name}</h5>
          <input name="cart_p_idx" value="{cart.cart_p_idx}" type="text" hidden="hidden"/>
          <input name="cart_p_name" value="{cart.cart_p_name}" type="text" hidden="hidden"/>
          <input name="cart_o_name" value="{cart.cart_o_name}" type="text" hidden="hidden"/>
          <input name="cart_o_price" value="{cart.cart_o_price}" type="text" hidden="hidden"/>
        </div>
      </td>
      <td>       
        <h5 id="{cart.cart_p_name}_price">{cart.cart_p_price}</h5>
      </td>
      <td>        
          <input type="button" value="-" id="minus" onclick="cartVAR.minus('{cart.cart_p_name}')">
          <input name="cart_p_count" style="text-align: center;" type="text" size="1" value="1" id="{cart.cart_p_name}">
          <input type="button" value="+" id="plus" onclick="cartVAR.plus('{cart.cart_p_name}')">        
      </td>
      <td>
        <input name="cart_p_price" type="text" value="{cart.cart_p_price}" id="{cart.cart_p_name}_product_price" hidden="hidden"/>
        <input type="text" class="total_price" value="{cart.cart_p_price}" id="{cart.cart_p_name}_total_price" hidden="hidden" />
        <h5 id="{cart.cart_p_name}_total_price_view">{cart.cart_p_price}</h5>        
      </td>
		 </c:forEach> -->
    <tr>
      <td><input type="checkbox" name="cart_target" id="">&nbsp;1</td>
      <td>
        <div class="cart_titles">
          <img class="" src="http://via.placeholder.com/100?text=Sample" alt="">          
        </div>
      </td>
      <td>
        <div class="cart_btns">
          <h5>PRODUCT_NAME A</h5>          
          <h6>옵션 : {옵션내용}</h6>
        </div>
      </td>
      <td>       
        <h5 id="A_price">500</h5>
      </td>
      <td>        
          <input type="button" value="-" id="minus" onclick="cartVAR.minus('A')">
          <input style="text-align: center;" type="text" size="1" value="1" id="A">
          <input type="button" value="+" id="plus" onclick="cartVAR.plus('A')">        
      </td>
      <td>          
        <input type="text" value="500" id="A_product_price" hidden="hidden"/>
        <input type="text" class="total_price" value="500" id="A_total_price" hidden="hidden" />
        <h5 id="A_total_price_view">500</h5>        
      </td>
    </tr>

    <tr id="B_row">
      <td><input type="checkbox" name="cart_target" id="">&nbsp;2</td>
      <td>
        <div class="cart_titles">
          <img class="" src="http://via.placeholder.com/100?text=Sample" alt="">          
        </div>
      </td>
      <td>
        <div class="cart_btns">
          <h5>PRODUCT_NAME B</h5>          
          <h6>옵션 : {옵션내용}</h6>
        </div>
      </td>
      <td>        
        <h5 id="B_price">500</h5>
      </td>
      <td>
          <input type="button" value="-" id="minus" onclick="cartVAR.minus('B')">
          <input style="text-align: center;" type="text" size="1" value="1" id="B">
          <input type="button" value="+" id="plus" onclick="cartVAR.plus('B')">
      </td>
      <td>
        <input type="text" value="500" id="B_product_price" hidden="hidden"/>
        <input type="text" class="total_price" value="500" id="B_total_price" hidden="hidden"/>
        <h5 id="B_total_price_view">500</h5>
      </td>
    </tr>

    <tr id="C_row">
      <td><input type="checkbox" name="cart_target" id="">&nbsp;3</td>
      <td>
        <div class="cart_titles">
          <img class="" src="http://via.placeholder.com/100?text=Sample" alt="">          
        </div>
      </td>
      <td>
        <div class="cart_btns">
          <h5>PRODUCT_NAME C</h5>
          <h6>옵션 : {옵션내용}</h6>        
        </div>
      </td>
      <td>
        <input type="text" value="500" id="C_product_price" hidden="hidden"/>
        <input type="text" class="total_price" value="500" id="C_total_price" hidden="hidden" />
        <h5 id="C_price">500</h5>
      </td>
      <td>
          <input type="button" value="-" id="minus" onclick="cartVAR.minus('C')">
          <input style="text-align: center;" type="text" size="1" value="1" id="C">
          <input type="button" value="+" id="plus" onclick="cartVAR.plus('C')">
      </td>
      <td>
        <h5 id="C_total_price_view">500</h5>
      </td>
    </tr>

    <tr>
      <td style="height: 100px;"><button type="button" onclick="#" class="btn btn-secondary">선택삭제</button></td>
      <td></td><td></td><td></td>
      <td>상품 총 금액</td>
      <td><h4 id="result"></h1></td>
    </tr>
    <tr>
      <td></td><td></td>
      <td style="padding-left: 100px; padding-top: 100px;">
      <button type="button" type="submit" class="btn btn-dark">결제</button>&emsp;
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