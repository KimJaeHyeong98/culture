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

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Bitcount+Grid+Double:wght@100..900&display=swap"
      rel="stylesheet"
    />
    <style>
      .game-title {
        padding: 10px;
        text-align: center;
        font-size: 30pt;
      }
      .game-wrap {
        width: 100%;
        display: flex;
        flex-wrap: wrap;
        justify-content: flex-start; /* 좌측 정렬 */
        gap: 20px; /* 카드 간 간격 */
        padding: 10px;
        box-sizing: border-box;
      }

      .game-review {
        width: calc((100% - 40px) / 3); /* gap 20px이 2번 들어가니까 40px 빼줘야 함 */
        height: 200px;
        display: flex;
        border-radius: 10px;
        background-color: rgba(0, 0, 0, 0.5);
        padding: 10px;
        gap: 10px;
        color: white;
        font-family: sans-serif;
        box-sizing: border-box;
      }

      .game-review div:first-child {
        width: 40%;
        background-color: gray;
        border-radius: 5px;
      }

      .game-review div:last-child {
        width: 60%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        gap: 5px;
        font-size: 15px;
      }

      .pagination{
        display: flex;
        justify-content: center;
        position: inherit;
        /* margin-top: 30px;
        gap: 10px; */
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
            <li>유저 리뷰</li>
            <li>토론</li>
            <li>FAQ</li>
            <li>랜덤</li>
          </ul>
        </div>
        <div class="box">
          <strong>내 계정</strong><br />
          <ul>
            <li>로그인</li>
            <li>회원가입</li>
            <li>내 정보</li>
          </ul>
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
                  <div>평점 : ⭐⭐⭐⭐⭐</div>
                  <div>제목 : ${game.g_title}</div>
                  <div>출시일 : ${game.g_release_date}</div>
                  <div>감독 : ${game.g_director}</div>
                  <div>장르 : ${game.category_list}</div>
                </div>
              </div>
            </c:forEach>
          </div>
            <div class="pagination">
              <c:forEach var="p" begin="1" end="${totalPage}">
                <a href="/gamelist?page=${p}" style="${p == currentPage ? 'font-weight:bold' : ''}">
                  ${p}
                </a>
              </c:forEach>
            </div>
        </div>
        <div style="height: 80px"></div>
      </div>
    </div>
  </body>
</html>
