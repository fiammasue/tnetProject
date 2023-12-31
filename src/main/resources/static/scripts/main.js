//슬라이드쇼 스크립트 코드
document.addEventListener("DOMContentLoaded", function () {
 var current = 0;

showSlides(); // 기본 첫 번째 이미지를 보여 줌

function showSlides(){
  var slides = document.querySelectorAll("#slides > img");
  for(let i = 0; i < slides.length; i++){
    slides[i].style.display = "none"; // 모든 이미지 감춤
  }

  current++;  // 다음 이미지로 이동

  if(current > slides.length) // 마지막 이미지라면
    current = 1;  // 1번째로 이동
  slides[current - 1].style.display = "block";  // 현재 위치 이미지로 표시
  setTimeout(showSlides, 3000);  // 2초마다 showSlides() 함수를 반복 실행
}





});
// ----------------------------------------- 토글관련 스크립트코드  ----------------------------------------- 
document.addEventListener("DOMContentLoaded", function () {
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