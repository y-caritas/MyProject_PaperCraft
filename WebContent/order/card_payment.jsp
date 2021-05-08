<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Open+Sans&display=swap" rel="stylesheet">
  <style>
    * {
      margin: 0;
      font-family: 'Open Sans', 'Noto Sans KR', sans-serif;
      color: #818181;
    }
    #cardPaymentWrap {
      margin: auto;
      width: 400px;
      font-size: 0.9em;
    }
    #cardPaymentWrap span {
      margin-top: 10px;
      margin-left: 10px;
    }
    #paymentInfo {
      margin: 20px auto;
      background-color: #f1f2f4;
      height: 80px;
      display:flex;
      flex-direction: column;
      justify-content: center;
    }
    #cardInfo {
      border: solid 1px #818181;
      border-collapse: collapse;
      margin: 10px auto;
      height: 200px;
    }
    .cardInfoInput {
      width: 250px;
    }
    .cardInfoInput input{
      margin: auto 10px;
      height: 20px;
    }
    #cardPaymentBtn {
      display: flex;
      justify-content: center;
      margin: 15px auto;
    }
    #cardPaymentBtn > button, #cardPaymentBtn > input {
      font-size: 0.9em;
      padding: 5px;
      border: none;
      cursor: pointer;
      margin: 0 5px;
    }
    #cardPaymentBtn > button:focus, #cardPaymentBtn > input:focus {
      outline: none;
    }
  </style>
</head>
<body>
  <section id="cardPaymentWrap">
    <h3>신용카드 결제</h3>
    <hr>
    <div id="paymentInfo">
    <% SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
       Date time = new Date();
       String nowTime = timeFormat.format(time); %>
      <div><span>가맹점명 :</span><span>PaperCraft</span></div>
      <c:if test="${ param.purchase_total_value < 50000}">
      <div><span>결제금액 :</span><span>${ param.purchase_total_value + 3000}</span></div>
      </c:if>
      <c:if test="${ param.purchase_total_value >= 50000}">
      <div><span>결제금액 :</span><span>${ param.purchase_total_value }</span></div>
      </c:if>
      <div><span>결제일시 :</span><span><%= nowTime %></span></div>
    </div>
    <form action="orderForm.do" method="post" name="popupWin">
      <table id="cardInfo">
        <tr>
          <td style="width: 130px;"><span>명의자 성함</span></td>
          <td class="cardInfoInput"><input name="creditOwner" type="text"></td>
        </tr>
        <tr>
          <td><span>카드 번호</span></td>
          <td class="cardInfoInput"><input name="creditNumber" type="text"></td>
        </tr>
        <tr>
          <td><span>유효 기간</span></td>
          <td class="cardInfoInput"><input name="creditDate" type="text" style="width: 70px;">/<input type="text" style="width: 70px;"></td>
        </tr>
        <tr>
          <td><span>비밀번호</span><span style="margin:0; font-size: 0.7em;">(앞 2자리)</span></td>
          <td class="cardInfoInput"><input name="creditPw" type="password"></td>
        </tr>
        <tr>
          <td><span>일시불/할부</span></td>
          <td class="cardInfoInput">
            <select name="installment" id="" style="margin: auto 10px; height: 25px;">
              <option value="1">일시불</option>
              <option value="2">2개월</option>
              <option value="3">3개월</option>
              <option value="4">4개월</option>
              <option value="5">5개월</option>
              <option value="6">6개월</option>
              <option value="7">7개월</option>
              <option value="8">8개월</option>
              <option value="9">9개월</option>
              <option value="10">10개월</option>
            </select>
          </td>
        </tr>
      </table>
      <div id="cardPaymentBtn">
        <input type="submit" value="결제" onclick="orderFormSubmit(); return false;">
        <button type="button">취소</button>
      </div>
    </form>
  </section>
</body>
<script>
  function orderFormSubmit() {
	  window.opener.name = "openWin";
	  document.popupWin.target = "openWin";
	  document.popupWin.action = "/orderForm.jsp";
	  document.popupWin.submit();
	  opener.document.orderForm.submit();
	  self.close();
  }
</script>
</html>