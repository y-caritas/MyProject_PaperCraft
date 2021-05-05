<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

<link href="<%= request.getContextPath() %>/CSS/adminSideBarCss.css?ver=1" rel="stylesheet">

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #orderlistwrap {
      width: 1000px;
      margin-left: 15px;
      margin-top: 15px;
    }
    table {
      border-collapse: collapse;
      border-spacing: 0;
      width: 800px;
      border-top: 2px solid #bfbfbf;
      color: black;
      margin-top: 25px;
    }
    .orderlistTitle {
      background-color: #bfbfbf;
      width: 18%;
      height: 40px;
      text-align: center;
    }
    table tr {
      border-bottom: 1px solid rgb(143, 143, 143);
    }
    .orderlistContent {
      padding-left: 20px;
    }
    .orderlistContent > select {
      height: 30px;
    }
    #orderBtn {
      text-align: center;
      margin-top: 20px;
      padding-right: 30px;
    }
    #orderBtn button {
      width: 60px;
      height: 30px;
      margin: 0 5px auto 5px;
      border: 1px solid #bfbfbf;
      background-color: #f1f2f4;
      outline: 0;
    }
    #orderBtn button:hover {
      background-color: #bfbfbf;
      color: white;
    }

</style>
</head>
<body>
	<div id="sideBarContainer">
		<c:import url="./admin_sideBar.jsp"></c:import>
		
		  <div id="orderlistwrap">
    <div>
      <h3>| 주문 수정</h3>
    </div>
    <form>
    <table>
      <tr>
        <td class="orderlistTitle">아이디</td>
        <td class="orderlistContent">${ dto.member_id }</td>
        <input type="hidden" name="order_idx" value="${dto.order_idx}">
      </tr>
      <tr>
        <td class="orderlistTitle">주문날짜</td>
        <fmt:formatDate value="${dto.order_date}" pattern="yyyy-MM-dd" var="reg" />
        <td class="orderlistContent">${reg}</td>
      </tr>
      <tr>
        <td class="orderlistTitle">상품 이름</td>
        <td class="orderlistContent">${ dto.order_p_name }</td>
      </tr>
      <tr>
        <td class="orderlistTitle"d>이름</td>
        <td class="orderlistContent">${ dto.member_name }</td>
      </tr>
      <tr>
        <td class="orderlistTitle">주소</td>
        <td class="orderlistContent">서울시 노원구 상계3동</td>
      </tr>
      <tr>
        <td class="orderlistTitle">회원 등급</td>
        <td class="orderlistContent">
          <select name="member_grade" id="membergrade">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
          </select>
        </td>
      </tr>
      <tr>
        <td class="orderlistTitle">상품 금액</td>
        <td class="orderlistContent">${ dto.order_p_price }</td>
      </tr>
      <tr>
        <td class="orderlistTitle">결제 방법</td>
        <td class="orderlistContent">카드결제</td>
      </tr>
      <tr>
        <td class="orderlistTitle">주문 상태</td>
        <td class="orderlistContent"><select name="order_status">
           <option value="주문확인중">주문확인중</option>
           <option value="배송준비중">배송준비중</option>
           <option value="배송중">배송중</option>
           <option value="배송완료">배송완료</option>
        </select>
      </td>
      </tr>
    </table>
    <div id="orderBtn">
      <button onclick="submitbtn()" formaction="order_modify.do">수정</button>
      <button type="button" onclick="location.href='admin_orderlist.do'">목록</button>
    </div>
    </form>
  <script>
  	function submitbtn() {
  		alert("수정되었습니다.");
  	}
  </script>
</body>
</html>