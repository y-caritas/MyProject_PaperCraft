
function confirmProduct() {
		
	submitContents();
	//스마트웹에디터 value 값 주고 받기가 안됨.
	oEditors.getById["product_introduction"].exec("UPDATE_CONTENTS_FIELD", []);
	oEditors.getById["content"].exec("SET_IR", [""]); 
	oEditors.getById["content"].exec("PASTE_HTML", ["내용 내용"]);
	
	if(document.adminProduct.product_category.value.length == 0) {
		alert("카테고리를 선택해주세요.");
		adminProduct.product_category.focus();
		return false;
	}
	
	if(document.adminProduct.product_name.value.length == 0) {
		alert("상품명을 작성해주세요");
		adminProduct.product_name.focus();
		return false;
	}
	
	if(document.adminProduct.product_note.value.length == 0) {
		alert("상품 소개글을 작성해주세요.");
		adminProduct.product_note.focus();
		return false;
	}
	
	if(document.adminProduct.product_listImg.value.length == 0) {
		alert("상품 이미지를 등록해주세요.");
		adminProduct.product_listImg.focus();
		return false;
	}
	if(document.adminProduct.product_introImg.value.length == 0) {
		alert("상품 이미지를 등록해주세요.");
		adminProduct.product_introImg.focus();
		return false;
	}
	
	if(document.adminProduct.product_introduction.value.length == 0) {
		alert("상품 상세 설명을 작성해주세요");
		adminProduct.product_introduction.focus();
		return false;
	}
	if(document.adminProduct.product_delivery_policy_category.value.length == 0) {
		alert("배송 안내 방식을 선택해주세요");
		adminProduct.product_delivery_policy_category.focus();
		return false;
	}
	if(document.adminProduct.product_delivery_policy.value.length == 0) {
		alert("배송 안내문을 작성해주세요.");
		adminProduct.product_delivery_policy.focus();
		return false;
	}
	if(document.adminProduct.product_swap_policy_category.value.length == 0) {
		alert("교환 및 반품 안내 방식을 선택해주세요.");
		adminProduct.eMail.focus();
		return false;
	}
	if(document.adminProduct.product_swap_policy.value.length == 0) {
		alert("교환 및 반품 안내 방식을 선택해주세요.");
		adminProduct.product_swap_policy.focus();
		return false;
	}
	
	return true;
}

function submitContents() {
	
	//스마트웹에디터 value 값 주고 받기가 안됨.
	oEditors.getById["product_introduction"].exec("UPDATE_CONTENTS_FIELD", []);
//	oEditors.getById["content"].exec("SET_IR", [""]); 
//	oEditors.getById["content"].exec("PASTE_HTML", ["내용 내용"]);
}
	
