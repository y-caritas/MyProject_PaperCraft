<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

  <!-- Required meta tags -->
    <meta charset="utf-8">
   
<title>Insert title here</title>
    <link href="<%= request.getContextPath() %>/CSS/adminSideBarCss.css?ver=1" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/CSS/joinCss.css?ver=3" rel="stylesheet">

   <style>
 
   .join_form_right{
   width: auto;
   }
   .admin_modify {
   margin: 50px auto;
  
   }
   .categoryTitle{
   text-align: center;	
   
   padding: 15px;
   }
   .modify_btn{
   background-color:#e3e3e4;
   border: none;
   width: 60px;
   height: 30px;
   }
   .modify_btn:focus {
    outline: none; 
   }

   .modify_btn:hover {	
   background-color: #c7c7c7;
   color:white;
 	border:1px white;
  
   }
   .modify_btn:active {
   outline: none;

   
   }
   
   #modify_submitbtn{
   margin: 30px auto;
   text-align:center;
   }
   
 
   </style>

 
</head>
<body>

<div id="sideBarContainer">
<!-- 사이드 바  -->
<c:import url="/admin/admin_sideBar.jsp"></c:import>

<!-- main section -->

<div class = "admin_modify">
 <div class="categoryTitle">
      <h2>회원 정보 수정</h2>
     <br>
      <hr class="dividingLine">
    </div>
    <br>
    
	<!-- View + 데이터연동  View용 코드는 차후에 제거할 것 -->
	
	   <div id="join_wrapper">
	   
        <form action="adminMemberModify.do" onSubmit= "return checkValue()" name="userInfo" method="POST">
         <input type="hidden" name="member_idx" value="${dto.member_idx }">
            <table id="join_table" style="border-collapse: collapse;">
                <!-- 아이디 -->
                
                <tr>
                
                    <td class="join_form_left">아이디</td>
                    <td class="join_form_right join_form_border">${dto.member_id}
                       
                    </td>
                </tr>
                <!-- 비밀번호 -->
                <tr>
                    <td class="join_form_left">비밀번호</td>
                    <td class="join_form_right join_form_border"><input class="join_inputbox" type="password" id="join_pw" name="member_pw" maxlength="20" value="${dto.member_pw}" onchange="isSame()">
                    <label class="join_label">영문자+숫자 조합으로 8~25자리를 사용해주세요.</label>
                    </td>
                </tr>
              
                <!-- 이름 -->
                <tr>
                    <td class="join_form_left">이름 </td>
                    <td class="join_form_right join_form_border"><input class="join_inputbox" type="text" id="join_name" name="member_name" maxlength="20" value="${dto.member_name}"></td>
                </tr>
                <!-- 주소 -->
                <tr>
                    <td class="join_form_left" >주소</td>
                    
               
               
                    <td class="join_form_right"><input class="join_inputbox" type="text" id="join_address"  name="member_address" style=" width: 300px;"value="${dto.member_address}" >
                        
                        <span id="guide" style="color:#999;display:none"></span><br></td>
                </tr>

                <!-- 이메일 -->
                <tr>
                    <td class="join_form_left">이메일</td>
                    <td class="join_form_right join_form_border"><input class="join_inputbox" type="text" id="join_email" name="member_email" maxlength="20" style="width: 200px;" value="${dto.member_email}">
                        
                   
                    </td>
                </tr>
                <!-- 휴대폰 번호 -->
                <tr>
                    <td class="join_form_left">휴대폰 번호</td>
                    <td class="join_form_right join_form_border">
         
                        <input id="join_phone2" class="join_inputbox" type="text" name="member_phone" id="join_phone" maxlength="4" style="width: 200px;" value="${dto.member_phone}">
                
                      
                    </td>
                </tr>
                <!-- 성별 -->
                <tr>
                    <td class="join_form_left">성별</td>
                    <td class="join_form_right join_form_border">
                        <input type="radio" name="member_gender" value="남성" checked="checked">&nbsp;남성 &nbsp;&nbsp;
                        <input type="radio" name="member_gender" value="여성">&nbsp;여성
                    </td>
                </tr>
                <!-- 이메일 수신동의 여부(1:동의, 2:미동의) -->
                <tr>
                    <td class="join_form_left">이메일 수신동의</td>
                    <td class="join_form_right join_form_border">
                        <input type="radio" name="member_email_ad" checked="checked" value="1">&nbsp;동의 &nbsp;&nbsp;
                        <input type="radio" name="member_email_ad" value="2">&nbsp;미동의
                    </td>
                </tr>
           <tr>
                    <td class="join_form_left">가입일</td>
                    <fmt:formatDate value="${dto.member_date}" pattern="yyyy-MM-dd" var="reg" />
	     
                    <td class="join_form_right join_form_border">${ reg }
                       
                    </td>
                </tr>
                 <tr>
                    <td class="join_form_left">구매금액</td>
                    <td class="join_form_right join_form_border">${dto.member_purchase}
                       
                    </td>
                </tr>
            </table>
            
            <div id="modify_submitbtn">
               <button type="button" class="modify_btn" style="visibility:hidden" > </button> 
               <button type="button" class="modify_btn" onclick="location.href='adminMemberList.do';">목록</button>
               <button type="submit" class="modify_btn" >수정</button>
               <button type="button" class="modify_btn" onclick="confirm_event()" style="float:right">탈퇴</button>
            </div>
        </form>

      </div>

</div>
</div>

 
<script>
/* 유효성 검사 */

	function checkValue(){
		if(!document.userInfo.member_pw.value){
			alert("비밀번호를 입력해주세요");
			document.getElementById('join_pw').focus();
			return false;
		}
		if(!document.userInfo.member_phone.value){
			alert("전화번호를 입력해주세요");
			document.getElementById('join_phone').focus();
			return false;
		}
		if(!document.userInfo.member_address.value){
			alert("주소를 입력해주세요");
			document.getElementById('join_address').focus();
			return false;
		}
		if(!document.userInfo.member_email.value){
			alert("이메일을 입력해주세요");
			document.getElementById('join_email').focus();
			return false;
		}

		alert("회원정보수정 완료되었습니다.")
	}
	
	function confirm_event(){
		if (confirm("정말 삭제하시겠습니까??"))
		{
		alert("삭제 확인"); 
		location.href="deleteMember.do?member_idx=${dto.member_idx}";
		}
		else{ alert("삭제취소"); 
		
		}
		}
	
</script>
</body>
</html>