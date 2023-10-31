<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <link rel="icon" href="/favicon.ico" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="theme-color" content="#000000" />
  <title>공지사항 작성</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter%3A300%2C700"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A300%2C400%2C500%2C700"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto%3A400%2C500"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins%3A300"/>
  <link rel="stylesheet" href="/styles/noticeWrite.css"/>
</head>
<body>
<div class="item--zec">
  <div class="auto-group-ppq6-syJ">
    <p class="item--ZbE">공지 작성</p>
    <p class="item--sbv"><span> 작성자 :</span> <span id="name">관리자</span></p>
  </div>
  <div class="auto-group-fkmn-YCG">
    <div class="button-em6">등록하기</div>
    <div class="button-hDa">취소하기</div>
  </div>
  <div class="auto-group-i9yr-khe">
    <div class="button-Gvt">
      <img class="vector-36-stroke-C3r" src="/assets/vector-36-stroke.png"/>
      <div class="text-label-i2C">목록으로</div>
    </div>
    <div class="group-5-1X6">수정</div>
    <div class="group-6-VSG">삭제</div>
  </div>
  <div class="auto-group-mwc8-wp4">
    <div class="item-3-3--47z">
      <textarea style="margin: 0px;width: 708px;height: 360px;resize: none;">
        제가 개발자로 취직한지 어언 3년 이제 이직을 해야하는데 3년전과는 달리 토스점수를 원하더군요 
      그래서 점수가 필요한데 제가 할줄아는게 컴퓨터 뿐이네요 엑셀이나 이런것을 가르쳐 드릴테니
      영어를 알려주실  영어천재님 모십니다!!
      </textarea>
    </div>
  </div>
  <div class="auto-group-jktr-5SQ">
    <label for="title" style="margin:0px;">제목 :</label>
    <input id="title" type="text" style="margin:0px 10px; height: 15px;width: 100%;" placeholder="제가 영어를 해야해서요"/>
  </div>
  <div class="button-89n">첨부파일 추가</div>
  <!--- 파일선택 input태그가 들어가는 div  -->
  <div class="frame-49-bJG">
    <!-- 파일 선택 과 input태그가 들어가는 한줄 -->
    <div class="component-15-Wg8">
      <div class="auto-group-4p8g-eXS">
        <input type="file"/>
        <!-- <div class="button-yZi">파일 선택</div>
        <div class="jdk-11020windows-x64binexe-s9J"> jdk-11.0.20_windows-x64_bin.exe</div> -->
      </div>
      <img class="vector-142-YFS" src="REPLACE_IMAGE:I27:1192;1:1109"/>
    </div>
    <!-- 한줄끝 -->


  </div>
  <!-- 한줄끝 -->

</div>
</body>