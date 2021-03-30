<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <c:import url="/header.jsp"></c:import>
    
  <div id="notice_content_section">
    <table id="notice_content_table">
      <thead style="border: 1px solid #bfbfbf;">
        <tr class="notice_content_table_title">
          <th style="width: 20%; border-right: 1px solid #bfbfbf;">제목</th>
          <th style="width: 80%;">제목입니다.</th> <!-- ${ dto.notice_title } -->
        </tr>
      </thead>
      <tbody>
        <tr class="notice_border_bottom">
          <td style="width: 30%;">조회수</td>
          <td style="width: 70%;">조회수입니다.</td> <!-- ${ dto.notice_hit } -->
        </tr>
        <tr class="notice_border_bottom">
          <td style="width: 30%;">날짜</td>
          <td style="width: 70%;">날짜입니다.</td> <%-- ${ dto.notice_date } --%>
        </tr>
        <tr class="notice_content_table_content">
          <td style="width: 30%;">내용</td>
          <td style="width: 70%;">내용입니다.</td> <%-- ${ dto.notice_content } --%>
        </tr>
      </tbody>
    </table>
  </div>
  <div id="notice_content_btn">
  	<button onclick="goBack()"> 이 전 </button>
  </div>
  
  
  <c:import url="/footer.jsp"></c:import>