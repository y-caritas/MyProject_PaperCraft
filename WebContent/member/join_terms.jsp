<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/header.jsp"></c:import>

<form action="termsAction" id="jointerms" name="termsAction_submit" onSubmit="return false;">
	<div id="jointermsection">
            <ul class="join_box">
                <li class="checkBox check01">
                    <ul class="clearfix">
                        <li>이용약관, 개인정보 수집 및 이용,
                            위치정보 이용약관(선택), 프로모션 안내
                            메일 수신(선택)에 모두 동의합니다.</li>
                        <li class="checkAllBtn">
                            <input type="checkbox" name="terms_check_all" id="terms_check_all" class="chkAll">
                        </li>
                    </ul>
                </li>
                <li class="checkBox check02">
                    <ul class="clearfix">
                        <li>이용약관 동의<span class="terms_bold">(필수)</span></li>
                        <li class="checkBtn">
                            <input type="checkbox" id="terms_check_1" name="needchk1" class="terms_chk"> 
                        </li>
                    </ul>
                    <textarea name="" id="">여러분을 환영합니다.
페이퍼크래프트 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 페이퍼크래프트의 이용과 관련하여 페이퍼크래프트 서비스를 제공하는 페이퍼크래프트와 이를 이용하는 페이퍼크래프트 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 페이퍼크래프트 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>개인정보 수집 및 이용에 대한 안내<span class="terms_bold">(필수)</span></li>
                        <li class="checkBtn">
                            <input type="checkbox" id="terms_check_2" name="needchk2" class="terms_chk">
                        </li>
                    </ul>
 
                    <textarea name="" id="">여러분을 환영합니다.
페이퍼크래프트 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 페이퍼크래프트의 이용과 관련하여 페이퍼크래프트 서비스를 제공하는 페이퍼크래프트와 이를 이용하는 페이퍼크래프트 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 페이퍼크래프트 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>위치정보 이용약관 동의(선택)</li>
                        <li class="checkBtn">
                            <input type="checkbox" id="terms_check_3" name="chk1" class="terms_chk">
                        </li>
                    </ul>
 
                    <textarea name="" id="">여러분을 환영합니다.
페이퍼크래프트 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 페이퍼크래프트의 이용과 관련하여 페이퍼크래프트 서비스를 제공하는 페이퍼크래프트와 이를 이용하는 페이퍼크래프트 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 페이퍼크래프트 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
                </li>
                <li class="checkBox check04">
                    <ul class="clearfix">
                        <li>이벤트 등 프로모션 알림 메일 수신(선택)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk2" class="terms_chk">
                        </li>
                    </ul>
 
                </li>
            </ul>
            <ul class="footBtwrap clearfix">
                <li><button type="button" class="fpmgBt1" onclick="nonechk()">비동의</button></li>
                <li><button type="button" class="fpmgBt2" onclick="chkAction()">동의</button></li>
            </ul>
            </div>
        </form>
        
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
  <script>
  		// 체크박스 전체선택 시
  		$("#jointermsection").on("click","#terms_check_all", function() {
  			$(this).parents("#jointermsection").find('input').prop("checked", $(this).is(":checked"));
  		});
  		
  		//체크박스 개별선택 시
  		$("#jointermsection").on("click", ".terms_chk", function() {
  			var is_checked = true;
  			
  			$("#jointermsection .terms_chk").each(function() {
  				is_checked = is_checked && $(this).is(":checked");
  			});
  			
  			$("#terms_check_all").prop("checked", is_checked);
  		});
  
  		
  		//동의 버튼 클릭시 액션
  		function chkAction() {
  			var chk1 = document.termsAction_submit.needchk1.checked;
  			var chk2 = document.termsAction_submit.needchk2.checked;
  			
  			if(chk1=="") {
  				alert("필수약관에 동의해주세요");
  				return false;
  			}
  			if(chk2=="") {
  				alert("필수약관에 동의해주세요");
  				return false;
  			}
  			//제출 코드
  			 /* document.termsAction_submit.submit(); */
  			 location.replace("./join.jsp");
  		}
  </script>
        
        <c:import url="/footer.jsp"></c:import>