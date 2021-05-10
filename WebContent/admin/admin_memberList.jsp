<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <link href="<%= request.getContextPath() %>/CSS/adminSideBarCss.css?ver=1" rel="stylesheet">
 <link href="<%= request.getContextPath() %>/CSS/inquiryListCss.css?ver=1" rel="stylesheet">
 
   <style>
   .admin_memList{
   margin: 50px auto;
 
   }
    .categoryTitle{
   text-align: center;	
   padding: 15px;
   }
   
   .dividingLine {
   margin: 30px auto;
   }
   </style>
</head>
<body>

<div id="sideBarContainer">
<!-- 사이드 바  -->
<c:import url="/admin/admin_sideBar.jsp"></c:import>

<!-- main section -->

<div class = "admin_memList">
 <div class="categoryTitle">
      <h2>회원목록</h2>
      <hr class="dividingLine">
    </div>

<table id="inquiryListTable">
      <tr class="inquiryTr">
        <th style="width:10%">회원번호</th>
        <th style="width:10%">성명</th>
        <th style="width:15%">아이디</th>
        <th style="width:20%">연락처</th>
        <th style="width:25%">이메일</th>
         <th style="width:10%">등급</th>
        
        
        
      </tr>
      
      
       <c:forEach var="dto" items="${ memberList }">
          <tr class="inquiryTr">
       
          <td><a href="adminMemberInfo.do?member_idx=${dto.member_idx}">${dto.member_idx}</a></td>
          <td>${dto.member_name}</td>
          <td>${dto.member_id}</td>
          <td>${dto.member_phone}</td>
          <td>${dto.member_email}</td>
           <c:choose>
                <c:when test="${dto.member_grade == 4}">
		        	<td>관리자</td>
		        </c:when>
		        <c:when test="${dto.member_grade == 3}">
		        	<td>VIP</td>
		        </c:when>
		        <c:when test="${dto.member_grade == 2}">
		        	<td>우수회원</td>
		        </c:when>
		        	<c:when test="${dto.member_grade == 1}">
		        <td>일반회원</td>
		        </c:when>
		        
	        </c:choose>
     
      </tr>
         </c:forEach>

      
    </table>

      

</div>
</div>
</body>
</html>