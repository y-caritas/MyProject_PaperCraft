<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<table id="sideBar">
  <tr>
    <th>게시판 관리</th>
  </tr>
  <tr>
    <td>
        <button class="sideBarDropBtn">Account</button>
        <div class="sideBarDropdownContainer">
        <a href="<%=request.getContextPath()%>/main.jsp">Home</a>
          <a href="logout.do">로그아웃</a>
        </div>
        <button class="sideBarDropBtn">회원 관리</button>
        <div class="sideBarDropdownContainer">
          <a href="adminMemberList.do">회원 목록</a>
          <a href="admin_orderlist.do">주문 목록</a>
        </div>
        <button class="sideBarDropBtn">상품 관리</button>
        <div class="sideBarDropdownContainer">
          <a href="<%=request.getContextPath()%>/admin/admin_productRegistration.jsp">상품 등록</a>
          <a href="adminProductList.do">상품 목록</a>
        </div>
        <button class="sideBarDropBtn">게시판 관리</button>
        <div class="sideBarDropdownContainer">
          <a href="admin_notice_list.do">공지사항</a>
          <a href="adminFaqList.do">자주하는 질문</a>
          <a href="adminInquiryList.do">주문 제작/문의</a>
          <a href="pEnquiryList.do">상품 문의</a>
        </div>
    </td>
  </tr>
</table>
<script>
  var sideBarDropdown = document.getElementsByClassName('sideBarDropBtn');
  var i;

  for(i = 0; i < sideBarDropdown.length; i++) {
    sideBarDropdown[i].addEventListener('click', function() {
      this.classList.toggle('active');
      var sideBarDropdownContent = this.nextElementSibling;
      if(sideBarDropdownContent.style.display === "block") {
        sideBarDropdownContent.style.display = "none";
      } else {
        sideBarDropdownContent.style.display = "block";
      }
    });
  }
</script>