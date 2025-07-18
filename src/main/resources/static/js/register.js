document.addEventListener("DOMContentLoaded", () => {
  const buttons = document.querySelectorAll(".load-button");

  buttons.forEach((button) => {
    button.addEventListener("click", () => {
      const type = button.getAttribute("data-type");
      let url = "";

      // 요청 URL 설정
      if (type === "MOVIE") url = "/categoryless-movies";
      else if (type === "GAME") url = "/categoryless-games";
      else if (type === "ANIME") url = "/categoryless-animes";
      else if (type === "MOVIECAST") url = "/castless-movies";

      fetch(url)
        .then((res) => res.json())
        .then((data) => {
          console.log(data);
          const listId =
            type === "MOVIE"
              ? "movie-list"
              : type === "MOVIECAST"
              ? "moviecast-list"
              : type === "GAME"
              ? "game-list"
              : type === "ANIME"
              ? "anime-list"
              : null;

          if (!listId) {
            console.error("❗listId를 찾을 수 없습니다. type:", type);
            return;
          }

          const list = document.getElementById(listId);
          list.innerHTML = ""; // 기존 목록 초기화

          // ✅ 결과가 없을 경우 메시지 출력
          if (data.length === 0) {
            const li = document.createElement("li");
            li.textContent = "카테고리 없는 항목이 없음";
            li.style.color = "#888";
            li.style.textAlign = "center";
            li.style.padding = "10px";
            list.appendChild(li);
            return;
          }

          data.forEach((item) => {
            const li = document.createElement("li");

            let title = "";
            let director = "";
            let releaseDate = "";
            let id = "";

            if (type === "MOVIE") {
              title = item.m_title;
              director = item.m_director;
              releaseDate = item.m_release_date;
              id = item.m_movie_id;
            } else if (type === "ANIME") {
              title = item.an_title;
              director = item.an_director;
              releaseDate = item.an_release_date;
              id = item.an_anime_id;
            } else if (type === "GAME") {
              title = item.g_title;
              director = item.g_director;
              releaseDate = item.g_release_date;
              id = item.g_game_id;
            } else if (type === "MOVIECAST") {
              title = item.m_title;
              director = item.m_director;
              releaseDate = item.m_release_date;
              id = item.m_movie_id;
            }
            li.innerHTML = `
              <strong>제목:</strong> ${title}<br>
              <strong>제작:</strong> ${director}<br>
              <strong>출시:</strong> ${releaseDate}
            `;

            li.style.cursor = "pointer";

            li.addEventListener("click", () => {
              openCategoryModal(type, id, li); // 👈 type도 전달!
            });

            list.appendChild(li);
          });
        })
        .catch((err) => console.error("데이터 불러오기 실패:", err));
    });
  });
});

let currentLi = null; // 전역에 추가

function openCategoryModal(type, id, liElement) {
  // 모든 hidden input 초기화
  document.getElementById("selectedMovieId").value = "";
  document.getElementById("selectedAnimeId").value = "";
  document.getElementById("selectedGameId").value = "";
  document.getElementById("selectedMovieCastId").value = "";

  // 출연진 전용 선택창 보여주거나 숨기기
  const castCategoryWrapper = document.getElementById("castCategoryWrapper");
  const categorySelectContainer = document.getElementById(
    "categorySelectContainer"
  );

  if (type === "MOVIE") {
    document.getElementById("selectedMovieId").value = id;
    castCategoryWrapper.style.display = "none";
    categorySelectContainer.style.display = "block";
  } else if (type === "ANIME") {
    document.getElementById("selectedAnimeId").value = id;
    castCategoryWrapper.style.display = "none";
    categorySelectContainer.style.display = "block";
  } else if (type === "GAME") {
    document.getElementById("selectedGameId").value = id;
    castCategoryWrapper.style.display = "none";
    categorySelectContainer.style.display = "block";
  } else if (type === "MOVIECAST") {
    document.getElementById("selectedMovieCastId").value = id;
    castCategoryWrapper.style.display = "block";
    categorySelectContainer.style.display = "none";
  }

  currentLi = liElement;
  document.getElementById("categoryModal").classList.remove("hidden");
}

// 모달 닫기
function closeModal() {
  document.getElementById("categoryModal").classList.add("hidden");
}

