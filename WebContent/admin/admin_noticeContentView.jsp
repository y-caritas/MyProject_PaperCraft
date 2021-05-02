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
		<c:import url="/admin_sideBar.jsp"></c:import>
		
		<div id="admin_notice_title_container">
			<div id="admin_noticelist_title" style="width: 1000px;">
				<h3>| 공지사항</h3>
				<hr id="admin_hr"><br>
			</div>
    <table id="notice_content_table">
      <thead style="border: 1px solid #bfbfbf;">
        <tr class="notice_content_table_title">
          <th class="background-footer" style="width: 30%; height: 35px; border-right: 1px solid #bfbfbf;">제목</th>
          <th class="text_left" style="width: 70%;">${ dto.notice_title }</th> <!-- ${ dto.notice_title } -->
        </tr>
      </thead>
      <tbody>
        <tr class="notice_border_bottom">
          <td class="background-footer" style="width: 30%; height: 35px;">조회수</td>
          <td class="text_left" style="width: 70%;">${ dto.notice_hit }</td> <!-- ${ dto.notice_hit } -->
        </tr>
        <tr class="notice_border_bottom">
          <td class="background-footer" style="width: 30%; height: 35px;">날짜</td>
          <td class="text_left" style="width: 70%;">${ dto.notice_date }</td> <%-- ${ dto.notice_date } --%>
        </tr>
        <tr class="notice_content_table_content">
          <td class="background-footer" style="width: 30%; height: 35px;">내용</td>
          <td class="text_left" style="width: 70%;">${ dto.notice_content }</td> <%-- ${ dto.notice_content } --%>
        </tr>
      </tbody>
    </table>
			
			<div id="admin_notice_contBtn">
				<a href="admin_notice_list.do"><button>목 록</button></a>&nbsp;&nbsp;
				<a href="admin_notice_modify.do?notice_idx=${dto.notice_idx}"><button>수 정</button></a>&nbsp;&nbsp;		<!-- button에 formaction 주면됨 -->
				<a onclick="deletebtn();" href="admin_notice_delete.do?notice_idx=${dto.notice_idx}"><button>삭 제</button></a>
			</div>
		</div>
	</div>
	<script>
    function deletebtn() {
    	if(confirm("정말 삭제하시겠습니까?") == true ) {
    		alert("삭제되었습니다.");
    	}else{
    		return;
    	}
    }
	</script>
</body>
</html>