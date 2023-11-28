<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>  
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
   	  <tiles:insertDefinition name="menuBar" /> 

        <!-- Member List 흰색 영역 -->
        <div class="whitearea-Nnc  tap_content" id="tab4">
          <p class="member-list-VMS">Member List</p>
          <div id="search" >
           <select id="search_kind">
		    <option selected value="title">닉네임</option>
		    <option value="talent">성별</option>
		    <option value="city">이메일</option>
		   </select>
		   <input type="text" id="search_box"/>
		   <span id="search_button"> 검색 </span>
		   </div>
          <!-- 테이블 -->
 		   <div id="table">
            <table >
                <tr id = "table_title_bar">
                  <th>선택</th>
                  <th>닉네임</th>
                  <th>이메일</th>
                  <th>성별</th>
                  <th>전화번호</th>
                  <th>소셜로그인</th>
                  <th>휴면계정</th>
                  <th>가입날짜</th>
                  <th>점수</th>
                  <th>신고수</th>
                  </tr>
                  <c:forEach items="${result.list}" var="member">
                  <tr id = "table_contents">
                  	<td><input type="checkbox" class="checkbox" value="${member.nickName}" ></td>
                    <td>${member.nickName}</td>
                    <td >${member.email}</td>
                    <td >${member.gender}</td>
                    <td>${member.phoneNum}</td>
                    <td>${member.oauth}</td>
                    <td >${member.accountExpired}</td>
                    <td >${member.join_date}</td>
                    <td >${member.temperature}</td>
                    <td >${member.complain}</td>
                  </tr>
                </c:forEach>                        
            </table>
          </div> <!-- 테이블 -->

          <!-- 버튼이랑 페이징 함께-->
          <div id = "white_footer_area">
            <!-- 버튼 -->
            <div id = "crud_buttons">
            <input type="button" id ="button-bQU" value="퇴출"/>
            </div>

            <!-- 페이징부분 -->
            <div id ="paging">
              <form name="mForm" id="mForm" action="<c:url value='/admin/memberlist'/>" method="post" >
		     	<input type="hidden" id="pageNo" name="pageNo" />  
		     	<input type="hidden" id="pageLength" name="pageLength" />
		      </form>
              <div id = "Change number">
                <span>건수 : </span>  
              <select id="button-bQU">
				    <option selected value="10">10</option>
				    <option value="20">20</option>
				    <option value="30">30</option>
			  </select>
              </div>
              
              <div class="group-299-zDe" id="page_switch_buttons">
				<c:if test="${result.member.navStart != 1}">
	           		<input type="submit" id="pagenum" onclick="changePage(${result.member.navStart-1})" value="&lt;"/> 
	           	</c:if>
		        <c:forEach var="page_num" begin="${result.member.navStart}" end="${result.member.navEnd}">	           	
		           	<input type="submit" id="pagenum" onclick="changePage(${page_num})" value="${page_num}"/> 
				</c:forEach>
		        <c:if test="${result.member.navEnd != result.member.totalPageSize}">
		           	<input type="submit" id="pagenum" onclick="changePage(${result.member.navEnd+1})" value="&gt;"/> 
		        </c:if> 
              </div>
            </div>
          </div>

        </div> <!-- Member List 흰색 영역끝 -->

  </div><!--영역끝 지우면 안됨 -->
</div><!-- 영역끝 지우면 안됨-->

<script>                                   
function changePage(pageNo) {	
	console.log("페이지 번호 : ", pageNo);
    var length = $('#paging select option:selected').val().toString(); // pageLength 값을 가져옴
  
	document.querySelector("#pageNo").value = pageNo;
	document.querySelector("#pageLength").value = length;  // pageLength 값을 설정
	document.querySelector("#mForm").submit();
}

// 건수가 선택되면 
$('#paging select').on('change', function(){
  var length = $(this).find('option:selected').val(); // 옵션의 값을 가져와야 합니다.
  console.log("선택된 건수 : ", length);
  
  //그냥 건수설정하면 무조건 첫 페이지로 가게
  var pageNo =1
  // 로컬 스토리지에 저장
  localStorage.setItem('selectedPageLength', length);
  
  document.querySelector("#pageNo").value = pageNo;
  document.querySelector("#pageLength").value = length;  // pageLength 값을 설정
  document.querySelector("#mForm").submit();
});

//페이지 로드 시 로컬 스토리지에 저장된 건수로 설정
document.addEventListener("DOMContentLoaded", function() {
    var selectedPageLength = localStorage.getItem('selectedPageLength');
    if (selectedPageLength) {
    	 $('#paging select option').each(function() {
             if ($(this).val() === selectedPageLength) {
                 $(this).prop('selected', true);
             }
         });
    }
});
</script>
</body>
</html>