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
    <link rel="stylesheet" href="/styles/noticeWrite.css"/>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<div class="memberlist-Bwn">
  <div class="allgroup-Lpg">
    <!-- 초록색 배경 -->
    <div class="greenbackground-sZi">
    </div>
      <!-- 메뉴바 -->
   	  <tiles:insertDefinition name="menuBar" /> 

        <!-- Notice List 흰색 영역 -->
        <div class="whitearea-Nnc  tap_content" id="tab3">
          <p class="member-list-VMS">Notice List</p>
          <!-- 테이블 -->
          <div id="table">
            <table >
                <tr id = "table_title_bar">
                  <td><input type="checkbox" id="Allcheck" ></td>
                  <th>번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>등록날짜</th>
                  <th>고정여부</th>
                  <th>삭제여부</th>
                  </tr>
                  <c:forEach items="${result.list}" var="notice">
                  <tr id = "table_contents">
                  	<td><input type="checkbox" class="checkbox" value="${notice.notice_no}" ></td>
                    <td class="notice_no">${notice.notice_no}</td>
                    <td class="title">${notice.title}</td>
                    <td >${notice.nickname}</td>
                    <td>${notice.reg_date}</td>
                    <td class="fixed_yn" >${notice.fixed_yn}</td>
                    <td >${notice.deleted_yn}</td>
                  </tr>
                </c:forEach>                        
            </table>
              <form name="detail_form" id="detail_form" action="<c:url value='/admin/detail_notice'/>" method="post" >
		     	<input type="hidden" id="notice_no" name="notice_no" /> 
		      </form>
          </div> <!-- 테이블 -->

          <!-- 버튼이랑 페이징 함께-->
          <div id = "white_footer_area">
            <!-- 버튼 -->
            <div id = "crud_buttons">
            <input type="button"  id ="insert_button" value="글쓰기"/>
            <input type="button"  id ="delete_button" value="삭제"/>
            <input type="button" id ="fix_button" value="고정"/>
            <input type="button" id ="none_fix_button" value="고정해제"/>
            </div>

            <!-- 페이징부분 -->
            <div id ="paging">
              <form name="mForm" id="mForm" action="<c:url value='/admin/noticelist'/>" method="post" >
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
				<c:if test="${result.notice.navStart != 1}">
	           		<input type="submit" id="pagenum" onclick="changePage(${result.notice.navStart-1})" value="&lt;"/> 
	           	</c:if>
		        <c:forEach var="page_num" begin="${result.notice.navStart}" end="${result.notice.navEnd}">	           	
		           	<input type="submit" id="pagenum" onclick="changePage(${page_num})" value="${page_num}"/> 
				</c:forEach>
		        <c:if test="${result.notice.navEnd != result.notice.totalPageSize}">
		           	<input type="submit" id="pagenum" onclick="changePage(${result.notice.navEnd+1})" value="&gt;"/> 
		        </c:if> 
              </div>
            </div>
          </div>

        </div> <!-- Notice List 흰색 영역끝 -->

  </div><!--영역끝 지우면 안됨 -->
</div><!-- 영역끝 지우면 안됨-->



 <!-- Notice 게시글 추가 다이얼로그-->
  
 <div id="insert_notice" >
  <form id="inser_form" >
	<div class="item--zec" >
	  <h2>공지사항 추가</h2>	
	  <div class="auto-group-jktr-5SQ">
	    <input id="insert_title" type="text"  name="title" placeholder="공지사항 제목"/>
	  </div>
	  <div class="auto-group-mwc8-wp4">
	    <div class="item-3-3--47z">
	      <textarea type="text"  id="insert_contents" name="contents" style="margin: 0px;width: 708px;height: 360px;resize: none;" placeholder="공지사항 내용"></textarea>
	    </div>
	  </div>
	  
	  <div id="attachefile_div">
	  	<div class="button-89n" id="add_file">+</div>
	  	<div class="attachefile" id="attachefile" ><!--- 파일선택 input태그가 들어가는 div  --></div>
	  </div>	  
  	  <div class="auto-group-fkmn-YCG">
	    <div class="button-em6" id="insert">등록하기</div>
	    <div class="button-hDa" id="insert_out">취소하기</div>
	  </div>
	</div>
   </form>
 </div>
 
 
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

// 전체선택 이벤트
$("#Allcheck").on("click", function(){
    // If "Allcheck" is checked, check all checkboxes in the table, else uncheck them
    if($(this).prop("checked")){
      $(".checkbox").prop("checked", true);
    } else {
      $(".checkbox").prop("checked", false);
    }
  });
  
