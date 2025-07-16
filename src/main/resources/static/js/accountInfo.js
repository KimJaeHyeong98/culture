 function enableEdit() {
    // 기존 value div → input으로 교체
    const id = document.getElementById("id").innerText;
    const pw = document.getElementById("pw").innerText;
    const name = document.getElementById("name").innerText;

    document.getElementById("id").innerHTML = `<input type="text" id="inputId" value="${userInfo.u_user_id}" style="font-size:18px;" />`;
    document.getElementById("pw").innerHTML = `<input type="text" id="inputPw" value="${userInfo.u_password}" style="font-size:18px;"/>`;
    document.getElementById("name").innerHTML = `<input type="text" id="inputName" value="${userInfo.u_user_name}" style="font-size:18px;"/>`;

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
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        u_user_id: id,
        u_password: pw,
        u_user_name: name
      })
    })
    .then(response => {
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