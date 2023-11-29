<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()"> <!-- 인증이 됐는지안됐는지 확인하는 구문 -->
   <sec:authentication property="principal" var="principal"/> <!-- property로 가져와서 var 데이터타입으로 대입하겠다는뜻 -->
</sec:authorize>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js" ></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.2.0/stomp.min.js"></script>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
   <style>
   /* 일반 로그인과 카카오 로그인 구분 div태그 css */ 
      .or-divider {
            display: flex;
            align-items: center;
            text-align: center;
            color: #999;
        }

        .divider-line {
            flex-grow: 1;
            border: 1.3px solid #ccc;
        }
        
      /* 활성화된 탭의 글자를 bold 처리 */
    .nav-link.active {
      font-weight: bold;
    }
    /* 비활성 탭의 글자 색을 검정색으로 변경 */
    .nav-link:not(.active) {
      color: black;
    }
	    
	 .modal-body{
	   background-color: #f9f9f9; /* 배경색 설정 */
	 } 
	    
	 /* 헤더 채팅알람창 CSS */
     .alarm {
	    margin-bottom: 10px; /* 알람 아이템 간 간격 조절 */
	    padding: 10px; /* 내부 여백 설정 */
	    border: 1px solid #ccc; /* 테두리 설정 */
	    border-radius: 5px; /* 테두리 둥글게 설정 */
	    background-color: white; /* 배경색 설정 */
	        overflow: hidden; /* 부모 요소의 자식 요소를 감출 때 사용 (float을 사용할 때 필요) */
 		 }

	  .alarm p {
	    margin: 0; /* 문단의 기본 마진 제거 */
	  }
  
	.alarm-id {
	    display: none; /* alarm-id 숨김 */
	}
	
	.alarm .date {
	    float: right;
	}
	
	.alarm .contents {
	    clear: both;
	}
	
	.alarm .deleteAlarm {
    float: right;
    background-color: gray; /* 삭제 버튼 배경색 */
    color: #fff; /* 삭제 버튼 글자색 */
    border: none; /* 테두리 제거 */
    padding: 2px 6px; /* 내부 여백 설정 */
    cursor: pointer; /* 커서를 손가락 형태로 변경 */
    border-radius: 4px; /* 테두리 둥글게 설정 */
}

.alarm:hover {
  background-color: #f0f0f0; /* 예시: 배경색 변경 */
  cursor: pointer; /* 예시: 커서 모양 변경 */

}

.alarm .deleteAlarm:hover {
    background-color: #c82333; /* 마우스 오버 시 배경색 변경 */
}

#modal-btn-footer{
    background-color: gray; /* 삭제 버튼 배경색 */
 color: #fff; /* 삭제 버튼 글자색 */
    border: none; /* 테두리 제거 */
    padding: 5px 7px; /* 내부 여백 설정 */
    cursor: pointer; /* 커서를 손가락 형태로 변경 */
    border-radius: 4px; /* 테두리 둥글게 설정 */
    
}

 #modal-btn-footer:hover {
    background-color: #c82333; /* 마우스 오버 시 배경색 변경 */
}

/* 헤더알람 채팅방 a태그 적용시 생기는 밑줄과 글자색제거 css */
.alarmChatAnchor{
	text-decoration: none; /* 밑줄 제거 */
	color: inherit; /* 부모 엘리먼트의 색상 상속 */
	   	       	  }
	   	       	  
.alarmChatAnchor:hover {
	text-decoration: none; /* 밑줄 제거 */
	color: inherit; /* 부모 엘리먼트의 색상 상속 */
} 	       	  
  </style>
  
</head>
<body>
<!-- 알람 모달창 -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
    <div class="modal-content">

      <div class="modal-header">
          <!-- 탭 메뉴 -->
          <ul class="nav nav-tabs" id="myTabs">
            <li class="nav-item">
              <a class="nav-link active" id="chat-tab" data-bs-toggle="tab" href="#chat">채팅</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="progress-tab" data-bs-toggle="tab" href="#progress">진행상황</a>
            </li>
          </ul>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
        <!-- 탭 내용 -->
        <div class="tab-content mt-2">
          <!-- 채팅 탭 내용 -->
          <div class="tab-pane fade show active" id="chat">
          </div>

          <!-- 진행상황 탭 내용 -->
          <div class="tab-pane fade" id="progress">
          </div>
        </div>
      </div>

      <div class="modal-footer">
        <button type="button" id="modal-btn-footer" >전체삭제</button>        
      </div>
    </div>
  </div>
