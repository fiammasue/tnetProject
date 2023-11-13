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
            <p>진행상황 내용이 여기에 들어갑니다.</p>
          </div>
        </div>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>        
      </div>
    </div>
  </div>
</div>


  <div id="container">   
  	<c:choose> 
  		<c:when test="${empty principal}">
  		
		    <header>
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
	    	<header>
		      <a href='<c:url value="/"/>'><img id="logo" src="/assets/logo.png" alt="" ></a>
		      <nav id="menubar">
		        <ul id="topMenu">
		          <li><a href="/logout.do">logout </a></li>
		          <li><a href="#">notice</a></li>
		          <li><a href='<c:url value="/board/list"/>'>lesson</a></li>
		          <li><a href="/myPage/userInfo">mypage</a></li>
		          <!-- data-bs-toggle="modal" 아래코드에서 이부분을 삭제시킴 -->
          		  <li><a href="#"><img id="bell" src="/assets/bell3(3).png" alt="" data-bs-target="#staticBackdrop"></a></li>
		        </ul>
		      </nav>
		    </header>
	    </c:otherwise>
  	</c:choose>
  </div>

	<div id="LoginDialog">
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
$(document).ready(function() {
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
		//시간 자르기
			 var timestampString = recv.reg_date;

			// "T" 문자를 기준으로 문자열을 분할하고 두 번째 부분을 선택
			var timePart = timestampString.split("T")[1];

			// 시:분 부분만 선택
			var time = timePart.substring(0, 5);
			
		if (recv.type_string==="ALARM") {
			alert("ALARM");
			alert(recv.contents, recv.receiver)
		}
		else if (recv.type_string==="TALK") {
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
			var chatListInfo = `<span class="badge rounded-pill text-bg-warning">`+decodeURIComponent(recv.message)+`</span>`
			$("#chatList").append(chatListInfo);
		}
		else if (recv.type_string==="LEAVE") {
			alert("퇴장");
			var chatListInfo = `<span class="badge rounded-pill text-bg-warning">`+decodeURIComponent(recv.message)+`</span>`
			$("#chatList").append(chatListInfo);
		}
		
		
	}
	
	   //알람 로딩 함수
	    function loadAlarms(listAlarm) {
	   	     const commentListHTML = document.querySelector("#chat");
	
	   	 	 listAlarm.forEach(alarm => {
	   	          console.log("알람 데이터:", alarm); // 알람 데이터 확인
	   	          const alarmItem = document.createElement("div");
	   	          alarmItem.className = "alarm";
	
	   	          alarmItem.innerHTML = 
	   	             "<input type='hidden' value='" + alarm.alarm_id + "' class='alarm-id'>"  +
	   	              "<p>방제목: " + alarm.room_name + "</p>" + 
	   	              "<p>내용: " + alarm.contents + "</p>" + 
	   	            /*   "<p>수신자: " +  alarm.receiver + "</p>" + 
	   	              "<p>송신자: " +  alarm.sender + "</p>" + 
	   	              "<p>읽음여부: " + alarm.read_yn + "</p>" +
	   	              "<p>방번호: " + alarm.room_id + "</p>" + */
	   	              "<br><br>"
	   	          commentListHTML.appendChild(alarmItem);
	   	      });
		}
	   
	    // 다이얼로그가 닫힐 때 이벤트 처리
	    $('#staticBackdrop').on('hidden.bs.modal', function () {
	        $(".alarm").remove(); // .alarm 클래스를 가진 요소 삭제
	    });
	    
	   // #bell(종) 이미지 클릭시 이벤트 처리
	  $(document).on("click", "#bell", function(e) {
			
		   // 서버에 AJAX 요청을 보내서 해당 게시글의 내용을 가져옵니다.
		   $.ajax({
		      type: "POST",
			  url: "<c:url value='/header'/>",  
		      contentType: "application/json; charset=UTF-8",
		      /* data: {nickName: "${principal.user.nickName}"}, */
		      dataType: "json",
		      success: function(response) {
		    	  console.log(response);
		    	  if(response.status){
		    		  
		    		    loadAlarms(response.listAlarm); // 알람목록을 출력하는 함수호출
		    		    
		    			// 다이얼로그를 오픈합니다.
				         $('#staticBackdrop').modal('show');
		    	  }
		      },
		      error: function(error) {
		         alert("데이터를 가져오는 데 실패했습니다.");
		      }
		   });
		   
		});
		 
		});
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
