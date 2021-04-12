<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<c:import url="/header.jsp"></c:import>



  <div class="categoryTitle">
      <h2>주문내역</h2>
      <hr class="dividingLine">
    </div>


<div id="sidebar">

<br>
<div class="My-content">
<b>쇼핑정보</b><br><br>
<a href=""> &nbsp;  주문내역</a><br>
<a href=""> &nbsp;  장바구니</a><br>
<br>
<b>게시판이용</b> <br><br>
<a href=""> &nbsp;  나의문의</a> <br>
<br>
<b>계정관리</b><br><br>
<a href=""> &nbsp;  개인정보수정</a>


</div>



</div>


<section id="inquiryListWrap">


<form action="">
  <table id="inquiryListTable">
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

<c:import url="/footer.jsp"></c:import>