// 체크박스 클릭시 고정, 고정해제 버튼 출력
$(".checkbox").on("click", function(){
	const deleteButton = $("#delete_button");
	const fixButton = $("#fix_button");
	const noneFixButton = $("#none_fix_button");
	
	const checkedRows = $(".checkbox:checked")
	
	  let hasFixed = false;
	  let hasNoneFixed = false;
	  
	  checkedRows.each(function() {
		   const fixedYN = $(this).closest("tr").find(".fixed_yn").text();
		   if (fixedYN === "Y") {
			      hasFixed = true;
			    } else if (fixedYN === "N") {
			      hasNoneFixed = true;
			    }
		});
	  
	  
		// '고정' 버튼과 '고정해제' 버튼 활성화 여부 결정
		if (hasFixed && !hasNoneFixed) {
			noneFixButton.show(); // '고정해제' 버튼 활성화
			fixButton.hide(); // '고정' 버튼 비활성화
		} else if (!hasFixed && hasNoneFixed) {
			noneFixButton.hide(); // '고정해제' 버튼 비활성화
			fixButton.show(); // '고정' 버튼 활성화
		} else {
			noneFixButton.hide(); // 둘 다 비활성화
			fixButton.hide();
		}
});


// 삭제 버튼 클릭시 삭제
$('#delete_button').on('click', function() {
    const ids = [];
    const items = $('.checkbox:checked');
    
    items.each(function(index, item) {
        ids.push(item.value);
    });
    
    const param = {
        ids: ids
    };
    
    fetch("<c:url value='/del/notice'/>", {
        method: "POST",
        headers: {
            "Content-Type": "application/json; charset=UTF-8",
        },
        body: JSON.stringify(param),
    })
    .then((response) => response.json())
    .then((json) => {
        console.log(json.status);
        console.log(json);
        if (json.status) {
            alert(json.message);
            location.href = "<c:url value='/admin/noticelist'/>";
        }
    });
});

//제목클릭시 상세페이지로 이동
$(".title").on("click", function () {
    const notice_no = $(this).closest("tr").find(".notice_no").text();

    // Rest of your code
    document.querySelector("#detail_form #notice_no").value = notice_no;
    document.querySelector("#detail_form").submit();
});


//고정버튼 클릭시 공지사항 고정
$('#fix_button').on('click', function() {
    alert("고정버튼 클릭");
    const ids = [];
    const items = $('.checkbox:checked');
    
    items.each(function(index, item) {
        ids.push(item.value);
    });
    
    const param = {
        ids: ids
    };
    
    fetch("<c:url value='/fix/notice'/>", {
        method: "POST",
        headers: {
            "Content-Type": "application/json; charset=UTF-8",
        },
        body: JSON.stringify(param),
    })
    .then((response) => response.json())
    .then((json) => {
        console.log(json.status);
        console.log(json);
        if (json.status) {
            alert(json.message);
            location.href = "<c:url value='/admin/noticelist'/>";
        }
    });
});


//고정해제버튼 클릭시 공지사항 고정해제
$('#none_fix_button').on('click', function() {
    const ids = [];
    const items = $('.checkbox:checked');
    
    items.each(function(index, item) {
        ids.push(item.value);
    });
    
    const param = {
        ids: ids
    };
    
    fetch("<c:url value='/nonefix/notice'/>", {
        method: "POST",
        headers: {
            "Content-Type": "application/json; charset=UTF-8",
        },
        body: JSON.stringify(param),
    })
    .then((response) => response.json())
    .then((json) => {
        console.log(json.status);
        console.log(json);
        if (json.status) {
            alert(json.message);
            location.href = "<c:url value='/admin/noticelist'/>";
        }
    });
});

$(document).ready(function() {
	  $('.fixed_yn').each(function() {
	    const fixedYN = $(this).text();
	    if (fixedYN === "Y") {
	      // fixed_yn이 'Y'인 경우 배경색을 초록색으로 변경
	      $(this).closest("tr").css('background-color', '#fffcc6');
	    } else {
	      // fixed_yn이 'Y'가 아닌 경우 배경색을 원래대로 돌리기
	      $(this).closest("tr").css('background-color', '');
	    }
	  });
	});
	
//더하기 버튼 클릭시 파일 선택 추가
var cnt=1;
$("#add_file").on('click', function(){
	$("#attachefile").append("<input type='file' name='file"+cnt+"'/>");
	cnt++;
});

//공지사항 글쓰기 다이얼로그
$("#insert_notice").dialog({
    autoOpen: false,
    modal: true,
    width: 1000,
    height: 900,
    close: function() {
    }
});

//글쓰기 버튼 클릭시 다이얼로그 열기
$("#insert_button").on('click', function(){
	$("#insert_notice").dialog("open")
});

//취소하기 클릭시 다이얼로그 닫기
$("#insert_out").on('click', function(){
	$("#insert_notice").dialog("close")
});

//등록하기 클릭시 등록
$("#insert").on('click', function(){
    var form = $('#inser_form')[0];
    var formData = new FormData(form);
	

    // AJAX로 서버에 데이터 전송
    $.ajax({
        url: "<c:url value='/notice/insert.do'/>",
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function (data) {
            // 성공적으로 등록되었을 때의 처리
        	alert(data.message);
        	$("#insert_notice").dialog("close");
        	location.href = "<c:url value='/admin/noticelist'/>";

        },
        error: function (error) {
            // 등록 실패 시의 처리
            console.error("에러 발생: ", error);
            alert("파일 등록에 실패했습니다.");
        }
    });
});


</script>
</body>
</html>