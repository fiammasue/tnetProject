<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="/styles/main.css">
</head>
<body>
  <div id="container">    
  <div id="slideShow">
    <div id="slides">
      <img src="/assets/slideshow1.jpg" alt="">
      <img src="/assets/slideshow2.jpg" alt="">
      <img src="/assets/slideshow3.jpg" alt="">
      <img src="/assets/slideshow4.jpg" alt="">
      <button id="prev">&lang;</button>
      <button id="next">&rang;</button>
    </div>
  </div>

  <div id="contents">
      <div id="links">
        <ul>
          <li>        
            <a>
              <img class="icon" src="/assets/icon_language.png">
              <p>Language</p>
            </a>

            <ul class="cls">
              <li><a href="#">영어</a></li>
              <li><a href="#">일본어</a></li>
              <li><a href="#">중국어</a></li>
              <li><a href="#">한국어</a></li>
              <li><a href="#">프랑스어</a></li>
              <li><a href="#">독일어</a></li>
              <li><a href="#">스페인어</a></li>              
              <li><a href="#">러시아어</a></li>
              <li><a href="#">이탈리아어</a></li>
              <li><a href="#">태국어</a></li>
              <li><a href="#">베트남어</a></li>
              <li><a href="#">그리스어</a></li>
            </ul>
          </li>
          <li>
            <a>
              <img class="icon" src="/assets/icon_art.png">
              <p>art</p>
            </a>  
            <ul class="cls">
              <li><a href="#">미술</a></li>
              <li><a href="#">디자인</a></li>
              <li><a href="#">마술</a></li>
              <li><a href="#">사진찍기</a></li>
              <li><a href="#">요리</a></li>
              <li><a href="#">뷰티</a></li>
              <li><a href="#">글쓰기</a></li>
              <li><a href="#">커피</a></li>          
              <li><a href="#">바둑</a></li>
              <li><a href="#">패션</a></li>
              <li><a href="#">댄스</a></li>
              <li><a href="#">연기</a></li>
              <li><a href="#">꽃곶이</a></li>
            </ul>          
          </li>
          <li>
            <a>
              <img class="icon" src="/assets/icon_computer.png">
              <p>computer</p>
            </a>
            <ul class="cls">
              <li><a href="#">프로그래밍</a></li>
              <li><a href="#">3D/CAD</a></li>
              <li><a href="#">쇼핑몰</a></li>
              <li><a href="#">포토샵</a></li>
              <li><a href="#">MS 오피스</a></li>
            </ul>             
          </li>
          <li>
            <a>
              <img class="icon" src="/assets/icon_exercise.png">
              <p>exercise</p>
            </a>
            <ul class="cls">
              <li><a href="#">수영</a></li>
              <li><a href="#">요가</a></li>
              <li><a href="#">필라테스</a></li>
              <li><a href="#">스키</a></li>
              <li><a href="#">드라이빙</a></li>
              <li><a href="#">볼링</a></li>
              <li><a href="#">스키</a></li>
              <li><a href="#">테니스</a></li>
              <li><a href="#">골프</a></li>
              <li><a href="#">헬스</a></li>
            </ul>             
          </li>
          <li>
            <a>
              <img class="icon" src="/assets/icon_music.png">
              <p>music</p>
            </a>
            <ul class="cls">
              <li><a href="#">피아노</a></li>
              <li><a href="#">기타</a></li>
              <li><a href="#">재즈</a></li>
              <li><a href="#">플루트</a></li>
              <li><a href="#">클라리넷</a></li>
              <li><a href="#">보컬</a></li>
              <li><a href="#">섹소폰</a></li>
              <li><a href="#">드럼</a></li>
              <li><a href="#">첼로</a></li>
              <li><a href="#">베이스</a></li>
            </ul>             
          </li>
          <li>
            <a>
              <img class="icon" src="/assets/icon_study.png">
              <p>study</p>
            
            <ul class="cls">
              <li><a href="#">수학</a></li>
              <li><a href="#">심리학</a></li>
              <li><a href="#">역사</a></li>
              <li><a href="#">의학</a></li>
              <li><a href="#">마케팅</a></li>
              <li><a href="#">물리학</a></li>
              <li><a href="#">경제학</a></li>
            </ul>     
          </li>
        </ul>
      </div>
    </div> 
    
    <article>
      <div id="notice_rolling">          
        <table>
          <tr>
            <td><strong>첫 번째 공지사항입니다.</strong></td>
            <td>내용을 여기에 작성하세요.</td>
          </tr>            
        </table>             
      </div>
    </article>

    <ul class="lesson-cards">
      <li class="lesson-card">
        <div class="lesson-image">
            <img src="/assets/usericon1.png">
            <a href="#"><span>영어</span></a>
            <img src="/assets/exchageicon.png">
            <a href="#"><span>피아노</span></a>
            <img src="/assets/usericon2.png">
        </div>
        <div class="lesson-details">
            <p class="lesson-description">저는 어디어디살고요 어떤 재능이 필요한데 그 재능을 ...</p>
            <div class="lesson-meta">
                <img src="/assets/locationicon.png">
                <span class="lesson-location">서울시 관악구</span>
                <input type="button" id="detail" value="DETAIL"></input>
            </div>
        </div>
      </li>

      <li class="lesson-card">
        <div class="lesson-image">
            <img src="/assets/usericon1.png">
            <a href="#"><span id="leftLesson">영어</span></a>
            <img src="/assets/exchageicon.png">
            <a href="#"><span>피아노</span></a>
            <img src="/assets/usericon2.png">
        </div>
        <div class="lesson-details">
            <p class="lesson-description">저는 어디어디살고요 어떤 재능이 필요한데 그 재능을 ...</p>
            <div class="lesson-meta">            
              <img src="/assets/locationicon.png">  
              <span>서울 관악구</span>
              <input type="button" id="detail" value="DETAIL"></input>
            </div>
        </div>
      </li>

      <li class="lesson-card">
        <div class="lesson-image">
            <img src="/assets/usericon1.png">
            <a href="#"><span>영어</span></a>
            <img src="/assets/exchageicon.png">
            <a href="#"><span>피아노</span></a>
            <img src="/assets/usericon2.png">
        </div>
        <div class="lesson-details">
            <p class="lesson-description">저는 어디어디살고요 어떤 재능이 필요한데 그 재능을 ...</p>
            <div class="lesson-meta">
                <img src="/assets/locationicon.png">
                <span class="lesson-location">서울 관악구</span>
                <input type="button" id="detail" value="DETAIL"></input>
            </div>
        </div>
      </li>

      <li class="lesson-card">
        <div class="lesson-image">
            <img src="/assets/usericon1.png">
            <a href="#"><span>영어</span></a>
            <img src="/assets/exchageicon.png">
            <a href="#"><span>피아노</span></a>
            <img src="/assets/usericon2.png">
        </div>
        <div class="lesson-details">
            <p class="lesson-description">저는 어디어디살고요 어떤 재능이 필요한데 그 재능을 ...</p>
            <div class="lesson-meta">
                <img src="/assets/locationicon.png">
                <span class="lesson-location">서울 관악구</span>
                <input type="button" id="detail" value="DETAIL"></input>
            </div>
        </div>
      </li>
      
      <li class="lesson-card">
        <div class="lesson-image">
            <img src="/assets/usericon1.png">
            <a href="#"><span>영어</span></a>
            <img src="/assets/exchageicon.png">
            <a href="#"><span>피아노</span></a>
            <img src="/assets/usericon2.png">
        </div>
        <div class="lesson-details">
            <p class="lesson-description">저는 어디어디살고요 어떤 재능이 필요한데 그 재능을 ...</p>
            <div class="lesson-meta">
                <img src="/assets/locationicon.png">
                <span class="lesson-location">서울 관악구</span>
                <input type="button" id="detail" value="DETAIL"></input>
            </div>
        </div>
      </li>

      <li class="lesson-card">
        <div class="lesson-image">
            <img src="/assets/usericon1.png">
            <a href="#"><span>영어</span></a>
            <img src="/assets/exchageicon.png">
            <a href="#"><span>피아노</span></a>
            <img src="/assets/usericon2.png">
        </div>
        <div class="lesson-details">
            <p class="lesson-description">저는 어디어디살고요 어떤 재능이 필요한데 그 재능을 ...</p>
            <div class="lesson-meta">
                <img src="/assets/locationicon.png">
                <span class="lesson-location">서울 관악구</span>
                <input type="button" id="detail" value="DETAIL"></input>
            </div>
        </div>
      </li>
    </ul>
  </div>
  
  <script src="/scripts/main.js"></script>
</body>
</html>