<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8");%>
<% String product_category =  request.getParameter("product_category"); %>
<% String orderby =  request.getParameter("orderby"); %>
<% String search_name =  request.getParameter("search_name");%>



  <c:import url="/header.jsp"></c:import>
  
  <section class="row">
    <div id="ToG" class="col-8"> Product > 
		<c:set var="product_category" value= "<%= product_category %>" />
		<c:choose>
		<c:when test="${ product_category eq '01' }">
		<a href="<%= request.getContextPath() %>/listview.do?product_category=01&orderby=01">무드등</a>  
		</c:when>
		<c:when test="${ product_category eq '02' }">
		<a href="<%= request.getContextPath() %>/listview.do?product_category=02&orderby=01">유리돔</a>
		</c:when>
		<c:when test="${ product_category eq '03' }">
		<a href="<%= request.getContextPath() %>/listview.do?product_category=03&orderby=01">카드/액자</a>
		</c:when>
		<c:when test="${ product_category eq '04' }">
		<a href="<%= request.getContextPath() %>/listview.do?product_category=04&orderby=01">도구</a>
		</c:when>			
		</c:choose>
	</div>
      <div id="ListSelect" class="col-4">
      	<ul>
      	<c:choose>
		<c:when test="${not empty search_name}">
		  <li><a class="orderby" href="<%= request.getContextPath() %>/listviewsearchDate.do?product_category=<%= product_category %>&search_name=<%= search_name %>">최신순</a>/</li>
          <li><a class="orderby" href="<%= request.getContextPath() %>/listviewsearchDesc.do?product_category=<%= product_category %>&search_name=<%= search_name %>">높은 가격순</a>/</li>
          <li><a class="orderby" href="<%= request.getContextPath() %>/listviewsearchAsc.do?product_category=<%= product_category %>&search_name=<%= search_name %>">낮은 가격순</a></li>
		</c:when>		
		<c:otherwise>
		  <li><a class="orderby" href="<%= request.getContextPath() %>/listview.do?product_category=<%= product_category %>&orderby=02">최신순</a>/</li>
          <li><a class="orderby" href="<%= request.getContextPath() %>/listview.do?product_category=<%= product_category %>&orderby=03">높은 가격순</a>/</li>
          <li><a class="orderby" href="<%= request.getContextPath() %>/listview.do?product_category=<%= product_category %>&orderby=04">낮은 가격순</a></li>
		</c:otherwise>
		</c:choose>          
        </ul>
       </div>
  </section>
  	  <div id="LoG">
  		<c:forEach var="product" items="${product_list}">  		   
		   <div class="items">
		   <img src="${product.product_listImg}" style="width:300px; height:300px;" onclick="javascript:location.href='detailview.do?product_category=<%= product_category %>&product_idx=${product.product_idx}'">
		   <br><br><div style="text-align: center;"><b style="font-size: 18pt;">${product.product_name}</b></div><h5 style="font-size: 12pt;">${product.product_price}원</h5>		   
		   </div>			
		 </c:forEach>

      
    </div>
    <div id="searchBar">
      <form class="form-inline" action="listviewsearch.do" method="POST">
      	<input name="product_category" value="<%= product_category %>" type="hidden">
        <input name="search_name" class="form-control" type="search" placeholder="Search" aria-label="Search">
        <button type="submit" class="btn btn-secondary">검색</button>
      </form>
    </div>
  
 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  
<c:import url="/footer.jsp"></c:import>
