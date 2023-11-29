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
    
        <!-- Board List 흰색 영역 -->
        <div class="whitearea-Nnc  tap_content defaultarea" id="tab2">
          <p class="member-list-VMS">Board List</p>
          <div id="search" >
           <select id="search_kind">
		    <option selected value="title">제목</option>
		    <option value="talent">재능</option>
		    <option value="city">위치</option>
		    <option value="status">상태</option>
		   </select>
           <input type="text" id="search_box"/><span id="search_button"> 검색 </span></div>
          <!-- 테이블 -->
          <div id="table">
            <table >
                <tr id = "table_title_bar">
                  <th>선택</th>
                  <th>번호</th>
                  <th>제목</th>
                  <th>기부재능</th>
                  <th>받는재능</th>
                  <th>작성자</th>
                  <th>위치(시)</th>
                  <th>위치(구)</th> 
                  <th>조회수</th>
                  <th>등록일</th>
                  <th>진행상태</th>
                  </tr>
                  <c:forEach items="${result.list}" var="board">
                  <tr id = "table_contents">
                  	<td><input type="checkbox" class="checkbox" value="${board.board_id}" ></td>
                    <td>${board.board_id}</td>
                    <td class="table_title">${board.title}</td>
                    <td>${board.givetalent}</td>
                    <td>${board.receivetalent}</td>
                    <td >${board.writer_nickname}</td>
                    <td >${board.cityname}</td>
                    <td >${board.districtname}</td>
                    <td >${board.read_count}</td>
                    <td>${board.register_date}</td>
                    <td >${board.status}</td>
                  </tr>
                </c:forEach>                        
            </table>
          </div> <!-- 테이블 -->

          <!-- 버튼이랑 페이징 함께-->
          <div id = "white_footer_area">
            <!-- 버튼 -->
            <div id = "crud_buttons">
            <input type="button" id ="button-bQU" value="삭제"/>
            </div>

            <!-- 페이징부분 -->
            <div id ="paging">
              <form name="mForm" id="mForm" action="<c:url value='/admin/boardlist'/>" method="post" >
		     	<input type="hidden" id="pageNo" name="pageNo" />  
		     	<input type="hidden" id="pageLength" name="pageLength" />
		     	<input type="hidden" id="searchWord" name="searchWord" />
 		     	<input type="hidden" id="kind_of_search" name="search_kind" /> 
		      </form>
              <div id = "Change number">
               <span>건수 : </span>  
              <select id="button-bQU">
				    <option selected value="12">12</option>
				    <option value="24">24</option>
				    <option value="36">36</option>
			  </select>
              </div>
              
              <div class="group-299-zDe" id="page_switch_buttons">
				<c:if test="${result.board.navStart != 1}">
	           		<input type="submit" id="pagenum" onclick="changePage(${result.board.navStart-1})" value="&lt;"/> 
	           	</c:if>
		        <c:forEach var="page_num" begin="${result.board.navStart}" end="${result.board.navEnd}">	           	
		           	<input type="submit" id="pagenum" onclick="changePage(${page_num})" value="${page_num}"/> 
				</c:forEach>
		        <c:if test="${result.board.navEnd != result.board.totalPageSize}">
		           	<input type="submit" id="pagenum" onclick="changePage(${result.board.navEnd+1})" value="&gt;"/> 
		        </c:if> 
              </div>
            </div>
          </div>
        </div> <!-- Board List 흰색 영역끝 -->

  </div><!--영역끝 지우면 안됨 -->
</div><!-- 영역끝 지우면 안됨-->

<script>                                   
function changePage(pageNo) {	
    var length = $('#paging select option:selected').val().toString(); // pageLength 값을 가져옴
    var searchword = localStorage.getItem('searchword');
    var search_kind = localStorage.getItem('search_kind');
    
	document.querySelector("#pageNo").value = pageNo; //페이지번호
	document.querySelector("#pageLength").value = length;  // pageLength 값을 설정
	document.querySelector("#searchWord").value = searchword; // 검색값
	document.querySelector("#kind_of_search").value = search_kind; // 검색종류
	document.querySelector("#mForm").submit(); //폼전송
}

//검색 버튼을 다시 한번 클릭하면 알아서 초기화됨
$("#search_button").on("click", function() {
		var searchword = $("#search_box").val();
		// 로컬 스토리지에 저장
		localStorage.setItem('searchword', searchword);
		
		//검색 종류 값 찾기
		var search_kind = $("#search_kind").find('option:selected').val();
		localStorage.setItem('search_kind', search_kind);
    
    var pageNo = 1;
    changePage(pageNo);
});


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