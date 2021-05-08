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
    <c:set var="i" value="${i+1 }" />
  <input type="checkbox" id="answer${i+1}">

  <label for="answer${i+1 }""> Q.  ${dto.faq_title}  <em>  </em></label>
  <div><p> ${dto.faq_content} </p></div> 
    </c:forEach>
   </div>

  
 

  <c:import url="/footer.jsp"></c:import>