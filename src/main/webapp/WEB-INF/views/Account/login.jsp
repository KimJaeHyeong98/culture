<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
     <link href="resources/css/account.css" rel="stylesheet" />
</head>
<body>
<c:if test="${loginFail}">
  <script>
    alert("아이디 또는 비밀번호가 잘못되었습니다.");
   
  </script>
</c:if>

   <div class="account-container">
  <h3>로그인 </h3>
  <form action="logindo" method="post">
    <input type="text" name="u_user_id" placeholder="아이디 입력">
    <br>
    <input type="password" name="u_password" placeholder="비밀번호 입력">
    <button class="login-btn">로그인</button>
  </form>
   <button onclick="location.href='account'" class="login-btn">회원가입</button>
</div>
</body>
</html>