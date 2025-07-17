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
    <link href="resources/css/latestreviewadd.css" rel="stylesheet" />
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
        <h2 style="text-align: center">리뷰 작성</h2>
        <div class="search-section">
          <!-- 영화 검색 -->
          <form
            class="search-form"
            onsubmit="return false;"
            style="display: flex; justify-content: center; gap: 5px"
          >
            <input
              type="text"
              id="movieInput"
              placeholder="영화 검색"
              style="height: 30px; width: 200px; font-size: 12px"
            />
            <button
              type="button"
              class="search-btn"
              data-type="movie"
              style="height: 30px; font-size: 12px"
            >
              영화 검색
            </button>
          </form>

          <!-- 애니메이션 검색 -->
          <form
            class="search-form"
            onsubmit="return false;"
            style="display: flex; justify-content: center; gap: 5px"
          >
            <input
              type="text"
              id="animeInput"
              placeholder="애니메이션 검색"
              style="height: 30px; width: 200px; font-size: 12px"
            />
            <button
              type="button"
              class="search-btn"
              data-type="anime"
              style="height: 30px; font-size: 12px"
            >
              애니 검색
            </button>
          </form>

          <!-- 게임 검색 -->
          <form
            class="search-form"
            onsubmit="return false;"
            style="display: flex; justify-content: center; gap: 5px"
          >
            <input
              type="text"
              id="gameInput"
              placeholder="게임 검색"
              style="height: 30px; width: 200px; font-size: 12px"
            />
            <button
              type="button"
              class="search-btn"
              data-type="game"
              style="height: 30px; font-size: 12px"
            >
              게임 검색
            </button>
          </form>
        </div>

        <!-- 공통 검색 결과 리스트 -->
        <div class="result-list">
          <c:forEach var="item" items="${searchResults}">
            <div class="result-item">
              <strong class="title">${item.title}</strong>
              <span class="meta">${item.creator}</span>
              <p class="desc">${item.description}</p>
            </div>
          </c:forEach>
        </div>
      </div>
    </div>
    <script src="/resources/js/reviews.js"></script>
  </body>
</html>
