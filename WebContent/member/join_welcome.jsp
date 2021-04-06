<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <c:import url="/header.jsp"></c:import>
    
    
<div class="categoryTitle" > 
  <h2>회원가입 완료</h2>
  <hr class="dividingLine">
</div>
<br>
<div id="join_welcome_wrap">
  <div id="join_welcome_content">회원이 되신것을 환영합니다.</div>
  <br><br>
  <div id="join_welcome_section">
    <a href="../main.jsp"><button class="join_welcome_btn">홈으로</button></a>
    <a href="./login.jsp"><button class="join_welcome_btn">로그인</button></a>
  </div>
</div>


<c:import url="/footer.jsp"></c:import>