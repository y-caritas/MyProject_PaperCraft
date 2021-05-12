<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/header.jsp"></c:import>

  <section id="inquiryContentWrap">
    <div class="categoryTitle">
      <h2>주문제작 / 문의</h2>
      <hr class="dividingLine">
    </div>
    <table id="inquiryContentTable">
      <tr>
        <td class="background-footer" style="height: 40px;">제목</td>
        <td>
          <span>${dto.inquiry_title}</span>
        </td>
      </tr>
      <tr>
        <td class="background-footer" style="height: 40px;">문의 종류</td>
        <td>
          <c:if test="${dto.inquiry_category == 1}">
            <span>주문제작</span>
          </c:if>
          <c:if test="${dto.inquiry_category == 2}">
            <span>1:1문의</span>
          </c:if>
        </td>
      </tr>
      <tr>
        <td class="background-footer" style="height: 40px;">작성자</td>
        <td>
          <span>${dto.inquiry_writer}</span>
        </td>
      </tr>
      <tr>
        <td class="background-footer" style="height: 40px;">비밀번호</td>
        <td>
          <input type="password" name="inquiry_pw" value="${dto.inquiry_pw}" style="height: 20px; margin-left: 10px; border: solid 1px #c7c7c7;" readonly>
        </td>
      </tr>
      <tr>
        <td class="background-footer" style="height:300px;">내용</td>
        <td>
          <div style="margin-left: 10px;">${ dto.inquiry_content }</div>
          <c:if test="${ dto.inquiry_img != null && dto.inquiry_img != ''}">
          <img src="http://localhost:8081${ dto.inquiry_img }" alt="이미지 없음" style="width: 500px; height: 300px; margin-left: 10px;">
          </c:if>
        </td>
      </tr>
      <tr>
        <td class="background-footer" style="height:200px;">답변</td>
        <c:if test="${ answerDto.inquiry_a_content != null && answerDto.inquiry_a_content != ''}">
        <td>
          <div style="margin-left: 10px;">${ answerDto.inquiry_a_content }</div>
        </td>
        </c:if>
        <c:if test="${ answerDto.inquiry_a_content == null || answerDto.inquiry_a_content == ''}">
        <td>
          <div style="margin-left: 10px;">답변 준비중입니다.<br />빠른 답변을 원하시면 고객센터로 연락 부탁드립니다.<br />tel)02-123-4567</div>
        </td>
        </c:if>
      </tr>
    </table>
      <div id="inquiryContentBtn">
        <button onclick="location.href='inquiryList.do'">목록</button>
        <button onclick="location.href='<%=request.getContextPath()%>/main.jsp'">홈으로</button>
        <button onclick="location.href='inquiryDelete.do?inquiry_idx=${ dto.inquiry_idx }'">삭제</button>
      </div>
  </section>
<c:import url="/footer.jsp"></c:import>
