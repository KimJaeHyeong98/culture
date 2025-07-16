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
    <link href="resources/css/gamelist.css" rel="stylesheet" />

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
          <!-- 게임 메인페이지 -->
          <div class="game-title">GAME</div>
          <div class="game-wrap">
            <c:forEach var="game" items="${games}">
              <div class="game-review">
                <img src="${game.g_poster_path}" alt="포스터" style="width: 150px;">
                <div>
                  <div hidden>${game.g_game_id}</div>
                  <div class="rating" onclick="openModal('${game.g_game_id}')">평점 : ⭐⭐⭐⭐⭐</div>
                  <div>제목 : ${game.g_title}</div>
                  <div>출시일 : ${game.g_release_date}</div>
                  <div>감독 : ${game.g_director}</div>
                  <div>장르 : ${game.category_list}</div>
                </div>
              </div>
            </c:forEach>
          </div>
            <div class="pagination">
              <a href="/gamelist?page=1">«</a>
                <c:forEach var="p" begin="1" end="${totalPage}">
                  <a href="/gamelist?page=${p}" style="${p == currentPage ? 'font-weight:bold' : ''}">
                    &nbsp;${p}&nbsp;
                  </a>
                </c:forEach>
              <a href="/gamelist?page=${totalPage}">»</a>
            </div>
        </div>
        <div style="height: 80px"></div>
      </div>
    </div>
    <!-- 모달 -->
    <c:forEach var="game" items="${games}">
      <div id="ratingModal-${game.g_game_id}" class="modal">
        <div class="modal-content">
          <span class="close" onclick="closeModal('${game.g_game_id}')">&times;</span>
          <h1 class="modal-title">${game.g_title}</h1>
            <!-- 정렬 탭 -->
            <div class="sort-options">
              <span class="sort-button active" onclick="sortReviews('latest', '${game.g_game_id}')">최신순</span> |
              <span class="sort-button" onclick="sortReviews('rating', '${game.g_game_id}')">평점순</span>
              ${reviewsMap}
            </div>
          <!-- 모달 리뷰 리스트 -->
          <div class="review-list">
            <c:forEach var="review" items="${game.reviews}">
              <div class="review-item">
                <div class="review-header">
                  <div class="review-left">
                    <span class="review-id">닉네임 : ${loginUser.u_user_name}</span>
                    <span class="review-stars">⭐⭐⭐⭐⭐</span>
                  </div>
                  <div class="review-right">
                    <span class="review-icon" onclick="editReview('${review.r_review_id}')">✏️</span>
                    <span class="save-icon" id="save-${review.r_review_id}" style="display:none;" onclick="saveReview('${review.r_review_id}')">💾</span>
                  </div>
                </div>
                <p class="review-text" id="text-${review.r_review_id}">${review.r_content}</p>
                <textarea class="edit-text" id="edit-${review.r_review_id}" style="display:none;">${review.r_content}</textarea>
                <div class="review-footer">
                  <span class="review-date">2025-07-09</span>
                </div>
              </div>
            </c:forEach>
          </div>
        </div>
      </div>
    </c:forEach>
    <script src="resources/js/gamelist.js"></script>
  </body>
</html>