</div>


  <div id="container">   
  	<c:choose> 
  		<c:when test="${empty principal}">
  		
		    <header>
		     <div id="header">
		      <a href='<c:url value="/"/>'><img id="logo" src="/assets/logo.png" alt="" ></a>
		      <nav id="menubar">
		        <ul id="topMenu">
		          <li><a href="#">join </a></li>
		          <li><a id="loginForm" href="javascript:void(0)">login </a></li>
		          <li><a href="#">notice</a></li>
		          <li><a href='<c:url value="/board/list"/>'>lesson</a></li>
		        </ul>
		      </nav>
		    </header>
	    </c:when>
	    <c:otherwise>
	    </div>
	    	<header>
		      <a href='<c:url value="/"/>'><img id="logo" src="/assets/logo.png" alt="" ></a>
		      <nav id="menubar">
		        <ul id="topMenu">
		          <li><a href="/logout.do">logout </a></li>
		          <li><a href="#">notice</a></li>
		          <li><a href='<c:url value="/board/list"/>'>lesson</a></li>
		          <li><a href="/myPage/userInfo">mypage</a></li>
      		      <li class="position-relative" style="width: 48px; height: 48px;">
   		  	  		<img id="bell" src="/assets/bell3(3).png" alt="" data-bs-target="#staticBackdrop" >
   		  	  		<!-- 헤더 알림테이블의 NEW 배지 -->
   		  	  		<!-- 데이터가 존재하는 경우에만 New 스팬을 화면에 표시 -->
                    <c:if test="${isAlarmDataExists}">
                        <span id="bellBadge" class="position-absolute top-0 start-100 badge bg-danger" style="transform: translate(-50%, +40%) !important;">New</span>
                    </c:if>
                    <c:if test="${!isAlarmDataExists}">
                        <span id="bellBadge" class="position-absolute top-0 start-100 badge bg-danger" style="transform: translate(-50%, +40%) !important; display: none;">New</span>
                    </c:if>
      		  	  </li>
		        </ul>
		      </nav>
		    </header>
	    </c:otherwise>
  	</c:choose>
  </div>

   <div id="LoginDialog" style="display:none;">
     <form class="login-form" id="loginFormTag" method="post" action="<c:url value='/auth/login.do'/>" >
       <h4 class="mb-3"><b>로그인</b></h4>
       <div class="form-group">
         <label for="nickname">닉네임</label>
         <input type="text" name = "username" class="form-control" id="nickname" placeholder="" required>
         <div class="invalid-feedback">
           닉네임을 입력해주세요.
         </div>
       </div>
   
       <div class="form-group">
         <label for="password">비밀번호</label>
         <input type="password" name ="password" class="form-control" id="password" placeholder="" required>
         <div class="invalid-feedback">
           비밀번호를 입력해주세요.
         </div>
       </div>
   
       <button class="btn btn-secondary btn-lg btn-block"  type="submit">로그인</button>
       
       <div class="or-divider">
         <div class="divider-line"></div>
         <div>or</div>
         <div class="divider-line"></div>
       </div>
    
       <a href="https://kauth.kakao.com/oauth/authorize?client_id=5837fcd202ac37e5ba6e78d6f6b575ed&redirect_uri=http://127.0.0.1:8090/auth/kakao/callback&response_type=code"><img id="kakaoLogin" src="/assets/kakao_login_medium_wide.png"  style="width: 460px; height: 45px;"/></a>
     </form>
   </div>
   
