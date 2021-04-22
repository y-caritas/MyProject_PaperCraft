<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <link href="<%= request.getContextPath() %>/CSS/adminSideBarCss.css?ver=1" rel="stylesheet">
 <link href="<%= request.getContextPath() %>/CSS/inquiryListCss.css?ver=1" rel="stylesheet">
 
   <style>
   .admin_prodInq {
      margin: 0 auto;
    }
    .adminProdInqTitle h6 {
     
      margin: 10px auto;
    }
    #accordian li{ 
    list-style:none;
    }
	#dropDown { 
    cursor:pointer;	
	}
	#dropContent {
	 display:none;
	}
	li > ul >li{
	 color:#818181;
	 }


   </style>
   
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.js"></script>
   
</head>
<body>

<div id="sideBarContainer">
<!-- 사이드 바  -->
<c:import url="/admin/admin_sideBar.jsp"></c:import>

<!-- main section -->

<div class = "admin_prodInq">
<div class="adminProdInqTitle">
        <h4>| 상품문의</h4>
        <hr>
<div class="admin_prodContent">

<div id ="prodInq_chkbox">

<input type="checkbox" name="productInq"  onclick='getCheckboxValue()'> 답변 없는 문의만 보기
</div>







<div id="accordian">

	<ul>
	
		<li>
	<table id="inquiryListTable">
      <tr class="inquiryTr">
        <th style="width:10%"></th>
        <th style="width:10%"></th>
        <th style="width:40%">문의 상품</th>
        <th style="width:10%">작성자</th>
        <th style="width:10%">작성일시</th>
        <th style="width:10%">답변보기</th>
      </tr>
	<tr class="inquiryTr">     
          <td>1</td>
          <td><img src="http://placehold.it/100" /> </td>         
           <td style="text-align: left;"><h6><b>상품 카테고리 > 상품명</b> <button><a href="#">제품 보기</a></button></h6> 
           <p></p>    
          Q.이 옷은 어떻게 세탁을 하면 되나요?..</td>
          <td>hong123</td>
          <td>2021-03-21</td>
          <td><div id="dropDown"><span class="ico_ar">▼</span></div></td>
      </tr>
      
      <tr>
      <td>
      <div id="dropContent">
      안녕하세요
       </div>
       </td>
      </tr>
     
      </table>										
			
			
			
			
				<li>
				
				

	
	</li>
		
		
		
		
				
		
	</ul>
</div>	






 

</div>        
      
</div>
</div>
</div>



<script>
              
$(function(){
	$("#dropDown").click(function(){
		$("#dropContent").slideToggle();
		$('.ico_ar').css('transform','none');
		if(!$(this).next().is(":visible"))
		{
			$(this).next().slideToggle();
			$(this).find('.ico_ar:eq(0)').css('transform','rotate(180deg)');
		}
	})
})


</script>
</body>
</html>