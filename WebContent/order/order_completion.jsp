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
      <td class="background-footer" style="width:5%; text-align: center;">번호</td>
      <td class="background-footer" style="width:70%; text-align: center;">상품 정보</td>
      <td class="background-footer" style="width:5%; text-align: center;">수량</td>
      <td class="background-footer" style="width:10%; text-align: center;">판매 가격</td>
      <td class="background-footer" style="width:10%; text-align: center;">배송비</td>
    </tr>
    <c:forEach var="dto" items="${ orderList }">
      <c:set var="i" value="${ i+1 }" />
      <tr>
        <td>${ i }</td>
        <td>
          <div style="display: flex;">
            <img src="${dto.img}" alt="상품 이미지">
            <div style="margin-left: 10px;">
              <span style="display: block;">${dto.productName}</span>
              <span style="display: block;">${dto.optionName}</span>
            </div>
            <div style="margin: 0 10px 0 auto;">
              <span style="display: block;">${dto.productPrice}</span>
              <span style="display: block;">${dto.optionPrice}</span>
            </div>
          </div>
        </td>
        <td>${dto.quantity}</td>
        <td>${dto.totalPrice}</td>
        <td>${dto.deliveryPrice}</td>
      </tr>
    </c:forEach>
  </table>
  <p>주문자 정보</p>
  <table class="orderCompletionTable orderInfo">
    <tr>
      <td class="background-footer">이름</td>
      <td>${dto.member_name}</td>
    </tr>
    <tr>
      <td class="background-footer">연락처</td>
      <td>${dto.member_phone}</td>
    </tr>
  </table>
  <p>배송 정보</p>
  <table class="orderCompletionTable recipientInfo">
    <tr>
      <td class="background-footer">이름(회사)</td>
      <td>${dto.recipient_name}</td>
    </tr>
    <tr>
      <td class="background-footer">주소</td>
      <td>${dto.recipient_address}</td>
    </tr>
    <tr>
      <td class="background-footer">휴대폰</td>
      <td>${dto.recipient_phone}</td>
    </tr>
    <tr>
      <td class="background-footer">요청사항</td>
      <td>${dto.recipient_request}</td>
    </tr>
  </table>
  <p>결제 정보</p>
  <table class="orderCompletionTable paymentInfo">
    <tr>
      <td class="background-footer">결제 방법</td>
      <td>${dto.paymentOption}</td>
    </tr>
    <tr>
      <td class="background-footer">결제 금액</td>
      <td>${dto.payment}</td>
    </tr>
  </table>
  <div id="orderCompletionBtn">
    <button onclick="location.href='<%= request.getContextPath()%>/main.jsp'">확인</button>
  </div>
</section>

<c:import url="/footer.jsp"></c:import>