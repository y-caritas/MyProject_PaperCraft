<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <tr style="text-align: center; border-bottom: 1px solid #f1f2f4">
          <c:forEach var="dto" items="${ noticelist }">
            <td style="height: 35px;">${dto.notice_idx}</td>
            <td class="notice_table_title" style="height: 35px;"><a href="notice_view.do?notice_idx=${dto.notice_idx}">${dto.notice_title}</a></td>  <!-- 앵커태그 notice_view.do?notice_idx=${dto.notice_idx} -->
            <td style="height: 35px;">${dto.notice_date}</td>
          </c:forEach>
        </tr>
      </tbody>
    </table>
  </div>

    <c:import url="/footer.jsp"></c:import>