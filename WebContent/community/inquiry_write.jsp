<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/header.jsp"></c:import>

<section id="inquiryWriteWrap">
    <div class="categoryTitle">
      <h2>주문제작 / 문의</h2>
      <hr class="dividingLine">
    </div>
    <form action="#" method="post" enctype="multipart/form-data" name="">
      <table id="inquiryWriteTable">
        <tr>
          <td class="background-footer">제목</td>
          <td>
            <input type="text" name="inquiry_title" style="width: 97%;">
          </td>
        </tr>
        <tr>
          <td class="background-footer">문의 종류</td>
          <td>
            <select name="inquiry_category" id="" style="height: 25px; margin-left: 10px; border: solid 0.5px #c7c7c7;">
              <option value="customize">주문제작</option>
              <option value="qna">1:1문의</option>
            </select>
          </td>
        </tr>
        <tr>
          <td class="background-footer">작성자</td>
          <td>
            <input type="text" name="inquiry_writer">
          </td>
        </tr>
        <tr>
          <td class="background-footer">비밀번호</td>
          <td>
            <input type="password" name="inquiry_pw">
          </td>
        </tr>
        <tr>
          <td class="background-footer">내용</td>
          <td>
            <textarea name="inquiry_content" id="inquiry_content" style="width: 97%; height: 400px; margin-left: 10px; border: solid 0.5px #c7c7c7;"></textarea>
          </td>
        </tr>
        <tr>
          <td class="background-footer">이미지 첨부</td>
          <td>
            <input type="file" name="inquiry_img" style="height: 30px;">
          </td>
        </tr>
      </table>
      <div id="inquiryBtn">
        <input type="submit" value="제출하기" style="margin: 0 10px;">
        <button type="button" onclick="location.href='<%= request.getContextPath()%>/main.jsp'" style="margin: 0 10px;">홈으로</button>
      </div>
    </form>
  </section>
  
  <c:import url="/footer.jsp"></c:import>