<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Cultural Content Critic | CCC</title>
    <link rel="icon" href="https://i.imgur.com/CpTWrKm.png" />

    <link href="resources/css/sample.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Bitcount+Grid+Double:wght@100..900&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
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

      <div class="main">
        <div class="recommendation">
          <div class="best-title" id="title">
            <div class="best-name" id="tname">　</div>
          </div>
          <div class="pagination">
            <div id="tbtn1" onclick="toggleImg1()"></div>
            <div id="tbtn2" onclick="toggleImg2()"></div>
            <div id="tbtn3" onclick="toggleImg3()"></div>
            <div id="tbtn4" onclick="toggleImg4()"></div>
          </div>
        </div>
        <div class="rankings">
          <!-- 게임 랭킹 -->
          <div class="ranking-box">
            <h3>게임 랭킹</h3>
            <div class="toggle-tabs">
              <span>　</span>
              <span class="tab active" data-type="median">중앙값</span>
              <span>　</span>
              <span class="tab" data-type="average">평균값</span>
            </div>
            <div class="ranking-list">
              <ul class="median-list">
                <li>97점 | Hollow Knight</li>
                <li>97점 | Monster Hunter: World</li>
                <li>95점 | The Division 2</li>
                <li>94점 | Minecraft</li>
                <li>91점 | League of Legends</li>
                <li>91점 | Terraria</li>
                <li>90점 | The Witcher 3: Wild Hunt</li>
                <li>90점 | Grand Theft Auto V</li>
                <li>89점 | Cyberpunk 2077</li>
                <li>89점 | Among Us</li>
              </ul>
              <ul class="average-list">
                <li>95점 | Monster Hunter: World</li>
                <li>95점 | Minecraft</li>
                <li>94점 | The Witcher 3: Wild Hunt</li>
                <li>94점 | Hollow Knight</li>
                <li>94점 | Grand Theft Auto V</li>
                <li>92점 | League of Legends</li>
                <li>91점 | Cyberpunk 2077</li>
                <li>90점 | Among Us</li>
                <li>90점 | The Division 2</li>
                <li>88점 | Terraria</li>
              </ul>
            </div>
          </div>

          <!-- 애니메이션 랭킹 -->
          <div class="ranking-box">
            <h3>애니메이션 랭킹</h3>
            <div class="toggle-tabs">
              <span>　</span>
              <span class="tab active" data-type="median">중앙값</span>
              <span>　</span>
              <span class="tab" data-type="average">평균값</span>
            </div>
            <div class="ranking-list">
              <ul class="median-list">
                <li>99점 | 진격의 거인</li>
                <li>98점 | 코드기어스</li>
                <li>97점 | 명탐정 코난</li>
                <li>97점 | 데스노트</li>
                <li>97점 | 클라나드</li>
                <li>96점 | 페이트 스테이 나이트</li>
                <li>95점 | 서머 포켓츠</li>
                <li>94점 | 카케구루이</li>
                <li>94점 | 러브라이브</li>
                <li>93점 | 원펀맨</li>
              </ul>
              <ul class="average-list">
                <li>98점 | 진격의 거인</li>
                <li>97점 | 클라나드</li>
                <li>96점 | 페이트 스테이 나이트</li>
                <li>96점 | 서머 포켓츠</li>
                <li>96점 | 코드기어스</li>
                <li>94점 | 데스노트</li>
                <li>93점 | 명탐정 코난</li>
                <li>93점 | 러브라이브</li>
                <li>91점 | 원펀맨</li>
                <li>90점 | 카케구루이</li>
              </ul>
            </div>
          </div>

          <!-- 영화 랭킹 -->
          <div class="ranking-box">
            <h3>영화 랭킹</h3>
            <div class="toggle-tabs">
              <span>　</span>
              <span class="tab active" data-type="median">중앙값</span>
              <span>　</span>
              <span class="tab" data-type="average">평균값</span>
            </div>
            <div class="ranking-list">
              <ul class="median-list">
                <li>99점 | 인터스텔라</li>
                <li>99점 | 어벤져스: 엔드게임</li>
                <li>98점 | 너의 이름은.</li>
                <li>97점 | 인셉션</li>
                <li>95점 | 기생충</li>
                <li>95점 | 라라랜드</li>
                <li>95점 | 인사이드 아웃</li>
                <li>94점 | 조커</li>
                <li>92점 | 탑건: 매버릭</li>
                <li>91점 | 타이타닉</li>
              </ul>
              <ul class="average-list">
                <li>98점 | 인터스텔라</li>
                <li>97점 | 어벤져스: 엔드게임</li>
                <li>95점 | 너의 이름은.</li>
                <li>95점 | 기생충</li>
                <li>94점 | 탑건: 매버릭</li>
                <li>93점 | 조커</li>
                <li>91점 | 라라랜드</li>
                <li>90점 | 인셉션</li>
                <li>89점 | 타이타닉</li>
                <li>88점 | 인사이드 아웃</li>
              </ul>
            </div>
          </div>
        </div>
        <div style="height: 80px"></div>
      </div>
    </div>
  </body>
  <script src="resources/js/sample.js"></script>
  <script src="resources/js/latestReview-all.js"></script>
</html>
