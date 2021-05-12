<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/header.jsp"></c:import>

<section id="orderFormWrap">
  <div class="categoryTitle">
    <h2>상품 주문</h2>
    <hr class="dividingLine">
  </div>
  <form action="orderForm.do" name="orderForm" method="post">
    <div>
      <p>주문자 정보</p>
      <table class="orderFormTable" style="height:70px;">
        <tr>
          <td class="background-footer" style="width:170px;">이름</td>
          <td>
            <span style="margin-left: 10px;">${ memberDto.member_name }</span>
          </td>
        </tr>
        <tr>
          <td class="background-footer" style="width:170px;">연락처</td>
          <td>
            <span style="margin-left: 10px;" id="ordererPhone">${ memberDto.member_phone }</span>
          </td>
        </tr>
      </table>
    </div>
    <div>
      <p>배송 정보</p>
      <table class="orderFormTable" style="height:300px;">
        <tr>
          <td class="background-footer">*이름(회사)</td>
          <td>
            <input type="text" name="recipientName" id="recipientName"><span style="margin-left: 5px;">0</span>/25
          </td>
        </tr>
        <tr>
          <td class="background-footer">*주소</td>
          <td>
            <input type="text" name="recipientAddress1" id="postcode" placeholder="우편번호">
            <input type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br>
            <input type="text" name="recipientAddress2" id="recipientAddress" placeholder="주소" style="margin-top: 3px; margin-bottom:3px;width:61.5%;"><br>
            <input type="text" name="recipientAddress3" id="detailAddress" placeholder="상세주소" style="width:30%;">
            <input type="text" name="recipientAddress4" id="extraAddress" placeholder="참고항목" style="width:30%; margin-left:0;">
          </td>
        </tr>
        <tr>
          <td class="background-footer">*휴대폰</td>
          <td>
            <input type="text" name="recipientPhone" id="recipientPhone">
          </td>
        </tr>
        <tr>
          <td class="background-footer">요청사항</td>
          <td>
            <textarea name="recipientRequest" id="recipientRequest"></textarea>
            <div style="text-align: right;"><span>0</span>/100</div>
          </td>
        </tr>
      </table>
    </div>
    <div>
      <p>결제 금액 확인 및 결제 방법 선택</p>
      <table class="orderFormTable" style="height:200px;">
        <tr>
          <td class="background-footer">총 상품 가격</td>
          <td><span style="margin-left: 10px;">${ purchase_total_value }</span>원</td>
        </tr>
        <c:if test="${ purchase_total_value >= 50000 }">
        <tr>
          <td class="background-footer">배송비</td>
          <td><span style="margin-left: 10px;">무료배송</span></td>
        </tr>
        <tr>
          <td class="background-footer">총 결제 가격</td>
          <td><span style="margin-left: 10px;">${ purchase_total_value }</span>원</td>
        </tr>
        </c:if>
        <c:if test="${ purchase_total_value < 50000 }">
        <tr>
          <td class="background-footer">배송비</td>
          <td><span style="margin-left: 10px;">3000</span>원</td>
        </tr>
        <tr>
          <td class="background-footer">총 결제 가격</td>
          <td><span style="margin-left: 10px;">${ purchase_total_value + 3000 }</span>원</td>
        </tr>
        </c:if>
        <tr>
          <td class="background-footer">일반 결제</td>
          <td>
            <div>
              <input type="radio" name="paymentOption" value="무통장입금" id="deposit">무통장 입금
              <input type="radio" name="paymentOption" value="신용카드" id="credit">카드 결제
              <input type="radio" name="paymentOption" value="계좌이체" id="account">계좌 이체
              <input type="radio" name="paymentOption" value="가상계좌" id="virtual">가상 계좌
              <button type="button" class="deselectBtn" onclick="deselect()">선택해제</button>
            </div>
          </td>
        </tr>
        <tr>
          <td class="background-footer">에스크로 결제</td>
          <td>
            <input type="radio" name="escrow" value="escrowAccount">계좌 이체
            <input type="radio" name="escrow" value="escrowVirtual">가상 계좌
            <button type="button" class="deselectBtn" onclick="deselectEscrow()">선택해제</button>
          </td>
        </tr>
      </table>
      <input type="hidden" name="product_idx1" value="${ product_idx1 }">
      <input type="hidden" name="product_idx2" value="${ product_idx2 }">
      <input type="hidden" name="product_idx3" value="${ product_idx3 }">
      <input type="hidden" name="product_idx1count" value="${ product_idx1count }">
      <input type="hidden" name="product_idx2count" value="${ product_idx2count }">
      <input type="hidden" name="product_idx3count" value="${ product_idx3count }">
      <input type="hidden" name="member_grade" value="${ memberDto.member_grade }">
      <input type="hidden" name="p_name" value="${ p_name }">
      <input type="hidden" name="p_total_price1" value="${ p_total_price1 }">
      <input type="hidden" name="p_total_price2" value="${ p_total_price2 }">
      <input type="hidden" name="p_total_price3" value="${ p_total_price3 }">
      <input type="hidden" name="purchase_total_value" id="purchase_total_value" value="${ purchase_total_value }">
      <input type="hidden" name="ordererName" value="${ memberDto.member_name }">
      <input type="hidden" name="ordererPhone" value="${ memberDto.member_phone }">
      <input type="hidden" name="p_img" value="${ p_img1 }">
      <input type="hidden" name="cart_idx1" value="${ cart_idx1 }">
      <input type="hidden" name="cart_idx2" value="${ cart_idx2 }">
      <input type="hidden" name="cart_idx3" value="${ cart_idx3 }">
    </div>
    <div id="orderFormBtn">
      <input type="submit" onclick="orderFormCheck(); return false;" value="결제하기">
      <button type="button" onclick="">취소</button>
    </div>
  </form>
