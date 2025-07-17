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

    <link href="/resources/css/account.css" rel="stylesheet" />
    <link href="/resources/css/sample.css" rel="stylesheet" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Bitcount+Grid+Double:wght@100..900&display=swap"
      rel="stylesheet"
    />
    <style>
      .review-main {
        border: 1px solid #0077cc;
        background-color: rgba(0, 0, 139, 0.1);
        height: 725px;
        width: 1000px;
        margin: 0 auto;
        padding: 30px;
      }

      .search-section {
        display: flex;
        justify-content: space-between;
        margin-bottom: 20px;
      }

      .search-form {
        display: flex;
        gap: 8px;
      }

      .search-form input {
        width: 180px;
        padding: 8px;
        border: 1px solid #0077cc;
        border-radius: 4px;
        font-size: 14px;
      }

      .search-form button {
        padding: 8px 12px;
        background-color: #0077cc;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
      }

      .result-list {
        background-color: white;
        border: 1px solid #ccc;
        height: 500px;
        overflow-y: auto;
        padding: 15px;
        border-radius: 8px;
        font-family: "Bitcount Grid Double", sans-serif;
      }

      .result-item {
        border-bottom: 1px solid #ddd;
        padding: 10px 0;
      }

      .result-item:last-child {
        border-bottom: none;
      }

      .result-item .title {
        font-weight: bold;
        font-size: 16px;
        color: #0077cc;
      }

      .result-item .meta {
        margin-left: 10px;
        font-size: 13px;
        color: #777;
      }

      .result-item .desc {
        margin-top: 5px;
        font-size: 14px;
        color: #333;
      }
    </style>
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
            <li><a href="<c:url value='/latestReview-all'/>">유저 리뷰</a></li>
            <li>토론</li>
            <li>FAQ</li>
            <li>랜덤</li>
          </ul>
        </div>
        <div class="include-wrapper">
          <jsp:include page="${content}"></jsp:include>
        </div>
      </div>
      <div class="review-main">
        <div class="search-section">
          <!-- 영화 검색 -->
          <form class="search-form" onsubmit="return false;">
            <input type="text" id="movieInput" placeholder="영화 검색" />
            <button type="button" class="search-btn" data-type="movie">
              영화 검색
            </button>
          </form>

          <!-- 애니메이션 검색 -->
          <form class="search-form" onsubmit="return false;">
            <input type="text" id="animeInput" placeholder="애니메이션 검색" />
            <button type="button" class="search-btn" data-type="anime">
              애니 검색
            </button>
          </form>

          <!-- 게임 검색 -->
          <form class="search-form" onsubmit="return false;">
            <input type="text" id="gameInput" placeholder="게임 검색" />
            <button type="button" class="search-btn" data-type="game">
              게임 검색
            </button>
          </form>
        </div>

        <!-- 공통 검색 결과 리스트 -->
        <div class="result-list">
          <c:forEach var="item" items="${searchResults}">
            <div class="result-item">
              <strong class="title">${item.title}</strong>
              <span class="meta">by ${item.creator}</span>
              <p class="desc">${item.description}</p>
            </div>
          </c:forEach>
        </div>
      </div>
    </div>
    <script src="/resources/js/reviews.js"></script>
  </body>
</html>
