<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>browse game | CCC</title>
    <link rel="icon" href="https://i.imgur.com/CpTWrKm.png" />

    <link href="/resources/css/account.css" rel="stylesheet" />
    <link href="/resources/css/sample.css" rel="stylesheet" />
    <link href="/resources/css/register.css" rel="stylesheet" />

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
      
      <div class="register-main">
  <!-- 영화 -->
  <div class="content-box">
    <h3>영화</h3>
    <ul id="movie-list">
      <!-- 영화 항목들이 여기에 비동기로 추가됨 -->
    </ul>
    <button class="load-button" data-type="MOVIE">카테고리 없는 영화 불러오기</button>
  </div>

    <!-- 애니메이션 -->
  <div class="content-box">
    <h3>애니메이션</h3>
    <ul id="anime-list">
      <!-- 애니 항목들이 여기에 비동기로 추가됨 -->
    </ul>
    <button class="load-button" data-type="ANIME">카테고리 없는 애니 불러오기</button>
  </div>

  <!-- 게임 -->
  <div class="content-box">
    <h3>게임</h3>
    <ul id="game-list">
      <!-- 게임 항목들이 여기에 비동기로 추가됨 -->
    </ul>
    <button class="load-button" data-type="GAME">카테고리 없는 게임 불러오기</button>
  </div>



    <div class="content-box">
    <h3>영화</h3>
    <ul id="game-list">
      <!-- 게임 항목들이 여기에 비동기로 추가됨 -->
    </ul>
    <button class="load-button" data-type="GAME">출연진 없는 영화 불러오기</button>
  </div>
</div>

<!-- 카테고리 선택 모달 -->
<div id="categoryModal" class="modal hidden">
  <div class="modal-content">
    <h3>카테고리 선택</h3>
    <!-- <form id="categoryForm">
      <input type="hidden" id="selectedMovieId" name="movieId" /> -->
      <form id="categoryForm">
      <input type="hidden" id="selectedMovieId" name="movieId" />
      <input type="hidden" id="selectedAnimeId" />
      <input type="hidden" id="selectedGameId" />

      <div id="categorySelectContainer">
        <select name="categoryIds" class="category-select" required>
          <option value="">-- 카테고리 선택 --</option>
          <option value="1">액션</option>
          <option value="2">공포</option>
          <option value="3">판타지</option>
          <option value="4">SF</option>
          <option value="5">드라마</option>
          <option value="6">로맨스</option>
          <option value="7">코미디</option>
          <option value="8">스릴러</option>
          <option value="9">미스터리</option>
          <option value="10">모험</option>
          <option value="11">전쟁</option>
          <option value="12">범죄</option>
          <option value="13">스포츠</option>
          <option value="14">음악</option>
          <option value="15">애니메이션</option>
        </select>
      </div>

      <!-- 버튼 영역 -->
      <div style="margin: 10px 0;">
        <button type="button" onclick="addCategorySelect()">＋ 카테고리 추가</button>
        <button type="button" onclick="removeCategorySelect()">− 삭제</button>
      </div>

      <div style="margin-top: 15px;">
        <button type="submit">저장하기</button>
        <button type="button" onclick="closeModal()">닫기</button>
      </div>
    </form>
  </div>
</div>
   <script src="/resources/js/register.js"></script>
  </body>
</html>
