<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <form action="">
    <table>
      <tr>
        <td class="orderlistTitle">아이디</td>
        <td class="orderlistContent">user</td>
      </tr>
      <tr>
        <td class="orderlistTitle">주문날짜</td>
        <td class="orderlistContent">2020-08-26-14시</td>
      </tr>
      <tr>
        <td class="orderlistTitle">상품 이름</td>
        <td class="orderlistContent">DIY 카드 패키지</td>
      </tr>
      <tr>
        <td class="orderlistTitle">상품 금액</td>
        <td class="orderlistContent">65,000</td>
      </tr>
      <tr>
        <td class="orderlistTitle"d>이름</td>
        <td class="orderlistContent">홍길동</td>
      </tr>
      <tr>
        <td class="orderlistTitle">주소</td>
        <td class="orderlistContent">서울시 노원구 상계3동</td>
      </tr>
      <tr>
        <td class="orderlistTitle">회원 등급</td>
        <td class="orderlistContent">
          <select name="membergrade" id="membergrade">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
          </select>
        </td>
      </tr>
      <tr>
        <td class="orderlistTitle">성별</td>
        <td class="orderlistContent"><input type="checkbox">남성 <input type="checkbox">여성</td>
      </tr>
      <tr>
        <td class="orderlistTitle">구매 금액</td>
        <td class="orderlistContent">user</td>
      </tr>
      <tr>
        <td class="orderlistTitle">결제 방법</td>
        <td class="orderlistContent">카드결제</td>
      </tr>
      <tr>
        <td class="orderlistTitle">주문 상태</td>
        <td class="orderlistContent"><select name="order" id="">
          <option value="1">주문 확인중</option>
          <option value="2">배송 준비중</option>
        </select>
      </td>
      </tr>
    </table>
    <div id="orderBtn">
      <button type="submit">수정</button>
      <button type="button" onclick="location.href='./admin_orderList.jsp'">목록</button>
    </div>
  </form>
  </div>
		
	</div>
</body>
</html>