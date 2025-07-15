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


/* 폼들 전체 묶는 박스 */
.register-main {
  border: 1px solid #0077cc;
  background-color: rgba(0, 0, 139, 0.1);
  height: auto;
  width: 1000px;
  margin: 0 auto;
  padding: 30px;
  box-sizing: border-box;
  border-radius: 10px;
  display: flex;
  justify-content: space-between;
  gap: 20px;
}

/* 폼 개별 스타일 */
.form-section {
  flex: 1;
  background-color: #ffffff;
  border: 1px solid #ccc;
  border-radius: 12px;
  padding: 20px;
  box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.05);
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
  gap: 10px;
}

/* 폼 내부 제목 */
.form-section h3 {
  margin-top: 0;
  font-size: 18px;
  color: #333;
}

/* 라벨 스타일 */
.form-section label {
  font-weight: bold;
  margin-bottom: 4px;
  font-size: 14px;
  color: #333;
}

/* 입력 필드 */
.form-section input[type="text"],
.form-section input[type="date"],
.form-section input[type="file"] {
  padding: 8px;
  font-size: 14px;
  border: 1px solid #ccc;
  border-radius: 6px;
  width: 100%;
  box-sizing: border-box;
}

/* 포스터 파일명 */
#filename-text {
  font-size: 12px;
  color: gray;
}

/* 폼 제출 버튼 */
.form-section button {
  margin-top: 10px;
  padding: 10px;
  background-color: #0077cc;
  color: white;
  border: none;
  border-radius: 6px;
  font-size: 14px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.form-section button:hover {
  background-color: #005fa3;
}

/* 장르/출연진 버튼 */
.cast_of_categories {
  width: 197px;
  padding: 15px;
  margin: 20px auto 0;
  display: block;
  background-color: #2980b9;
  color: white;
  border: none;
  border-radius: 6px;
  font-size: 14px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.cast_of_categories:hover {
  background-color: #21618c;
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
          action="registerMovieAdd"
          method="post"
          enctype="multipart/form-data"
        >
          <h3>영화 등록</h3>

          <label>제목</label>
          <input type="text" name="m_title" required />

          <label>포스터</label>
          <input type="file" name="file" id="poster-file-movie" required />
          <span id="filename-text-movie" style="font-size: 12px; color: gray"></span>

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
          <h3>애니메이션 등록</h3>

          <label>제목</label>
          <input type="text" name="an_title" required />

          <label>포스터</label>
          <input type="file" name="file" id="poster-file-anime" required />
          <span id="filename-text-anime" style="font-size: 12px; color: gray"></span>

          <label>방영일</label>
          <input type="date" name="an_release_date" required />

          <label>감독</label>
          <input type="text" name="an_director" required />

          <button type="submit">애니 등록하기</button>
        </form>

        <!-- 게임 등록 폼 -->
        <form
          class="form-section"
          action="registerAddGame"
          method="post"
          enctype="multipart/form-data"
        >
          <h3>게임 등록</h3>

          <label>제목</label>
          <input type="text" name="g_title" required />

          <label>포스터</label>
          <input type="file" name="file" id="poster-file-game" required />
          <span id="filename-text-game" style="font-size: 12px; color: gray"></span>
          <label>출시일</label>
          <input type="date" name="g_release_date" required />

          <label>제작사</label>
          <input type="text" name="g_director" required />

          <button type="submit">게임 등록하기</button>
        </form>
      </div>
    </div>
    <button
      type="submit"
      onclick="cast_of_categories()"
      class="cast_of_categories"
    >
      장르 등록하러가기
    </button>
    <button
      type="submit"
      onclick="actoradd()"
      class="cast_of_categories"
    >
      출연진 등록하러가기
    </button>

    <c:if test="${registerSuccess}">
      <script>
        alert("영화 등록 성공!");
      </script>
    </c:if>

     <c:if test="${animeSuccess}">
      <script>
        alert("애니메이션 등록 성공!");
      </script>
    </c:if>

     <c:if test="${gameSuccess}">
      <script>
        alert("게임 등록 성공!");
      </script>
    </c:if>

    <script>
      document
  .getElementById("poster-file-movie")
  .addEventListener("change", function () {
    const filename = this.files.length > 0 ? this.files[0].name : "선택된 파일 없음";
    document.getElementById("filename-text-movie").innerText = filename;
  });

document
  .getElementById("poster-file-anime")
  .addEventListener("change", function () {
    const filename = this.files.length > 0 ? this.files[0].name : "선택된 파일 없음";
    document.getElementById("filename-text-anime").innerText = filename;
  });
  document
  .getElementById("poster-file-game")
  .addEventListener("change", function () {
    const filename = this.files.length > 0 ? this.files[0].name : "선택된 파일 없음";
    document.getElementById("filename-text-game").innerText = filename;
  });

      function cast_of_categories() {
        location.href = "cocAdd";
      }
      

    </script>
  </body>
</html>
