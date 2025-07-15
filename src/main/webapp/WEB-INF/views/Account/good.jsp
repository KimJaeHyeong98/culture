<% if (session.getAttribute("loginUser") == null) {
response.sendRedirect("login"); return; } %> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link href="resources/css/account.css" rel="stylesheet" />
    <meta http-equiv="Cache-Control" content="no-store" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
  </head>

  <body>
    <div class="account-container">
      <h3>${sessionScope.loginUser.u_user_name}님</h3>
      <c:if test="${loginUser.u_user_pk == 1}">
        <div class="center-btn-wrapper">
          <button class="register-btn" onclick="register()">신작 등록</button>
        </div>
      </c:if>

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
    function register() {
       location.href = "account/register";
    }
  </script>
</html>
