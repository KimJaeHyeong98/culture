<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>browse latest review | CCC</title>
    <link rel="icon" href="https://i.imgur.com/CpTWrKm.png" />

    <link href="resources/css/sample.css" rel="stylesheet" />
    <!-- <link href="resources/css/latestreview.css" rel="stylesheet" /> -->
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
          <input type="text" placeholder="search" />
          <button>></button>
        </div>
        <div class="box">
          <strong>메뉴</strong><br />
          <ul>
            <li><a href="/home">홈</a></li>
            <li><a href="/gamelist">게임</a></li>
            <li>애니메이션</li>
            <li>영화</li>
            <li>태그</li>
            <li><a href="/latestReview">유저 리뷰</a></li>
            <li>토론</li>
            <li>FAQ</li>
            <li>랜덤</li>
          </ul>
        </div>
        <div class="include-wrapper">
          <jsp:include page="${content}"></jsp:include>
        </div>
      </div>
      <div class="main">
        <div
          style="
            border: 1px solid #0077cc;
            background-color: rgba(0, 0, 139, 0.2);
            height: 774px;
          "
        >
          <!-- 최신리뷰 메인페이지 -->
          <div class="lreview-title">최신 리뷰</div>
            <div class="lreview-wrapper">
              <div class="lreview-toolbar">
                <input type="text" class="search-box" placeholder="ID 검색" />
                <button class="search-btn">🔍</button>
                <span class="sort-type">최신순 | 평점순</span>
              </div>

                <div class="lreview-list">
                    <!-- 반복해서 리뷰 출력될 부분 -->
                    <div class="lreview-item">
                      <div class="lreview-header">
                        <span class="user-id">ID ksy</span>
                        <span class="review-stars">⭐ ⭐ ⭐ ⭐ ⭐</span>
                        <span class="lreview-icon">✏️</span>
                      </div>
                      <div class="review-text">[어서오세요 동물의 숲] 쭈니가 잘생겼어요~❤</div>
                      <div class="review-date">2025-07-09</div>
                    </div>

                    <!-- 리뷰2 -->
                     <div class="lreview-item">
                      <div class="lreview-header">
                        <span class="user-id">ID ksy</span>
                        <span class="review-stars">⭐ ⭐ ⭐ ⭐ ⭐</span>
                        <span class="lreview-icon">✏️</span>
                      </div>
                      <div class="review-text">[명탐정 코난 극장판] 너무너무재밋엇어욤~~ 또 보고싶어용~~^^*</div>
                      <div class="review-date">2025-07-09</div>
                    </div>

                    <!-- 리뷰3 -->
                     <div class="lreview-item">
                      <div class="lreview-header">
                        <span class="user-id">ID ksy</span>
                        <span class="review-stars">⭐ ⭐ ⭐</span>
                        <span class="lreview-icon">✏️</span>
                      </div>
                      <div class="review-text">[쥬라기 월드: 새로운 시작] 그냥 그랬음</div>
                      <div class="review-date">2025-07-09</div>
                    </div>

                    <!-- 리뷰4 -->
                     <div class="lreview-item">
                      <div class="lreview-header">
                        <span class="user-id">ID ksy</span>
                        <span class="review-stars">⭐ ⭐ ⭐ ⭐ ⭐</span>
                        <span class="lreview-icon">✏️</span>
                      </div>
                      <div class="review-text">[쥬라기 월드: 새로운 시작] 공룡이 귀여워요~</div>
                      <div class="review-date">2025-07-09</div>
                    </div>

            </div>
          </div>
        <div style="height: 80px"></div>
      </div>
    </div>
  </body>
</html>
