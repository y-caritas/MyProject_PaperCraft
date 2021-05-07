<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/header.jsp"></c:import>

<section id="orderFormWrap">
  <div class="categoryTitle">
    <h2>상품 주문</h2>
    <hr class="dividingLine">
  </div>
  <form action="#" name="orderForm">
    <div>
      <p>주문자 정보</p>
      <table class="orderFormTable" style="height:70px;">
        <tr>
          <td class="background-footer" style="width:170px;">이름</td>
          <td>
            <span style="margin-left: 10px;">${member_id}</span>
          </td>
        </tr>
        <tr>
          <td class="background-footer" style="width:170px;">*연락처</td>
          <td>
            <input type="text" name="ordererPhone" id="ordererPhone">
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
            <input type="text" id="postcode" placeholder="우편번호">
            <input type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br>
            <input type="text" name="recipientAddress" id="recipientAddress" placeholder="주소" style="margin-top: 3px; margin-bottom:3px;width:61.5%;"><br>
            <input type="text" id="detailAddress" placeholder="상세주소" style="width:30%;">
            <input type="text" id="extraAddress" placeholder="참고항목" style="width:30%; margin-left:0;">
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
          <td><span style="margin-left: 10px;">0</span>원</td>
        </tr>
        <tr>
          <td class="background-footer">배송비</td>
          <td><span style="margin-left: 10px;">0</span>원</td>
        </tr>
        <tr>
          <td class="background-footer">총 결제 가격</td>
          <td><span style="margin-left: 10px;">0</span>원</td>
        </tr>
        <tr>
          <td class="background-footer">일반 결제</td>
          <td>
            <input type="radio" name="paymentOption" value="1" id="">무통장 입금
            <input type="radio" name="paymentOption" value="2" id="">카드 결제
            <input type="radio" name="paymentOption" value="3" id="">계좌 이체
            <input type="radio" name="paymentOption" value="4" id="">가상 계좌
            <button type="button" class="deselectBtn" onclick="deselect()">선택해제</button>
            
          </td>
        </tr>
        <tr>
          <td class="background-footer">에스크로 결제</td>
          <td>
            <input type="radio" name="escrow" id="">계좌 이체
            <input type="radio" name="escrow" id="">가상 계좌
            <button type="button" class="deselectBtn" onclick="deselect()">선택해제</button>
          </td>
        </tr>
      </table>
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
    var payment = document.getElementsByName('payment');
    for(var i = 0; i < payment.length; i++) {
      if(payment[i].getAttribute('type') == 'radio') {
        payment[i].checked = false;
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

    if(ordererPhone == null || ordererPhone == "") {
      alert("연락처를 입력해주세요.");
      document.getElementById("ordererPhone").focus();
      return false;
    } else if( recipientName == null || recipientName == "") {
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
    }
    
    for(var i = 0; i < paymentOption.length; i++) {
    	if(paymentOption[i].checked == true && paymentOption[i].value === "2") {
    		window.open("/MyProject_PaperCraft/order/card_payment.jsp", "새창", "width=430, height=400, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
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
