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
    <div class="account-container">
      <h3>${loginUser.u_user_name}님 환영합니다</h3>
      <div class="btn-group">
        <button onclick="logout()" class="logout-btn">로그아웃</button>
        <button class="logout-btn">내 정보</button>
      </div>
    </div>
  </body>

  <script>
    function logout() {
      let ok = confirm("로그아웃 하시겠습니까?");
      if (ok) {
        location.href = "logoutdo";
      }
    }
  </script>
</html>
