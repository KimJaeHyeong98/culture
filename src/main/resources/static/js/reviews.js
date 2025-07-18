document.querySelectorAll(".search-btn").forEach((btn) => {
  btn.addEventListener("click", function () {
    const type = this.getAttribute("data-type"); // movie, anime, game

    // 검색어 input의 id를 type에 따라 다르게 가져오기
    const inputId = {
      movie: "movieInput",
      anime: "animeInput",
      game: "gameInput",
    }[type];

    const keyword = document.getElementById(inputId).value.trim();

    if (!keyword) {
      alert("검색어를 입력해주세요.");
      return;
    }

    fetch(`/search${capitalize(type)}?keyword=${encodeURIComponent(keyword)}`)
      .then((res) => res.json())
      .then((data) => {
        console.log("📦 서버 응답 데이터:", data); // 👈 이거 추가!
        const list = document.querySelector(".result-list");
        list.innerHTML = "";

        if (data.length === 0) {
          list.innerHTML = "<p>검색 결과가 없습니다.</p>";
          return;
        }

        data.forEach((item) => {
          const html = `
    <div class="result-item" data-id="${item.id}" data-type="${type}">
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

console.log("로그인한 유저 ID:", loginUserId);

document.addEventListener("DOMContentLoaded", function () {
  const modal = document.getElementById("reviewModal");
  const closeBtn = modal.querySelector(".close");
  const contentIdInput = document.getElementById("contentId");
  const contentTypeInput = document.getElementById("contentType");

  // 이벤트 위임: 동적으로 생성된 항목도 처리됨
  document
    .querySelector(".result-list")
    .addEventListener("click", function (e) {
      const target = e.target.closest(".result-item");
      if (!target) return;

      const contentId = target.getAttribute("data-id");
      const contentType = target.getAttribute("data-type"); // 'MOVIE', 'ANIME', 'GAME'

      contentIdInput.value = contentId;
      contentTypeInput.value = contentType;

      modal.style.display = "block"; // 모달 열기
    });

  closeBtn.addEventListener("click", function () {
    modal.style.display = "none"; // 모달 닫기
    contentIdInput.value = "";
    contentTypeInput.value = "";
    document.getElementById("reviewText").value = "";
    document.getElementById("reviewRating").value = "";
    document.getElementById("reviewRecommend").value = "Y";
  });

  // 외부 클릭 시 닫기
  window.addEventListener("click", function (e) {
    if (e.target === modal) {
      modal.style.display = "none";
    }
  });

  // 리뷰 폼 제출 처리
  document
    .getElementById("reviewForm")
    .addEventListener("submit", function (e) {
      e.preventDefault();

      const contentId = contentIdInput.value;
      const contentType = contentTypeInput.value;
      const reviewText = document.getElementById("reviewText").value;
      const reviewRating = document.getElementById("reviewRating").value;
      const reviewRecommend = document.getElementById("reviewRecommend").value;

      // 유효성 검사: 평점과 리뷰 내용이 있는지 확인
      if (!reviewText.trim() || reviewRating === "" || reviewRecommend === "") {
        alert("모든 항목을 입력해주세요.");
        return;
      }
      console.log({
        contentId,
        contentType,
        reviewText,
        reviewRating,
        reviewRecommend,
      });
      // 서버에 리뷰, 평점, 추천 여부를 보내기
      fetch("/submitReview", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        credentials: "include",
        body: JSON.stringify({
          contentId: contentId,
          contentType: contentType.toUpperCase(),
          reviewText: reviewText,
          reviewRating: reviewRating,
          reviewRecommend: reviewRecommend,
        }),
      })
        .then((response) => response.json())
        .then((data) => {
          if (data.success) {
            alert("리뷰가 등록되었습니다.");
            modal.style.display = "none"; // 모달 닫기
          } else {
            alert("리뷰 등록에 실패했습니다.");
          }
        })
        .catch((err) => {
          console.error("리뷰 제출 실패:", err);
        });
    });
});
