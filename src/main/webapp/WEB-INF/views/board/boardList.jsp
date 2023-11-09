<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <link rel="icon" href="/favicon.ico" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="theme-color" content="#000000" />
  <title>게시판 목록</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter%3A800"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins%3A300"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A300%2C500%2C700%2C800"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto%3A500%2C700"/>
  <!-- 부트스트랩 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
         rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
         integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="/styles/boardList.css"/>
</head>
<body>
    <div class="item--XFN">

      <div class="item--Vua">게시판</div>
      <div class="auto-group-qmuj-WZn">
        <div class="group-30929677-Xjn">
        <select class="form-select" aria-label="Default select example" style="margin-right:10px;">
          <option selected>시</option>
          <option value="1">One</option>
          <option value="2">Two</option>
          <option value="3">Three</option>
        </select>
        </div>
        <div class="group-30929678-Je4">
          <select class="form-select" aria-label="Default select example">
            <option selected>구</option>
            <option value="1">One</option>
            <option value="2">Two</option>
            <option value="3">Three</option>
          </select>
        </div>
        <div class="group-30929675-2Cg">
          <select class="form-select" aria-label="Default select example" style="margin-right:10px;">
            <option selected>대분류</option>
            <option value="1">One</option>
            <option value="2">Two</option>
            <option value="3">Three</option>
          </select>
        </div>
        <div class="group-30929676-uQt"> <select class="form-select" aria-label="Default select example">
          <option selected>기부받고싶은재능</option>
          <option value="1">One</option>
          <option value="2">Two</option>
          <option value="3">Three</option>
        </select>
      </div>
        
        <img class="secondary-cricle-button-LFJ" src="/assets/Secondary Cricle Button.png"/>
      </div>

      <!-- 내용의 한줄 -->
      <div class="auto-group-dxhj-ErU">
        <!-- 내용의 한칸 -->
        <div class="component-1-LPi">
          <img class="location-FFn" src="/assets/location.png"/>
          <img class="movement-of-items-yBn" src="/assets/movement-of-items.png"/>
          <div class="button-Ggg">Detail</div>
          <div class="item--7hJ">저는 어디어디살고요 어떤 재능이 필요한데 그 재능을 ...</div>
          <div class="item--8MW">영어</div>
          <div class="item--bkt">피아노</div>
          <img class="user-tV6" src="/assets/user.png"/>
          <img class="user-cfz" src="/assets/user.png"/>
          <div class="item--ZLL">서울 관악구</div>
        </div>
        <!-- 내용의 한칸 끝 -->
        <div class="component-2-1CL">
          <img class="location-8Gx" src="REPLACE_IMAGE:I27:419;1:980"/>
          <img class="movement-of-items-rik" src="REPLACE_IMAGE:I27:419;1:981"/>
          <div class="button-Nwz">Detail</div>
          <div class="item--EjJ">저는 어디어디살고요 어떤 재능이 필요한데 그 재능을 ...</div>
          <div class="item--fZi">영어</div>
          <div class="item--m6x">피아노</div>
          <img class="user-3aG" src="REPLACE_IMAGE:I27:419;1:986"/>
          <img class="user-BRa" src="REPLACE_IMAGE:I27:419;1:987"/>
          <div class="item--6YY">서울 관악구</div>
        </div>
        <div class="component-3-wJG">
          <img class="location-rRE" src="REPLACE_IMAGE:I27:420;1:980"/>
          <img class="movement-of-items-ykk" src="REPLACE_IMAGE:I27:420;1:981"/>
          <div class="button-yuA">Detail</div>
          <div class="item--F5z">저는 어디어디살고요 어떤 재능이 필요한데 그 재능을 ...</div>
          <div class="item--UUY">영어</div>
          <div class="item--9Kn">피아노</div>
          <img class="user-2uN" src="REPLACE_IMAGE:I27:420;1:986"/>
          <img class="user-B1a" src="REPLACE_IMAGE:I27:420;1:987"/>
          <div class="item--tRn">서울 관악구</div>
        </div>
        <div class="component-4-fqr">
          <img class="location-BJQ" src="REPLACE_IMAGE:I27:421;1:980"/>
          <img class="movement-of-items-hXe" src="REPLACE_IMAGE:I27:421;1:981"/>
          <div class="button-dAQ">Detail</div>
          <div class="item--ts2">저는 어디어디살고요 어떤 재능이 필요한데 그 재능을 ...</div>
          <div class="item--LDE">영어</div>
          <div class="item--REg">피아노</div>
          <img class="user-ufe" src="REPLACE_IMAGE:I27:421;1:986"/>
          <img class="user-SvU" src="REPLACE_IMAGE:I27:421;1:987"/>
          <div class="item--Pap">서울 관악구</div>
        </div>
      </div>
      <div class="auto-group-hmya-ELY">
        <div class="component-9-Y6L">
          <img class="location-rsi" src="REPLACE_IMAGE:I27:422;1:980"/>
          <img class="movement-of-items-CAt" src="REPLACE_IMAGE:I27:422;1:981"/>
          <div class="button-i9E">Detail</div>
          <div class="item--ahE">저는 어디어디살고요 어떤 재능이 필요한데 그 재능을 ...</div>
          <div class="item--DEQ">영어</div>
          <div class="item--6oz">피아노</div>
          <img class="user-nwi" src="REPLACE_IMAGE:I27:422;1:986"/>
          <img class="user-YAC" src="REPLACE_IMAGE:I27:422;1:987"/>
          <div class="item--5fv">서울 관악구</div>
        </div>
        <div class="component-10-iyn">
          <img class="location-Set" src="REPLACE_IMAGE:I27:423;1:980"/>
          <img class="movement-of-items-nCx" src="REPLACE_IMAGE:I27:423;1:981"/>
          <div class="button-6zL">Detail</div>
          <div class="item--PCk">저는 어디어디살고요 어떤 재능이 필요한데 그 재능을 ...</div>
          <div class="item--DSg">영어</div>
          <div class="item--i8Y">피아노</div>
          <img class="user-cUp" src="REPLACE_IMAGE:I27:423;1:986"/>
          <img class="user-AFS" src="REPLACE_IMAGE:I27:423;1:987"/>
          <div class="item--hWG">서울 관악구</div>
        </div>
        <div class="component-11-YWt">
          <img class="location-sJG" src="REPLACE_IMAGE:I27:424;1:980"/>
          <img class="movement-of-items-cFr" src="REPLACE_IMAGE:I27:424;1:981"/>
          <div class="button-9Fn">Detail</div>
          <div class="item--E2L">저는 어디어디살고요 어떤 재능이 필요한데 그 재능을 ...</div>
          <div class="item--4n4">영어</div>
          <div class="item--9Hi">피아노</div>
          <img class="user-qRS" src="REPLACE_IMAGE:I27:424;1:986"/>
          <img class="user-mZz" src="REPLACE_IMAGE:I27:424;1:987"/>
          <div class="item--6cG">서울 관악구</div>
        </div>
        <div class="component-12-9Ke">
          <img class="location-4xQ" src="REPLACE_IMAGE:I27:425;1:980"/>
          <img class="movement-of-items-1Mr" src="REPLACE_IMAGE:I27:425;1:981"/>
          <div class="button-8hN">Detail</div>
          <div class="item--cMe">저는 어디어디살고요 어떤 재능이 필요한데 그 재능을 ...</div>
          <div class="item--3xk">영어</div>
          <div class="item--MTe">피아노</div>
          <img class="user-F3E" src="REPLACE_IMAGE:I27:425;1:986"/>
          <img class="user-BSg" src="REPLACE_IMAGE:I27:425;1:987"/>
          <div class="item--vfA">서울 관악구</div>
        </div>
      </div>
      <div class="auto-group-5hjg-YRe">
        <div class="component-5-37W">
          <img class="location-kGp" src="REPLACE_IMAGE:I27:414;1:980"/>
          <img class="movement-of-items-UTi" src="REPLACE_IMAGE:I27:414;1:981"/>
          <div class="button-QMN">Detail</div>
          <div class="item--Fsn">저는 어디어디살고요 어떤 재능이 필요한데 그 재능을 ...</div>
          <div class="item--67i">영어</div>
          <div class="item--zD6">피아노</div>
          <img class="user-GAc" src="REPLACE_IMAGE:I27:414;1:986"/>
          <img class="user-nek" src="REPLACE_IMAGE:I27:414;1:987"/>
          <div class="item--iYQ">서울 관악구</div>
        </div>
        <div class="component-6-mFn">
          <img class="location-Ufz" src="REPLACE_IMAGE:I27:415;1:980"/>
          <img class="movement-of-items-QpY" src="REPLACE_IMAGE:I27:415;1:981"/>
          <div class="button-k7i">Detail</div>
          <div class="item--pNU">저는 어디어디살고요 어떤 재능이 필요한데 그 재능을 ...</div>
          <div class="item--TRS">영어</div>
          <div class="item--wrQ">피아노</div>
          <img class="user-dz8" src="REPLACE_IMAGE:I27:415;1:986"/>
          <img class="user-Zct" src="REPLACE_IMAGE:I27:415;1:987"/>
          <div class="item--W2L">서울 관악구</div>
        </div>
        <div class="component-7-9b6">
          <img class="location-Trg" src="REPLACE_IMAGE:I27:416;1:980"/>
          <img class="movement-of-items-17W" src="REPLACE_IMAGE:I27:416;1:981"/>
          <div class="button-8C8">Detail</div>
          <div class="item--Cxg">저는 어디어디살고요 어떤 재능이 필요한데 그 재능을 ...</div>
          <div class="item--eJt">영어</div>
          <div class="item--8zk">피아노</div>
          <img class="user-Ryr" src="REPLACE_IMAGE:I27:416;1:986"/>
          <img class="user-yEg" src="REPLACE_IMAGE:I27:416;1:987"/>
          <div class="item--WEc">서울 관악구</div>
        </div>
        <div class="component-8-xMW">
          <img class="location-gHW" src="REPLACE_IMAGE:I27:417;1:980"/>
          <img class="movement-of-items-DHS" src="REPLACE_IMAGE:I27:417;1:981"/>
          <div class="button-k2U">Detail</div>
          <div class="item--R8c">저는 어디어디살고요 어떤 재능이 필요한데 그 재능을 ...</div>
          <div class="item--fHr">영어</div>
          <div class="item--kq6">피아노</div>
          <img class="user-Sxp" src="REPLACE_IMAGE:I27:417;1:986"/>
          <img class="user-Atp" src="REPLACE_IMAGE:I27:417;1:987"/>
          <div class="item--7JG">서울 관악구</div>
        </div>
      </div>
      <!-- 페이징 -->
      <div class="auto-group-yf6p-kc8">
        <img class="circle-rfA" src="/assets/circle-rMe.png"/>
        <div class="circle-nYp">1</div>
        <div class="circle-dZS">2</div>
        <div class="circle-Wt8">3</div>
        <div class="circle-nqe">4</div>
        <div class="circle-scC">5</div>
        <img class="circle-kvt" src="/assets/circle.png"/>
        <div><a href='<c:url value="/ckeditorForm.do"/>'>게시글작성</a></div>
      </div>
    </div>
</body>