<script>
	/* 로그인 다이얼로그 창 띄우는 jquery */
	var loginDialog = $( "#LoginDialog" ).dialog({
	 autoOpen: false,
	 height: 500,
	 width: 500,
	 modal: true,
	 close: function() {
		 
	 }
	});
	
	/* 로그인 다이얼로그 이벤트핸들러*/
	$("#loginForm").on("click", function() {
		loginDialog.dialog("open");
	});

	//웹소켓 연결
	var sock = new SockJS("/ws-stomp");
	var ws = Stomp.over(sock);
	var subscription = null;
	const sender = "${principal.user.nickName}";
	var flag = 0;
	
	if(sender != ""){
		ws.connect({},function(frame){
			subscription = ws.subscribe("/sub/member/userId/"+sender
					,message => {//구독한곳에서 메시지가 오면
						const recv = JSON.parse(message.body);//메시지 파싱
						chatRecvMessage(recv);
					}, {sender:sender});//보내는 사람을 등록할필요가 있나?
		},error => {
			alert("error "+error);
		});
	}

	function chatRecvMessage(recv) {
		console.log(recv)
		
			
		if (recv.type_string==="ALARM") {
			alert("ALARM");
			alert(recv.contents, recv.receiver)
			if(flag === 0){
				var bellBadgeElement = document.getElementById("bellBadge");
				bellBadgeElement.style.display = "block";
				
			}
			
			
			
			
			
			
			
			
			
			
			if (recv.alarm_code == "A01") {
				alert('A01')
				//채팅방의 안읽음 표시 올리기
				var selectedElement = $('.chat-metadata.room-'+recv.room_id);
				var deletedElement =$('.unread-messages.count-'+recv.room_id);
				console.log("deletedElement => ",deletedElement)
				deletedElement.remove();
				
				countInfo = `<div class="unread-messages count-`+ recv.room_id +`">`+ recv.receiver_count +`</div>`;
				
				selectedElement.append(countInfo);
				
				//채팅방 알림 교체
				//채팅방에 대한 알람 찾기
				 var selectedElement = $('input.room-id-'+recv.room_id);
				console.log("selectedElement - > ",selectedElement);
				
				if(selectedElement.length !== 0){
					//채팅방에 대한 알람 교체
					selectedElement.closest('.alarm').find('.contents').text(decodeURIComponent(recv.contents))
					
					//채팅방 교체 시간
					selectedElement.closest('.alarm').find('.date').text(recv.printDate)
					
				}
				else if (selectedElement.length === 0){
					//채팅방이 존재하지 않을시에는 새롭게 추가
					alert("채팅방ㅅ ㅐ로 생성")
				const commentListHTML = document.querySelector("#chat");
					const alarmItem = document.createElement("div");
		   	          alarmItem.className = "alarm";
		
		   	       	  // <a> 태그 생성
		   	          const anchorTag = document.createElement("a");
		   	       	  anchorTag.className = "alarmChatAnchor";
		   	          // 경로를 하드코딩하는 대신, 동적으로 경로를 생성하는 방법
		   	          const url = "/myPage/chatRoom"; // 원하는 경로로 수정
		   	          anchorTag.href = url;
		   	        
		   	          alarmItem.innerHTML = 
		   	              "<input type='hidden' value='" + recv.alarm_id + "' class='alarm-id'>"  +
		   	              "<input type='hidden' class='room-id-"+ recv.room_id +"'>"  +
		   	          	  "<span><strong>" + recv.room_name + "</strong></span>" +
		   	          	  "<span class='date'>" + recv.printDate + "</span>" +
		   	              "<br><br>" +
		   	          	  "<span class='contents'>" + decodeURIComponent(recv.contents) + "</span>" +
		   	          	  "<br>" +
		   	          	  "<button class='deleteAlarm' type='button' data-alarm-id='" + recv.alarm_id + "'>삭제</button>";


		   	        // <a> 태그 안에 <div> 태그를 추가
		   	        anchorTag.appendChild(alarmItem);

		   	        // 최종적으로 <a> 태그를 #chat에 추가
		   	        commentListHTML.appendChild(anchorTag);
					
					
					
				}
				
			}
			else /* if (recv.alarm_code == "A02") */ {
				//알람이 이제 게시글명과 함께 넘어올꺼임
				//태그를 추가만 해주면됌
				alert("다른 알람들")
				const commentListHTML = document.querySelector("#progress");
			      const alarmItem = document.createElement("div");
	   	          alarmItem.className = "alarm";
	
	   	       	  // <a> 태그 생성
	   	          const anchorTag = document.createElement("a");
	   	       	  anchorTag.className = "alarmChatAnchor";
	   	          // 경로를 하드코딩하는 대신, 동적으로 경로를 생성하는 방법
	   	          const url = "/myPage/course_proceeding"; // 원하는 경로로 수정
	   	          anchorTag.href = url;
	   	        
	   	          alarmItem.innerHTML = 
	   	              "<input type='hidden' value='" + recv.alarm_id + "' class='alarm-id'>"  +
	   	          	  "<span><strong>" + "송신자: " + recv.sender + "</strong></span>" +
	   	          	  "<span class='date'>" + recv.printDate + "</span>" +
	   	              "<br><br>" +
	   	          	  "<span class='title'><strong>" + "제목: " + recv.title + "</strong></span>" +
	   	          	  "<br>" +
	   	          	  "<span class='contents'>" + "진행상황: " + recv.contents + "</span>" +
	   	          	  "<br>" +
	   	          	  "<button class='deleteAlarm' type='button' data-alarm-id='" + recv.alarm_id + "'>삭제</button>";


	   	        // <a> 태그 안에 <div> 태그를 추가
	   	        anchorTag.appendChild(alarmItem);

	   	        // 최종적으로 <a> 태그를 #chat에 추가
	   	        commentListHTML.appendChild(anchorTag);
			}
			
			
		}
		else if (recv.type_string==="TALK") {
			//시간 자르기
			 var timestampString = recv.reg_date;

         // "T" 문자를 기준으로 문자열을 분할하고 두 번째 부분을 선택
         var timePart = timestampString.split("T")[1];

         // 시:분 부분만 선택
         var time = timePart.substring(0, 5);
         alert("TALK");
         var chatListInfo = "";
          if(recv.sender != "${principal.user.nickName}"){
                 chatListInfo+=`<div class="chat ch1">
                                  <div class="textbox">`+decodeURIComponent(recv.message)+`</div>
                                  <div class="sender-time">`+time+`</div>`;
                  if(recv.read_yn=='N'){
                   chatListInfo+=` <div class="sender-readCount">1</div>`;
                     
                  }
                  chatListInfo+=`</div>`;
          }   
          else{
                 chatListInfo += `<div class="chat ch2">
                                  <div class="textbox">`+decodeURIComponent(recv.message)+`</div>
                                  <div class="receiver-time">`+time+`</div>`
                  if(recv.read_yn=='N'){
                   chatListInfo+=` <div class="receiver-readCount">1</div>`;
                     
                  }
                   chatListInfo+=`</div>`;
             
          }
         $('.wrap').append(chatListInfo); 
         var divElement = $(".wrap");
            $(".wrap").scrollTop(divElement[0].scrollHeight);
      }
      else if (recv.type_string==="ENTER") {
         alert("입장");
         $(".receiver-readCount").remove();
      }
      else if (recv.type_string==="LEAVE") {
         alert("퇴장");
//          var chatListInfo = `<span class="badge rounded-pill text-bg-warning">`+decodeURIComponent(recv.message)+`</span>`
//          $("#chatList").append(chatListInfo);
      }
      else if (recv.type_string==="AGREE") {
         alert("수락 요청")
         var agreeInfo = `
            <div class="task-card" draggable="true" ondragstart="drag(event)" id="course-`+ recv.course_id + `" data-courseid="`+ recv.course_id  +`" data-boardid="`+ recv.board_id  +`">
            <div class="card-top">
            <p class="status waiting">`+ recv.status_code +`</p>
            <p class="card-board_id">no. ` + recv.board_id +`</p>
            </div>
            <p class="task-name">` + recv.title + `</p>
            <div class="details">`
            
            if (recv.applyer_nickname == sender) {
               agreeInfo += `   <p class="requester">신청자 : `+ recv.applyer_nickname + `</p>`
               
            }
            else {
               agreeInfo += `<p class="requester">요청자 : `+ recv.applyer_nickname +`</p>`
               
            }
                   

	            agreeInfo +=   ` <p class="date"></p>
				</div>
			</div>`;
			
			$(".tasks.waiting").append(agreeInfo);
			console.log(agreeInfo);
			
		}
		else if (recv.type_string==="AGREE_INVOLVE"){
			alert("수락요청완료")
			//태그삭제
			 var className = "course-"+recv.course_id;
			 var selectedElement = $('[id^="' + className + '"]');
			 selectedElement.remove();
			 
				var agreeInfo = `
					<div class="task-card" draggable="true" ondragstart="drag(event)" id="course-`+ recv.course_id + `" data-courseid="`+ recv.course_id  +`" data-boardid="`+ recv.board_id  +`">
					<div class="card-top">
					<p class="status accept">`+ recv.status_code +`</p>
					<p class="card-board_id">no. ` + recv.board_id +`</p>
					</div>
					<p class="task-name">` + recv.title + `</p>
					<div class="details">`
					
					if (recv.applyer_nickname == sender) {
						agreeInfo += `	<p class="requester">신청자 : `+ recv.applyer_nickname + `</p>`
						
					}
					else {
						agreeInfo += `<p class="requester">요청자 : `+ recv.applyer_nickname +`</p>`
						
					}
	                   
		            agreeInfo +=   ` <p class="date">`+ recv.start_date+`</p>
					</div>
				</div>`;
			 
				// 태그 추가
			 $(".tasks.accept").append(agreeInfo);
		}
		else if (recv.type_string==="COMPLETE_AGREE"){
			alert("완료 요청 보냄")
			
			 var className = "course-"+recv.course_id;
			console.log(className);
			 var selectedElement = $('[id^="' + className + '"]');
			 console.log(selectedElement)
			 selectedElement.remove();
			 
				var agreeInfo = `
					<div class="task-card" draggable="true" ondragstart="drag(event)" id="course-`+ recv.course_id + `" data-courseid="`+ recv.course_id  +`" data-boardid="`+ recv.board_id  +`">
					<div class="card-top">
					<p class="status completed-waiting">`+ recv.status_code +`</p>
					<p class="card-board_id">no. ` + recv.board_id +`</p>
					</div>
					<p class="task-name">` + recv.title + `</p>
					<div class="details">`
					
					if (recv.applyer_nickname == sender) {
						agreeInfo += `	<p class="requester">신청자 : `+ recv.applyer_nickname + `</p>`
						
					}
					else {
						agreeInfo += `<p class="requester">요청자 : `+ recv.applyer_nickname +`</p>`
						
					}
	                   
		            agreeInfo +=   ` <p class="date">`+ recv.start_date +`</p>
					</div>
				</div>`;
				
				
				// 태그 추가
		    $(".tasks.completed-waiting").append(agreeInfo);
	          const rejectBucket = $(".kanban-board .bucket.reject .tasks");
	          const taskCard2 = $(".kanban-board .bucket.reject .tasks .task-card[data-boardid='" + recv.board_id + "']");
	          taskCard2.remove();
		}
		else if (recv.type_string==="COMPLETE_INVOLVE"){
			alert("완료요청 성공")
			
			 var className = "course-"+recv.course_id;
			 var selectedElement = $('[id^="' + className + '"]');
			 selectedElement.remove();
			 
				var agreeInfo = `
					<div class="task-card" draggable="true" ondragstart="drag(event)" id="course-`+ recv.course_id + `" data-courseid="`+ recv.course_id  +`" data-boardid="`+ recv.board_id  +`">
					<div class="card-top">
					<p class="status completed">`+ recv.status_code +`</p>
					<p class="card-board_id">no. ` + recv.board_id +`</p>
					</div>
					<p class="task-name">` + recv.title + `</p>
					<div class="details">`
					
					if (recv.applyer_nickname == sender) {
						agreeInfo += `	<p class="requester">신청자 : `+ recv.applyer_nickname + `</p>`
						
					}
					else {
						agreeInfo += `<p class="requester">요청자 : `+ recv.applyer_nickname +`</p>`
						
					}
	                   
		            agreeInfo +=   ` <p class="date">`+ recv.start_date+`</p>
					</div>
				</div>`;
				
				
				// 태그 추가
		    $(".tasks.completed").append(agreeInfo);
		}
		else if(recv.type_string==="RETURN_WAITING"){
			var className = "course-"+recv.course_id;
			 var selectedElement = $('[id^="' + className + '"]');
			 selectedElement.remove();
			 
			 var agreeInfo = `
					<div class="task-card" draggable="true" ondragstart="drag(event)" id="course-`+ recv.course_id + `" data-courseid="`+ recv.course_id  +`" data-boardid="`+ recv.board_id  +`">
					<div class="card-top">
					<p class="status accept">`+ recv.status_code +`</p>
					<p class="card-board_id">no. ` + recv.board_id +`</p>
					</div>
					<p class="task-name">` + recv.title + `</p>
					<div class="details">`
					
					if (recv.applyer_nickname == sender) {
						agreeInfo += `	<p class="requester">신청자 : `+ recv.applyer_nickname + `</p>`
						
					}
					else {
						agreeInfo += `<p class="requester">요청자 : `+ recv.applyer_nickname +`</p>`
						
					}
	                   
		            agreeInfo +=   ` <p class="date">`+ recv.start_date+`</p>
					</div>
				</div>`;
			 
				// 태그 추가
			 $(".tasks.accept").append(agreeInfo);
		}
		
		
	}
	

	   //알람 로딩 함수
	    function loadAlarms(listAlarm) {
	    
	   	     const commentListHTML = document.querySelector("#chat");
	
	   	 	 listAlarm.forEach(alarm => {
	   	          console.log("알람 데이터:", alarm); // 알람 데이터 확인
	   	          const alarmItem = document.createElement("div");
	   	          alarmItem.className = "alarm";
	
	   	       	  // <a> 태그 생성
	   	          const anchorTag = document.createElement("a");
	   	       	  anchorTag.className = "alarmChatAnchor";
	   	          // 경로를 하드코딩하는 대신, 동적으로 경로를 생성하는 방법
	   	          const url = "/myPage/chatRoom"; // 원하는 경로로 수정
	   	          anchorTag.href = url;
	   	        
	   	          alarmItem.innerHTML = 
	   	              "<input type='hidden' value='" + alarm.alarm_id + "' class='alarm-id'>"  +
	   	              "<input type='hidden' class='room-id-"+ alarm.room_id +"'>"  +
	   	          	  "<span><strong>" + alarm.room_name + "</strong></span>" +
	   	          	  "<span class='date'>" + alarm.printDate + "</span>" +
	   	              "<br><br>" +
	   	          	  "<span class='contents'>" + decodeURIComponent(alarm.contents) + "</span>" +
	   	          	  "<br>" +
	   	          	  "<button class='deleteAlarm' type='button' data-alarm-id='" + alarm.alarm_id + "'>삭제</button>";


	   	        // <a> 태그 안에 <div> 태그를 추가
	   	        anchorTag.appendChild(alarmItem);

	   	        // 최종적으로 <a> 태그를 #chat에 추가
	   	        commentListHTML.appendChild(anchorTag);
	   	      });
		}
	   
	    //진행상황 로딩 함수
	    function loadProgress(listAlarm) {
	    	 const commentListHTML = document.querySelector("#progress");
	    		
	    	 listAlarm.forEach(alarm => {
	   	          console.log("알람 데이터:", alarm); // 알람 데이터 확인
	   	          const alarmItem = document.createElement("div");
	   	          alarmItem.className = "alarm";
	
	   	       	  // <a> 태그 생성
	   	          const anchorTag = document.createElement("a");
	   	       	  anchorTag.className = "alarmChatAnchor";
	   	          // 경로를 하드코딩하는 대신, 동적으로 경로를 생성하는 방법
	   	          const url = "/myPage/course_proceeding"; // 원하는 경로로 수정
	   	          anchorTag.href = url;
	   	        
	   	          alarmItem.innerHTML = 
	   	              "<input type='hidden' value='" + alarm.alarm_id + "' class='alarm-id'>"  +
	   	          	  "<span><strong>" + "송신자: " + alarm.sender + "</strong></span>" +
	   	          	  "<span class='date'>" + alarm.printDate + "</span>" +
	   	              "<br><br>" +
	   	          	  "<span class='title'><strong>" + "제목: " + alarm.title + "</strong></span>" +
	   	          	  "<br>" +
	   	          	  "<span class='contents'>" + "진행상황: " + alarm.contents + "</span>" +
	   	          	  "<br>" +
	   	          	  "<button class='deleteAlarm' type='button' data-alarm-id='" + alarm.alarm_id + "'>삭제</button>";


	   	        // <a> 태그 안에 <div> 태그를 추가
	   	        anchorTag.appendChild(alarmItem);

	   	        // 최종적으로 <a> 태그를 #chat에 추가
	   	        commentListHTML.appendChild(anchorTag);
	   	      });
		}
	    
	    // 채팅&진행 상황알람 삭제 버튼 클릭 이벤트 처리
	    $(document).on("click", ".deleteAlarm", function(e) {
	      e.preventDefault(); // 이벤트의 기본 동작을 막음
	      
	      var alarmId = $(this).data("alarm-id");
	      var self = this; // 클로저를 활용하여 현재의 this를 저장
	      // AJAX 요청
	      $.ajax({
	        type: "POST",
	  	  	url: "<c:url value='/header/alarmDelete'/>",  
	  	    contentType: "application/json; charset=UTF-8",
   	  	    data: JSON.stringify({ alarm_id: alarmId }),// 컨트롤러로 전송할 데이터
	        dataType: "json",
	        success: function(response) {
	        	 alert(response.message);
				 if (response.status) {
					// 클릭된 버튼과 가장 가까운 .alarm 클래스를 가진 부모 div 제거
					$(self).closest(".alarm").remove(); 
				 }
	        },
	      });
	    });
	   
	    // 전체 삭제 버튼 클릭 시 이벤트 처리
		$(document).on("click", "#modal-btn-footer", function(e) {
		    // 현재 활성 탭을 확인
		    var activeTabId = $(".nav-tabs .nav-item .active").attr("href");
		    
		    // 채팅 탭에 있는 알람들을 삭제
		    if (activeTabId === "#chat") {
		    	
		    	 // 채팅 탭의 알람이 없으면 알림 메시지를 띄우고 종료
		        if ($("#chat .alarm").length === 0) {
		            alert("이미 전체삭제된 알람입니다.");
		            return;
		        }
		    	 
		        // AJAX 요청
			      $.ajax({
			        type: "POST",
			  	  	url: "<c:url value='/header/allAlarmDelete'/>",  
			        dataType: "json",
			        success: function(response) {
			        	 alert(response.message);
						 if (response.status) {
							  $("#chat .alarm").remove();
						 }
			        },
			      });
		    }
		    // 진행상황 탭에 있는 알람들을 삭제
		    else if (activeTabId === "#progress") {
		    	
		    	 // 진행상황 탭의 알람이 없으면 알림 메시지를 띄우고 종료
		        if ($("#progress .alarm").length === 0) {
		            alert("이미 전체삭제된 알람입니다.");
		            return;
		        }
		    	 
		     // AJAX 요청
			      $.ajax({
			        type: "POST",
			  	  	url: "<c:url value='/header/allProgressDelete'/>",  
			        dataType: "json",
			        success: function(response) {
			        	 alert(response.message);
						 if (response.status) {
							 $("#progress .alarm").remove();
						 }
			        },
			      });
		    }
		    
		    // 추가적으로 서버에 전체 삭제 요청을 보낼 수 있음
		    // ...
	
		});	   
	    // 다이얼로그가 닫힐 때 이벤트 처리
	    $('#staticBackdrop').on('hidden.bs.modal', function () {
	        $(".alarm").remove(); // .alarm 클래스를 가진 요소 삭제
	        flag=0;
	    });
	    
	   // #bell(종) 이미지 클릭시 이벤트 처리
	  $(document).on("click", "#bell", function(e) {
			
		   // 서버에 AJAX 요청을 보내서 해당 게시글의 내용을 가져옵니다.
		   $.ajax({
		      type: "POST",
			  url: "<c:url value='/header/alarmSelect'/>",  
		      contentType: "application/json; charset=UTF-8",
		      dataType: "json",
		      success: function(response) {
		    	  console.log(response);
		    	  if(response.status){
		    		  
		    		    loadAlarms(response.listAlarm); // 알람목록을 출력하는 함수호출
		    		    loadProgress(response.listProgress);// 진행상황을 출력하는 함수호출
		    			// 다이얼로그를 오픈합니다.
				         $('#staticBackdrop').modal('show');
		    		    flag=1;
				         // 클릭 시 "New" 배지 감추기
			             $("#bellBadge").hide();
		    	  }
		      },
		      error: function(error) {
		         alert("데이터를 가져오는 데 실패했습니다.");
		      }
		   });
		   
		});
		 
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>