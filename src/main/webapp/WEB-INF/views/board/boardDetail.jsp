<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <sec:authorize access="isAuthenticated()"> <!-- 인증이 됐는지안됐는지 확인하는 구문 -->
	   <sec:authentication property="principal" var="principal"/> <!-- property로 가져와서 var 데이터타입으로 대입하겠다는뜻 -->
	</sec:authorize>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <link rel="icon" href="/favicon.ico" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="theme-color" content="#000000" />
  <title>게시글 상세보기</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto%3A400%2C500"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter%3A100%2C300%2C400"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins%3A300%2C500"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A100%2C300%2C400%2C500"/>
  <link rel="stylesheet" href="/styles/boardDetail.css"/>
</head>
<body>

<div id="innerBoardDetail">
  <div class="item--XQC">
    <div class="auto-group-fgyx-zW4">
      <div class="button-6oz">
        <img class="vector-36-stroke-Q3z" src="/assets/vector-36-stroke.png"/>
        <div class="text-label-Kgk">목록으로</div>
      </div>
      <div class="group-5-znt">수정</div>
      <div class="group-6-TgU">삭제</div>
    </div>
    <div class="auto-group-jkgl-7W8">
      <div class="group-30929672-PiY">
        <p class="item--vTa">${board.give_talent }</p>
        <img class="movement-of-items-crC" src="/assets/movement-of-items.png"/>
        <p class="item--LnC">${board.receive_talent }</p>
      </div>
      <div class="auto-group-f1ex-GA4">
        <div class="auto-group-8whi-by2">
          <img class="vector-L9v" src="/assets/vector.png"/>
          <p class="yeonsul123navercom-fxt">작성자 : ${board.writer_nickname }</p>
          <p class="item--NcQ">성별 : ${board.gender=='female'? '남' : '여'} </p>
          <!-- ${board.gender=='w'? '남' : '여'} -->
        </div>
        <div class="auto-group-ogqn-h8t">
          <div class="group-9-3iY">
            <p class="item-123-PGc">조회수 : ${board.read_count }</p>
            <p class="item-2023-10-22-11-23-12-UKz">게시일 : ${board.register_date }</p>
          </div>
          <p class="item--n5n">신고 </p>
        </div>
      </div>
    </div>
    <div class="auto-group-tmvr-Fk4">${board.title }</div>
    <div class="group-20-JTS">
      <p class="item--cDE">
      ${board.contents }
      </p>
      <div class="auto-group-dgqx-KG4">
        <img class="location-3xk" src="/assets/location.png"/>
        <div class="item--Bp4">${board.city_name } ${board.district_name }</div>
      </div>
    </div>
    <div class="frame-45-qdi">
      <div class="component-9-NNk">
        <div class="auto-group-ewde-v9N">
          <img class="attach-rHv" src="/assets/attach.png"/>
          <div class="jdk-11020windows-x64binexe-NXA">첨부파일 : jdk-11.0.20_windows-x64_bin.exe</div>
        </div>
        <img class="vector-50-UaC" src="REPLACE_IMAGE:27:880"/>
      </div>

    <div class="auto-group-mjac-BEx">
      <div class="button-W2L">참여하기</div>
      <div class="button-kxG">문의하기</div>
    </div>
  </div>
</div>
</div>
</body>