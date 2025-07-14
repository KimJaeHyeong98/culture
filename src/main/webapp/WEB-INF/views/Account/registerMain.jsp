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
          </ul>
        </div>
        <div class="include-wrapper">
          <jsp:include page="${content}"></jsp:include>
        </div>
      </div>

      <div class="register-main">
        <h2>신작 등록</h2>
        <form>
          <label for="user-color">신작 종류</label>
          <select id="user-color" required onchange="showInputs()">
            <option value="" disabled selected>신작 종류</option>
            <option value="movie">영화</option>
            <option value="anime">애니메이션</option>
            <option value="game">게임</option>
          </select>

          <br /><br /><br /><br />

          <div id="input-container"></div>
        </form>
      </div>
    </div>
    <script>
      function showInputs() {
        const type = document.getElementById("user-color").value;
        const container = document.getElementById("input-container");

        // HTML 초기화
        container.innerHTML = "";

        if (type === "movie") {
          container.innerHTML = `
          <h3>영화 등록 </h3>
        Title: <input type="text" name="m_title"><br><br>
        Poster: <input type="file" name="m_poster_path"><br><br>
        Release Date: <input type="date" name="m_release_date"><br><br>
      `;
        } else if (type === "anime") {
          container.innerHTML = `
           <h3>애니메이션 등록 </h3>
       Title: <input type="text" name="m_title"><br><br>
        Poster: <input type="file" name="m_poster_path"><br><br>
        Release Date: <input type="date" name="m_release_date"><br><br>
      `;
        } else if (type === "game") {
          container.innerHTML = `
           <h3>게임 등록 </h3>
        Title: <input type="text" name="m_title"><br><br>
        Poster: <input type="file" name="m_poster_path"><br><br>
        Release Date: <input type="date" name="m_release_date"><br><br>
      `;
        }
      }
    </script>
  </body>
</html>
