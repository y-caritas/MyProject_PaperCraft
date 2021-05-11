<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>



#order-btn{
 border: none;}
#order-chk{
margin-top:10px;
padding-top:10px;
}

.sidebar{

margin-top:100px;
max-width:200px;
margin-left:20px;
border-radius:10px;
position: sticky;
top:0;

}

#inquiryListWrap{
max-width:1200px;
width:100%;
margin:0 auto;

}
.sidebar a {

text-decoration: none;
color: #818181;
}
.sidebar a:hover{
text-decoration: none;
color: #818181;
}


.section-wrap {
margin-left: 30px;
padding-left: 40px;
text-align: center;

}

#writeBtn{
margin: 0 auto;	
text-align: right;
width: 1000px;

}

    #writeBtn button {
      border: solid 0.5px #e3e3e4;
      font-size: 0.9em;
      padding: 5px;
      cursor: pointer;
    }
      .join_form_right{
   width: auto;
   }
   .admin_modify {
   width: 750px;
   margin: auto;
  
   }
   .modifyTitle {
   margin: 0px;
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
   .modifyLine{
  
   }
   
</style>





<c:import url="/header.jsp"></c:import>

 

<div class="container-fluid">
  <div class="row flex-nowrap">


<div class="col-md-2 sidebar">
<!-- 사이드 바 메뉴-->
  <!-- 패널 타이틀1 -->
<div class="panel panel-info">
    <div class="panel-heading">
     
    </div>
    <!-- 사이드바 메뉴목록1 -->
    <ul class="list-group">
      <li class="list-group-item"><b>&nbsp&nbsp쇼핑정보</b></br></br>
      <a href="order_detail.do">&nbsp&nbsp  주문내역</a></br>
       <a href="cart.do">&nbsp&nbsp 장바구니</a></br>
        </li>
      
      
      <li class="list-group-item"><b>&nbsp&nbsp게시판이용</b></br></br>
         <a href="one_to_one_inquiry.do">&nbsp&nbsp 1:1문의</a></br>
         <a href="customizeList.do">&nbsp&nbsp 주문제작</a></br>
      
      
      </li>
      <li class="list-group-item"><b>&nbsp&nbsp계정관리</b></br></br>
         <a href="<%= request.getContextPath() %>/myPage/check_pw.jsp">&nbsp&nbsp 정보수정</a></br>
         <p></p>
          
       
      
      
      </li>
    </ul>
</div>
</div>


<div class="col-md-8  ">


<div class = "admin_modify">
 <div class="modifyTitle">
      <h2>회원 정보 수정</h2>
     <br>
      <hr class="modifyLine">
    </div>
    <br>
    
	<!-- View + 데이터연동  View용 코드는 차후에 제거할 것 -->
	
	   <div id="join_wrapper">
	   
        <form action="myPageModify.do" onSubmit= "return checkValue()" name="userInfo" method="POST">
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
                    <td class="join_form_right join_form_border"><input class="join_inputbox" type="password" id="join_pw" name="member_pw" maxlength="20" placeholder="비밀번호를 입력해주세요." onchange="isSame()">
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
                 <!-- 회원등급 -->
                <tr>
                    <td class="join_form_left">회원등급 </td>
                    <td class="join_form_right join_form_border">
                <c:choose>
                <c:when test="${dto.member_grade == 4}">
		        	관리자
		        </c:when>
		        <c:when test="${dto.member_grade == 3}">
		        	VIP
		        </c:when>
		        <c:when test="${dto.member_grade == 2}">
		        	우수회원
		        </c:when>
		        	<c:when test="${dto.member_grade == 1}">
		        일반회원
		        </c:when>
		        
	        </c:choose>
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
               <button type="button" class="modify_btn" onclick=''>취소</button>
               <button type="submit" class="modify_btn" >수정</button>
               <button type="button" class="modify_btn" onclick="confirm_event()" style="float:right">탈퇴</button>
            </div>
        </form>

      </div>

</div>

</div>
<div class="col-md-2">


</div>

</div>
</div>




	<script>
	function checkValue(){
		if(!document.userInfo.member_pw.value){
			alert("비밀번호를 입력해주세요");
			document.getElementById('join_pw').focus();
			return false;
		}
		if(!document.userInfo.member_phone.value){
			alert("전화번호를 입력해주세요");
			document.getElementById('phone').focus();
			return false;
		}
		if(!document.userInfo.member_address.value){
			alert("주소를 입력해주세요");
			document.getElementById('address').focus();
			return false;
		}
		if(!document.userInfo.member_email.value){
			alert("이메일을 입력해주세요");
			document.getElementById('joindate').focus();
			return false;
		}

		alert("회원정보수정 완료되었습니다.")
	}
	
	function confirm_event(){
		if (confirm("정말 삭제하시겠습니까??"))
		{
		alert("삭제 확인"); 
		location.href="deletemyPageMember.do?member_idx=${dto.member_idx}";
		}
		else{ alert("삭제취소"); 
		
		}
		}
	

	
	</script>





      
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

<c:import url="/footer.jsp"></c:import>