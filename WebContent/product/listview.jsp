<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8");%>
<% String product_category =  request.getParameter("product_category"); %>


  <c:import url="/header.jsp"></c:import>
  
  <section class="row">
    <div id="ToG" class="col-8"> Product > 
		<c:set var="product_category" value= "<%= product_category %>" />
		<c:choose>
		<c:when test="${ product_category eq '01' }">
		<a href="<%= request.getContextPath() %>/listview.do?product_category=01">무드등</a>  
		</c:when>
		<c:when test="${ product_category eq '02' }">
		<a href="<%= request.getContextPath() %>/listview.do?product_category=02">유리돔</a>
		</c:when>
		<c:when test="${ product_category eq '03' }">
		<a href="<%= request.getContextPath() %>/listview.do?product_category=03">카드/액자</a>
		</c:when>
		<c:when test="${ product_category eq '04' }">
		<a href="<%= request.getContextPath() %>/listview.do?product_category=04">도구</a>
		</c:when>			
		</c:choose>
	</div>
      <div id="ListSelect" class="col-4">
      	<ul>
          <li><a class="orderby" href="#">최신순</a>/</li>
          <li><a class="orderby" href="#">높은 가격순</a>/</li>
          <li><a class="orderby" href="#">낮은 가격순</a></li>
        </ul>
       </div>
  </section>
  	  <div id="LoG">
  <!-- <c:forEach var="product" items="${product_list}">  		   
		   <div class="items">
		   <img class="" src="{product.product_name}" alt="" 
		   onclick="javascript:location.href='
		   <%= request.getContextPath() %>/?product_idx={product.product_idx}">
		   <h5>{product.product_name}</h5>
		   <h5>{product.product_price}</h5>
		   <h5>{product.product_note}</h5>
		   </div>			
		 </c:forEach> -->

      <div class="items">
        <img class="" src="http://via.placeholder.com/220?text=Sample" alt="">
        <h5>product_title</h5>
        <h5>product_price</h5>
        <h5>product_note</h5>
      </div>
      <div class="items">
        <img class="" src="http://via.placeholder.com/220?text=Sample" alt="">
        <h5>product_title</h5>
        <h5>product_price</h5>
        <h5>product_note</h5>
      </div>
      <div class="items">
        <img class="" src="http://via.placeholder.com/220?text=Sample" alt="">
        <h5>product_title</h5>
        <h5>product_price</h5>
        <h5>product_note</h5>
      </div>
      <div class="items">
        <img class="" src="http://via.placeholder.com/220?text=Sample" alt="">
        <h5>product_title</h5>
        <h5>product_price</h5>
        <h5>product_note</h5>
      </div>
      <div class="items">
        <img class="" src="http://via.placeholder.com/220?text=Sample" alt="">
        <h5>product_title</h5>
        <h5>product_price</h5>
        <h5>product_note</h5>
      </div>
      <div class="items">
        <img class="" src="http://via.placeholder.com/220?text=Sample" alt="">
        <h5>product_title</h5>
        <h5>product_price</h5>
        <h5>product_note</h5>
      </div>
      <div class="items">
        <img class="" src="http://via.placeholder.com/220?text=Sample" alt="">
        <h5>product_title</h5>
        <h5>product_price</h5>
        <h5>product_note</h5>
      </div>
      <div class="items">
        <img class="" src="http://via.placeholder.com/220?text=Sample" alt="">
        <h5>product_title</h5>
        <h5>product_price</h5>
        <h5>product_note</h5>
      </div>
      <div class="items">
        <img class="" src="http://via.placeholder.com/220?text=Sample" alt="">
        <h5>product_title</h5>
        <h5>product_price</h5>
        <h5>product_note</h5>
      </div>
        <div class="items">
        <img class="" src="http://via.placeholder.com/220?text=Sample" alt="">
        <h5>product_title</h5>
        <h5>product_price</h5>
        <h5>product_note</h5>
      </div>
    </div>
    <div id="searchBar">
      <form class="form-inline" action="#">
        <input class="form-control" type="search" placeholder="Search" aria-label="Search">
        <button type="button" type="submit" class="btn btn-secondary">검색</button>
      </form>
    </div>
  
 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  
<c:import url="/footer.jsp"></c:import>
