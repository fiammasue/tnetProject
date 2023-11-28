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
      <button class="slideShowButton" id="prev">&lang;</button>
      <button class="slideShowButton" id="next">&rang;</button>
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
              <li value="TS01"><a href="javascript:void(0)">영어</a></li>
              <li value="TS02"><a href="javascript:void(0)">한국어</a></li>
              <li value="TS03"><a href="javascript:void(0)">일본어</a></li>
              <li value="TS04"><a href="javascript:void(0)">중국어</a></li>
              <li value="TS05"><a href="javascript:void(0)">독일어</a></li>
              <li value="TS06"><a href="javascript:void(0)">프랑스어</a></li>              
              <li value="TS07"><a href="javascript:void(0)">스페인어</a></li>
              <li value="TS08"><a href="javascript:void(0)">아랍어</a></li>              
              <li value="TS09"><a href="javascript:void(0)">러시아어</a></li>
              <li value="TS10"><a href="javascript:void(0)">터키어</a></li>
              <li value="TS11"><a href="javascript:void(0)">힌디어</a></li>
              <li value="TS12"><a href="javascript:void(0)">포루투칼어</a></li>             
            </ul>
          </li>
          <li>
            <a>
              <img class="icon" src="/assets/icon_art.png">
              <p>art</p>
            </a>  
            <ul class="cls">
              <li value="TS22"><a href="javascript:void(0)">그림</a></li>
              <li value="TS23"><a href="javascript:void(0)">꽃꽂이</a></li>
              <li value="TS24"><a href="javascript:void(0)">도예</a></li>
              <li value="TS25"><a href="javascript:void(0)">POP</a></li>
            </ul>          
          </li>
          <li>
            <a>
              <img class="icon" src="/assets/icon_computer.png">
              <p>computer</p>
            </a>
            <ul class="cls">
              <li value="TS13"><a href="javascript:void(0)">JAVA</a></li>
              <li value="TS14"><a href="javascript:void(0)">C언어</a></li>
              <li value="TS15"><a href="javascript:void(0)">C++</a></li>
              <li value="TS16"><a href="javascript:void(0)">python</a></li>
              <li value="TS17"><a href="javascript:void(0)">javascript</a></li>
              <li value="TS18"><a href="javascript:void(0)">html</a></li>
              <li value="TS19"><a href="javascript:void(0)">css</a></li>
              <li value="TS20"><a href="javascript:void(0)">spring</a></li>
              <li value="TS21"><a href="javascript:void(0)">jsp</a></li>
            </ul>             
          </li>
          <li>
            <a>
              <img class="icon" src="/assets/icon_exercise.png">
              <p>exercise</p>
            </a>
            <ul class="cls">
              <li value="TS26"><a href="javascript:void(0)">헬스</a></li>
              <li value="TS27"><a href="javascript:void(0)">자전거</a></li>
              <li value="TS28"><a href="javascript:void(0)">태권도</a></li>
              <li value="TS29"><a href="javascript:void(0)">권투</a></li>
              <li value="TS30"><a href="javascript:void(0)">배드민턴</a></li>
              <li value="TS31"><a href="javascript:void(0)">주짓수</a></li>
              <li value="TS32"><a href="javascript:void(0)">탁구</a></li>
              <li value="TS33"><a href="javascript:void(0)">요가</a></li>
              <li value="TS34"><a href="javascript:void(0)">축구</a></li>
              <li value="TS35"><a href="javascript:void(0)">골프</a></li>
              <li value="TS36"><a href="javascript:void(0)">테니스</a></li>
              <li value="TS37"><a href="javascript:void(0)">필라테스</a></li>
            </ul>             
          </li>
          <li>
            <a>
              <img class="icon" src="/assets/icon_music.png">
              <p>music</p>
            </a>
            <ul class="cls">
              <li value="TS38"><a href="javascript:void(0)">피아노</a></li>
              <li value="TS39"><a href="javascript:void(0)">플룻</a></li>
              <li value="TS40"><a href="javascript:void(0)">바이올린</a></li>
              <li value="TS41"><a href="javascript:void(0)">보컬</a></li>
              <li value="TS42"><a href="javascript:void(0)">드럼</a></li>
              <li value="TS43"><a href="javascript:void(0)">첼로</a></li>      
            </ul>             
          </li>
          <li>
            <a>
              <img class="icon" src="/assets/icon_study.png">
              <p>study</p>
            
            <ul class="cls">
              <li value="TS44"><a href="javascript:void(0)">수학</a></li>
              <li value="TS45"><a href="javascript:void(0)">역사</a></li>
              <li value="TS46"><a href="javascript:void(0)">문학</a></li>
              <li value="TS47"><a href="javascript:void(0)">주식</a></li>
              <li value="TS48"><a href="javascript:void(0)">정치</a></li>
              <li value="TS49"><a href="javascript:void(0)">성경</a></li>
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
	    <c:forEach var="board" items="${boardList}">
	      <li class="lesson-card">
	        <div class="lesson-image">
	            <img src="/assets/usericon1.png">
	            <span>${board.giveTalentLowName}</span>
	            <img src="/assets/exchageicon.png">
	            <span>${board.receiveTalentLowName}</span>
	            <img src="/assets/usericon2.png">
	        </div>
	        <div class="lesson-details">
	            <p class="lesson-description">${board.contents}</p>
	            <div class="lesson-meta">
	                <img src="/assets/locationicon.png">
	                <span class="lesson-location">${board.city_name} ${board.district_name}</span>
	                <!-- <input type="button" id="detail" value="DETAIL"></input> -->
	                <a href='/board/detail/${board.board_id}'><input type="button" id="detail" value="DETAIL"></input></a>
	            </div>
	        </div>
	      </li>
		</c:forEach>
    </ul>
  </div>
  
 <script>
    $(document).ready(function () {
        // li 태그를 클릭했을 때의 이벤트 핸들러를 정의합니다.
        $("ul.cls li").click(function () {
            // 클릭한 li 태그의 value 값을 가져옵니다.
            const param = { give_talent: $(this).attr("value") };

            // AJAX를 통해 컨트롤러에 값을 전달합니다.
            $.ajax({
                url:  "<c:url value='/telent/teachers'/>", // 컨트롤러의 URL을 지정합니다.
                type: "POST", // 또는 "GET" 등 HTTP 요청 방식 선택
                data: JSON.stringify(param), // 전달할 데이터 설정
                contentType: 'application/json; charset=UTF-8',
                success: function (response) {
                    if (response.status) {
                        // 성공적으로 데이터를 받아왔을 때 강의 카드를 업데이트합니다.
                        updateLessonCards(response.teachersList);
                    }
                },
                error: function(error) {
                    alert("데이터를 가져오는 데 실패했습니다.");
                }
            });
        });

        // 강의 카드를 업데이트하는 함수 정의
        function updateLessonCards(teachersList) {
            // 강의 카드를 감싸는 ul 요소를 선택합니다.
            var lessonCardsUl = $("ul.lesson-cards");

            // ul 요소 안의 기존 내용을 지웁니다.
            lessonCardsUl.empty();

            // 받아온 teachersList를 이용하여 강의 카드를 동적으로 생성합니다.
            $.each(teachersList, function (index, teacher) {
                // 강의 카드를 추가합니다.
                var lessonCard = $("<li class='lesson-card'>").html(
                    "<div class='lesson-image'>" +
                    "<img src='/assets/usericon1.png'>" +
                    "<a href='#'><span>" + teacher.giveTalentLowName + "</span></a>" +
                    "<img src='/assets/exchageicon.png'>" +
                    "<a href='#'><span>" + teacher.receiveTalentLowName + "</span></a>" +
                    "<img src='/assets/usericon2.png'>" +
                    "</div>" +
                    "<div class='lesson-details'>" +
                    "<p class='lesson-description'>" + teacher.contents + "</p>" +
                    "<div class='lesson-meta'>" +
                    "<img src='/assets/locationicon.png'>" +
                    "<span class='lesson-location'>" + teacher.city_name + " " + teacher.district_name + "</span>" +
                    "<a href='/board/detail/" + teacher.board_id + "'><input type='button' id='detail' value='DETAIL'></input></a>" +
                    "</div>" +
                    "</div>"
                );

                // 생성한 강의 카드를 ul에 추가합니다.
                lessonCardsUl.append(lessonCard);
            });
        }
    });
</script>


</body>
</html>