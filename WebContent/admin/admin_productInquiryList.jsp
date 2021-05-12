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
	.dropDown { 
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
	#tdid {
	text-align: center;
	}
	 input[id*="answer"]{
   
   display: none;
    
  
 }
 input[id*="answer"]+ label {
  
   height: 10px;
   display: block;
   padding: 20px;
   border-top: 1px solid #818181;
   font-weight: 500;
   background-color: #e3e3e4;
   
   cursor: pointer;
   position: relative;
   color: #818181;
   padding-bottom: 40px;
 }
 input[id*="answer"] + label em {
   position: absolute;
   top: 50%;
   right: 10px;
   width: 30px;
   height: 30px;
   margin-top: 15px ;
   display: inline-block;
   
    
 }
 
input[id*="answer"] + label + div {
  max-height: 0;
  transition: all, 35ms;
  overflow: hidden;
  font-size: 14px;
  background-color: #f1f3f4;
}
input[id*="answer"] + label + div p {
  display: inline-block;
  padding: 20px;
}
input[id*="answer"]:checked + label + div {
  max-height: 100px;
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
   
  </div>

  <!--   @@@  Data 용  @@@		 		 -->
  <div id="accordian">
  
	<table id="inquiryListTable">
	
    <!-- table header -->
    <tr class="inquiryTr">
      <th style="width:10%"></th>
      <th style="width:10%"></th>
      <th style="width:40%">문의 상품</th>
      <th style="width:10%">작성자</th>
      <th style="width:10%">작성일시</th>
      <th style="width:10%">답변보기</th>
    </tr>   
    
      
    <!-- table body -->
   

   <c:forEach var="dto" items="${pInquiryList}" varStatus="status"> 

		<!-- 질문 -->
		<tr class="inquiryTr">     
		  <td id ="tdid" width="50px" >${dto.product_i_idx}</td>
		 <td width="170px"><img style="width:150px; height:100px;" src="${dto.product_i_img}" /></td>         
		 <td style="text-align: left;" width="490px">
		 	<div class="ProdInqCatg"><span>Q.</span> <b> ${dto.product_i_title}</b></div> 
		   <br>  
		   <b> ${dto.product_i_content}</b>
		 </td>
		 <td width="100px">${dto.member_id}</td>
		 <td width="150px"><fmt:formatDate pattern="yyyy-MM-dd " value="${dto.product_i_date}"/></td>          
		 <td>
		 	<div class="dropDown" onclick="clickDropdown( '${status.index}' )">
		 		<input type="hidden" value="${status.index}" />
		 		<span class="ico_ar">▼</span>
		 	</div>
		 </td>
		</tr>
		<!-- 답변 -->

   		<tr id="dropContent${status.index}" class="dropTr" style="background-color:#f1f3f4;  width:100%; display:none;" > 
       
		<td>  <b>A.</b></td>
		<td> </td>
		<c:choose> 
		 <c:when test = "${dto.product_i_a_content == null }">
		<td>등록된 답변이 없습니다.</td>
		</c:when>
		<c:when test = "${dto.product_i_a_content != null }">
		<td> ${dto.product_i_a_content }</td>
		</c:when>
		</c:choose>
		<td></td>
		<td></td>
		<td><button class ="goProBtn"  onclick="ProdInqWrite('${dto.product_i_idx}')" >답변하기</button></td>
              
       </tr> 
        
	</c:forEach> 
       
       
       
      </table>   
        
         <%--  <table id ="InqDropTab">
            <colgroup>
              <col width="10%" />
              <col width="90%" />
            </colgroup>
                      
           
                        
                <tr class="dropTr" style="background-color:#f1f3f4;" > 
                <td>  <b>A.</b></td>
                    
               <td> 안녕하세요 <td>
        
                  <td><c:if test="${status.index eq status2.index}"> 
                  
                  ${dto_answer.product_i_a_content}
                  <c:set var="found" value="success" />
                   </c:if></td> 
              
                
                    
                 <c:if test="${found ne 'success'}">
                    <td>등록된 답변이 없습니다</td>
                </c:if>
                
                
                
              
                </tr>
                
                <tr style="background-color:#f1f3f4; text-align:right;" > 
                <td></td>
                               
                <td>
                <div id ="ProWriteBtn">
                  <button class ="goProBtn"  onclick="ProdInqWrite()" >답변하기</button>
                 
                  <button class ="goProBtn"  onclick="del(${answerDto.product_i_a_idx})" >삭제 </button>
                </div>
                </td>
                <td></td>
                </tr>
            
          </table>
  --%>
 
        <!-- dropContent -->
	
  		 
  		    	
     
         
       
		 	
  
  <!-- accordian -->
  </div>
  <!-- admin_prodContent -->
  </div>        
  <!-- admin_prodInq -->
  </div>
  <!-- sideBarContainer -->
</div>




<script>
              
/*   $(function(){
	  
	  
    $(".dropDown").click(function(){
    	var index = 
      $("#dropContent").slideToggle();
      $('.ico_ar').css('transform','none');
      if(!$(this).next().is(":visible"))
      {
        $(this).next().slideToggle();
        $(this).find('.ico_ar:eq(0)').css('transform','rotate(180deg)');
      }
    })
  }) */
  
  function clickDropdown( index ) {
	  $("#dropContent"+index).slideToggle();
      $('.ico_ar').css('transform','none');
      if(!$(this).next().is(":visible"))
      {
        $(this).next().slideToggle();
        $(this).find('.ico_ar:eq(0)').css('transform','rotate(180deg)');
      }
  }

  var popupWidth = 750;
  var popupHeight = 380;
  var popupX = (window.screen.width / 2) - (popupWidth / 2);
  var popupY = (window.screen.height / 2) - (popupHeight / 2);
  
  function ProdInqWrite( idx ) {
    window.open("../admin/admin_productInquiryAnswer.jsp?idx="+idx, "새창", "width=750, height=380, left="+ popupX +", top="+ popupY +",toolbar=no, menubar=no, scrollbars=no, resizable=yes");
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