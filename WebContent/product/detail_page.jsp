<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8");%>


  <c:import url="/header.jsp"></c:import>
  
    <script>    
    var productVAR = {      
      product_price : null,
      total_price : null,      
      convert : function (arg) {        
        this.product_price = arg + "_product_price";      
        this.total_price = arg + "_total_price";        
      },
      plus : function (arg) {      
        this.convert(arg);
        var count = document.getElementById(arg).value;
        count++;	
        document.getElementById(arg).value = count;
        document.getElementById(productVAR.total_price).value = document.getElementById(productVAR.product_price).value * count;
        document.cartForm.cart_p_total_price.value = document.getElementById(productVAR.total_price).value;
      },
      minus : function (arg) {    
        this.convert(arg);
        var count = document.getElementById(arg).value;
        if (count > 1) {
        count--;
        document.getElementById(arg).value = count;
        document.getElementById(productVAR.total_price).value = document.getElementById(productVAR.product_price).value * count;
        document.cartForm.cart_p_total_price.value = document.getElementById(productVAR.total_price).value;
        }        
      }
    }
    function thisindex(elm){
        var nodes = elm.parentNode.childNodes, node;
        var i = 0, count = i;
        while( (node=nodes.item(i++)) && node!=elm )
          if( node.nodeType==1 ) count++;
        return count;
      }

      function closeAll(index){
        var len = document.getElementsByTagName("details").length;
        for(var i=0; i<len; i++){
          if(i != index){
            document.getElementsByTagName("details")[i].removeAttribute("open");
          }
        }
      }
      function confirmCart (){
          var result = confirm("??????????????? ?????????????????????????");
          if (result){
            alert("??????????????? ?????????????????????.");
          } else {
            alert("?????????????????????.");
            return false;
          }
        }
      function focus01 (){
    	  document.getElementById('product_introduction').scrollIntoView();
		}
      function focus02 (){
    	  document.getElementById('product_review').scrollIntoView();
		}
      function focus03 (){
    	  document.getElementById('product_enquiry').scrollIntoView();
		}
      function focus04 (){
    	  document.getElementById('product_delivery_policy').scrollIntoView();
		}
      function focus05 (){
    	  document.getElementById('product_swap_policy').scrollIntoView();
		}
    	 
      function goSubmit()
      {
          var popupWidth = 750;
          var popupHeight = 380;
          var popupX = (window.screen.width / 2) - (popupWidth / 2);
          var popupY = (window.screen.height / 2) - (popupHeight / 2);
          var gsWin = window.open("about:blank", "winName", "width=750, height=430, left="+ popupX +", top="+ popupY +",toolbar=no, menubar=no, scrollbars=no, resizable=yes");
          var frm = document.writeEnquiry;          
          frm.target="winName";
          frm.submit();
      }
      function go(product_i_idx)
      {
          var popupWidth = 750;
          var popupHeight = 380;
          var popupX = (window.screen.width / 2) - (popupWidth / 2);
          var popupY = (window.screen.height / 2) - (popupHeight / 2);
          var gsWin = window.open("productEnquiryAnswer.do?product_i_idx="+product_i_idx, "winName", "width=750, height=630, left="+ popupX +", top="+ popupY +",toolbar=no, menubar=no, scrollbars=no, resizable=yes");
      }
      
    </script>    
  	<%	  	 	
  		if(request.getAttribute("confirm") != null){
		int confirm = (int)request.getAttribute("confirm");
		if(confirm == 0){			
			out.println("<script>alert('??????????????? ???????????? ???????????????.');</script>");
		}
  		}		
 	%> 	
 <section>
    <div id="product_detail" class="row">
      <div style="text-align: center;" class="col-7">      	
        <img style="margin-left: 250px; width: 400px; height: 400px" src="${productDto.product_introImg}" alt="">
      </div>
      <div class="col-5">
          <form name="cartForm" action="<%= request.getContextPath() %>/product/productPurchase.do" method="POST">
          <ul>
              <li class="product_detail">????????? : <input class="product_detail_text" type="text" disabled value="${productDto.product_name}"/>
              									  <input name="cart_p_name" hidden="hidden" type="text" value="${productDto.product_name}"/>	</li>
              <li>?????? : <input style="width: 50px;" class="product_detail_text" type="text" disabled value="${productDto.product_price}"/>
               			 <input name="cart_p_price" hidden="hidden" type="text" value="${productDto.product_price}"/><b>???</b></li>
              <li>????????? : <input name="" class="product_detail_text" type="text" disabled value="3000 ???"/></li>
              <li>?????? : &nbsp;<input class="product_detail_btn" type="button" value="-" id="minus" onclick="productVAR.minus('${productDto.product_name}')">
                  <input name="cart_p_count" style="text-align: center; border: none;" type="text" size="1" value="1" id="${productDto.product_name}">
                  <input class="product_detail_btn" type="button" value="+" id="plus" onclick="productVAR.plus('${productDto.product_name}')"></li>                                 
              <li>??? ?????? : 
                  <input style="width: 50px;" class="product_detail_text"  id="${productDto.product_name}_total_price" style="font-weight: bold; border: none;" type="text" disabled value="${productDto.product_price}" />
                  <input name="cart_p_total_price" value="${productDto.product_price}" hidden="hidden"/>
                  <input type="text" value="${productDto.product_price}" id="${productDto.product_name}_product_price" hidden="hidden"/><b>???</b>
              </li>
              <li style="margin-top: 120px;">
              	<input name="product_idx" value="${product_idx}" hidden="hidden">
              	<input name="cart_p_idx" value="${product_idx}" hidden="hidden">
              	<input name="cart_p_img" value="${productDto.product_introImg}" hidden="hidden">
    	        <%-- member_id ????????? ??? ???????????? ??? ???????????? --%>
              	<input name="member_id" value="${member_id}" hidden="hidden">
                <button type="submit" formaction="<%= request.getContextPath() %>/cartInsert.do" onclick="return confirmCart()" class="btn btn-secondary">????????????</button>&emsp;
                <button type="submit" class="btn btn-dark">????????????</button>
              </li>
          </ul>  
        </form>          
      </div>
    </div>
   <div id="product_introduction" style="text-align: center; padding-top: 50px;">
    <ul class="detail_tab clearbox">
      <li><a href="javascript:focus01();" class="detail_tab" style="background-color: #818181;">????????????</a></li>
      <li><a href="javascript:focus02();" class="detail_tab">?????????</a></li>
      <li><a href="javascript:focus03();" class="detail_tab">????????????</a></li>      
      <li><a href="javascript:focus04();" class="detail_tab">????????????</a></li>
      <li><a href="javascript:focus05();" class="detail_tab">?????? ??? ??????</a></li>
    </ul>
    <img style="margin-top:100px; width:800px;" src="${productDto.product_introduction}">    
  </div>
  <div id="product_review" style="text-align: center; padding-top: 50px;">
      <ul class="detail_tab clearbox">
        <li><a href="javascript:focus01();" class="detail_tab" >????????????</a></li>
        <li><a href="javascript:focus02();" class="detail_tab" style="background-color: #818181;">?????????</a></li>
        <li><a href="javascript:focus03();" class="detail_tab">????????????</a></li>      
        <li><a href="javascript:focus04();" class="detail_tab">????????????</a></li>
        <li><a href="javascript:focus05();" class="detail_tab">?????? ??? ??????</a></li>
      </ul>
		<div style="text-align: center;">
		<table style="display: inline-block; margin-top: 50px;">
          <colgroup>
            <col width="10%"/>
            <col width="30%"/>
            <col width="50%"/>
            <col width="10%"/>
          </colgroup>
              <c:forEach var="productReviewDto" items="${productReviewDto}" varStatus="status">  		   
              <tr>
                <td>${status.count}</td>
                <td><div><img style="width:100px; height:100px;" src="${productReviewDto.product_r_img}"></div></td>
                <td style="width: 500px;">
                  <div>                  
                    <h5>${productReviewDto.product_r_content}</h5>                  
                  </div>
                </td>            
                <td>
                <c:set var="product_r_grade" value= "${productReviewDto.product_r_grade}" />
            <c:choose>
            <c:when test="${ product_r_grade eq '01' }">
            ???   
            </c:when>
            <c:when test="${ product_r_grade eq '02' }">
            ??? ???
            </c:when>
            <c:when test="${ product_r_grade eq '03' }">
            ??? ??? ???
            </c:when>
            <c:when test="${ product_r_grade eq '04' }">
            ??? ??? ??? ???
            </c:when>
            <c:when test="${ product_r_grade eq '05' }">
            ??? ??? ??? ??? ???
            </c:when>				
            </c:choose>
          </td>
             </tr>			
         </c:forEach>	
              </table>
              <br><br>
              <form action="<%= request.getContextPath() %>/reviewinsert.do" method="POST">
                <div>               
                    <div style="text-align: center; padding-top: 50px;">
                    <b>??????</b>&emsp;&emsp;
                    <input class="product_grade" type="radio" name="product_r_grade" id="" value="05">&nbsp; ?????? ?????? ??? ??? ??? ??? ??? &emsp;&emsp;
                      <input class="product_grade" type="radio" name="product_r_grade" id="" value="04">&nbsp; ?????? ??? ??? ??? ??? &emsp;&emsp;
                      <input class="product_grade" type="radio" name="product_r_grade" id="" value="03">&nbsp; ?????? ??? ??? ??? &emsp;&emsp;
                      <input class="product_grade" type="radio" name="product_r_grade" id="" value="02">&nbsp; ?????? ??? ??? &emsp;&emsp;
                      <input class="product_grade" type="radio" name="product_r_grade" id="" value="01">&nbsp; ?????? ?????? ???
                    </div>                
                <input name="product_r_content" style="margin: 20px; width: 850px; height: 80px;" type="text" id=""
                placeholder="??????????????? ???????????? ?????? 000????????? ????????? ??? ????????????. ??? ??????, ????????? ???????????? ?????? ???????????? ?????? ???????????????">
                <input name="product_idx" value="${product_idx}" hidden="hidden">
                <input name="product_r_img" value="${productDto.product_introImg}" hidden="hidden">               
                <input name="member_id" value="${member_id}" hidden="hidden">
                <button style="width: 100px; height: 60px;" type="submit" class="btn btn-secondary">??????</button>
              </form>
      </div>
  </div>
  <div id="product_enquiry" style="text-align: center; margin-top: 100px; padding-top: 50px;">
    <ul class="detail_tab clearbox">
      <li><a href="javascript:focus01();" class="detail_tab" >????????????</a></li>
      <li><a href="javascript:focus02();" class="detail_tab">?????????</a></li>
      <li><a href="javascript:focus03();" class="detail_tab" style="background-color: #818181;">????????????</a></li>      
      <li><a href="javascript:focus04();" class="detail_tab">????????????</a></li>
      <li><a href="javascript:focus05();" class="detail_tab">?????? ??? ??????</a></li>
    </ul>
    <div style="text-align: center;">
    <table style="display: inline-block; margin-top: 50px;">
      <tr>
        <th style="padding-top: 50px; width: 100px;">??????</th>
        <th style="padding-top: 50px; width: 600px;">?????? ??????</th>
        <th style="padding-top: 50px; width: 200px;">?????????</th>
        <th style="padding-top: 50px; width: 200px;">?????????</th>
      </tr>
      <c:forEach var="productEnquiryDto" items="${productEnquiryDto}" varStatus="status">  		   
      <tr>
      <th style="padding-top: 50px;">${status.count}</th>      
      <th style="padding-top: 50px;"><a href="javascript:void();" onClick="go('${productEnquiryDto.product_i_idx}');"> ${productEnquiryDto.product_i_title}</a></th>
      <th style="padding-top: 50px;">${productEnquiryDto.member_id}</th>
      <th style="padding-top: 50px;">${productEnquiryDto.product_i_date}</th>
      </tr>			
     </c:forEach>      
      <tr>
        <td></td><td></td><td></td>
        <td style="padding-top: 50px;">
          <form name="writeEnquiry" method="POST" action="<%= request.getContextPath() %>/product/product_enquiry.jsp">
          <input name="product_idx" value="<%= request.getParameter("product_idx") %>" hidden="hidden">
          <input name="product_i_category" value="<%= request.getParameter("product_category") %>" hidden="hidden">
          <input name="product_i_name" value="${productDto.product_name}" hidden="hidden">          
          <input name="product_i_img" value="${productDto.product_introImg}" hidden="hidden">
          <input name="member_id" value="${member_id}" hidden="hidden">
          <button style="width: 100px;" type="button" onclick="goSubmit();" class="btn btn-secondary">?????????</button>
          </form>
        </td>
      </tr>
    </table>
  </div><br><br><br><br>
  </div>
  <div id="product_delivery_policy" style="text-align: center; padding-top: 50px;">
    <ul class="detail_tab clearbox">
      <li><a href="javascript:focus01();" class="detail_tab" >????????????</a></li>
      <li><a href="javascript:focus02();" class="detail_tab">?????????</a></li>
      <li><a href="javascript:focus03();" class="detail_tab">????????????</a></li>      
      <li><a href="javascript:focus04();" class="detail_tab" style="background-color: #818181;">????????????</a></li>
      <li><a href="javascript:focus05();" class="detail_tab">?????? ??? ??????</a></li>
    </ul>
    <div style="padding-left: 46px; padding-top:20px; text-align: center;"><img  src="<%= request.getContextPath() %>/img/delivery.jpg" alt=""></div>
  </div>
  <div id="product_swap_policy" style="text-align: center; padding-top: 50px;">
    <ul class="detail_tab clearbox">
      <li><a href="javascript:focus01();" class="detail_tab">????????????</a></li>
      <li><a href="javascript:focus02();" class="detail_tab">?????????</a></li>
      <li><a href="javascript:focus03();" class="detail_tab">????????????</a></li>      
      <li><a href="javascript:focus04();" class="detail_tab">????????????</a></li>
      <li><a href="javascript:focus05();" class="detail_tab"  style="background-color: #818181;">?????? ??? ??????</a></li>
    </ul>
    <div style="margin:0 auto; text-align: center;"><img style="width:800px" src="<%= request.getContextPath() %>/img/swap.jpg" alt=""></div>
  </div>
  </section>  
<c:import url="/footer.jsp"></c:import>
