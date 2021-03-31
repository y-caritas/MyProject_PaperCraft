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
      
      <!-- view용 -->
      <tr class="inquiryTr">
        <td>1</td>
        <td style="text-align: left;"><a href="<%=request.getContextPath()%>/community/inquiry_content.jsp">view용 문의</a></td>
        <td>hong</td>
      </tr>
      
      <!-- DB 연동용 -->
      <tr class="inquiryTr">
        <c:forEach var="dto" items="${ inquiryList }">
          <td>${dto.inquiryIdx}</td>
          <td style="text-align: left;"><a href="#">${dto.inquiryTitle}</a></td>
          <td>${dto.inquirywriter}</td>
        </c:forEach>
      </tr>
      
    </table>
    <div id="inquiryBtn">
      <c:if test="${ session.memberId != null }">
        <button onclick="location.href='#'">나의 문의 보기</button>
      </c:if>
      <c:if test="${ session.memberId == null }">
        <button onclick="location.href='#'">나의 문의 보기</button>
      </c:if>
      <button onclick="location.href='<%= request.getContextPath() %>/community/inquiry_write.jsp'">문의글 쓰기</button>
    </div>
  </section>
  
<c:import url="/footer.jsp"></c:import>