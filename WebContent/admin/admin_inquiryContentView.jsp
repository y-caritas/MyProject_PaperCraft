<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%= request.getContextPath() %>/CSS/adminSideBarCss.css" rel="stylesheet">
<style>
    #admin_inquiryContentWrap {
      width: 1000px;
      margin: 0 auto;
    }
    #inquiryAnswerTable {
      width: 1000px;
      border-collapse: collapse;
    }
    #inquiryAnswerTable td {
      border-top: solid 1.5px #c7c7c7;
    }
    .inquiryContentBtnWrap {
      display: flex;
      justify-content: flex-end;
      margin: 20px auto;
    }
    .admininquiryContentBtn {
      outline: none;
      background-color: white;
      border: solid 0.5px #e3e3e4;
      font-size: 0.9em;
      padding: 5px;
      margin-right: 10px;
      cursor: pointer;
    }
    #admininquiryContentBtn {
      outline: none;
      background-color: #e3e3e4;
      font-size: 0.9em;
      padding: 5px;
      margin-right: 10px;
      border: solid 0.5px #c7c7c7;
      width: 60px;
      cursor: pointer;
    }
</style>
</head>
<body>
  <div id="sideBarContainer">
    <c:import url="/admin/admin_sideBar.jsp"></c:import>
    
        <div id="admin_inquiryContentWrap">
      <div class="adminCategoryTitle" style="margin-bottom: 50px;">
        <h4>주문제작/문의</h4>
        <hr>
      </div>
      <table id="inquiryAnswerTable">
          <tr>
            <td style="height: 50px;">${ dto.inquiry_title }</td>
            <td style="text-align: right;">${ dto.inquiry_date }</td>
          </tr>
          <tr>
            <td colspan="2">
              <div style="margin-top: 20px; margin-bottom: 20px;">
                ${ dto.inquiry_content }
              </div>
              <c:if test="${ dto.inquiry_img != null }">
              <img style="width: 500px; height: 300px;" src="http://localhost:8081${ dto.inquiry_img }" alt="이미지" style="display: block;">
              </c:if>
            </td>
          </tr>
        <c:if test="${ answerDto.inquiry_idx != dto.inquiry_idx }">
          <tr>
            <td style="height: 50px;">답변 준비 중입니다.</td>
            <td></td>
          </tr>
          <tr>
            <td colspan="2" style="border-bottom: solid 1.5px #c7c7c7;">
              <div style="margin-top: 20px; margin-bottom: 20px;">
              답변 준비 중입니다. <br />
              신속한 답변을 원하시면 고객센터로 문의해주십시오.<br />
              ▶고객센터 Tel : 02-123-4567
              </div>
              <div class="inquiryContentBtnWrap">
                <button class="admininquiryContentBtn" onclick="inquiryAnswerWrite(${ dto.inquiry_idx }, ${ dto.inquiry_category })">답변하기</button>
              </div>
              <script>
                var popupWidth = 750;
                var popupHeight = 380;
                var popupX = (window.screen.width / 2) - (popupWidth / 2);
                var popupY = (window.screen.height / 2) - (popupHeight / 2);
                function inquiryAnswerWrite(num, category) {
                	window.open("admin_inquiryAnswer.jsp?inquiry_idx="+num+"&inquiry_category="+category, "새창", "width=750, height=380, left=" + popupX + ", top=" + popupY + ", toolbar=no, menubar=no, scrollbars=no, resizable=yes");
                }
              </script>
            </td>
          </tr>
        </c:if>
        <c:if test="${ answerDto.inquiry_idx == dto.inquiry_idx }">
            <tr>
              <td style="height: 50px;">${ answerDto.inquiry_a_title }</td>
              <td style="text-align: right;">${ answerDto.inquiry_a_date }</td>
            </tr>
            <tr>
              <td colspan="2" style="border-bottom: solid 1.5px #c7c7c7;">
                <div style="margin-top: 20px; margin-bottom: 20px;">
                  ${ answerDto.inquiry_a_content }
                </div>
                <div class="inquiryContentBtnWrap">
                  <!-- <button class="admininquiryContentBtn" type="button" onclick="adminInquiryAnswerModify()">수정</button>
                  <script>
                    var popupWidth = 750;
                    var popupHeight = 380;
                    var popupX = (window.screen.width / 2) - (popupWidth / 2);
                    var popupY = (window.screen.height / 2) - (popupHeight / 2);
                    function adminInquiryAnswerModify() {
                	    var answerModifyWin = window.open("admin_inquiryAnswerModify.jsp", "answerModifyWin", "width=750, height=380, left=" + popupX + ", top=" + popupY + ", toolbar=no, menubar=no, scrollbars=no, resizable=yes");
                	    answerModifyWin.document.getElementById('test1').value = "test";
                    }
                  </script> -->
                  <button class="admininquiryContentBtn" type="button" onclick="location.href='adminInquiryAnswerDelete.do?inquiry_idx=${ dto.inquiry_idx }'">삭제</button>
                </div>
              </td>
            </tr>
        </c:if>

      </table>
      <div class="inquiryContentBtnWrap">
        <button id="admininquiryContentBtn" onclick="location.href='adminInquiryList.do'">목록</button>
      </div>
    </div>
    
  </div>
</body>
</html>