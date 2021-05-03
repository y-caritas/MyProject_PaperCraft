<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>

.categoryTitle {
text-align: center;
}

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


<div class = "section-wrap">
 <div class="categoryTitle">
      <h2>회원 정보 수정 </h2>
      <hr class="dividingLine">
    </div>

	<form method="post" action="MemberModifyAction.do" 
				name="userInfo" onsubmit="return checkValue()">
				
				

 <table  id="inquiryContentTable"  style="border-left: none; border-right: none; border-bottom: none;" >
      <tr>
        <td class="background-footer">아이디</td>
        <td  class="join_form_right join_form_border">
          <span> hong123${dto.member_id}</span>
        </td>
      </tr>
       <!-- 비밀번호 -->
                <tr>
                    <td class="join_form_left">새 비밀번호</td>
                    <td class="join_form_right join_form_border"><input class="join_inputbox" type="password" id="join_pw" name="member_pw" maxlength="20" placeholder="비밀번호를 입력해주세요." onchange="isSame()">
                    <label class="join_label">비밀번호는 영문자+숫자 조합으로 8~25자리를 사용해주세요.</label>
                    </td>
                </tr>
                <tr>
                    <td class="join_form_left">비밀번호 확인</td>
                    <td class="join_form_right join_form_border"><input class="join_inputbox" type="password" id="join_pw2" name="member_pw2" maxlength="20" placeholder="비밀번호를 다시입력해주세요." onchange="isSame()">&nbsp;<span id="join_same"></span></td>
                </tr>
      <!-- 이름 -->
                <tr>
                    <td class="join_form_left">이름</td>
                    <td  class="join_form_right join_form_border" > <span> 홍길동${dto.member_name }</span> </td>
                </tr>
    <tr>
                    <td class="join_form_left">휴대폰 번호</td>
                    <td class="join_form_right join_form_border">
                        <select id="join_phone" class="join_inputbox" name="member_phone" style="width: 80px;">
                            <option value="">-앞자리-</option>
                            <option value="010">010</option>
                            <option value="070">070</option>
                            <option value="012">012</option>
                            <option value="02">02</option>
                        </select>
                        <span>-</span>
                        <input id="join_phone2" class="join_inputbox" type="text" name="member_phone2" id="join_phone" maxlength="4" style="width: 80px;">
                        <span>-</span>
                        <input id="join_phone3" class="join_inputbox" type="text" name="member_phone2" id="join_phone2" maxlength="4" style="width: 80px;">
                    </td>
                    
     <tr>
                    <td class="join_form_left">이메일</td>
                    <td class="join_form_right join_form_border"><input class="join_inputbox" type="text" id="join_email" name="member_email" maxlength="20" placeholder="이메일을 입력해주세요">
                        <span>@</span>
                        <select class="join_inputbox" id="member_email2">
                            <option value="">---이메일---</option>
                            <option value="naver.com">naver.com</option>
                            <option value="daum.net">daum.net</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="yahoo.com">yahoo.com</option>
                        </select>
                    </td>
                </tr>
                <tr style="border-bottom: none;" >
					<td  style="border-bottom: none;" colspan="2" align="center" >
	 <button type="button" type="submit" class="btn btn-secondary">수정</button>&emsp;
      <button type="button" class="btn btn-outline-secondary" onclick="history.back()">취소</button>
       <button type="button" class="btn btn-light" onclick="MemberDelete?member_id=${dto.member_id}"  style="float: right;">회원탈퇴</button>
						
					</td>
				</tr>
      
    </table>
    
    </form>
    
	




      

</div>

</div>
<div class="col-md-2">
</div>

</div>
</div>




<script> 

 function joinform_check() {
       
       var join_id = document.getElementById("join_id");
       var join_pw = document.getElementById("join_pw");
       var join_pw2 = document.getElementById("join_pw2");
       var join_name = document.getElementById("join_name");
       var join_email = document.getElementById("join_email");
       var join_email2 = document.getElementById("join_email2");
       var join_phone = document.getElementById("join_phone");
       var join_phone2 = document.getElementById("join_phone2");
       var join_phone3 = document.getElementById("join_phone3");
       

      
       if( !/^[a-zA-Z0-9]{8,25}$/.test(join_pw.value) ) {
          alert("비밀번호는 8자리 이상 25자리 영소,대문자 또는 숫자로 입력해주세요.")
          join_pw.focus();
          return false;
       }
       if( join_pw !== join_pw2 ) {
           alert("비밀번호가 서로 다릅니다.");
           join_pw.focus();
           return false;
    
       }
       if( join_email == "" ) {
          alert("이메일을 입력해주세요.");
          join_email.focus();
          return false;
       }
       if( join_email2 == "" ) {
          alert("이메일 주소를 선택해주세요.");
          join_email2.focus();
          return false;
       }
       if(join_phone == "" ) {
    	   alert("휴대폰 번호 앞자리를 선택해주세요.")
    	   join_phone2.focus();
    	   return false;
       }
       
       if(join_phone2 == "" || join_phone3 == "" ) {
    	   alert("휴대폰 번호를 입력해주세요.")
    	   join_phone2.focus();
    	   return false;
       }
          document.Join_form_submit.submit();
    }
    
    /* 비밀번호 실시간 확인 */
    function isSame() {
         var pw = document.getElementById( "join_pw" ).value;
         if( pw.length < 8 || pw.length > 25 ) {
            window.alert("비밀번호는 8자리 이상 25자리 미만으로 입력해주세요.");
            document.getElementById( "join_pw" ).value = document.getElementById( "join_pw2" ).value="";
            document.getElementById( "join_same" ).innerHTML = "";
         }
         
       if( document.getElementById( "join_pw" ).value !="" && document.getElementById( "join_pw2" ).value !="") {
          if( document.getElementById( "join_pw" ).value == document.getElementById( "join_pw2" ).value ) {
             document.getElementById( "join_same" ).innerHTML = "비밀번호가 일치합니다.";
             document.getElementById( "join_same" ).style.color="blue";
          }else{
             document.getElementById( "join_same" ).innerHTML = "비밀번호가 일치하지 않습니다.";
             document.getElementById( "join_same" ).style.color="red";
          }
       }
    }



    </script>






      
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

<c:import url="/footer.jsp"></c:import>