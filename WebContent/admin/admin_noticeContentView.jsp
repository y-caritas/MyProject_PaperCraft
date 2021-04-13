<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>

<link href="<%= request.getContextPath() %>/CSS/adminSideBarCss.css?ver=1" rel="stylesheet">
<link href="<%= request.getContextPath() %>/CSS/adminNoticeListCss.css?ver=1" rel="stylesheet">
<link href="<%= request.getContextPath() %>/CSS/adminNoticeContentViewCss.css?ver=1" rel="stylesheet">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="sideBarContainer">
		<c:import url="./admin_sideBar.jsp"></c:import>
		
		<div id="admin_notice_title_container">
			<div id="admin_noticelist_title" style="width: 1000px;">
				<h3>| 공지사항</h3>
				<hr id="admin_hr"><br>
			</div>
			
    <table id="notice_content_table">
      <thead style="border: 1px solid #bfbfbf;">
        <tr class="notice_content_table_title">
          <th class="background-footer" style="width: 30%; height: 35px; border-right: 1px solid #bfbfbf;">제목</th>
          <th class="text_left" style="width: 70%;">제목입니다.</th> <!-- ${ dto.notice_title } -->
        </tr>
      </thead>
      <tbody>
        <tr class="notice_border_bottom">
          <td class="background-footer" style="width: 30%; height: 35px;">조회수</td>
          <td class="text_left" style="width: 70%;">조회수입니다.</td> <!-- ${ dto.notice_hit } -->
        </tr>
        <tr class="notice_border_bottom">
          <td class="background-footer" style="width: 30%; height: 35px;">날짜</td>
          <td class="text_left" style="width: 70%;">날짜입니다.</td> <%-- ${ dto.notice_date } --%>
        </tr>
        <tr class="notice_content_table_content">
          <td class="background-footer" style="width: 30%; height: 35px;">내용</td>
          <td class="text_left" style="width: 70%;">내용입니다.</td> <%-- ${ dto.notice_content } --%>
        </tr>
      </tbody>
    </table>
			
			<div id="admin_notice_contBtn">
				<a href="./admin_noticeList.jsp"><button>목 록</button></a>&nbsp;&nbsp;
				<a><button>수 정</button></a>		<!-- button에 formaction 주면됨 -->
			</div>
		</div>
	</div>
	
</body>
</html>