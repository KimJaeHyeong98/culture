document.querySelectorAll(".search-btn").forEach((btn) => {
  btn.addEventListener("click", function () {
    const type = this.getAttribute("data-type"); // movie, anime, game

    // 검색어 input의 id를 type에 따라 다르게 가져오기
    const inputId = {
      movie: "movieInput",
      anime: "animeInput",
      game: "gameInput"
    }[type];

    const keyword = document.getElementById(inputId).value.trim();

    if (!keyword) {
      alert("검색어를 입력해주세요.");
      return;
    }

    fetch(`/search${capitalize(type)}?keyword=${encodeURIComponent(keyword)}`)
      .then((res) => res.json())
      .then((data) => {
        const list = document.querySelector(".result-list");
        list.innerHTML = "";

        if (data.length === 0) {
          list.innerHTML = "<p>검색 결과가 없습니다.</p>";
          return;
        }

        data.forEach((item) => {
          const html = `
            <div class="result-item">
              <strong class="title">${item.title}</strong>
              <span class="meta">by ${item.releaseDate}</span>
              <p class="desc">${item.categoryList}</p>
            </div>
          `;
          list.insertAdjacentHTML("beforeend", html);
        });
      })
      .catch((err) => {
        console.error("검색 실패:", err);
      });
  });
});

function capitalize(str) {
  return str.charAt(0).toUpperCase() + str.slice(1);
}
