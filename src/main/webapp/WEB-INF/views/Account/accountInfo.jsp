<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>browse game | CCC</title>
    <link rel="icon" href="https://i.imgur.com/CpTWrKm.png" />

    <link href="resources/css/sample.css" rel="stylesheet" />
    <link href="resources/css/accountInfo.css" rel="stylesheet" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Bitcount+Grid+Double:wght@100..900&display=swap"
      rel="stylesheet"
    />
  </head>
  <body>
    <header>
      <div>　</div>
      <div><a href="/home" id="logo">Cultural</a></div>
      <div><a href="/home" id="logo">Content</a></div>
      <div><a href="/home" id="logo">Critic</a></div>
    </header>

    <div class="container">
      <div class="sidebar">
        <div class="search-box">
          <input
            style="background-color: rgba(0, 0, 139, 0.2); border-radius: 0px"
            type="text"
            placeholder="search"
          />
          <button
            style="background-color: rgba(0, 0, 139, 0.2); border-radius: 0px"
          >
            >
          </button>
        </div>
        <div class="box">
          <strong>메뉴</strong><br />
          <ul>
            <li><a href="/home">홈</a></li>
            <li><a href="/gamelist">게임</a></li>
            <li>애니메이션</li>
            <li>영화</li>
            <li>태그</li>
            <li><a href="/latestreview">유저 리뷰</a></li>
            <li>토론</li>
            <li>FAQ</li>
            <li>랜덤</li>
          </ul>
        </div>
        <div class="include-wrapper">
          <jsp:include page="${content}"></jsp:include>
        </div>
      </div>
      <div class="info-main">
        <h2 style="text-align: center; color: white">회원 정보</h2>
        <div class="user-info-list" id="infoArea">
          <div class="label">아이디:</div>
          <div class="value" id="id">${userInfo.u_user_id}</div>

          <div class="label">비밀번호:</div>
          <div class="value" id="pw">${userInfo.u_password}</div>

          <div class="label">이름:</div>
          <div class="value" id="name">${userInfo.u_user_name}</div>

          <div class="label">가입일:</div>
          <div class="value">
            <fmt:formatDate
              value="${userInfo.u_created_at}"
              pattern="yyyy-MM-dd"
            />
          </div>
        </div>

        <div class="info-btn-group" id="buttonArea">
          <button class="info-btn" onclick="enableEdit()">회원정보 수정</button>
          <button class="info-btn delete" onclick="deleteAccount()">
            회원탈퇴
          </button>
        </div>
      </div>
    </div>
    <script>
      const userInfo = {
        u_user_id: "${userInfo.u_user_id}",
        u_password: "${userInfo.u_password}",
        u_user_name: "${userInfo.u_user_name}",
      };
    </script>
    <script src="/resources/js/accountInfo.js"></script>
  </body>
</html>
