// 모달 JS

function openModal(gameId) {
  document.getElementById("ratingModal-" + gameId).style.display = "block";
}

function closeModal(gameId) {
  document.getElementById("ratingModal-" + gameId).style.display = "none";
}

window.onclick = function (event) {
  const modals = document.querySelectorAll(".modal");
  modals.forEach(function (modal) {
    if (event.target === modal) {
      modal.style.display = "none";
    }
  });
};

//모달 리뷰 수정

function editReview(id) {
  document.getElementById("text-" + id).style.display = "none";
  document.getElementById("edit-" + id).style.display = "block";
  document.querySelector(".review-icon").style.display = "none";
  document.getElementById("save-" + id).style.display = "inline";
}

function saveReview(id) {
  const newText = document.getElementById("edit-" + id).value;

  fetch("/updateReview", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      r_review_id: id,
      r_content: newText,
    }),
  })
    .then((response) => {
      if (response.ok) {
        // 화면에 반영
        document.getElementById("text-" + id).innerText = newText;
        document.getElementById("text-" + id).style.display = "block";
        document.getElementById("edit-" + id).style.display = "none";
        document.querySelector(".review-icon").style.display = "inline";
        document.getElementById("save-" + id).style.display = "none";
      } else {
        alert("리뷰 저장 실패!");
      }
    })
    .catch(() => alert("서버 요청 실패"));
}
