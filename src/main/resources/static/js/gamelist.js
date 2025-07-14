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
  document.getElementById("save-" + id).style.display = "inline";
}

function saveReview(id) {
  const newText = document.getElementById("edit-" + id).value;
  document.getElementById("text-" + id).innerText = newText;
  document.getElementById("text-" + id).style.display = "block";
  document.getElementById("edit-" + id).style.display = "none";
  document.getElementById("save-" + id).style.display = "none";
}
