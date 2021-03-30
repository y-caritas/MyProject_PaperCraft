<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">

<c:import url="/header.jsp"></c:import>

    <div class=" login1 align-middle" style="width:500px">
      <div class="card-title" style="margin-top:30px;">
        <h2 class="card-title text-center" style="color:#818181;">로그인</h2>
      </div>
      <div class="card-body">
        <form class="form-signin" method="POST"  action="LoginAction" name="LoginMember" onSubmit="logincall();return false">      
         
          <input type="text" id="uid" class="form-control input-lg"  placeholder="아이디를 입력하세요." required autofocus><BR>
          <input type="password" id="upw" class=" form-control input-lg"  placeholder="비밀번호를 입력하세요." required><br>
          
          <div class="login2">
            <label>
               <a href="<%= request.getContextPath() %>/member/login_findID.jsp">아이디 / 비밀번호 찾기</a>  
            </label>
          </div>
          <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">LOGIN</button>
        </form>
        

      </form>

    </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  <c:import url="/footer.jsp"></c:import>