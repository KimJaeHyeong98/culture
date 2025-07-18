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
    <link href="resources/css/latestreview.css" rel="stylesheet" />
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
        <h2 style="text-align: center">나의 리뷰</h2>

        <!-- 📋 리뷰 리스트 -->
        <div class="review-list">
          <c:forEach var="review" items="${myReview}">
            <div class="review-item"  data-review-id="${review.reviewId}">
              <button class="edit-btn">수정</button>
              <button class="delete-btn">삭제</button>
              <!-- 콘텐츠 유형 -->
              <c:choose>
                <c:when test="${review.contentType == 'GAME'}">
                  <span class="review-type" style="color: blue"
                    >${review.contentType}</span
                  >
                </c:when>
                <c:when test="${review.contentType == 'ANIME'}">
                  <span class="review-type" style="color: red"
                    >${review.contentType}</span
                  >
                </c:when>
                <c:when test="${review.contentType == 'MOVIE'}">
                  <span class="review-type" style="color: yellow"
                    >${review.contentType}</span
                  >
                </c:when>
                <c:otherwise>
                  <span class="review-type">${review.contentType}</span>
                </c:otherwise>
              </c:choose>
              <!-- 콘텐츠 제목 -->
              <span class="review-title"> ${review.contentTitle}</span><br />
              <!-- 리뷰 본문 -->
              <span class="review-content">${review.content}</span><br />
              <!-- 작성일 -->
              <span class="review-date"> ${review.reviewDate}</span>
              <!-- 추천 여부 -->

              <!-- <span class="review-recommend">
                <c:choose>
                  <c:when test="${review.recommendYn == 'Y'}">👍 추천</c:when>
                  <c:otherwise>👎 비추천</c:otherwise>
                </c:choose>
              </span> -->
              <span
                class="review-recommend"
                data-recommend="${review.recommendYn}"
              >
                <c:choose>
                  <c:when test="${review.recommendYn == 'Y'}">👍 추천</c:when>
                  <c:otherwise>👎 비추천</c:otherwise>
                </c:choose>
              </span>
            </div>
          </c:forEach>
        </div>
      </div>
    </div>
  </body>
  <script src="/resources/js/accountInfo.js"></script>
</html>
