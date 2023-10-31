<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <link rel="icon" href="/favicon.ico" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="theme-color" content="#000000" />
  <title>게시판 수정</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter%3A300%2C700"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A300%2C400%2C500%2C700"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto%3A400%2C500"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins%3A300"/>
  <!-- 부트스트랩 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
         rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
         integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="/styles/boardRevise.css"/>
</head>
<body>
<div class="item--3zp">
  <div class="auto-group-ipon-B5S">
    <p class="item--fFW">글 수정하기</p>
    <p class="writer-mJY"><span> 작성자 :</span> <span id="name">yeonsul</span></p>
  </div>
  <div class="auto-group-5zh6-TSG">
    <div class="button-Bt4">등록하기</div>
    <div class="button-dk4">취소하기</div>
  </div>
  <div class="button-HZi">
    <img class="vector-36-stroke-nFa" src="/assets/vector-36-stroke.png"/>
    <div class="text-label-tZW">목록으로</div>
  </div>
  <div class="auto-group-vsfa-bD2">
    <div class="js-nodejs-api-htmlcss--i2k">
      <textarea style="margin: 0px;width: 774px;height: 396px;resize: none;">
        제가 개발자로 취직한지 어언 3년 이제 이직을 해야하는데 3년전과는 달리 토스점수를 원하더군요 
      그래서 점수가 필요한데 제가 할줄아는게 컴퓨터 뿐이네요 엑셀이나 이런것을 가르쳐 드릴테니
      영어를 알려주실  영어천재님 모십니다!!
      </textarea>
    </div>
  </div>
  <div class="auto-group-swtq-Vhi">
    <label for="title" style="margin:0px;">제목 :</label>
    <input id="title" type="text" style="margin:0px 10px; height: 15px;width: 100%;" placeholder="저와 해커톤에 나가실분구합니다."/>
  </div>
  <div class="auto-group-r49e-Kwe">
    <p class="item--D1S">위치</p>
    <select class="form-select" aria-label="Default select example" style="margin-right:10px;">
      <option selected>시</option>
      <option value="1">One</option>
      <option value="2">Two</option>
      <option value="3">Three</option>
    </select>
    <div class="auto-group-4xow-fXe">
      <select class="form-select" aria-label="Default select example">
        <option selected>구</option>
        <option value="1">One</option>
        <option value="2">Two</option>
        <option value="3">Three</option>
      </select>
    </div>
  </div>
  <div class="group-18-dsn">
    <p class="item--XyA">기부할 재능</p>
    <select class="form-select" aria-label="Default select example" style="margin-right:10px;">
      <option selected>대분류</option>
      <option value="1">One</option>
      <option value="2">Two</option>
      <option value="3">Three</option>
    </select>
    <select class="form-select" aria-label="Default select example" style="margin-right:10px;">
      <option selected>기부할재능</option>
      <option value="1">One</option>
      <option value="2">Two</option>
      <option value="3">Three</option>
    </select>
    <p class="item--jhr">기부 받고 싶은 재능</p>
    <select class="form-select" aria-label="Default select example" style="margin-right:10px;">
      <option selected>대분류</option>
      <option value="1">One</option>
      <option value="2">Two</option>
      <option value="3">Three</option>
    </select>
    <select class="form-select" aria-label="Default select example">
      <option selected>기부받고싶은재능</option>
      <option value="1">One</option>
      <option value="2">Two</option>
      <option value="3">Three</option>
    </select>
  </div>

</div>
</body>