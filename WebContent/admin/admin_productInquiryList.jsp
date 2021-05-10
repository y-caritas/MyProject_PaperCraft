<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <link href="<%= request.getContextPath() %>/CSS/adminSideBarCss.css?ver=1" rel="stylesheet">
 <link href="<%= request.getContextPath() %>/CSS/inquiryListCss.css?ver=1" rel="stylesheet">
 
   <style>
   
   #inquiryListTable{
   margin: 0;
   width: 1050px;
   }
   .admin_prodInq {
      margin: 0 auto;
    }
    .admin_prodContent{
    width:1050px;
    margin-left:40px;
    }
    .adminProdInqTitle {
      width: 1050px;
      margin: 30px auto 0 40px;
    }
    #accordian li{ 
    list-style:none;
    }
	#dropDown { 
    cursor:pointer;	
	}
	#dropContent {
	 width:100%;
	 display:none;

	}
	li > ul >li{
	 color:#818181;
	 }
	#InqDropTab{
      margin: 0 auto 20px auto;
      text-align: center;
      width: 1050px;
   	  
      border-collapse: collapse;
	}
	  .dropTr td {
      border-bottom: 1px solid #f1f2f4;
      height: 200px;
      padding: 0 10px 0 10px;
      font-size: 0.9em;
    }
    #prodInq_chkbox{
    width: 100%;

    padding-top: 25px;
    height: 30px;
    }
    .ProdInqCatg {
    margin:0;
    padding:0;
    }
    .inquiryTr td{
    margin:0;
    padding: 0 ;
    }
    
    .goProBtn {
    border: 1px solid #c7c7c7;
    border-radius: 5px;
	font-size:5px;
    
    bakcground-color: #f1f3f4;
    color: #818181;
    width: 60px;
    height: 20px;
    }
    .goProBtn:hover {
    background-color: #f1f3f4;
    }

    .goProBtn:active {
    background-color:#c7c7c7;
    }
	
	#ProWriteBtn {
	margin :10px;
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
        <h3>| 상품문의</h3>
        <hr>
        </div>
<div class="admin_prodContent">

<div id ="prodInq_chkbox">



<form action = "pInquirySearch.do" method="post" style="float:right" >
<input type="text" name ="pInquirySearch"> <button class="goProBtn" type = "submit">검색 </button>
</form>
</div>



<!--   @@@  Data 용  @@@		 		 -->
	
<div id="accordian">

	
	<table id="inquiryListTable">
	
      <tr class="inquiryTr">
        <th style="width:10%"></th>
        <th style="width:10%"></th>
        <th style="width:40%">문의 상품</th>
        <th style="width:10%">작성자</th>
        <th style="width:10%">작성일시</th>
        <th style="width:10%">답변보기</th>
      </tr>   
      
      
      
     <c:forEach var="dto" items="${pInquiryList}" varStatus="status">  
     
     
	<tr class="inquiryTr">     
          <td>${dto.product_i_idx}</td>
          <td><img src="http://placehold.it/100" />${dto.product_i_img}</td>         
           <td style="text-align: left;"><div class="ProdInqCatg"><small><b>${dto.product_i_category} > ${dto.product_i_name}</b></small></div> 
           <br>  
        <b> ${dto.product_i_title}</b></td>
          <td>${dto.member_id}</td>
          <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${dto.product_i_date}"/></td>
          <td><div id="dropDown" ><span class="ico_ar">▼</span></div></td>
      </tr>
      
      
      
		 
      </table>					
       
				<div id="dropContent">
				<table id ="InqDropTab">
				

			 <colgroup>
            <col width="10%" />
            <col width="90%" />
			</colgroup>
							
	 
													
				<tr class="dropTr" style="background-color:#f1f3f4;" > 
				<td>  <b>A.</b></td>
						
				<c:forEach  var="dto_answer" items="${answerList}" varStatus="status2">

					<%-- <td><c:if test="${status.index eq status2.index}"> 
					
					${dto_answer.product_i_a_content}
					<c:set var="found" value="success" />
					 </c:if></td> --%>
			
			 	</c:forEach>
						
				 <c:if test="${found ne 'success'}">
				    <td>등록된 답변이 없습니다</td>
				</c:if>
				
				
				
			
				</tr>
				<tr style="background-color:#f1f3f4; text-align:right;" > 
				<td></td>
				
				
				<td>
				<div id ="ProWriteBtn">
				<button class ="goProBtn"  onclick="ProdInqWrite()" >답변하기</button>
				<button class ="goProBtn"  onclick="location.href='pInquiryModify.do?dto.product_i_idx=${answerDto.product_i_a_idx}';" >수정</button>
				<button class ="goProBtn"  onclick="del(${answerDto.product_i_a_idx})" >삭제 </button>
				
				</div>
				</td>
				</tr>
				
					
				
			
				
			
				</table>

</c:forEach>		
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

        var popupWidth = 750;
        var popupHeight = 380;
        var popupX = (window.screen.width / 2) - (popupWidth / 2);
        var popupY = (window.screen.height / 2) - (popupHeight / 2);
        
        function ProdInqWrite() {
          window.open("../admin/admin_productInquiryAnswer.jsp", "새창", "width=750, height=380, left="+ popupX +", top="+ popupY +",toolbar=no, menubar=no, scrollbars=no, resizable=yes");
        }
        function ProdInqModify() {
           window.open("../admin/admin_productInquiryModify.jsp", "새창", "width=750, height=380, left="+ popupX +", top="+ popupY +",toolbar=no, menubar=no, scrollbars=no, resizable=yes");
          }
        
        function del(seq) {
    		var chk = confirm("정말 삭제하시겠습니까?");
    		if (chk) {
    			location.href='pInquiryReplydelete.do?seq='+seq;
    		}
    	}	

</script>
</body>
</html>