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
  <link rel="stylesheet" href="./styles/memberlist.css"/>
  <link rel="stylesheet" href="./styles/dashboard.css"/>
</head>
<body>
<div class="memberlist-Bwn">
  <div class="allgroup-Lpg">
    <!-- ì´ë¡ì ë°°ê²½ -->
    <div class="greenbackground-sZi">
    </div>
      <!-- ë©ë´ë° -->
    <div class="menubargroup-nwa">
      <div class="auto-group-tqda-4PJ">
        <div class="frame-2-naC">
          <div class="main-logo-LLp">
            <p class="caption-6Kz">Admin Dashboard</p>
            <p class="t-net-zRN">T-net.</p>
          </div>
          <div class="auto-group-e7b6-7Vz tab_menu">
            <div class="group-30929683-3uS defaultarea">
              <img class="icon-yo6" src="./assets/icon-RhJ.png"/>
              <a class="analytics-uRr" href="#tab1">Analytics</a>
            </div>
            <div class="group-30929684-Ruz">
              <img class="icon-NKS" src="./assets/icon-E2L.png"/>
              <a class="board-list-u4U" href="#tab2" >Board List</a>
            </div>
            <div class="group-30929685-3Ag">
              <img class="icon-Nye" src="./assets/icon-j28.png"/>
              <a class="notice-list-WKA"  href="#tab3">Notice List</a>
            </div>
            <div class="group-30929686-eRN">
              <img class="icon-Pdr" src="./assets/icon-p7z.png"/>
              <a class="member-list-8LY" href="#tab4" >Member List</a>
            </div>
            <div class="group-30929687-Ghe">
              <img class="icon-alert-circle-1v8" src="./assets/icon-alert-circle-HqJ.png"/>
              <p class="complain-LSc">Complain</p>
            </div>
          </div>
        </div>
      </div>
      <div class="menubottomletter-rQx">
        <p class="made-with-by-peterdraw-abr">Made with â¥ by Peterdraw</p>
        <p class="talent-networks-pronesis-Ux8">
        Talent -NetWorkâs  
        <br/>
        @pro_nesis
        </p>
      </div>

       <!-- ì½íì¸  ìì­ í­ëë¥´ë©´ ë°ëë ë¶ë¶ -->

        <!-- Dash board -->
        <div class="whitearea-Nnc tap_content " id="tab1">
          <p class="t-net-dashboard-CJc">T - Net DashBoard</p>

          <!-- ì¹´ì´í¸ ìì­ -->
          <div class="countingarea-Mqi">
            <!-- ì§íì¤ì¸ìì ì¹´ì´í¸ -->
            <div class="classcountinarea-sp4">
              <img class="icon-nRE" src="./assets/icon-k5E.png"/>
              <div class="group-187-i3z">
                <p class="item--eCY">ì§íì¤ì¸ ìì</p>
                <div class="item-96-jDz">96</div>
              </div>
              <div class="togle-RMi">
                <p class="item--MFN">ëë</p>
                <img class="polygon-2-TJQ" src="./assets/polygon-2-RCL.png"/>
              </div>
            </div>

            <!-- ìë£ë ìì ì¹´ì´í¸ -->
            <div class="completeclassarea-6AL">
              <img class="icon-CDN" src="./assets/icon-stt.png"/>
              <div class="letter-jDJ">
                <p class="item--f6x">ìë£ë ìì</p>
                <div class="item-38-MVa">38</div>
              </div>
              <div class="togle-S1E">
                <p class="item--9wE">ì£¼ </p>
                <img class="polygon-2-sMS" src="./assets/polygon-2-ZfE.png"/>
              </div>
            </div>

            <!-- ê¸°ë¶ì ì¹´ì´í¸ -->
            <div class="givekingarea-6cG">
              <img class="icon-QN4" src="./assets/icon.png"/>
              <div class="group-187-XxU">
                <p class="item--4Bi">ê¸°ë¶ìì</p>
                <div class="item-23-AEk">23</div>
              </div>
              <div class="togle-fSQ">
                <p class="item--BvY">ë¬</p>
                <img class="polygon-2-hP6" src="./assets/polygon-2.png"/>
              </div>
            </div>
          </div><!-- ì¹´ì´í¸ ìì­ ë -->


        <!-- ì°¨í¸ ìì­ -->
          <div class="auto-group-jz1n-jeY">
            <!-- ë§ë ì°¨í¸ ìì­ -->
            <div class="bargrape-HRA">
              <div class="auto-group-cjhn-mbE"> 
                <p class="item--VGL">ì°ëë³ ì¶ì´</p>
                <!-- í ê¸ -->
                <div class="group-30929674-c64">
                  <p class="item--iet">ìë£ë ìì</p>
                  <img class="polygon-2-zsJ" src="./assets/polygon-2-Kip.png"/>
                </div>
                <div class="group-184-JNC">
                  <!-- ë§ëê·¸ëíë¤ì´ê° ìë¦¬ -->
                </div>
            </div>
            </div>

            <!-- íì´ ì°¨í¸ ìì­ -->
            <div class="piechart-ojW">
              <div class="auto-group-8seu-Wdv">
                <p class="item--SXa">ì¸ê¸° ê³¼ëª©</p>
                <div class="group-30929675-YqW">
                <p class="item--fQL">ì°ë ¹ëë³</p>
                <img class="polygon-2-yfv" src="./assets/polygon-2-PCk.png"/>
                </div>
              </div>
              <div class="auto-group-xle4-eGG">
                <!-- íì´ì°¨í¸ ë¤ì´ê° ìë¦¬ -->
              </div>
            </div>
          </div>


        </div><!-- Dash board í°ë°°ê²½ ë¶ë¶ ë-->


    </div>    <!-- ë©ë´ë° ë -->
  </div><!--ìì­ë ì§ì°ë©´ ìë¨ -->
</div><!-- ìì­ë ì§ì°ë©´ ìë¨-->

</body>