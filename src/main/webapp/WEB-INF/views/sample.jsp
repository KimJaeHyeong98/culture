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
        <div class="include-wrapper">
        <jsp:include page="${content}"></jsp:include>
      </div>
      </div>

      

      <div class="main">
        <div class="recommendation">
          <div class="best-title" id="title"></div>
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
              <ol class="median-list">
                <li>게임1　　○○점</li>
                <li>게임2　　○○점</li>
                <li>게임3　　○○점</li>
                <li>게임4　　○○점</li>
                <li>게임5　　○○점</li>
                <li>게임6　　○○점</li>
                <li>게임7　　○○점</li>
                <li>게임8　　○○점</li>
                <li>게임9　　○○점</li>
                <li>게임0　　○○점</li>
              </ol>
              <ol class="average-list">
                <li>게임1　　□□점</li>
                <li>게임2　　□□점</li>
                <li>게임3　　□□점</li>
                <li>게임4　　□□점</li>
                <li>게임5　　□□점</li>
                <li>게임6　　□□점</li>
                <li>게임7　　□□점</li>
                <li>게임8　　□□점</li>
                <li>게임9　　□□점</li>
                <li>게임0　　□□점</li>
              </ol>
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
              <ol class="median-list">
                <li>애니1　　○○점</li>
                <li>애니2　　○○점</li>
                <li>애니3　　○○점</li>
                <li>애니4　　○○점</li>
                <li>애니5　　○○점</li>
                <li>애니6　　○○점</li>
                <li>애니7　　○○점</li>
                <li>애니8　　○○점</li>
                <li>애니9　　○○점</li>
                <li>애니0　　○○점</li>
              </ol>
              <ol class="average-list">
                <li>애니1　　□□점</li>
                <li>애니2　　□□점</li>
                <li>애니3　　□□점</li>
                <li>애니4　　□□점</li>
                <li>애니5　　□□점</li>
                <li>애니6　　□□점</li>
                <li>애니7　　□□점</li>
                <li>애니8　　□□점</li>
                <li>애니9　　□□점</li>
                <li>애니0　　□□점</li>
              </ol>
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
              <ol class="median-list">
                <li>영화1　　○○점</li>
                <li>영화2　　○○점</li>
                <li>영화3　　○○점</li>
                <li>영화4　　○○점</li>
                <li>영화5　　○○점</li>
                <li>영화6　　○○점</li>
                <li>영화7　　○○점</li>
                <li>영화8　　○○점</li>
                <li>영화9　　○○점</li>
                <li>영화0　　○○점</li>
              </ol>
              <ol class="average-list">
                <li>영화1　　□□점</li>
                <li>영화2　　□□점</li>
                <li>영화3　　□□점</li>
                <li>영화4　　□□점</li>
                <li>영화5　　□□점</li>
                <li>영화6　　□□점</li>
                <li>영화7　　□□점</li>
                <li>영화8　　□□점</li>
                <li>영화9　　□□점</li>
                <li>영화0　　□□점</li>
              </ol>
            </div>
          </div>
        </div>
        <div style="height: 80px"></div>
      </div>
    </div>
  </body>
  <script src="resources/js/sample.js"></script>
</html>
