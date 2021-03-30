<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">


<c:import url="/header.jsp"></c:import>

<div class="faqhead" > 

<h2>FAQ</h2>

<hr class="faq-hr">


<h6>자주하는 질문 </h6> 
</div>


 <%// 실제 데이터용   %>
 <div class="accordian">
  <c:forEach var="dto" items="${ faq_list }">
  <input type="checkbox" id="answer01">
  <label for="answer01"> Q.  ${dto.faq_title} ? <em>  </em></label>
  <div><p> ${dto.faq_content} </p></div> 
  </c:forEach>
   </div>
  
  
 <%// view 용 컨텐츠  %> 
   <div class="accordian">
    <input type="checkbox" id="answer02">
    <label for="answer02"> 컨텐츠 제목 <em>  </em></label>
    <div><p> 컨텐츠 내용 </p></div> 
     </div>
     <div class="accordian">
      <input type="checkbox" id="answer03">
      <label for="answer03"> 컨텐츠 제목 <em>  </em></label>
      <div><p> 컨텐츠 내용 </p></div> 
       </div>
       
        <div class="accordian">
    <input type="checkbox" id="answer04">
    <label for="answer04"> 컨텐츠 제목 <em>  </em></label>
    <div><p> 컨텐츠 내용 </p></div> 
     </div>

  <c:import url="/footer.jsp"></c:import>