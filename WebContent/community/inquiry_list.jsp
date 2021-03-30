<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/header.jsp"></c:import>

<section id="inquiryListWrap">
    <h3 class="categoryTitle">주문제작 / 문의</h3>
    <table id="inquiryListTable">
      <tr class="inquiryTr">
        <th style="width:10%">번호</th>
        <th style="width:70%">제목</th>
        <th style="width:20%">작성자</th>
      </tr>
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
      <button onclick="location.href='#'">문의글 쓰기</button>
    </div>
  </section>
  
<c:import url="/footer.jsp"></c:import>