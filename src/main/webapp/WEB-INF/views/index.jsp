<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>  
</head>
<body>
  <div id="container">    
  <div id="slideShow">
    <div id="slides">
    
      <img src="/assets/slideshow6.jpg" alt="">
      <img src="/assets/slideshow7.jpg" alt="">
      <img src="/assets/slideshow8.jpg" alt="">
      <img src="/assets/slideshow9.jpg" alt="">
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
              <li><a href="#">한국어</a></li>
              <li><a href="#">일본어</a></li>
              <li><a href="#">중국어</a></li>
              <li><a href="#">독일어</a></li>
              <li><a href="#">프랑스어</a></li>              
              <li><a href="#">스페인어</a></li>
              <li><a href="#">아랍어</a></li>              
              <li><a href="#">러시아어</a></li>
              <li><a href="#">터키어</a></li>
              <li><a href="#">힌디어</a></li>
              <li><a href="#">포루투칼어</a></li>             
            </ul>
          </li>
          <li>
            <a>
              <img class="icon" src="/assets/icon_art.png">
              <p>art</p>
            </a>  
            <ul class="cls">
              <li><a href="#">그림</a></li>
              <li><a href="#">꽃꽂이</a></li>
              <li><a href="#">도예</a></li>
              <li><a href="#">POP</a></li>
              <li><a href="#">헬스</a></li>             
            </ul>          
          </li>
          <li>
            <a>
              <img class="icon" src="/assets/icon_computer.png">
              <p>computer</p>
            </a>
            <ul class="cls">
              <li><a href="#">JAVA</a></li>
              <li><a href="#">C언어</a></li>
              <li><a href="#">C++</a></li>
              <li><a href="#">python</a></li>
              <li><a href="#">javascript</a></li>
              <li><a href="#">html</a></li>
              <li><a href="#">css</a></li>
              <li><a href="#">spring</a></li>
              <li><a href="#">jsp</a></li>
            </ul>             
          </li>
          <li>
            <a>
              <img class="icon" src="/assets/icon_exercise.png">
              <p>exercise</p>
            </a>
            <ul class="cls">
              <li><a href="#">헬스</a></li>
              <li><a href="#">자전거</a></li>
              <li><a href="#">태권도</a></li>
              <li><a href="#">권투</a></li>
              <li><a href="#">배드민턴</a></li>
              <li><a href="#">주짓수</a></li>
              <li><a href="#">탁구</a></li>
              <li><a href="#">요가</a></li>
              <li><a href="#">축구</a></li>
              <li><a href="#">골프</a></li>
              <li><a href="#">테니스</a></li>
              <li><a href="#">필라테스</a></li>
            </ul>             
          </li>
          <li>
            <a>
              <img class="icon" src="/assets/icon_music.png">
              <p>music</p>
            </a>
            <ul class="cls">
              <li><a href="#">피아노</a></li>
              <li><a href="#">플룻</a></li>
              <li><a href="#">바이올린</a></li>
              <li><a href="#">보컬</a></li>
              <li><a href="#">드럽</a></li>
              <li><a href="#">첼로</a></li>      
            </ul>             
          </li>
          <li>
            <a>
              <img class="icon" src="/assets/icon_study.png">
              <p>study</p>
            
            <ul class="cls">
              <li><a href="#">수학</a></li>
              <li><a href="#">역사</a></li>
              <li><a href="#">문학</a></li>
              <li><a href="#">주식</a></li>
              <li><a href="#">정치</a></li>
              <li><a href="#">성경</a></li>
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
            </div>'
        </div>
      </li>
    </ul>
  </div>
</body>
</html>