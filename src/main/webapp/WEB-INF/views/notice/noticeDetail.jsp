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
  <title>공지사항 상세보기</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins%3A300"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A100%2C300%2C400%2C500"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto%3A400%2C500"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter%3A100%2C300"/>
  <link rel="stylesheet" href="/styles/noticeDetail.css"/>
   <link rel="stylesheet" href="/styles/noticeRevise.css"/>
</head>
<body>
<div class="item--mGL">

  <div class="auto-group-toqk-R9r">
    <div class="button-8a4">
      <img class="vector-36-stroke-Ed6" src="/assets/vector-36-stroke.png"/>
      <a href="<c:url value='/admin/noticelist'/>" class="text-label-MSp">목록으로</a>
    </div>
    <input type="button" class="group-5-qsn" id="update_button" value="수정"/>
    <input type="button"  class="group-6-igg"  id="delete_button" value="삭제"/>
  </div>
  <div class="auto-group-fekx-BKN">
  	<input type="hidden" id="notice_no" value="${notice.notice_no}"/>
    <p class="item--shz" id="title">${notice.title}</p>
    <p class="item--jEQ">작성자 : 관리자</p>
  </div>
  <div class="group-20-ok4">
    <p class="item--v3z" id="contents" >${notice.contents} </p>
    <img class="location-3np" src="REPLACE_IMAGE:27:1294"/>
  </div>
  <!-- 첨부파일이 들어갈 곳 -->
  <div class="frame-45-NKJ">
    <!-- 한줄 시작 -->
    <div class="component-9-5zQ">

        <c:if test="${attache_bool}">
         <c:forEach items="${filelist}" var="file">
           <div class="auto-group-awon-EcQ">
	        <div class="rectangle-169-msE">
	         <img class="attach-uiY" src="/assets/attach.png"/>
	          <a class="jdk-11020windows-x64binexe-eAL file_name" href="/download/file/${file.file_no}">${file.file_name_org}</a>
	        </div> 
	       </div>  
		 </c:forEach> 
		</c:if>
      <img class="vector-50-uMA" src="REPLACE_IMAGE:I27:1279;74:488"/>
    </div>
    <!-- 한줄 끝 -->
  </div>
</div>


    <!-- 게시판 수정하기 다이얼로그 -->
	<div class="item--ijS" id="update_dialog">
	 <div id="list_button_div">
		  <div class="button-yKv">
		    <img class="vector-36-stroke-Tkt" src="/assets/vector-36-stroke.png"/>
		    <div class="text-label-yjE">목록으로</div>
		  </div>
	  </div>
	  <div id="first_title">
		  <div class="auto-group-qbrz-SQY">
		    <input type="text" class="item--vqW" id="update_title" placeholder="${notice.title}"></input>
		    <p class="item--eFi"><span> 작성자 : </span> <span id="name">관리자</span></p>
		  </div>
	  </div>
	  	<div class="auto-group-wrhe-gde">
	       <input type="text" id="update_contents" placeholder="${notice.contents}"></input>
	    </div>
	  <div class="auto-group-z3cc-j2G">
	    <input type="button" class="button-euv" id="real_update_btn" value="수정" />
	    <input type="button" class="button-7Yc" id="update_out" value="나가기" />
	  </div>
   </div>

<script>
//삭제 버튼 클릭시 삭제
$('#delete_button').on('click', function() {
    const ids = [];
    ids.push($('#notice_no').val());
    
  
    const param = {
        ids: ids
    };
    
    alert("param : "+param);
    console.log("ids : "+ param)
    
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

//공지사항 수정 다이얼로그
$("#update_dialog").dialog({
    autoOpen: false,
    modal: true,
    width: 1000,
    height: 900,
    close: function() {
    }
});

//공지사항 수정 다이얼로그 열기									
$("#update_button").on("click", function () {
	$("#update_dialog").dialog("open");
});

//공지사항 수정 다이얼로그에서 나가기 버튼 클릭시 다이얼로그 닫기
$("#update_out").on("click", function () {
	$("#update_dialog").dialog("close");
});


//공지사항 수정 다이얼로그에서 수정버튼 클릭시 수정되게
$("#real_update_btn").on("click", function () {
  const notice_no =$('#notice_no').val()
  const update_title = $('#update_title').val();
  const update_contents = $('#update_contents').val();
  
  // 입력값이 null인지 또는 빈 문자열인지 확인
	 if (update_title === null || update_title.trim() === '') {
	  // update_title이 null이거나 빈 문자열이면 placeholder 값으로 설정
	  $('#update_title').val($('#update_title').prop('placeholder'));
	}
	
	if (update_contents === null || update_contents.trim() === '') {
	  // update_contents가 null이거나 빈 문자열이면 placeholder 값으로 설정
	  $('#update_contents').val($('#update_contents').prop('placeholder'));
	}
  
  alert("제목 : "+update_title);
  alert("내용 : "+update_contents); 
  
  
  const param = {
		  	notice_no: notice_no,
	        title: update_title,
	        contents: update_contents
	    };
	    
  fetch("<c:url value='/update/notice'/>", {
	        method: "POST",
	        headers: {
	            "Content-Type": "application/json; charset=UTF-8",
	        },
	        body: JSON.stringify(param),
	    })
	    .then((response) => response.json())
	    .then((json) => {
	    	//수정되면 다이얼로그 닫고
	    	$("#update_dialog").dialog("close");
	    	//제목이랑 내용에 붙여넣기	    	
	    	$('#title').text(json.update_notice.title);
	    	$('#contents').text(json.update_notice.contents);

	    });
});



</script>
</body>