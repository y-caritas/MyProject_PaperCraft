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
        <td class="background-footer">제목</td>
        <td>
          <span>view용 문의${dto.inquiry_title}</span>
        </td>
      </tr>
      <tr>
        <td class="background-footer">문의 종류</td>
        <td>
          <c:if test="${dto.inquiry_category} == customize">
            <span>주문제작</span>
          </c:if>
          <c:if test="${dto.inquiry_category} == qna">
            <span>1:1문의</span>
          </c:if>
          <span>1:1문의</span>
        </td>
      </tr>
      <tr>
        <td class="background-footer">작성자</td>
        <td>
          <span>hong${dto.inquiry_writer}</span>
        </td>
      </tr>
      <tr>
        <td class="background-footer">비밀번호</td>
        <td>
          <input type="password" name="inquiry_pw" value="1234${dto.inquiry_pw}" style="height: 20px; margin-left: 10px; border: solid 1px #c7c7c7;" readonly>
        </td>
      </tr>
      <tr>
        <td class="background-footer">내용</td>
        <td>
          <textarea name="inquiry_content" id="inquiry_content" readonly>view용 문의 내용</textarea>
        </td>
      </tr>
      <tr>
        <td class="background-footer">이미지 첨부</td>
        <td>
          <img src="<%=request.getContextPath()%>/upload/${dto.inquiry_img}" alt="img${dto.inquiry_img}" style="margin-left: 10px;">
        </td>
      </tr>
    </table>
      <div id="inquiryContentBtn">
        <button onclick="location.href='<%=request.getContextPath()%>/community/inquiry_list.jsp'">목록</button>
        <button onclick="location.href='<%=request.getContextPath()%>/main.jsp'">홈으로</button>
      </div>
  </section>
  
<c:import url="/footer.jsp"></c:import>