</section>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
  // 다음 주소 API
  function DaumPostcode() {
    new daum.Postcode({
      oncomplete: function(data) {
        var addr = '';
        var extraAddr = '';

        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
            addr = data.roadAddress;
        } else { // 사용자가 지번 주소를 선택했을 경우(J)
            addr = data.jibunAddress;
        }

        if(data.userSelectedType === 'R'){

          if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
            extraAddr += data.bname;
        }

        if(data.buildingName !== '' && data.apartment === 'Y'){
            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
        }

        if(extraAddr !== ''){
            extraAddr = ' (' + extraAddr + ')';
        }

        document.getElementById("extraAddress").value = extraAddr;
    
        } else {
            document.getElementById("extraAddress").value = '';
        }

        document.getElementById('postcode').value = data.zonecode;
        document.getElementById("recipientAddress").value = addr;
        document.getElementById("detailAddress").focus();
    }
    }).open();
  }

  // radio 선택 해제
  function deselect() {
    var paymentOption = document.getElementsByName('paymentOption');
    for(var i = 0; i < paymentOption.length; i++) {
      if(paymentOption[i].getAttribute('type') == 'radio') {
    	  paymentOption[i].checked = false;
      }
    }
  }
  function deselectEscrow() {
	    var escrow = document.getElementsByName('escrow');
	    for(var i = 0; i < escrow.length; i++) {
	      if(escrow[i].getAttribute('type') == 'radio') {
	    	  escrow[i].checked = false;
	      }
	    }
	  }

  // alert창
  function orderFormCheck() {
    var ordererPhone = document.getElementById("ordererPhone").value;
    var recipientName = document.getElementById('recipientName').value;
    var recipientPhone = document.getElementById('recipientPhone').value;
    var recipientAddress = document.getElementById('recipientAddress').value;
    var paymentOption = document.getElementsByName('paymentOption');
    var escrow = document.getElementsByName('escrow');

    if( recipientName == null || recipientName == "") {
      alert("배송받는 분 이름을 입력해주세요.");
      document.getElementById('recipientName').focus();
      return false;
    } else if(recipientAddress == null || recipientAddress == "") {
      alert("배송받는 분 주소를 입력해주세요.");
      document.getElementById('recipientAddress').focus();
      return false;
    } else if(recipientPhone == null || recipientPhone == "") {
      alert("배송받는 분 연락처를 입력해주세요.");
      document.getElementById('recipientPhone').focus();
      return false;
    } else if(paymentOption.value != null && escrow.value != null) {
    	alert("결제방식을 하나만 선택해주세요.");
    	return false;
    }
    
    var purchaseTotalValue = document.getElementById('purchase_total_value').value;
    for(var i = 0; i < paymentOption.length; i++) {
    	if(paymentOption[i].checked == true && paymentOption[i].value === "신용카드") {
    		window.open("/MyProject_PaperCraft/order/card_payment.jsp?purchase_total_value="+purchaseTotalValue, "새창", "width=430, height=400, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
    		return false;
    	}
    }

    form.submit();
  }

// 주소창 인풋 박스 focus 시 다음 API 창 띄우기
  recipientAddress.focus = function() {
    DaumPostcode();
  }

  recipientAddress.onclick = function() {
    DaumPostcode();
  }

  postcode.onclick = function() {
    DaumPostcode();
  }

</script>

<c:import url="/footer.jsp"></c:import>
