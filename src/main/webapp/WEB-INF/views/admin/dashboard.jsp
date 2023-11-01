<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <link rel="icon" href="/favicon.ico" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="theme-color" content="#000000" />
  <title>MemberList</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto%3A400"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Barlow%3A400%2C500"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C500%2C700"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins%3A500%2C700"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Capriola%3A400"/>
  <link rel="stylesheet" href="/styles/memberlist.css"/>
  <link rel="stylesheet" href="/styles/dashboard.css"/>
</head>
<body>
<div class="memberlist-Bwn">
  <div class="allgroup-Lpg">
    <!-- 초록색 배경 -->
    <div class="greenbackground-sZi">
    </div>
      <!-- 메뉴바 -->
    <div class="menubargroup-nwa">
      <div class="auto-group-tqda-4PJ">
        <div class="frame-2-naC">
          <div class="main-logo-LLp">
            <p class="caption-6Kz">Admin Dashboard</p>
            <p class="t-net-zRN">T-net.</p>
          </div>
          <div class="auto-group-e7b6-7Vz tab_menu">
            <div class="group-30929683-3uS defaultarea">
              <img class="icon-yo6" src="/assets/icon-RhJ.png"/>
              <a class="analytics-uRr" href="#tab1">Analytics</a>
            </div>
            <div class="group-30929684-Ruz">
              <img class="icon-NKS" src="/assets/icon-E2L.png"/>
              <a class="board-list-u4U" href="#tab2" >Board List</a>
            </div>
            <div class="group-30929685-3Ag">
              <img class="icon-Nye" src="/assets/icon-j28.png"/>
              <a class="notice-list-WKA"  href="#tab3">Notice List</a>
            </div>
            <div class="group-30929686-eRN">
              <img class="icon-Pdr" src="/assets/icon-p7z.png"/>
              <a class="member-list-8LY" href="#tab4" >Member List</a>
            </div>
            <div class="group-30929687-Ghe">
              <img class="icon-alert-circle-1v8" src="/assets/icon-alert-circle-HqJ.png"/>
              <p class="complain-LSc">Complain</p>
            </div>
          </div>
        </div>
      </div>
      <div class="menubottomletter-rQx">
        <p class="made-with-by-peterdraw-abr">Made with ♥ by Peterdraw</p>
        <p class="talent-networks-pronesis-Ux8">
        Talent -NetWork’s  
        <br/>
        @pro_nesis
        </p>
      </div>

       <!-- 콘텐츠 영역 탭누르면 바뀌는 부분 -->

        <!-- Dash board -->
        <div class="whitearea-Nnc tap_content " id="tab1">
          <p class="t-net-dashboard-CJc">T - Net DashBoard</p>

          <!-- 카운트 영역 -->
          <div class="countingarea-Mqi">
            <!-- 진행중인수업 카운트 -->
            <div class="classcountinarea-sp4">
              <img class="icon-nRE" src="/assets/icon-k5E.png"/>
              <div class="group-187-i3z">
                <p class="item--eCY">진행중인 수업</p>
                <div class="item-96-jDz">96</div>
              </div>
              <div class="togle-RMi">
                <p class="item--MFN">년도</p>
                <img class="polygon-2-TJQ" src="/assets/polygon-2-RCL.png"/>
              </div>
            </div>

            <!-- 완료된 수업 카운트 -->
            <div class="completeclassarea-6AL">
              <img class="icon-CDN" src="/assets/icon-stt.png"/>
              <div class="letter-jDJ">
                <p class="item--f6x">완료된 수업</p>
                <div class="item-38-MVa">38</div>
              </div>
              <div class="togle-S1E">
                <p class="item--9wE">주 </p>
                <img class="polygon-2-sMS" src="/assets/polygon-2-ZfE.png"/>
              </div>
            </div>

            <!-- 기부왕 카운트 -->
            <div class="givekingarea-6cG">
              <img class="icon-QN4" src="/assets/icon.png"/>
              <div class="group-187-XxU">
                <p class="item--4Bi">기부왕왕</p>
                <div class="item-23-AEk">23</div>
              </div>
              <div class="togle-fSQ">
                <p class="item--BvY">달</p>
                <img class="polygon-2-hP6" src="/assets/polygon-2.png"/>
              </div>
            </div>
          </div><!-- 카운트 영역 끝 -->


        <!-- 차트 영역 -->
          <div class="auto-group-jz1n-jeY">
            <!-- 막대 차트 영역 -->
            <div class="bargrape-HRA">
              <div class="auto-group-cjhn-mbE"> 
                <p class="item--VGL">연도별 추이</p>
                <!-- 토글 -->
                <div class="group-30929674-c64">
                  <p class="item--iet">완료된 수업</p>
                  <img class="polygon-2-zsJ" src="/assets/polygon-2-Kip.png"/>
                </div>
                <div class="group-184-JNC">
                  <!-- 막대그래프들어갈 자리 -->
                </div>
            </div>
            </div>

            <!-- 파이 차트 영역 -->
            <div class="piechart-ojW">
              <div class="auto-group-8seu-Wdv">
                <p class="item--SXa">인기 과목</p>
                <div class="group-30929675-YqW">
                <p class="item--fQL">연령대별</p>
                <img class="polygon-2-yfv" src="/assets/polygon-2-PCk.png"/>
                </div>
              </div>
              <div class="auto-group-xle4-eGG">
                <!-- 파이차트 들어갈 자리 -->
              </div>
            </div>
          </div>


        </div><!-- Dash board 흰배경 부분 끝-->


    </div>    <!-- 메뉴바 끝 -->
  </div><!--영역끝 지우면 안됨 -->
</div><!-- 영역끝 지우면 안됨-->

</body>
</html>