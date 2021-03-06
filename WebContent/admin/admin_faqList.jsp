<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- side bar CSS -->
<link href="<%= request.getContextPath() %>/CSS/adminSideBarCss.css" rel="stylesheet">
<style>
    #adminFaqListMain {
      margin: 0 auto;
    }
    #faqNavbar {
      text-align: center;
      margin: 30px auto;
    }
    #faqNavbar a {
      text-decoration: none;
      font-size: 0.9em;
    }
    #faqNavbar a:hover {
      background-color: #f1f3f4;
    }
    #faqCategoryName {
      width: 900px;
      margin: 5px auto;
      font-size: 0.9em;
      font-weight: bold;
    }
    #adminFaqTable {
      width: 900px;
      border-collapse: collapse;
      font-size: 0.9em;
      margin: 0 auto;
    }
    #adminFaqTable:first-child td {
      border-top: solid 0.5px #c7c7c7;
      border-bottom: solid 0.5px #c7c7c7;
    }
    .show {
      background-color: #f1f3f4;
    }
    .faqContentContainer {
      display: none;
    }
    .adminFaqBtn {
      outline: none;
      background-color: white;
      font-size: 0.9em;
      padding: 5px;
      border: none;
      cursor: pointer;
    }
    .adminFaqContentBtn {
      outline: none;
      background-color: #e3e3e4;
      font-size: 0.9em;
      padding: 5px;
      border: solid 0.5px #e3e3e4;
      cursor: pointer;
    }
    .adminFaqBtnWrap {
      display: flex;
      justify-content: flex-end;
    }
    .bold {
      font-weight: bold;
    }
</style>
</head>
<body>
  <div id="sideBarContainer">
    <!-- side bar -->
    <c:import url="/admin/admin_sideBar.jsp"></c:import>
    
    <!-- main section 작성 -->
    <div id="adminFaqListMain">
    <div class="adminCategoryTitle">
        <h4>| 자주하는 질문</h4>
        <hr>
      </div>
      <div id="faqNavbar">
        <a href="adminFaqList.do" name="faqAll" id="faqAll">전체</a>
        |
        <a href="adminFaqList.do?category=faqProduct" name="faqProduct" id="faqProduct">상품</a>
        |
        <a href="adminFaqList.do?category=faqSwap" name="faqSwap" id="faqSwap">반품/교환</a>
        |
        <a href="adminFaqList.do?category=faqDelivery" name="faqDelivery" id="faqDelivery">배송</a>
      </div>
      <c:if test="${ category != null }">
      <p id="faqCategoryName"></p>
      </c:if>
      <script>
        var faqAll = document.getElementById('faqAll');
        var faqProduct = document.getElementById('faqProduct');
        var faqSwap = document.getElementById('faqSwap');
        var faqDelivery = document.getElementById('faqDelivery');
      </script>
      <%
        if(request.getAttribute("category") != null) {
        	if(request.getAttribute("category").equals("상품")) {
            	%><script>
            	faqProduct.classList.toggle('bold');
            	if( faqSwap.classList.contains('bold') ) {
                    faqSwap.classList.toggle('bold');
                } else if( faqDelivery.classList.contains('bold') ) {
                    faqDelivery.classList.toggle('bold');
                } else if( faqAll.classList.contains('bold') ) {
                	faqAll.classList.toggle('bold');
                }
            	</script><%
            } else if(request.getAttribute("category").equals("반품/교환")) {
            	%><script>
            	faqSwap.classList.toggle('bold');
            	if( faqProduct.classList.contains('bold') ) {
            		faqProduct.classList.toggle('bold');
                } else if( faqDelivery.classList.contains('bold') ) {
                	faqDelivery.classList.toggle('bold');
                } else if( faqAll.classList.contains('bold') ) {
                	faqAll.classList.toggle('bold');
                }
            	</script><%
            } else if(request.getAttribute("category").equals("배송")) {
            	%><script>
            	faqDelivery.classList.toggle('bold');
            	if( faqProduct.classList.contains('bold') ) {
            		faqProduct.classList.toggle('bold');
                } else if( faqSwap.classList.contains('bold') ) {
                	faqSwap.classList.toggle('bold');
                } else if( faqAll.classList.contains('bold') ) {
                	faqAll.classList.toggle('bold');
                }
            	</script><%
            } else if(request.getAttribute("category").equals("전체")) {
            	%><script>
            	faqAll.classList.toggle('bold');
            	if( faqProduct.classList.contains('bold') ) {
            		faqProduct.classList.toggle('bold');
                } else if( faqSwap.classList.contains('bold') ) {
                	faqSwap.classList.toggle('bold');
                } else if( faqDelivery.classList.contains('bold') ) {
                	faqDelivery.classList.toggle('bold');
                }
            	</script><%
            }
        }
      %>
        
        <!-- faqProduct.addEventListener('click', function() {
        this.classList.toggle('bold');
        faqCategoryName.innerText = this.innerText;
        if( faqSwap.classList.contains('bold') ) {
          faqSwap.classList.toggle('bold');
        } else if( faqDelivery.classList.contains('bold') ) {
          faqDelivery.classList.toggle('bold');
        }
      })-->

      <c:if test="${ faqList != null }">
        <c:forEach var="dto" items="${ faqList }">
          <table id="adminFaqTable">
            <tr>
              <td style="width:10%;">${ dto.faq_idx }</td>
              <td>${ dto.faq_title }</td>
              <td style="width:10%;"><button type="button" onclick="show(${ dto.faq_idx })" class="adminFaqBtn" id="faqContentBtn${ dto.faq_idx }">보기▼</button></td>
            </tr>
            <tr class="faqContentContainer" id="faqContainer${ dto.faq_idx }">
              <td colspan="3" style="background-color: #f1f3f4;">
                ${ dto.faq_content }
                <div class="adminFaqBtnWrap">
                  <!-- <button class="adminFaqContentBtn">수정</button> -->
                  <button class="adminFaqContentBtn" onclick="location.href='adminFaqDelete.do?faq_idx=${ dto.faq_idx }'" style="margin: auto 10px;">삭제</button>
                </div>
              </td>
            </tr>
          </table>
          <script>
            function show( num ) {
              var faqContainer = document.getElementById('faqContainer'+num);
              var faqContentBtn = document.getElementById('faqContentBtn'+num);
              faqContentBtn.innerText = '보기▼';
              if(faqContainer.style.display === "table-row") {
                faqContainer.style.display = "none";
              } else {
                faqContainer.style.display = "table-row";
                faqContentBtn.innerText = '닫기▲';
              }
            }
          </script>
        </c:forEach>
      </c:if>
      <div class="adminFaqBtnWrap">
        <button class="adminFaqContentBtn" onclick="faqWriteOpen()" style="margin-right:50px; margin-top:20px; width:70px;">등록</button>
      </div>
      <script>
        var popupWidth = 750;
        var popupHeight = 380;
        var popupX = (window.screen.width / 2) - (popupWidth / 2);
        var popupY = (window.screen.height / 2) - (popupHeight / 2);
        
        function faqWriteOpen() {
          window.open("../admin/admin_faqWrite.jsp", "새창", "width=750, height=430, left="+ popupX +", top="+ popupY +",toolbar=no, menubar=no, scrollbars=no, resizable=yes");
        }
      </script>
    </div>
  </div>  

</body>
</html>