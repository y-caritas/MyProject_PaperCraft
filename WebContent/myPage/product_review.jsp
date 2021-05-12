<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div>
   <form action="<%= request.getContextPath() %>/reviewinsert.do" method="POST">               
         <div style="text-align: center; padding-top: 50px;">
         <b>평점</b>&emsp;&emsp;
         <input class="product_grade" type="radio" name="product_r_grade" id="" value="05">&nbsp; 매우 만족 ☆ ☆ ☆ ☆ ☆ &emsp;&emsp;
           <input class="product_grade" type="radio" name="product_r_grade" id="" value="04">&nbsp; 만족 ☆ ☆ ☆ ☆ &emsp;&emsp;
           <input class="product_grade" type="radio" name="product_r_grade" id="" value="03">&nbsp; 보통 ☆ ☆ ☆ &emsp;&emsp;
           <input class="product_grade" type="radio" name="product_r_grade" id="" value="02">&nbsp; 불만 ☆ ☆ &emsp;&emsp;
           <input class="product_grade" type="radio" name="product_r_grade" id="" value="01">&nbsp; 매우 불만 ☆
         </div>                
     <input name="product_r_content" style="margin: 20px; width: 850px; height: 80px;" type="text" id=""
     placeholder="띄어쓰기를 포함하여 최대 000자까지 작성할 수 있습니다. ※ 욕설, 영업에 방해되는 글은 관리자에 의해 삭제됩니다">
     <input name="product_idx" value="${product_idx}" hidden="hidden">
     <input name="product_r_img" value="${productDto.product_introImg}" hidden="hidden">               
     <input name="member_id" value="${member_id}" hidden="hidden">
     <button style="width: 100px; height: 60px;" type="submit" class="btn btn-secondary">등록</button>
   </form>
  </div>
</body>
</html>