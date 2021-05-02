<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <style>
    * {
      margin: 0;
      color: #818181;
    }
    #inquiryComparePWWrap {
      width: 480px;
    }
    #ComparePWCategoryTitle {
      margin: 10px auto;
      width: 450px;
    }
    #inquiryComparePWWrap p {
      font-size: 0.8em;
      font-weight: bold;
      width: 450px;
      margin: 0 auto;
    }
    #inputWrap {
      width: 450px;
      height: 100px;
      display: flex;
      justify-content: center;
      align-items: center;
      margin: 0 auto;
      font-size: 0.9em;
      background-color: #f1f2f4;
    }
    #inputWrap input {
      outline: none;
      height: 20px;
      margin: auto 10px auto 10px;
    }
    #comparePWBtnWrap {
      display: flex;
      justify-content: center;
      margin: 10px auto;
    }
    .comparePWBtn {
      margin: 0 5px;
      outline: none;
      font-size: 0.8em;
      padding: 5px;
      border: solid 0.5px #e3e3e4;
      cursor: pointer;
    }
  </style>
</head>
<body>
<%
  if(request.getAttribute("compareResult") != null) {
	  int compareResult = (int)request.getAttribute("compareResult");
	  if(compareResult == 0) {
		  %><script>alert("비밀번호가 일치하지 않습니다.")</script><%
	  } else if(compareResult == 1) {
		  %><script>opener.document.location.href="inquiryContent.do?inquiry_idx=" + ${ inquiry_idx }; self.close();</script><%
	  }
  }
%>

  <div id="inquiryComparePWWrap">
    <div id="ComparePWCategoryTitle">
      <h5>|주문제작/문의 비밀번호 확인</h5>
      <hr>
    </div>
    <p>글 작성 시 설정한 비밀번호를 입력해주세요.</p>
    <form action="inquiryComparePW.do" method="post">
      <input type="hidden" name="inquiry_idx" value="${ param.inquiry_idx }">
      <div id="inputWrap">
        비밀번호 <input type="password" name="inquiry_pw">
      </div>
      <div id="comparePWBtnWrap">
        <button class="comparePWBtn">확인</button>
      </div>
    </form>
  </div>
</body>
</html>