<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <link rel="icon" href="/favicon.ico" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="theme-color" content="#000000" />
  <title>공지사항 상세보기</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins%3A300"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A100%2C300%2C400%2C500"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto%3A400%2C500"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter%3A100%2C300"/>
  <link rel="stylesheet" href="/styles/noticeDetail.css"/>
</head>
<body>
<div class="item--mGL">

  <div class="auto-group-toqk-R9r">
    <div class="button-8a4">
      <img class="vector-36-stroke-Ed6" src="/assets/vector-36-stroke.png"/>
      <div class="text-label-MSp">목록으로</div>
    </div>
    <div class="group-5-qsn">수정</div>
    <div class="group-6-igg">삭제</div>
  </div>
  <div class="auto-group-fekx-BKN">
  	<input type="hidden" value="${notice.notice_no}"/>
    <p class="item--shz">${notice.title}</p>
    <p class="item--jEQ">작성자 : 관리자</p>
  </div>
  <div class="group-20-ok4">
    <p class="item--v3z">${notice.contents} </p>
    <img class="location-3np" src="REPLACE_IMAGE:27:1294"/>
  </div>
  <!-- 첨부파일이 들어갈 곳 -->
  <div class="frame-45-NKJ">
    <!-- 한줄 시작 -->
    <div class="component-9-5zQ">
      <div class="auto-group-awon-EcQ">
        <div class="rectangle-169-msE">
        </div>
        <img class="attach-uiY" src="/assets/attach.png"/>
        <div class="jdk-11020windows-x64binexe-eAL">첨부파일 : jdk-11.0.20_windows-x64_bin.exe</div>
      </div>
      <img class="vector-50-uMA" src="REPLACE_IMAGE:I27:1279;74:488"/>
    </div>
    <!-- 한줄 끝 -->
  </div>
</div>
</body>