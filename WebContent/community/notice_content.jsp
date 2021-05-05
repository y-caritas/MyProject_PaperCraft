<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

  <c:import url="/header.jsp"></c:import>
    
   <div class="categoryTitle" > 

      <h2>공지사항</h2>

      <hr class="dividingLine">
 
   </div>
    
  <div id="notice_content_section">
    <table id="notice_content_table">
      <thead style="border: 1px solid #bfbfbf;">
        <tr class="notice_content_table_title">
          <th class="background-footer" style="width: 30%; height: 35px; border-right: 1px solid #bfbfbf;">제목</th>
          <th class="text_left" style="width: 70%;">${ dto.notice_title} </th>
        </tr>
      </thead>
      <tbody>
        <tr class="notice_border_bottom">
          <td class="background-footer" style="width: 30%; height: 35px;">조회수</td>
          <td class="text_left" style="width: 70%;">${ dto.notice_hit }</td> 
        </tr>
        <tr class="notice_border_bottom">
          <td class="background-footer" style="width: 30%; height: 35px;">날짜</td>
          <fmt:formatDate value="${dto.notice_date}" pattern="yyyy-MM-dd" var="reg" />
          <td class="text_left" style="width: 70%;">${ reg }</td>
        </tr>
        <tr class="notice_content_table_content">
          <td class="background-footer" style="width: 30%; height: 35px;">내용</td>
          <td class="text_left" style="width: 70%;">${ dto.notice_content }</td> 
        </tr>
      </tbody>
    </table>
  </div>
  <div id="notice_content_btn">
     <a href="noticelist.do"><button> 목 록 </button></a>
  </div>
  
  
  <c:import url="/footer.jsp"></c:import>