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


        <!-- Notice List 흰색 영역 -->
        <div class="whitearea-Nnc  tap_content" id="tab3">
          <p class="member-list-VMS">Notice List</p>
          <!-- 테이블 -->
          <div>
            <table >
                <tr id = "table_title_bar">
                  <th>선택</th>
                  <th>번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>등록날짜</th>
                  <th>고정여부</th>
                  <th>삭제여부</th>
                  </tr>
                  <c:forEach items="${result.List}" var="notice">
                  <tr id = "table_contents">
                    <td>${notice.boardid}</td>
                    <td >${notice.title}</td>
                    <td>${notice.writer_uid}</td>
                    <td>${notice.reg_date}</td>
                    <td>${notice.view_count}</td>
                    <td >${notice.title}</td>
                    <td >${notice.title}</td>
                  </tr>
                </c:forEach>                        
            </table>
          </div> <!-- 테이블 -->

          <!-- 버튼이랑 페이징 함께-->
          <div id = "white_footer_area">
            <!-- 버튼 -->
            <div id = "crud_buttons">
            <input type="button" id ="button-bQU" value="삭제"/>
            <input type="button" id ="button-bQU" value="고정"/>
            <input type="button" id ="button-bQU" value="고정해제"/>
            </div>

            <!-- 페이징부분 -->
            <div id ="paging">
              <div id = "Change number">
              건수 : <input type="text" id ="button-bQU" value="10"/></div>
              
              <div class="group-299-zDe" id="page_switch_buttons">
                <input class="frame-298-jBE" type ="button" value="&lt;"/>
                <input class="frame-292-QYG" type ="button" value="1"/>
                <input class="frame-295-T9A" type ="button" value="2"/>
                <input class="frame-294-mn8" type ="button" value="3"/>
                <input class="frame-295-T9A" type ="button" value="4"/>
                <input class="frame-295-T9A" type ="button" value="5"/>
                <input class="frame-297-vwr" type ="button" value="&gt;"/>
              </div>
            </div>
          </div>

        </div> <!-- Notice List 흰색 영역끝 -->



    </div>    <!-- 메뉴바 끝 -->
  </div><!--영역끝 지우면 안됨 -->
</div><!-- 영역끝 지우면 안됨-->
</body>
</html>