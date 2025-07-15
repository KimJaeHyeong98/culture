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

      fetch(url)
        .then((res) => res.json())
        .then((data) => {
          console.log(data);
          const listId =
            type === "MOVIE"
              ? "movie-list"
              : type === "GAME"
              ? "game-list"
              : "anime-list";

          const list = document.getElementById(listId);
          list.innerHTML = ""; // 기존 목록 초기화

          data.forEach((item) => {
            const li = document.createElement("li");
            li.innerHTML = `
              <strong>제목:</strong> ${item.m_title}<br>
              <strong>감독:</strong> ${item.m_director}<br>
              <strong>개봉일:</strong> ${item.m_release_date}
            `;
            li.style.cursor = "pointer";

            // 🎯 클릭 시 모달 열기 (4단계 핵심!)
            li.addEventListener("click", () => {
              openCategoryModal(item.m_movie_id);
            });

            list.appendChild(li);
          });
        })
        .catch((err) => console.error("데이터 불러오기 실패:", err));
    });
  });
});

// 모달 열기
function openCategoryModal(movieId) {
  document.getElementById("selectedMovieId").value = movieId;
  document.getElementById("categoryModal").classList.remove("hidden");
}

// 모달 닫기
function closeModal() {
  document.getElementById("categoryModal").classList.add("hidden");
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


document.getElementById("categoryForm").addEventListener("submit", function (e) {
  e.preventDefault();

  const movieId = document.getElementById("selectedMovieId").value;
  const selects = document.querySelectorAll(".category-select");

  const categoryIds = Array.from(selects)
    .map(select => select.value)
    .filter(val => val); // 빈 값 제외

  if (!movieId || categoryIds.length === 0) {
    alert("카테고리를 하나 이상 선택해주세요.");
    return;
  }

  fetch("/register/assign-categories", {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify({
      movieId: movieId,
      categoryIds: categoryIds
    })
  })
    .then(res => res.text())
    .then(msg => {
      alert("카테고리 등록 완료"); // ex) "카테고리 등록 완료!"
      closeModal(); // 모달 닫기
    })
    .catch(err => console.error("카테고리 등록 실패:", err));
});
