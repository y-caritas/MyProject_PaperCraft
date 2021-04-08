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
  
    <table id="inquiryListTable">
      <tr class="inquiryTr">
        <th style="width:10%">주문일자</th>
        <th style="width:10%"></th>
        <th style="width:40%">상품정보</th>
        <th style="width:10%">수량</th>
        <th style="width:10%">구매금액</th>
        <th style="width:10%">주문현황</th>
      </tr>
      
      <%-- view 용 --%>
      
          <tr class="inquiryTr">     
          <td>2021-03-21</td>
          <td><img src="http://placehold.it/150" /> </td>         
           <td style="text-align: left;"><a href="#"><h6><b>취미박스 DIY 키트 페이퍼커팅 조명 만들기 [normal ver.]</b></h6></a>          
          <small>공예커터칼날 (+3,000)</small> </td>
          <td>${dto.order_p_count}1</td>
          <td>25,500</td>
          <td><div>배송중</div></td>
      </tr>
       <tr class="inquiryTr">     
          <td>2021-03-21</td>
          <td> <img src="http://placehold.it/150" /></td>         
            <td style="text-align: left;"><a href="#"><h6><b>취미박스 DIY 키트 페이퍼커팅 조명 만들기 [normal ver.]</b></h6></a>          
         
          <td>${dto.order_p_count}1</td>
          <td>22,500</td>
          <td>
          <div id ="order-chk">주문확인중<br>	
          
           <button id="order-btn" onclick="order_delete.do">주문취소 </button></div>
          </td>
      </tr>
       <tr class="inquiryTr">     
          <td>2021-03-21</td>
          <td> <img src="http://placehold.it/150" /></td>         
            <td style="text-align: left;"><h6><a href="#"> <b>취미박스 DIY 키트 페이퍼커팅 조명 만들기 [normal ver.]</b></a></h6>          
          
          <td>${dto.order_p_count}1</td>
          <td>22,500</td>
          <td><div>배송완료</div></td>
      </tr>
      
      <%-- EL 표현식 --%>   
      
       <tr class="inquiryTr">
          <c:forEach var="dto" items="${ orderList }">
        
          <td> <fmt:formatDate value="${dto.order_date}" pattern="yyyy-MM-dd" /></td>
          <td> ${dto.order_p_img}</td>          
          <td style="text-align: left;"><div><a href="#">${dto.order_p_name}</a></div></td>
         							    <div>${dto.order_o_name}</div>
          <td><div>${dto.order_p_count}</div></td>
          
           <td><fmt:formatNumber value="${dto.order_total }" pattern="#,###원" /></td>                                       
          <td>
          <c:choose>
    	<c:when test="${dto.order_statuse == 0}">
    		<b>주문확인중</b>
    	    <p> <button style="border:none" onclick="order_delete.do">주문취소 </button></p>
    	</c:when>
    	<c:when test="${dto.order_statuse == 1}">
    		<b>배송중</b>
    	</c:when>
    	<c:when test="${dto.order_statuse == 2}">
    		<b>배송완료</b>
    	</c:when>  	
        <c:otherwise>
       		<b>관리자에게 문의하세요</b>
		</c:otherwise>
    </c:choose>
                  
        </c:forEach>
      </tr>
      </table>
      </section>

<c:import url="/footer.jsp"></c:import>