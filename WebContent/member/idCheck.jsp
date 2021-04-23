<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>아이디 중복확인</title>
    <style>
    * {
      margin: 0; padding: 0;
    }
    #wrap {
      width:410px; height:319px;
      margin: 10px 10px 10px 15px;
    }
    #div1 {
      width: 410px; height: 50px; font-size: 16px; background-color: #818181; color: white;
      vertical-align: middle; line-height: 50px; 
    }
    #div1 div {
      margin-left: 15px;
    }
    #div2 {
      font-size: 13px; margin: 20px 0 2px 0; line-height: 18px;
    }
    #div3 {
      background-color: #e3e3e4; padding: 18px 16px 18px 16px;
      position: relative; height: 26px;
    }
    #search:focus {
      outline: none;
    }
    #div3 input:nth-of-type(1) {
      width: 180px; height: 16px; padding: 1px 2px;
      position: absolute;
    }
    #div3 input:nth-of-type(2) {
      padding: 1px 2px; left: 50%;
      position: absolute;
    }
    #div5 {
      height: 31px; background-color: #f1f3f4; text-align: end; 
      margin-top:   100px;
    }
    #div5 img {
      margin: 5px 10px;
    }
  </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script>
    
    window.onload = function() {
      var search = document.getElementById('search');
      // var idCheck = document.getElementById('idCheck');
      var idReg = /^[A-za-z0-9]{4,16}/g;
      search.onclick = function() {
        if( !idReg.test( $("#idCheck").val() ) ) {
          alert("아이디를 숫자 및 영어로만 정확히 입력하세요. [4~16글자]");
          return;
        } else {
          window.close();
        }
      };    

    };
  </script>
</head>
<body>
  <div id="wrap">
  <form method="post" action="idCheck.do">
    <div id="div1"><div>아이디 중복확인</div></div>
    <div id="div2">
      <img src="http://bdmp-004.cafe24.com/cimg/bl.gif" alt="">원하는 아이디를 입력하세요.
    </div>
    <div id="div3">
        <input type="text" id="idCheck" name="member_id">
        <input  TYPE="IMAGE" src="http://bdmp-004.cafe24.com/cimg/btn_search.gif" name="Submit" value="Submit" formaction = "idCheck.do">
    </div>
    <br>
    	<%
    	
		String check_id = (String)request.getAttribute("check_id");
    	String result = (String)request.getAttribute("result");
    	
		//null체크
		if( check_id == null || result == null ) {
		%>
			<span></span>
		<%
		}
		else if( result.equals("1") )  //아이디가 이미 있음
		{
		%>
			<span>아이디 <%= check_id %>가 이미 존재합니다.</span>
		<%		
		}
		else if( result.equals("2") ) //아이디 사용가능
		{
		%>
			<span>아이디 <%= check_id %>는 사용 가능합니다.</span>
			<input class="inputbtn" type="button" value="사용하기" onclick="send()" >
		<%
		}
		
		%>
		
		<script>
			
	
	    function send(){
	    	var parent = window.opener;
	    	var answer = document.getElementById('idCheck').value;
	    	
	    	parent.document.getElementById('join_id').value = answer;
	    	window.close();
	    }
		</script>
    
    <div id="div5">
      <a href="javascript:window.close();"><img src="http://bdmp-004.cafe24.com/cimg/btn_close.gif" alt=""></a>
    </div>
    </form>
  </div>
</body>
</html>