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

        <!-- Member List í°ì ìì­ -->
        <div class="whitearea-Nnc  tap_content" id="tab4">
          <p class="member-list-VMS">Member List</p>
          <!-- íì´ë¸ -->
          <div>
            <table >
                <tr id = "table_title_bar">
                  <th>ì í</th>
                  <th>ëë¤ì</th>
                  <th>ì´ë©ì¼</th>
                  <th>ëì´</th>
                  <th>ì íë²í¸</th>
                  <th>ììë¡ê·¸ì¸</th>
                  <th>í´ë©´ê³ì </th>
                  <th>ê°ìë ì§</th>
                  <th>ì ì</th>
                  <th>ì ê³ ì</th>
                </tr>
                    <!-- ëì¤ì ìì -->
                <c:forEach items="${result.List}" var="member">
                  <tr id = "table_contents">
                  <td>${member.boardid}</td>
                  <td >${member.title}</td>
                  <td>${member.writer_uid}</td>
                  <td>${member.reg_date}</td>
                  <td>${member.view_count}</td>
                  <td >${member.title}</td>
                  <td>${member.writer_uid}</td>
                  <td>${member.reg_date}</td>
                  <td>${member.view_count}</td>
                  <td>${member.view_count}</td>
                  </tr>
                </c:forEach>                        
              </table>
          </div> <!-- íì´ë¸ -->

          <!-- ë²í¼ì´ë íì´ì§ í¨ê»-->
          <div id = "white_footer_area">
            <!-- ë²í¼ -->
            <div id = "crud_buttons">
            <input type="button" id ="button-bQU" value="íìíí´"/>
            <input type="button" id ="button-bQU" value="ì¶ê°ë²í¼"/>
            </div>

            <!-- íì´ì§ë¶ë¶ -->
            <div id ="paging">
              <div id = "Change number">
              ê±´ì : <input type="text" id ="button-bQU" value="10"/></div>
             
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

        </div> <!-- Member List í°ì ìì­ë -->


    </div>    <!-- ë©ë´ë° ë -->
  </div><!--ìì­ë ì§ì°ë©´ ìë¨ -->
</div><!-- ìì­ë ì§ì°ë©´ ìë¨-->
</body>