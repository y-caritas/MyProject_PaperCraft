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
      
      <!-- view용 -->
      
      <tr class="inquiryTr">
        <td>1</td>
        <td> 김정우</td>
        <td><a href="<%=request.getContextPath()%>/admin/admin_memberModify.jsp">kimjwoo123</a></td>
        <td>010-2543-2266</td>
        <td>jungwooKim@naver.com</td>
        <td>A	</td>
      </tr>
      
       <tr class="inquiryTr">
        <td>2</td>
        <td> 박승진</td>
        <td><a href="<%=request.getContextPath()%>/admin/admin_memberModify.jsp">promote33</a></td>
        <td>010-7855-6343</td>
        <td>aobod22@gmail.com</td>
        <td>B	</td>
      </tr>
       <tr class="inquiryTr">
        <td>3</td>
       <td> 이미연</td>
        <td><a href="<%=request.getContextPath()%>/admin/admin_memberModify.jsp">minyeon2442</a></td>
        <td>010-6235-7586</td>
        <td>lee55mi@naver.com</td>
        <td>C	</td>
      </tr>
      
      <!-- EL 표현식 -->
      
      <tr class="inquiryTr">
        <c:forEach var="dto" items="${ memberList }">
          <td><a href="#">${dto.member_idx}</a></td>
          <td>${dto.member_name}</td>
          <td><a href="admin_memberModify?member_id=${dto.member_id}">${dto.member_id}</a></td>
          <td>${dto.member_phone}</td>
          <td>${dto.member_email}</td>
           <c:choose>
                <c:when test="${dto.member_grade eq 'S'}">
		        	<td>관리자</td>
		        </c:when>
		        <c:when test="${dto.member_grade eq 'A'}">
		        	<td>VIP</td>
		        </c:when>
		        <c:when test="${dto.member_grade eq 'B'}">
		        	<td>우수회원</td>
		        </c:when>
		        	<c:when test="${dto.member_grade eq 'C'}">
		        <td>일반회원</td>
		        </c:when>
		        
	        </c:choose>
        </c:forEach>
      </tr>
      
    </table>

      

</div>
</div>
</body>
</html>