<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>browse game | CCC</title>
    <link rel="icon" href="https://i.imgur.com/CpTWrKm.png" />

    <link href="resources/css/sample.css" rel="stylesheet" />
    <!-- <link href="resources/css/latestreview.css" rel="stylesheet" /> -->
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

      .review-search-box {
        margin-bottom: 20px;
        text-align: center;
      }

      .review-search-box input {
        width: 300px;
        padding: 8px;
        font-size: 16px;
        border: 1px solid #0077cc;
        border-radius: 5px;
      }

      .review-search-box button {
        padding: 8px 12px;
        font-size: 16px;
        background-color: #0077cc;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
      }

      .review-list {
        display: flex;
        flex-direction: column;
        gap: 15px;
      }

      .review-item {
        background-color: #f8f8ff;
        border: 1px solid #0077cc;
        padding: 15px;
        border-radius: 8px;
        font-family: "Bitcount Grid Double", sans-serif;
      }

      .review-type {
        font-weight: bold;
        color: #0077cc;
      }

      .review-title {
        font-weight: bold;
        font-size: 18px;
        margin-left: 5px;
      }

      .review-author {
        margin-left: 10px;
        color: gray;
      }

      .review-content {
        display: block;
        margin: 10px 0;
      }

      .review-date {
        font-size: 12px;
        color: #555;
      }

      .review-recommend {
        float: right;
        font-size: 14px;
        font-weight: bold;
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
        <!-- 🔍 검색 폼 -->
        <div class="review-search-box">
          <form action="/searchReview" method="get">
            <input
              type="text"
              name="keyword"
              placeholder="작품명 또는 작성자 이름"
            />
            <button type="submit">검색</button>
          </form>
        </div>

        <!-- 📋 리뷰 리스트 -->
       <div class="review-list">
  <c:forEach var="review" items="${reviews}">
    <div class="review-item">
      <!-- 콘텐츠 유형 -->
      <span class="review-type">[${review.rContentType}]</span>
      <!-- 콘텐츠 제목 -->
      <span class="review-title">${review.contentTitle}</span><br/>
      <!-- 리뷰 본문 -->
      <span class="review-content">${review.rContent}</span><br/>
      <!-- 작성일 -->
      <span class="review-date">${review.reviewDate}</span>
      <!-- 추천 여부 -->
      <span class="review-recommend">
        <c:choose>
          <c:when test="${review.rRecommendYn == 'Y'}">👍 추천함</c:when>
          <c:otherwise>👎 비추천</c:otherwise>
        </c:choose>
      </span>
    </div>
  </c:forEach>
</div>

      </div>
    </div>
  </body>
</html>