function reloadCategorylessList(type) {
  let url = "";

  if (type === "MOVIE") url = "/categoryless-movies";
  else if (type === "GAME") url = "/categoryless-games";
  else if (type === "ANIME") url = "/categoryless-animes";

  fetch(url)
    .then((res) => res.json())
    .then((data) => {
      const listId =
        type === "MOVIE"
          ? "movie-list"
          : type === "GAME"
          ? "game-list"
          : type === "ANIME"
          ? "anime-list"
          : null;

      const list = document.getElementById(listId);
      list.innerHTML = "";

      if (data.length === 0) {
        const li = document.createElement("li");
        li.textContent = "카테고리 없는 항목이 없습니다.";
        li.style.color = "#888";
        li.style.textAlign = "center";
        li.style.padding = "10px";
        list.appendChild(li);
        return;
      }

      data.forEach((item) => {
        const li = document.createElement("li");

        let title = "";
        let director = "";
        let releaseDate = "";
        let id = "";

        if (type === "MOVIE") {
          title = item.m_title;
          director = item.m_director;
          releaseDate = item.m_release_date;
          id = item.m_movie_id;
        } else if (type === "ANIME") {
          title = item.an_title;
          director = item.an_director;
          releaseDate = item.an_release_date;
          id = item.an_anime_id;
        } else if (type === "GAME") {
          title = item.g_title;
          director = item.g_director;
          releaseDate = item.g_release_date;
          id = item.g_game_id;

          li.innerHTML = `
          <strong>제목:</strong> ${title}<br>
          <strong>감독:</strong> ${director}<br>
          <strong>개봉일:</strong> ${releaseDate}
        `;

          li.style.cursor = "pointer";

          li.addEventListener("click", () => {
            openCategoryModal(type, id);
          });

          list.appendChild(li);
        }
      });
    });
}

function addCategorySelect() {
  const container = document.getElementById("categorySelectContainer");

  const newSelect = document.createElement("select");
  newSelect.name = "categoryIds";
  newSelect.classList.add("category-select");
  newSelect.required = true;

  newSelect.innerHTML = `
    <option value="">-- 카테고리 선택 --</option>
    <option value="1">액션</option>
    <option value="2">공포</option>
    <option value="3">판타지</option>
    <option value="4">SF</option>
    <option value="5">드라마</option>
    <option value="6">로맨스</option>
    <option value="7">코미디</option>
    <option value="8">스릴러</option>
    <option value="9">미스터리</option>
    <option value="10">모험</option>
    <option value="11">전쟁</option>
    <option value="12">범죄</option>
    <option value="13">스포츠</option>
    <option value="14">음악</option>
    <option value="15">애니메이션</option>
  `;

  container.appendChild(newSelect);
}

function removeCategorySelect() {
  const container = document.getElementById("categorySelectContainer");
  const selects = container.querySelectorAll("select");

  if (selects.length > 1) {
    container.removeChild(selects[selects.length - 1]);
  } else {
    alert("카테고리는 최소 1개 이상 선택해야 합니다.");
  }
}

function loadCastCategories() {
  const select = document.getElementById("castCategorySelect");
  select.innerHTML = `<option value="">-- 출연진 선택 --</option>`; // 초기화

  fetch("/cast-categories")
    .then((res) => res.json())
    .then((data) => {
      data.forEach((category) => {
        const option = document.createElement("option");
        option.value = category.id;
        option.textContent = category.name;
        select.appendChild(option);
      });
    })
    .catch((err) => {
      console.error("출연진 카테고리 불러오기 실패:", err);
    });
}

document
  .getElementById("categoryForm")
  .addEventListener("submit", function (e) {
    e.preventDefault();

    const movieId = document.getElementById("selectedMovieId").value;
    const animeId = document.getElementById("selectedAnimeId").value;
    const gameId = document.getElementById("selectedGameId").value;
    const movieCastId = document.getElementById("selectedMovieCastId").value;

    const contentId = movieId || animeId || gameId || movieCastId;
    const selects = document.querySelectorAll(".category-select");

    const categoryIds = Array.from(selects)
      .map((select) => select.value)
      .filter((val) => val);

    const payload = {
      categoryIds: categoryIds,
    };

    if (movieId) payload.movieId = movieId;
    else if (animeId) payload.animeId = animeId;
    else if (gameId) payload.gameId = gameId;
    else if (movieCastId) payload.movieCastId = movieCastId;

    if (!contentId || categoryIds.length === 0) {
      alert("카테고리를 하나 이상 선택해주세요.");
      return;
    }

    fetch("/register/assign-categories", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(payload),
    })
      .then((res) => res.text())
      .then((msg) => {
        alert("카테고리 등록 완료");
        closeModal();

        if (currentLi) {
          currentLi.remove();
          currentLi = null;
        }
      })
      .catch((err) => console.error("카테고리 등록 실패:", err));
  });
