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
          var result = confirm("장바구니에 추가하시겠습니까?");
          if (result){
            alert("장바구니에 추가되었습니다.");
          } else {
            alert("취소하셨습니다.");
            return false;
          }
        }
    </script>    
  	<%	  	 	
  		if(request.getAttribute("confirm") != null){
		int confirm = (int)request.getAttribute("confirm");
		if(confirm == 0){			
			out.println("<script>alert('장바구니에 존재하는 상품입니다.');</script>");
		}
  		}		
 	%> 	
 <section>
    <div id="product_detail" class="row">
      <div style="text-align: center;" class="col-7">      	
        <img style="width: 100px;" src="${productDto.product_introImg}" alt="">
      </div>
      <div class="col-5">
          <form name="cartForm" action="<%= request.getContextPath() %>/productPurchase.do" method="POST">
          <ul>
              <li class="product_detail">제품명 : <input class="product_detail_text" type="text" disabled value="${productDto.product_name}"/>
              									  <input name="cart_p_name" hidden="hidden" type="text" value="${productDto.product_name}"/>	</li>
              <li>가격 : <input style="width: 60px;" class="product_detail_text" type="text" disabled value="${productDto.product_price}"/>
               			 <input name="cart_p_price" hidden="hidden" type="text" value="${productDto.product_price}"/><b>원</b></li>
              <li>배송비 : <input name="" class="product_detail_text" type="text" disabled value="DB에 배송비 칼럼 없음"/></li>
              <li>수량 : &nbsp;<input class="product_detail_btn" type="button" value="-" id="minus" onclick="productVAR.minus('${productDto.product_name}')">
                  <input name="cart_p_count" style="text-align: center; border: none;" type="text" size="1" value="1" id="${productDto.product_name}">
                  <input class="product_detail_btn" type="button" value="+" id="plus" onclick="productVAR.plus('${productDto.product_name}')"></li>                                 
              <li>총 금액 : 
                  <input style="width: 60px;" class="product_detail_text"  id="${productDto.product_name}_total_price" style="font-weight: bold; border: none;" type="text" disabled value="${productDto.product_price}" />
                  <input name="cart_p_total_price" value="${productDto.product_price}" hidden="hidden"/>
                  <input type="text" value="${productDto.product_price}" id="${productDto.product_name}_product_price" hidden="hidden"/><b>원</b>
              </li>
              <li style="margin-top: 120px;">
              	<input name="product_idx" value="${product_idx}" hidden="hidden">
              	<input name="cart_p_idx" value="${product_idx}" hidden="hidden">
              	<input name="cart_p_img" value="${productDto.product_introImg}" hidden="hidden">
    	        <%-- member_id 로그인 한 세션에서 값 가져오기 --%>
              	<input name="member_id" value="${member_id}" hidden="hidden">
                <button type="submit" formaction="<%= request.getContextPath() %>/cartInsert.do" onclick="return confirmCart()" class="btn btn-secondary">장바구니</button>&emsp;
                <button type="submit" class="btn btn-dark">구매하기</button>
              </li>
          </ul>  
        </form>          
      </div>
    </div>

    <div style="text-align: center; height: 700px;">
      <details onclick="closeAll(thisindex(this))">
        <summary>상세설명</summary>
        <div id="details_1">${productDto.product_introduction}</div>
      </details>
      <details onclick="closeAll(thisindex(this))">
        <summary>상품평</summary>
        <div id="details_2">          
          <table>
		  <colgroup>
		    <col width="10%"/>
		    <col width="30%"/>
		    <col width="50%"/>
		    <col width="10%"/>
		  </colgroup>
          <c:forEach var="productReviewDto" items="${productReviewDto}">  		   
          <tr>
            <td>${productReviewDto.product_r_idx}</td>
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
				☆   
				</c:when>
				<c:when test="${ product_r_grade eq '02' }">
				☆ ☆
				</c:when>
				<c:when test="${ product_r_grade eq '03' }">
				☆ ☆ ☆
				</c:when>
				<c:when test="${ product_r_grade eq '04' }">
				☆ ☆ ☆ ☆
				</c:when>
				<c:when test="${ product_r_grade eq '05' }">
				☆ ☆ ☆ ☆ ☆
				</c:when>				
				</c:choose>
			</td>
         </tr>			
		 </c:forEach>		 	  
          </table>
          <br><br>
          <form action="<%= request.getContextPath() %>/reviewinsert.do" method="POST">
            <div style="border:solid 1px #818181; margin-top: 80px;">
            <table>
              <tr>
                <th style="width: 150px;"><b>평점</b></th>
                <th><input class="product_grade" type="radio" name="product_r_grade" id="" value="05">&nbsp; 매우 만족 ☆ ☆ ☆ ☆ ☆ &emsp;&emsp;
                  <input class="product_grade" type="radio" name="product_r_grade" id="" value="04">&nbsp; 만족 ☆ ☆ ☆ ☆ &emsp;&emsp;
                  <input class="product_grade" type="radio" name="product_r_grade" id="" value="03">&nbsp; 보통 ☆ ☆ ☆ &emsp;&emsp;
                  <input class="product_grade" type="radio" name="product_r_grade" id="" value="02">&nbsp; 불만 ☆ ☆ &emsp;&emsp;
                  <input class="product_grade" type="radio" name="product_r_grade" id="" value="01">&nbsp; 매우 불만 ☆
                </th>
              </tr>
            </table>          
          </div>
          <input name="product_r_content" style="margin: 20px; width: 850px; height: 80px;" type="text" id=""
          placeholder="띄어쓰기를 포함하여 최대 000자까지 작성할 수 있습니다. ※ 욕설, 영업에 방해되는 글은 관리자에 의해 삭제됩니다">
          <input name="product_idx" value="${product_idx}" hidden="hidden">
          <input name="product_r_img" value="${productDto.product_introImg}" hidden="hidden">
          <%-- member_id 로그인 한 세션에서 값 가져오기 --%>
          <input name="member_id" value="${member_id}" hidden="hidden">
          <button style="width: 100px; height: 60px;" type="submit" class="btn btn-secondary">등록</button>
          </form>        
        </div>
      </details>
      <details onclick="closeAll(thisindex(this))">
        <summary>상품문의</summary>
        <div id="details_3">    
        <table>
          <tr>
            <th style="padding-top: 50px; width: 100px;">번호</th>
            <th style="padding-top: 50px; width: 600px;">문의 내용</th>
            <th style="padding-top: 50px; width: 200px;">작성자</th>
            <th style="padding-top: 50px; width: 200px;">작성일</th>
          </tr>
          <c:forEach var="productEnquiryDto" items="${productEnquiryDto}">  		   
          <tr>
          <th style="padding-top: 50px;">{productEnquiryDto.product_i_idx}</th>
          <th style="padding-top: 50px;"> <a href="#"> {productEnquiryDto.product_i_content} 상품문의글 링크코드 및 글자 수 제한 기능 추가</a></th>
          <th style="padding-top: 50px;">{productEnquiryDto.product_i_writer}</th>
          <th style="padding-top: 50px;">{productEnquiryDto.product_i_date}</th>
          </tr>			
   		  </c:forEach>
          <tr>
            <th style="padding-top: 50px;">2</th>
            <th style="padding-top: 50px;"> <a href="#"> 이용자 문의글 상단 30자씩 1줄 표기</a></th>
            <th style="padding-top: 50px;">홍길동</th>
            <th style="padding-top: 50px;">2021-04-06</th>
          </tr>
          <tr>
            <th style="padding-top: 50px;">1</th>
            <th style="padding-top: 50px;"> <a href="#"> 다른 디자인은 없는 것인가요? 새로운 디자인의 제품을 구매...</a></th>
            <th style="padding-top: 50px;">홍길동</th>
            <th style="padding-top: 50px;">2021-04-06</th>
          </tr>
        </table>
        </div>
      </details>
      <details onclick="closeAll(thisindex(this))">
        <summary>배송안내</summary>
        <div id="details_4">
          ${productDto.product_delivery_policy}          
        </div>
      </details>
      <details onclick="closeAll(thisindex(this))">
        <summary>교환 및 반품</summary>
        <div id="details_5">
          ${productDto.product_swap_policy}          
        </div>
      </details>
      </div>
  </section>  
<c:import url="/footer.jsp"></c:import>
