let isIdChecked = false;
let isPasswordMatched = false;

document.getElementById("checkIdBtn").addEventListener("click", function () {
  const userId = document.getElementById("u_user_id").value;

  if (!userId) {
    document.getElementById("id-check-message").innerText = "아이디를 입력해주세요.";
    document.getElementById("id-check-message").style.color = "red";
    isIdChecked = false;
    checkFormValidity();
    return;
  }

  fetch("checkUserId", {
    method: "POST",
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    },
    body: "u_user_id=" + encodeURIComponent(userId),
  })
    .then((response) => response.text())
    .then((result) => {
      if (result === "AVAILABLE") {
        document.getElementById("id-check-message").innerText = "사용 가능한 아이디입니다.";
        document.getElementById("id-check-message").style.color = "green";
        isIdChecked = true;
      } else {
        document.getElementById("id-check-message").innerText = "이미 사용 중인 아이디입니다.";
        document.getElementById("id-check-message").style.color = "red";
        isIdChecked = false;
      }
      checkFormValidity();
    });
});

// 비밀번호 일치 확인
document.getElementById("u_password_confirm").addEventListener("input", function () {
  const pw = document.getElementById("u_password").value;
  const pwConfirm = document.getElementById("u_password_confirm").value;

  if (pw !== pwConfirm) {
    document.getElementById("password-check-message").style.display = "block";
    document.getElementById("password-check-message").innerText = "비밀번호가 일치하지 않습니다.";
    isPasswordMatched = false;
  } else {
    document.getElementById("password-check-message").style.display = "none";
    isPasswordMatched = true;
  }

  checkFormValidity();
});

// 폼 전체 유효성 검사
function checkFormValidity() {
  const userId = document.getElementById("u_user_id").value;
  const userName = document.getElementById("u_user_name").value;
  const password = document.getElementById("u_password").value;
  const passwordConfirm = document.getElementById("u_password_confirm").value;

  const isFilled =
    userId.trim() !== "" &&
    userName.trim() !== "" &&
    password.trim() !== "" &&
    passwordConfirm.trim() !== "";

  const isFormValid = isFilled && isIdChecked && isPasswordMatched;

  document.getElementById("submitBtn").disabled = !isFormValid;
}
