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
    #ordersection {
      width: 1000px;
      margin-left: 15px;
      margin-top: 15px;
    }
    #ordersearchbox {
      border: 1px solid #bfbfbf;
      margin-top: 20px;
    }
    #orderlistsection {
      border-bottom: 1px solid #bfbfbf;
    }
    #detsearchflex {
      display: flex;
      flex-direction: row;
      padding-top: 15px;
    }
    .detsearch {
      width: 495px;
      height: 80px;
      display: flex;
      flex-direction: row;
    }
    .detsearchBtn {
      text-align: center;
      margin-bottom: 15px;
    }
    .detsearchBtn button {
      width: 100px;
      height: 30px;
    }
    #orderlistTable {
      border-collapse: collapse;
      border-spacing: 0;
      width: 1000px;
    }
    .fontRight {
      text-align: right;
      font-size: 14px;
      font-weight: bold;
    }
    #order1search {
      text-align: center;
    }
    #order1search button {
      height: 25px;
      vertical-align: middle;
      width: 60px;
    }
    .margintop {
      margin-top: 20px;
    }
    #orderlistsection > span {
      font-size: 14px;
      font-weight: bold;
    }
    button {
      border: none;
      background-color: #f1f3f4;
      outline: 1;
    }
    button:hover {
      background-color: #bfbfbf;
      color: white;
    }
    input[type=text] {
      width: 80px;
    }
    .flexboxtitle {
      display: flex;
      flex-direction: column;
      width: 150px;
      text-align: center;
    }
    .flexboxtitle span {
      margin-bottom: 5px;
    }
    .flexboxContent {
      display: flex;
      flex-direction: column;
      text-align: center;
      margin-bottom: 15px;
    }
    .flexboxContent input, .flexboxContent1 input {
      margin-bottom: 5px;
    }
    .flexboxContent button {
       margin-bottom: 7px;
       width: 70px;
       margin-left: 15px;
    }
    thead {
      border-top: 2px solid #bfbfbf;
      border-bottom: 2px solid #bfbfbf;
      background-color: #f1f3f4;
      text-align: center;
    }
    thead > tr > td {
      height: 30px;
    }
    .tableContent {
      border-bottom: 1px solid #cfcfcf;
      text-align: center;
    }
    .tableContent > td {
      height: 25px;
    }
    #orderconfirmBtn {
      text-align: center;
      margin-top: 20px;
    }
    #orderconfirmBtn button {
      height: 35px;
    }
    a {
      color: #818181;
      text-decoration: none;
    }
    a:hover {
      color: #bfbfbf;
    }
    hr {
    	margin-top: 10px;
    }

</style>
</head>
<body>
   <div id="sideBarContainer">
      <c:import url="./admin_sideBar.jsp"></c:import>
      
        <div id="ordersection">
    <div id="orderlisthead">
      <h3>| ?????? ??????</h3>
      <hr>
    </div>
    <div id="ordersearchbox">
      <div id="orderlistsection">
        <span>????????????</span>
        <form action="orderlist_simpleSearch.do">
          <div id="order1search">
            <select name="orderselect" id="orderselect" style="height: 26px;">
              <option value="???????????????">?????? ?????????</option>
              <option value="???????????????">?????? ?????????</option>
              <option value="?????????">?????????</option>
              <option value="????????????">????????????</option>
            </select>
            <button type="submit">??? ???</button>
          </div>
        </form>
        <div class="fontRight margintop">
          <span>????????????</span>
        </div>
      </div>
      <!-- ???????????? -->
      <div>
      <form>
        <div id="detsearchflex">
          <div class="detsearch">
            <div class="flexboxtitle">
              <span>?????? ??????</span>
              <span>????????? ?????????</span>
              <span>?????? ??????</span>
            </div>
            <div class="flexboxContent">
              <input type="text" name="p_name">
              <input type="text" name="member_id">
              <select name="member_grade" id="membergrade">
              	<option value="">??????</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
              </select>
            </div>
            <div class="flexboxContent">
               <button formaction="det_p_name.do">??? ???</button>
               <button formaction="det_member_id.do">??? ???</button>
               <button formaction="det_member_grade.do">??? ???</button>
            </div>
            <script>
            </script>
            </div>
            <div class="detsearch">
              <div class="flexboxtitle">
                <span>????????? ??????</span>
                <span>?????? ??????</span>
              </div>
              <div class="flexboxContent1">
                <input type="text" name="member_name"><br>
                <input type="text" name="p_price1" id="p_price1"><span>??? ~ </span><input type="text" name="p_price2" id="p_price2"><span>???</span>
              </div>
              <div class="flexboxContent">
               <button formaction="det_member_name.do">??? ???</button>
               <button formaction="det_p_price.do">??? ???</button>
            	</div>
          </div>
        </div>
        </form>
      </div>
    </div>
    <span>????????????: 1. ???????????? 2. ???????????? 3. VIP?????? 4. ?????????</span><br>
    <br>
    <div id="checkboxsection">
    <table id="orderlistTable">
      <thead>
        <tr class="allCheck">
          <!-- <td><input type="checkbox" name="check_all" id="check_all"></td> -->
          <td>??????</td>
          <td>?????? ??????</td>
          <td>?????? ??????</td>
          <td>?????? ??????</td>
          <td>??????</td>
          <td>?????????</td>
          <td>?????? ??????</td>
          <td>?????? ??????</td>
        </tr>
      </thead>
      <!-- while -->
      <c:forEach var="dto" items="${ order_list }" varStatus="status">
      <tr class="tableContent">
        <!-- <td><input type="checkbox" name="order_statuschk" id="order_statuschk" class="check_btn"></td> -->
        <td>${status.count}</td>
        <fmt:formatDate value="${dto.order_date}" pattern="yyyy-MM-dd" var="reg" />
        <td style="height: 35px;">${reg}</td>
        <td>${dto.order_p_name}</td>
        <td>${dto.order_p_price}</td>
        <td><a href="orderContentView.do?order_idx=${dto.order_idx}">${dto.member_name}</a></td>
        <td><a href="orderContentView.do?order_idx=${dto.order_idx}">${dto.member_id}</a></td>
        <td>${dto.member_grade}</td>
        <td>${dto.order_status}</td>
        <c:if test ="${ status.last }">
     	    <div class="fontRight">
    			  <span class="tabletitle">??? ${status.count} ?????? ?????? ????????? ????????????.</span>
   				 </div>
        </c:if>
      </tr>
      </c:forEach>
        <c:if test="${empty order_list}">
        		<td colspan="8" style="text-align: center; padding-top: 15px;">????????? ????????? ????????????.</td>
        </c:if>
    </table>
    </div>
    <!-- <div id="orderconfirmBtn">
      <button type="button" onclick="location.href='orderstatusCH.do'">?????? ?????? ??????</button>
    </div> -->
  </div>
      
   </div>
</body>
</html>