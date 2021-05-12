<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 
<c:import url="/header.jsp"></c:import>
<style>
#order-btn{
 border: none;
 }
#order-chk{
margin-top:10px;
padding-top:10px;
}

.sidebar{

margin-top:100px;
max-width:200px;
margin-left:20px;
border-radius:10px;
position: sticky;
top:0;

}

#inquiryListWrap{
max-width:1200px;
width:100%;
margin:0 auto;

}
.sidebar a {

text-decoration: none;
color: #818181;
}
.sidebar a:hover{
text-decoration: none;
color: #818181;
}


.section-wrap {
margin-left: 30px;
padding-left: 40px;
text-align: center;

}

#writeBtn{
margin: 0 auto;	
text-align: right;
width: 1000px;

}

    #writeBtn button {
      border: solid 0.5px #e3e3e4;
      font-size: 0.9em;
      padding: 5px;
      cursor: pointer;
    }
    
 a {

text-decoration: none;
color: #818181;
}

a:hover{
text-decoration: none;
color: #818181;
}
  
</style>





<div class="container-fluid">
  <div class="row flex-nowrap">


<div class="col-md-2 sidebar">
<!-- 사이드 바 메뉴-->
  <!-- 패널 타이틀1 -->
<div class="panel panel-info">
    <div class="panel-heading">
     
    </div>
    <!-- 사이드바 메뉴목록1 -->
    <ul class="list-group">
      <li class="list-group-item"><b>&nbsp&nbsp쇼핑정보</b></br></br>
      <a href="order_detail.do">&nbsp&nbsp  주문내역</a></br>
       <a href="cart.do">&nbsp&nbsp 장바구니</a></br>
        </li>
      
      
      <li class="list-group-item"><b>&nbsp&nbsp게시판이용</b></br></br>
         <a href="one_to_one_inquiry.do">&nbsp&nbsp 1:1문의</a></br>
         <a href="customizeList.do">&nbsp&nbsp 주문제작</a></br>
      
      
      </li>
      <li class="list-group-item"><b>&nbsp&nbsp계정관리</b></br></br>
         <a href="<%= request.getContextPath() %>/myPage/check_pw.jsp">&nbsp&nbsp 정보수정</a></br>
         <p></p>
          
       
      
      
      </li>
    </ul>
</div>
</div>




<div class="col-md-8  ">

<div class="section-wrap">
  <div class="categoryTitle">
      <h2>주문내역</h2>
      <hr class="dividingLine">
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
      
    
      
      <%-- EL 표현식 --%>   
      <c:forEach var="dto" items="${ myPageOrder }">
       <tr class="inquiryTr">
          
        
          <td> <fmt:formatDate value="${dto.order_date}" pattern="yyyy-MM-dd" /></td>
          <td><img src="${dto.order_p_img}" style="width:150px; height:100px;"/></td>          
          <td id="proName" style="text-align: left;"><div><h6><b><a href="#">${dto.order_p_name}</a></b></h6></div>
           <c:choose>
         	<c:when test ="${dto.product_idx3 != null && dto.product_idx3 == null  }">  <div>외 1건 </div> </c:when>
         	<c:when test ="${dto.product_idx3 != null }">  <div><small>외 2건</small> </div> </c:when> 
         	</c:choose>
          </td>
         
          <td><div>${dto.order_p_count1}</div></td>
          
           <td><fmt:formatNumber value="${dto.order_p_price }" pattern="#,###원" /></td>                                       
          <td>${dto.order_status}    </td>
          
                  
    
      </tr>
          </c:forEach>
      </table>
      </section>
   </div>
   
   <div class="col-md-2">
</div>
</div>
     </div>
     </div>
      

      
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

<c:import url="/footer.jsp"></c:import>