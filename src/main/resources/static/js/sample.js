var bt = 1;
document.getElementById("tbtn1").style.backgroundColor = "white";

// 각 박스마다 탭 클릭 기능
document.querySelectorAll(".ranking-box").forEach((box) => {
  const tabs = box.querySelectorAll(".tab");
  const medianList = box.querySelector(".median-list");
  const averageList = box.querySelector(".average-list");

  medianList.style.display = "block";
  averageList.style.display = "none";

  tabs.forEach((tab) => {
    tab.addEventListener("click", () => {
      tabs.forEach((t) => t.classList.remove("active"));
      tab.classList.add("active");

      if (tab.dataset.type === "median") {
        medianList.style.display = "block";
        averageList.style.display = "none";
        // totalList.classList.add("active-list");
        // averageList.classList.remove("active-list");
      } else {
        medianList.style.display = "none";
        averageList.style.display = "block";
        // totalList.classList.remove("active-list");
        // averageList.classList.add("active-list");
      }
    });
  });
});

function toggleImg1() {
  if (bt != 1) {
    document.getElementById("title").style.backgroundImage =
      "url(https://thumbnail.laftel.net/carousel/b5bbdcf4-ab26-442f-9111-d0bde51a7c09.png)";

    document.getElementById("title").style.display = "none";
    setTimeout(showBanner, 1);

    document.getElementById("tbtn1").style.backgroundColor = "white";
    document.getElementById("tbtn2").style.backgroundColor =
      "rgb(128, 128, 128)";
    document.getElementById("tbtn3").style.backgroundColor =
      "rgb(128, 128, 128)";
    document.getElementById("tbtn4").style.backgroundColor =
      "rgb(128, 128, 128)";

    bt = 1;
  }
}

function toggleImg2() {
  if (bt != 2) {
    document.getElementById("title").style.backgroundImage =
      "url(https://thumbnail.laftel.net/carousel/aaa0f4d0-51eb-4af6-a968-66198e5679ba.jpg)";

    document.getElementById("title").style.display = "none";
    setTimeout(showBanner, 1);

    document.getElementById("tbtn1").style.backgroundColor =
      "rgb(128, 128, 128)";
    document.getElementById("tbtn2").style.backgroundColor = "white";
    document.getElementById("tbtn3").style.backgroundColor =
      "rgb(128, 128, 128)";
    document.getElementById("tbtn4").style.backgroundColor =
      "rgb(128, 128, 128)";

    bt = 2;
  }
}

function toggleImg3() {
  if (bt != 3) {
    document.getElementById("title").style.backgroundImage =
      "url(https://thumbnail.laftel.net/carousel/097e3172-84c1-4837-9d52-99ac26a881d8.jpg)";

    document.getElementById("title").style.display = "none";
    setTimeout(showBanner, 1);

    document.getElementById("tbtn1").style.backgroundColor =
      "rgb(128, 128, 128)";
    document.getElementById("tbtn2").style.backgroundColor =
      "rgb(128, 128, 128)";
    document.getElementById("tbtn3").style.backgroundColor = "white";
    document.getElementById("tbtn4").style.backgroundColor =
      "rgb(128, 128, 128)";

    bt = 3;
  }
}

function toggleImg4() {
  if (bt != 4) {
    document.getElementById("title").style.backgroundImage =
      "url(https://thumbnail.laftel.net/carousel/a807146f-088c-45ac-a5d5-31d0779865ea.jpg)";

    document.getElementById("title").style.display = "none";
    setTimeout(showBanner, 1);

    document.getElementById("tbtn1").style.backgroundColor =
      "rgb(128, 128, 128)";
    document.getElementById("tbtn2").style.backgroundColor =
      "rgb(128, 128, 128)";
    document.getElementById("tbtn3").style.backgroundColor =
      "rgb(128, 128, 128)";
    document.getElementById("tbtn4").style.backgroundColor = "white";

    bt = 4;
  }
}

function showBanner() {
  document.getElementById("title").style.display = "block";
}
