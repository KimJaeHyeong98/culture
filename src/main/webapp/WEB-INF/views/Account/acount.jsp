<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link href="/resources/css/account.css" rel="stylesheet" />
  </head>
  <body>
    <div class="account-container">
      <h3>회원가입</h3>
      <form action="joinMembership" method="post">
        <input
          type="text"
          id="u_user_id"
          name="u_user_id"
          placeholder="아이디 입력"
        />
        <button type="button" id="checkIdBtn" class="checkIdBtn">
          아이디 중복체크
        </button>
        <div
          id="id-check-message"
          style="font-size: 12px; margin-bottom: 10px"
        ></div>

        <input
          type="text"
          id="u_user_name"
          name="u_user_name"
          placeholder="닉네임 입력"
        />

        <input
          type="password"
          id="u_password"
          name="u_password"
          placeholder="비밀번호 입력"
        />
        <input
          type="password"
          id="u_password_confirm"
          placeholder="비밀번호 재입력"
        />
        <div
          id="password-check-message"
          style="font-size: 12px; color: red; display: none"
        ></div>

        <button type="submit" id="submitBtn" class="login-btn" disabled>
          회원가입
        </button>
      </form>
    </div>

    <script src="/resources/js/account.js"></script>
  </body>
</html>
