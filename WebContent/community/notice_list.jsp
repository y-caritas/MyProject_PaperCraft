<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

  <c:import url="/header.jsp"></c:import>
  
<div class="categoryTitle" > 

   <h2>공지사항</h2>

   <hr class="dividingLine">
 
</div>

  <div id="notice_view_table">
    <table id="notice_view_table2">
      <thead>
        <tr id="notice_view_title" style="background-color: #e3e3e4; text-align: center; ">
         <th style="height: 38px;">번호</th>
         <th style="height: 38px;">제목</th>
         <th style="height: 38px;">게시일</th>
        </tr>
      </thead>
      <tbody>
      <c:forEach var="dto" items="${ noticelist }">
        <tr style="text-align: center; border-bottom: 1px solid #f1f2f4">
          	<td style="height: 35px;">
            	<c:if test="${ dto.notice_pin eq 1 }"><img src="<%= request.getContextPath() %>/img/adminListImportant.png"></c:if>
            	<c:if test="${ dto.notice_pin ne 1 }">${dto.notice_idx}</c:if>
            </td>
            <td class="notice_table_title" style="height: 35px;"><a href="notice_view.do?notice_idx=${dto.notice_idx}">${dto.notice_title}</a></td>  <!-- 앵커태그 notice_view.do?notice_idx=${dto.notice_idx} -->
            <fmt:formatDate value="${dto.notice_date}" pattern="yyyy-MM-dd" var="reg" />
            <td style="height: 35px;">${reg}</td>
        </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>

    <c:import url="/footer.jsp"></c:import>