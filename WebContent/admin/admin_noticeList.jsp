<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>

<link href="<%= request.getContextPath() %>/CSS/adminSideBarCss.css?ver=1" rel="stylesheet">
<link href="<%= request.getContextPath() %>/CSS/adminNoticeListCss.css?ver=1" rel="stylesheet">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="sideBarContainer">
<c:import url="/admin/admin_sideBar.jsp"></c:import>		
		<div id="admin_notice_title_container">
			<div id="admin_noticelist_title" style="width: 1000px;">
				<h3>| 공지사항 목록</h3>
				<hr id="admin_hr"><br>
			</div>
	    	<table id="admin_view_table2" style="border-collapse: collapse; width: 1000px; margin: 0 auto;">
	      	<thead>
		        <tr id="admin_view_title" style="background-color: #e3e3e4; text-align: center; ">
		        <th style="height: 38px; width: 20%;">번호</th>
		        <th style="height: 38px; width: 40%;">제목</th>
		        <th style="height: 38px; width: 20%;">조회수</th>
		        <th style="height: 38px; width: 20%;">게시일</th>
		        </tr>
		      </thead>
		      <tbody>
		      <!-- view용 -->
		      <%--   <tr style="text-align: center; border-bottom: 1px solid #f1f2f4">
		          <td style="height: 35px;"><img class="admin_notice_img" src="<%= request.getContextPath() %>/img/adminListImportant.png" alt="""></td>
		          <td class="admin_table_title" style="height: 35px;"><a href="./admin_noticeContentView.jsp">공지사항 입니다.</a></td>
		          <td style="height: 35px;">날짜</td>
		        </tr>
		      
		        <tr style="text-align: center; border-bottom: 1px solid #f1f2f4">
		          <td style="height: 35px;">2</td>
		          <td class="admin_table_title" style="height: 35px;"><a href="./admin_noticeContentView.jsp">공지사항2</a></td>
		          <td style="height: 35px;">날짜</td>
		        </tr> --%>
		        
		        <!-- 데이터용 -->
		   <c:forEach var="dto" items="${ noticelist }">
		    <tr style="text-align: center; border-bottom: 1px solid #f1f2f4">
          	<td style="height: 35px;">
            	<c:if test="${ dto.notice_pin eq 1 }"><img src="<%= request.getContextPath() %>/img/adminListImportant.png"></c:if>
            	<c:if test="${ dto.notice_pin ne 1 }">${dto.notice_idx}</c:if>
            </td>
            <td class="admin_table_title" style="height: 35px;"><a href="admin_notice_view.do?notice_idx=${dto.notice_idx}">${dto.notice_title}</a></td>  <!-- 앵커태그 admin_notice_view.do?notice_idx=${dto.notice_idx} -->
            <td style="height: 35px;">${dto.notice_hit}</td>
            <fmt:formatDate value="${dto.notice_date}" pattern="yyyy-MM-dd" var="reg" />
            <td style="height: 35px;">${reg}</td>
        </tr>
       </c:forEach>
		      </tbody>
		    </table>
		    <div id="admin_notice_btn">
		    	<button onclick="location.href='./admin_noticeWrite.jsp'">글쓰기</button>
		    </div>
	    </div>
  	</div>
</body>
</html>