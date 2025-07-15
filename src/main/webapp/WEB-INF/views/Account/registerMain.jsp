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

    <style>
      .form-section {
        flex: 1;
        background-color: white;
        border: 1px solid #ccc;
        border-radius: 12px;
        padding: 20px;
        box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
        box-sizing: border-box;
      }

      /* 각 제목 */
      .form-section h3 {
        margin-top: 0;
        margin-bottom: 20px;
        text-align: center;
        color: #333;
      }

      /* 입력 필드들 */
      .form-section label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
        font-size: 13px;
      }

      .form-section input[type="text"],
      .form-section input[type="date"],
      .form-section input[type="file"] {
        width: 100%;
        padding: 8px;
        font-size: 13px;
        border: 1px solid #ccc;
        border-radius: 6px;
        margin-bottom: 15px;
        box-sizing: border-box;
      }

      /* 버튼 */
      .form-section button {
        width: 100%;
        padding: 10px;
        background-color: #2980b9;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 14px;
        cursor: pointer;
        transition: background-color 0.3s;
      }

      .form-section button:hover {
        background-color: #1f6391;
      }
      .cast_of_categories {
        width: 197px;
        padding: 15px;
        margin-top: 10px;
        background-color: #2980b9;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 14px;
        cursor: pointer;
        transition: background-color 0.3s;
      }
      .cast_of_categories:hover {
        background-color: #2980b9; /* 조금 더 어두운 블루 계열 */
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
          </ul>
        </div>
        <div class="include-wrapper">
          <jsp:include page="${content}"></jsp:include>
        </div>
      </div>

      <div class="register-main">
        <!-- 영화 등록 폼 -->
        <form
          class="form-section"
          action="registerAdd"
          method="post"
          enctype="multipart/form-data"
        >
          <h3>🎬 영화 등록</h3>

          <label>제목</label>
          <input type="text" name="m_title" required />

          <label>포스터</label>
          <input type="file" name="file" id="poster-file" required />
          <span id="filename-text" style="font-size: 12px; color: gray"></span>

          <label>개봉일</label>
          <input type="date" name="m_release_date" required />

          <label>감독</label>
          <input type="text" name="m_director" required />

          <button type="submit">영화 등록하기</button>
        </form>

        <!-- 애니 등록 폼 -->
        <form
          class="form-section"
          action="registerAddAnime"
          method="post"
          enctype="multipart/form-data"
        >
          <h3>📺 애니메이션 등록</h3>

          <label>제목</label>
          <input type="text" name="a_title" required />

          <label>포스터</label>
          <input type="file" name="file" required />

          <label>방영일</label>
          <input type="date" name="a_release_date" required />

          <label>감독</label>
          <input type="text" name="a_director" required />

          <button type="submit">애니 등록하기</button>
        </form>

        <!-- 게임 등록 폼 -->
        <form
          class="form-section"
          action="registerAddGame"
          method="post"
          enctype="multipart/form-data"
        >
          <h3>🎮 게임 등록</h3>

          <label>제목</label>
          <input type="text" name="g_title" required />

          <label>포스터</label>
          <input type="file" name="file" required />

          <label>출시일</label>
          <input type="date" name="g_release_date" required />

          <label>제작사</label>
          <input type="text" name="g_company" required />

          <button type="submit">게임 등록하기</button>
        </form>
      </div>
    </div>
    <button type="submit" onclick="cast_of_categories()" class="cast_of_categories">
      장르,출연진 등록하러가기
    </button>

    <c:if test="${registerSuccess}">
      <script>
        alert("영화 등록 성공!");
      </script>
    </c:if>

    <script>
      document
        .getElementById("poster-file")
        .addEventListener("change", function () {
          const fileInput = this;
          const filename =
            fileInput.files.length > 0
              ? fileInput.files[0].name
              : "선택된 파일 없음";
          document.getElementById("filename-text").innerText = filename;
        });

        function cast_of_categories() {
         location.href = "account/register";
        }
    </script>
  </body>
</html>
