<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/header.jsp"></c:import>

<section id="orderCompletionWrap">
  <div class="categoryTitle">
    <h2>주문 완료</h2>
    <hr class="dividingLine">
    <p>주문이 완료되었습니다. 이용해주셔서 감사합니다.</p>
    <p>주문 내역은 [마이 페이지 > 주문내역]에서 다시 확인 할 수 있습니다.</p>
  </div>
  <p>주문번호 : <span></span></p>
  <table class="orderCompletionTable orderDetail">
    <tr>
      <td class="background-footer" style="width:25%; text-align: center;">주문 번호</td>
      <td class="background-footer" style="width:55%; text-align: center;">상품 정보</td>
      <td class="background-footer" style="width:20%; text-align: center;">판매 가격</td>
    </tr>
      <tr>
        <td style="text-align:center;">${ orderDto.order_idx }</td>
        <td>
          <div style="display: flex;">
            <img src="http://localhost:8081${ p_img }" alt="상품 이미지" style="width:200px; height:100px;">
            <div style="margin-left: 10px; align-self: center;">
              <span style="display: block;">${ orderDto.order_p_name }</span>
            </div>
          </div>
        </td>
        <td style="text-align:center;">${ orderDto.order_p_price }원</td>
      </tr>
  </table>
  <p>주문자 정보</p>
  <table class="orderCompletionTable orderInfo">
    <tr>
      <td class="background-footer">이름</td>
      <td>${ ordererName}</td>
    </tr>
    <tr>
      <td class="background-footer">연락처</td>
      <td>${ ordererPhone }</td>
    </tr>
  </table>
  <p>배송 정보</p>
  <table class="orderCompletionTable recipientInfo">
    <tr>
      <td class="background-footer">이름(회사)</td>
      <td>${ orderDto.member_name }</td>
    </tr>
    <tr>
      <td class="background-footer">주소</td>
      <td>${ orderDto.member_address }</td>
    </tr>
    <tr>
      <td class="background-footer">휴대폰</td>
      <td>${ orderDto.member_phone }</td>
    </tr>
    <tr>
      <td class="background-footer">요청사항</td>
      <td>${ orderDto.member_request }</td>
    </tr>
  </table>
  <p>결제 정보</p>
  <table class="orderCompletionTable paymentInfo">
    <tr>
      <td class="background-footer">결제 방법</td>
      <td>${ orderDto.paymentOption }</td>
    </tr>
    <tr>
      <td class="background-footer">결제 금액</td>
      <td>${ orderDto.order_p_price }원</td>
    </tr>
  </table>
  <form action="orderCompletion.do" method="post">
    <div id="orderCompletionBtn">
      <input type="hidden" name="cart_idx1" value="${ cart_idx1 }">
      <input type="hidden" name="cart_idx2" value="${ cart_idx2 }">
      <input type="hidden" name="cart_idx3" value="${ cart_idx3 }">
      <button type="submit">확인</button>
    </div>
  </form>
</section>

<c:import url="/footer.jsp"></c:import>