<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="<%= request.getContextPath() %>/CSS/adminSideBarCss.css" rel="stylesheet">
  <style>
    #inquiryListTable {
      margin: 10px auto 20px auto;
      text-align: center;
      width: 1000px;
      border-bottom: solid 1px #818181;
      border-collapse: collapse;
    }

    .inquiryTr th {
      background-color: #e3e3e4;
      border-top: solid 2px #818181;
      border-bottom: solid 1px #818181;
      height: 30px;
    }
    .inquiryTr td {
      border-bottom: solid 1px #818181;
      height: 30px;
      padding: 0 10px 0 10px;
    }

    .inquiryTr > td > a {
      text-decoration: none;
    }

    #inquirySearch {
      text-align: center;
      margin: 0 auto;
    }
    #inquirySearch input[type=submit] {
      border: solid 0.5px #e3e3e4;
      height: 28px;
      cursor: pointer;
      outline: none;
    }
    #searchNotice {
      width: 1000px;
      height: 500px;
      margin: 0 auto;
      display: flex;
      justify-content: center;
      align-items: center;
    }
  </style>
</head>
<body>
  <div id="sideBarContainer">

    <c:import url="/admin/admin_sideBar.jsp"></c:import>

    <div id="inquiryListWrap" style="width:1000px; margin: 0 auto;">
      <div class="adminCategoryTitle">
        <h4>| 주문제작/문의</h4>
        <hr>
      </div>
      <select name="inquiry_category" id="inquiry_category" onchange="categorySearch()" style="margin-top:50px; outline:none; height: 30px;">
        <option>선택</option>
        <option value="0">전체</option>
        <option value="1">주문제작</option>
        <option value="2">1:1문의</option>
      </select>
      <script>
        function categorySearch() {
        	var inquiryCategory = document.getElementById("inquiry_category").value;
        	location.href = "adminInquirySelect.do?inquiry_category=" + inquiryCategory;
        }
      </script>
      <c:if test="${ inquiryList != null && fn:length(inquiryList) != 0 }">
      <table id="inquiryListTable">
        <tr class="inquiryTr">
          <th style="width:10%">번호</th>
          <th style="width:70%">제목</th>
          <th style="width:20%">작성자</th>
        </tr>
        <c:forEach var="dto" items="${ inquiryList}">
        <tr class="inquiryTr">
          <td>${dto.inquiry_idx}</td>
          <td style="text-align: left;"><a href="adminInquiryContent.do?inquiry_idx=${ dto.inquiry_idx }">${dto.inquiry_title}</a></td>
          <td>${dto.inquiry_writer}</td>
        </tr>
        </c:forEach>
      </table>
      </c:if>
      <c:if test="${ inquiryList == null || fn:length(inquiryList) == 0 }">
      <div id="searchNotice">
        <p>"검색 결과가 없습니다."</p>
      </div>
      </c:if>
      <form action="adminInquirySearch.do" method="POST">
        <select name="inquirySearch" id="" style="height:25px; outline:none;">
          <option value="titleAndContent">제목 + 내용</option>
          <option value="title">제목</option>
          <option value="content">내용</option>
        </select>
        <input type="search" name="inquirySearchContent" id="" style="height:25px; outline:none;">
        <input type="submit" value="검색">
      </form>
    </div>
  </div>
</body>
</html>