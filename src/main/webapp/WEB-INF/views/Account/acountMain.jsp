<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
 <link href="resources/css/account.css" rel="stylesheet" />
  </head>
  <body>
    <c:if test="${addMembership}">
  <script>
    alert("회원가입 성공!");
   
  </script>
</c:if>
     <div class="account-container">
    <h3>내 계정</h3>
    <div class="btn-group">
      <button onclick="location.href='login'">로그인</button>
      <button onclick="location.href='account'">회원가입</button>
    </div>
  </div>
  </body>
</html>
