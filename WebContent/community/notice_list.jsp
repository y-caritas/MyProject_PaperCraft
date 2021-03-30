<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <c:import url="/header.jsp"></c:import>
  
<div class="noticehead" > 

	<h2>공지사항</h2>

	<hr class="notice-hr">
 
</div>

  <div id="notice_view_table">
    <table id="notice_view_table2">
      <thead>
        <tr style="background-color: #e3e3e4; text-align: center; font-size: 18px;">
         <th style="padding: 8px 8px; ">번호</th>
          <th style="padding: 8px 8px; ">제목</th>
          <th style="padding: 8px 8px; ">게시일</th>
        </tr>
      </thead>
      <tbody>
      <!-- view용 -->
        <tr style="text-align: center; border-bottom: 1px solid #f1f2f4">
          <td style="padding: 5px 5px;">1</td>
          <td class="notice_table_title" style="padding: 5px 5px;"><a href="<%= request.getContextPath() %>/community/notice_content.jsp">공지사항 입니다.</a></td>
          <td style="padding: 5px 5px;">날짜</td>
        </tr>
      
        <tr style="text-align: center; border-bottom: 1px solid #f1f2f4">
          <td style="padding: 5px 5px;">2</td>
          <td class="notice_table_title" style="padding: 5px 5px;"><a href="<%= request.getContextPath() %>/community/notice_content.jsp">공지사항2</a></td>
          <td style="padding: 5px 5px;">날짜</td>
        </tr>
        
      <!-- 데이터용 -->
        <tr style="text-align: center; border-bottom: 1px solid #f1f2f4">
          <c:forEach var="dto" items="${ noticeList }">
            <td style="padding: 5px 5px;">${dto.notice_idx}</td>
            <td class="notice_table_title" style="padding: 5px 5px;"><a href="#">${dto.notice_title}</a></td>  <!-- 앵커태그 notice_view.do?notice_idx=${dto.notice_idx} -->
            <td style="padding: 5px 5px;">${dto.notice_date}</td>
          </c:forEach>
      </tbody>
    </table>
  </div>

    <c:import url="/footer.jsp"></c:import>