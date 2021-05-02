<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/header.jsp"></c:import>

<section id="inquiryListWrap">
    <div class="categoryTitle">
      <h2>주문제작 / 문의</h2>
      <hr class="dividingLine">
    </div>
    <table id="inquiryListTable">
      <tr class="inquiryTr">
        <th style="width:10%">번호</th>
        <th style="width:70%">제목</th>
        <th style="width:20%">작성자</th>
      </tr>
      <c:forEach var="dto" items="${ inquiryList }">
      <tr class="inquiryTr">
        <td>${dto.inquiry_idx}</td>
        <td style="text-align: left; cursor: pointer;"><a onclick="comparePW(${ dto.inquiry_idx })">${dto.inquiry_title}</a></td>
        <td>${dto.inquiry_writer}</td>
      </tr>
      </c:forEach>
    </table>
    <script>
      var popupWidth = 500;
      var popupHeight = 210;
      var popupX = (window.screen.width / 2) - (popupWidth / 2);
      var popupY = (window.screen.height / 2) - (popupHeight / 2);
      
      function comparePW( num ) {
      	window.open("<%= request.getContextPath()%>/community/inquiryComparePW.jsp?inquiry_idx="+num, "새창", "width=500, height=210, left=" + popupX + ", top=" + popupY + ", toolbar=no, menubar=no, scrollbars=no, resizable=yes");
      }
    </script>
    <div id="inquiryBtn" style="width:1000px;">
      <c:if test="${ session.member_id != null }">
        <button onclick="location.href='#'">나의 문의 보기</button>
      </c:if>
      <c:if test="${ session.member_id == null }">
        <button onclick="location.href='#'">나의 문의 보기</button>
      </c:if>
      <button onclick="location.href='<%= request.getContextPath() %>/community/inquiry_write.jsp'">문의글 쓰기</button>
    </div>
  </section>
  
<c:import url="/footer.jsp"></c:import>