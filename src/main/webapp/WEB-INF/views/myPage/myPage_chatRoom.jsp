<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()"> <!-- 인증이 됐는지안됐는지 확인하는 구문 -->
   <sec:authentication property="principal" var="principal"/> <!-- property로 가져와서 var 데이터타입으로 대입하겠다는뜻 -->
</sec:authorize>
<!doctype html>
<html lang="ko">

<head>
	<title>MyPage_chatRoom</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="/vendor/linearicons/style.css">
<!-- 	<link rel="stylesheet" href="/vendor/chartist/css/chartist-custom.css"> -->
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="/styles/myPage.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="/assets/img/favicon.png">

	<!-- 카카오톡 css -->
	<link rel="stylesheet" href="/styles/chatRoom.css">
</head>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li><a href="/myPage/userInfo" class=""><i class="lnr lnr-user"></i> <span>내 정보</span></a></li>
						<li>
							<a href="#subPages" data-toggle="collapse" class="collapsed"><i class="lnr lnr-pencil"></i> <span>강의 목록</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages" class="collapse ">
								<ul class="nav">
									<li><a href="/myPage/course_recruiting" class="">모집 중인 내 강의</a></li>
									<li><a href="/myPage/course_proceeding" class="">진행 중인 강의</a></li>
									<li><a href="#" class="">신청이 온 진행중 강의</a></li>
								</ul>
							</div>
						</li>
						<li><a href="/myPage/calendar" class=""><i class="fa fa-calendar"></i> <span>일정 관리</span></a></li>
						<li><a href="/myPage/chatRoom" class="active"><i class="fa fa-envelope"></i> <span>채팅방 목록</span></a></li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="panel-heading">
					<h2 class="panel-title recruiting">채팅방 목록</h2>
				</div>
				<div class="container-fluid">
					<div class="panel chat-room-list">
						<div class="chat-frames">
				
			 		<c:forEach var="chatRoom" items="${ roomList}">
							<div class="chat-room">
								<div class="user-info">
								  <c:if test="${empty principal.user.profileImage}">
									<img class="user-avatar" src="/assets/유저.png"/>
								  
								  </c:if>
								  <c:if test="${not empty principal.user.profileImage}">
									<img class="user-avatar" src="${principal.user.profileImage}"/>
								  
								  </c:if>
									<c:if test="${principal.user.nickName == chatRoom.receiver}">
										<p class="user-name">${chatRoom.sender }</p>
									</c:if>
									<c:if test="${principal.user.nickName == chatRoom.sender }">
										<p class="user-name">${chatRoom.receiver }</p>
									</c:if>
								</div>
								<div class="chat-details">
									<p class="room-title" data-roomid="${chatRoom.room_id }">${chatRoom.room_name }</p>
									<p style="display:none;" class="room-schedule">언제가 편하실까요?</p>
								</div>
								<div style="display:none;"  class="chat-metadata">
									<p class="chat-timestamp">7:36 PM</p>
									<div class="unread-messages">3</div>
								</div>
							</div>
					</c:forEach>  
							<!-- Add more chat room entries here -->
						</div>
					</div>
					


				</div>
			</div>
		</div>
	</div>
	<!-- 채팅창 -->
	<div class="chatRoomDialog" style="display:none;">
	    <div class="chatRoom-header">
	    <div class="roomId"></div>
	      <div class="cover-image">
	        <img src="/assets/유저.png" alt="" class="userImage">
	      </div>
	      <div class="chatRoom-name">수학, 과학 알려주는 방</div>
	      <div class="chatRoom-receiver">유저삼</div>
	    </div>
	    
	    <div class="wrap">
	        <!-- <div class="chat ch1">
	            <div class="textbox">안녕하세요. 반갑습니다.</div>
	            <div class="sender-time">6:30</div>
	            <div class="sender-readCount">1</div>
	        </div>
	        <div class="chat ch2">
	            <div class="textbox">안녕하세요. 친절한효자손입니다. 그동안 잘 지내셨어요?</div>
	            <div class="receiver-time">6:30</div>
	            <div class="receiver-readCount">1</div>
	        </div>
	        <div class="chat ch1">
	            <div class="textbox">아유~ 너무요너무요! 요즘 어떻게 지내세요?</div>
	        </div>
	        <div class="chat ch2">
	            <div class="textbox">뭐~ 늘 똑같은 하루 하루를 보내는 중이에요. 코로나가 다시 극성이어서 모이지도 못하구 있군요 ㅠㅠ 얼른 좀 잠잠해졌으면 좋겠습니다요!</div>
	        </div> -->
	    </div>
	    <div class="chatRoom-footer">
	      <textarea id ="messageBox"></textarea>
	      <button type="button" id="sendMessage">전송</button>
	    </div> 
	</div>
	<!-- 채팅창 끝 -->
	
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
		  채팅방 생성하기
		</button>
		<!-- 모달창 -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <label for="roomName">채팅방 이름 : </label>
		        <input type="text" id="roomName"/>
		        <label for="receiver">채팅상대 : </label>
		        <input type="text" id="receiver"/>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        <button type="button" id="createRoom" class="btn btn-primary">채팅방 생성</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- 모달창끝 -->
		
	<!-- Javascript -->
	<script src="/vendor/jquery/jquery.min.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
		var roomId = "";
		chatRoom= $( ".chatRoomDialog" ).dialog({
			//페이지로드시 자동으로 열림 방지
			autoOpen: false,
			width: 550,
			//다른거 안눌림
			modal: true,
			//창이 닫혔을때 
			close: function() {
				$("#messageBox").text("");
				ws.send("<c:url value='/pub/chat/message'/>", {"content-type": "application/json;charset=utf-8"}
		        , JSON.stringify({type:'LEAVE',room_id:roomId}));
				$(".wrap").html("");
			}
		});//채팅방폼
	
		$(document).on("click", ".room-title", function() {
		  	roomId = $(this).data("roomid");
		  	alert(roomId);
// 		  	location.href = "/chat/enterRoom/"+roomId;
		  	ws.send("/pub/chat/message", {"content-type": "application/json;charset=utf-8"}
	        , JSON.stringify({type:'ENTER',room_id:roomId, sender : sender}));
		  	
		  	
		  	$.ajax({
		    	url:"/chat/enterRoom/"+roomId,
		    	type:"GET",
		    	contentType: "application/json; charset=UTF-8",
		    	dataType:"json",
		    	success:function(json){
		    		
		    		 let roomInfo = json.roomInfo;
		    		 let chatList = json.chatList;
		    		 alert(roomInfo)
		    		 $(".chatRoom-name").text(roomInfo.room_name);
		    		 if(roomInfo.sender == "${principal.user.nickName}"){
		    			 $(".chatRoom-receiver").html(roomInfo.receiver);
		    		 }
		    		 else{
		    			 $(".chatRoom-receiver").html(roomInfo.sender);
		    		 }
		    		 $(".roomId").text(roomId);
		    		 var chatListInfo = "";
		    		 for(let i=0;i<chatList.length;i++){
		    			 var chat = chatList[i];
		    			 //시간 자르기
		    			 var timestampString = chat.reg_date;

		    			// "T" 문자를 기준으로 문자열을 분할하고 두 번째 부분을 선택
		    			var timePart = timestampString.split("T")[1];

		    			// 시:분 부분만 선택
		    			var time = timePart.substring(0, 5);
		    			
		    			 if(chat.sender != "${principal.user.nickName}"){
				    			 chatListInfo+=`<div class="chat ch1">
							    		            <div class="textbox">`+decodeURIComponent(chat.message)+`</div>
							    		            <div class="sender-time">`+time+`</div>`;
							   	if(chat.read_yn=='N'){
				    		      chatListInfo+=` <div class="sender-readCount">1</div>`;
							   		
							   	}
							   	chatListInfo+=`</div>`;
		    			 }	
		    			 else{
							  	chatListInfo += `<div class="chat ch2">
							    		            <div class="textbox">`+decodeURIComponent(chat.message)+`</div>
							    		            <div class="receiver-time">`+time+`</div>`
							   	if(chat.read_yn=='N'){
					    		   chatListInfo+=` <div class="receiver-readCount">1</div>`;
							   		
							   	}
							    	chatListInfo+=`</div>`;
		    				 
		    			 }
		    			$('.wrap').append(chatListInfo); 
		    		 }
		    		 
		    		 chatRoom.dialog("open");
		    		 
		    		 var divElement = $(".wrap");
		    		 $(".wrap").scrollTop(divElement[0].scrollHeight);
		    	}
		    }); 
		});
		
		//메세지 보내기
		$("#sendMessage").on("click",e => {
			alert(" ? ");
			if(subscription == null) return;
			const message = $("#chatContent").val();//메시지 내용
			//메시지 보내기
			var messageee = $("#messageBox").val();
			ws.send("/pub/chat/message",{"content-type": "application/json;charset=utf-8"},JSON.stringify({
															type:'TALK'
															,type_string:"TALK"
															,room_id:roomId
															,message:encodeURIComponent($("#messageBox").val())
															,sender:"${principal.user.nickName}"
															,receiver:$(".chatRoom-receiver").text()
															}));
			//메시지 창 비우기
			$("#messageBox").val("");
		});
		
		
		//채팅방 생성
		$("#createRoom").on("click", e =>{
			const param = {
				room_name : $("#roomName").val(),
				receiver : $("#receiver").val()
			};
			$.ajax({
				url:"/chat/createRoom",
				method: "POST",
				contentType: "application/json; charset=UTF-8",
				data: JSON.stringify(param),
				dataType:"json",
				success:function(json){
					 var roomListInfo = `<div class="card text-bg-info mb-3" style="max-width: 18rem;">
                         <div class="card-header" ><a href="/chat/enterRoom/`+json.room_id+`">`+json.room_id+`</a></div>
                         <div class="card-body">
                           <h5 class="card-title">`+json.room_name+`</h5>
                           <p class="card-text">`+json.receiver+`</p>
                         </div>
                       </div>`;
  					 $("#roomList").append(roomListInfo);
				}
				
			});
		});
		
		
		ws.onmessage= function(event){
			const message2 = event.data
			alert(message2.length);
		}
		
		
	</script>
</body>

</html>
