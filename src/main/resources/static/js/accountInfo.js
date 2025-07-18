function enableEdit() {
  // 기존 value div → input으로 교체
  const id = document.getElementById("id").innerText;
  const pw = document.getElementById("pw").innerText;
  const name = document.getElementById("name").innerText;

  document.getElementById(
    "id"
  ).innerHTML = `<input type="text" id="inputId" value="${userInfo.u_user_id}" style="font-size:18px;" />`;
  document.getElementById(
    "pw"
  ).innerHTML = `<input type="text" id="inputPw" value="${userInfo.u_password}" style="font-size:18px;"/>`;
  document.getElementById(
    "name"
  ).innerHTML = `<input type="text" id="inputName" value="${userInfo.u_user_name}" style="font-size:18px;"/>`;

  // 버튼 교체
  document.getElementById("buttonArea").innerHTML = `
      <button class="info-btn" onclick="submitEdit()">저장</button>
    `;
}

function submitEdit() {
  const id = document.getElementById("inputId").value;
  const pw = document.getElementById("inputPw").value;
  const name = document.getElementById("inputName").value;

  fetch("/updateAccount", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      u_user_id: id,
      u_password: pw,
      u_user_name: name,
    }),
  }).then((response) => {
    if (response.ok) {
      alert("수정 완료!");
      location.reload(); // 또는 수정된 값으로 다시 렌더링
    } else {
      alert("수정 실패!");
    }
  });
}

function deleteAccount() {
  const ok = confirm("정말로 탈퇴하시겠습니까? 이 작업은 되돌릴 수 없습니다.");
  if (!ok) return;

  fetch("/deleteAccount", {
    method: "POST",
  })
    .then((res) => {
      if (!res.ok) throw new Error("탈퇴 실패");
      return res.text();
    })
    .then((result) => {
      if (result === "success") {
        alert("탈퇴가 완료되었습니다.");
        location.href = "/home"; // 또는 로그인 페이지 등으로 리디렉션
      } else {
        alert("탈퇴에 실패했습니다.");
      }
    })
    .catch((err) => {
      alert("오류 발생: " + err.message);
    });
}

document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll(".review-item").forEach((item) => {
    const editBtn = item.querySelector(".edit-btn");
    const contentSpan = item.querySelector(".review-content");
    const recommendSpan = item.querySelector(".review-recommend");

    editBtn.addEventListener("click", () => {
      if (item.querySelector("textarea") || item.querySelector("select"))
        return;

      const originalText = contentSpan.textContent.trim();
      const originalRecommend = recommendSpan.getAttribute("data-recommend"); // 'Y' or 'N'

      // textarea 생성 (리뷰 내용 수정용)
      const textarea = document.createElement("textarea");
      textarea.value = originalText;
      textarea.rows = 4;
      textarea.style.width = "100%";

      // select 생성 (추천/비추천 선택용)
      const select = document.createElement("select");
      const optionY = new Option(
        "👍 추천",
        "Y",
        originalRecommend === "Y",
        originalRecommend === "Y"
      );
      const optionN = new Option(
        "👎 비추천",
        "N",
        originalRecommend === "N",
        originalRecommend === "N"
      );
      select.add(optionY);
      select.add(optionN);

      // 저장 버튼 생성
      const saveBtn = document.createElement("button");
      saveBtn.textContent = "저장";
      saveBtn.classList.add("save-btn");

      // 기존 텍스트 및 추천 표시 숨김
      contentSpan.style.display = "none";
      recommendSpan.style.display = "none";

      // textarea, select, 버튼 추가
      contentSpan.parentNode.insertBefore(textarea, contentSpan.nextSibling);
      contentSpan.parentNode.insertBefore(select, textarea.nextSibling);
      contentSpan.parentNode.insertBefore(saveBtn, select.nextSibling);

      saveBtn.addEventListener("click", () => {
        const updatedText = textarea.value;
        const updatedRecommend = select.value;
        const reviewId = item.dataset.reviewId;

        console.log(updatedText);
        console.log(updatedRecommend);
        console.log(reviewId);

        fetch("/updateReview", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            reviewId: reviewId,
            content: updatedText,
            recommendYn: updatedRecommend,
          }),
        })
          .then((response) => {
            if (!response.ok) throw new Error("서버 오류");
            return response.text();
          })
          .then(() => {
            // 변경 내용 반영
            contentSpan.textContent = updatedText;
            recommendSpan.textContent =
              updatedRecommend === "Y" ? "👍 추천" : "👎 비추천";
            recommendSpan.setAttribute("data-recommend", updatedRecommend);

            // 다시 보이게 하기
            contentSpan.style.display = "inline";
            recommendSpan.style.display = "inline";

            // input, select, 버튼 제거
            textarea.remove();
            select.remove();
            saveBtn.remove();

            alert("수정 성공!");
          })
          .catch((err) => {
            console.error(err);
            alert("수정 실패");
          });
      });
    });
  });
});

document.querySelectorAll(".delete-btn").forEach((btn) => {
  btn.addEventListener("click", function () {
    // 삭제할 리뷰 ID를 가져와야 함
    const reviewId = this.closest(".review-item").dataset.reviewId;

    if (!confirm("리뷰를 삭제하시겠습니까?")) return;
    console.log(reviewId);
    fetch("/deleteReview", {
      method: "POST", // POST 방식 사용
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ reviewId: reviewId }),
    })
      .then((response) => response.text())
      .then((data) => {
        if (data === "OK") {
          alert("리뷰가 삭제되었습니다.");
          location.reload(); // 새로고침으로 반영
        } else {
          alert("삭제에 실패했습니다.");
        }
      })
      .catch((error) => {
        console.error("삭제 중 오류:", error);
        alert("서버 오류");
      });
  });
});
