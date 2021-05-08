<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/header.jsp"></c:import>

<section id="inquiryWriteWrap">
    <div class="categoryTitle">
      <h2>주문제작 / 문의</h2>
      <hr class="dividingLine">
    </div>
    <form action="myInquiryWrite.do" method="post" enctype="multipart/form-data" name="">
      <table id="inquiryWriteTable">
        <tr>
          <td class="background-footer">제목</td>
          <td>
            <input type="text" id="inquiry_title" name="inquiry_title" style="width: 97%;">
          </td>
        </tr>
        <tr>
          <td class="background-footer">문의 종류</td>
          <td>
            <select name="inquiry_category" id="" style="height: 25px; margin-left: 10px; border: solid 0.5px #c7c7c7;">
              <option value="1">주문제작</option>
              <option value="2">1:1문의</option>
            </select>
          </td>
        </tr>
        <tr>
          <td class="background-footer" style="height: 40px;">작성자</td>
          <td>
            <input type="text" id="inquiry_writer" name="inquiry_writer">
          </td>
        </tr>
        <tr>
          <td class="background-footer" style="height: 40px;">비밀번호</td>
          <td>
            <input type="password" id="inquiry_pw" name="inquiry_pw">
          </td>
        </tr>
        <tr>
          <td class="background-footer">내용</td>
          <td>
            <textarea id="inquiry_content" name="inquiry_content" id="inquiry_content" style="width: 97%; height: 400px; margin-left: 10px; border: solid 0.5px #c7c7c7;"></textarea>
          </td>
        </tr>
        <tr>
          <td class="background-footer" style="height: 40px;">이미지 첨부</td>
          <td>
            <input type="file" name="inquiry_img" style="height: 30px;">
          </td>
        </tr>
      </table>
      <div id="inquiryWriteBtn">
        <input type="submit" onclick="check(); return false;" value="제출하기" style="margin: 0 10px;">
        <button type="button" onclick="location.href='<%= request.getContextPath()%>/main.jsp'" style="margin: 0 10px;">홈으로</button>
      </div>
      <input type="hidden" name="member_id" value="<%= session.getAttribute("member_id") %>">
    </form>
  </section>
  
  <script>
    function check() {
      var inquiry_title = document.getElementById("inquiry_title").value;
      var inquiry_writer = document.getElementById("inquiry_writer").value;
      var inquiry_pw = document.getElementById("inquiry_pw").value;
      var inquiry_content = document.getElementById("inquiry_content").value;

      if(inquiry_title == null || inquiry_title == "") {
        alert("제목을 입력해주세요.");
        return false;
      } else if (inquiry_writer == null || inquiry_writer == "") {
        alert("작성자를 입력해주세요.");
        return false;
      } else if(inquiry_pw == null || inquiry_pw == "") {
        alert("비밀번호를 입력해주세요.");
        return false;
      } else if(inquiry_content == null || inquiry_content == "") {
        alert("내용을 입력해주세요.");
        return false;
      }

      form.submit();
     }
  </script>
  
  <c:import url="/footer.jsp"></c:import>