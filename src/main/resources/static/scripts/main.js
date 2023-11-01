//슬라이드쇼 스크립트 코드
document.addEventListener("DOMContentLoaded", function () {
  var slides = document.querySelectorAll("#slides > img");
  var prev = document.getElementById("prev");
  var next = document.getElementById("next");
  var current = 0;

  showSlides(current);
  prev.onclick = prevSlide;
  next.onclick = nextSlide;

  function showSlides(n) {
    for (let i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
    }
    slides[n].style.display = "block";
  }

  function prevSlide() {
    if (current > 0) current -= 1;
    else current = slides.length - 1;
    showSlides(current);
  }

  function nextSlide() {
    if (current < slides.length - 1) current += 1;
    else current = 0;
    showSlides(current);
  }


// ----------------------------------------- 토글관련 스크립트코드  ----------------------------------------- 

  const liElements = document.querySelectorAll('#links ul li');

  liElements.forEach(function(li) {
    li.addEventListener("click", function() {
      const ul = li.querySelector("ul.cls");

      const allUlElements = document.querySelectorAll("#links ul.cls");
      allUlElements.forEach(function(ulElement) {
        if (ulElement !== ul) {
          ulElement.classList.remove("visible");
        }
      });

      if (ul) {
        ul.classList.toggle("visible");
      }
    });
  });
});