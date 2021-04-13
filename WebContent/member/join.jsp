<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <c:import url="/header.jsp"></c:import>
  
      <div class="categoryTitle" > 
        <h2>회원가입</h2>
        <hr class="dividingLine">
    </div>

    <div id="join_wrapper">
        <form action="JoinAction" onSubmit="return false;" name="Join_form_submit" method="POST">
            <table id="join_table" style="border-collapse: collapse;">
                <!-- 아이디 -->
                <tr>
                    <td class="join_form_left">아이디</td>
                    <td class="join_form_right join_form_border"><input class="join_inputbox" type="text" onclick="idCheck()" name="member_id" id="join_id" maxlength="20" placeholder="아이디를 입력해주세요.">
                       <button id="join_idcheckbtn" type="button" onclick="idCheck();">중복확인</button>
                    </td>
                </tr>
                <!-- 비밀번호 -->
                <tr>
                    <td class="join_form_left">비밀번호</td>
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
                    <td class="join_form_right join_form_border"><input class="join_inputbox" type="text" id="join_name" name="member_name" maxlength="20" placeholder="이름을 입력해주세요."></td>
                </tr>
                <!-- 주소 -->
                <tr>
                    <td class="join_form_left" rowspan="3">주소</td>
                    <td class="join_form_right"><input class="join_inputbox" type="text" id="sample4_postcode" placeholder="우편번호">
                        <input class="join_inputbox join_inputbtn" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"></td>
                </tr>
                <tr>
                    <td class="join_form_right"><input class="join_inputbox" type="text" id="sample4_roadAddress" placeholder="도로명주소">
                        <input class="join_inputbox" type="text" id="sample4_jibunAddress" placeholder="지번주소">
                        <span id="guide" style="color:#999;display:none"></span><br></td>
                </tr>
                <tr>
                    <td class="join_form_right"><input class="join_inputbox" type="text" id="sample4_detailAddress" placeholder="상세주소">
                        <input class="join_inputbox" type="text" id="sample4_extraAddress" placeholder="참고항목"></td>
                </tr>
                <!-- 이메일 -->
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
                <!-- 휴대폰 번호 -->
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
                <input type="hidden" name="member_grade" value="1">
                <input type="hidden" name="member_purchase" value="0">
            </table>
            <div id="join_submitbtn">
                <button type="button" onclick="joinform_check();">회원가입</button>
            </div>
        </form>
        </div>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    
    /* 유효성 검사 */
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
       
       if( join_id.value == "" ) {
          alert("아이디를 입력하세요.");
          join_id.focus();
          return false;
       }
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
       if( join_name == "" ) {
          alert("이름을 입력하세요.");
          join_name.focus();
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
    
    /* 아이디 중복확인 창 */
    function idCheck() {
    	window.open("/MyProject_PaperCraft/member/idCheck.jsp", "새창", "width=440, height=353, toolbar=no, menubar=no, scrollbars=no, resizable=yes" ); 
    }
    </script>
  
  <c:import url="/footer.jsp"></c:import>