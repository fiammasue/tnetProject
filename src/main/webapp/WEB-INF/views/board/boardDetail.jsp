<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <sec:authorize access="isAuthenticated()"> <!-- 인증이 됐는지안됐는지 확인하는 구문 -->
	   <sec:authentication property="principal" var="principal"/> <!-- property로 가져와서 var 데이터타입으로 대입하겠다는뜻 -->
	</sec:authorize>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <link rel="icon" href="/favicon.ico" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="theme-color" content="#000000" />
  <title>게시글 상세보기</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto%3A400%2C500"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter%3A100%2C300%2C400"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins%3A300%2C500"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A100%2C300%2C400%2C500"/>
  <link rel="stylesheet" href="/styles/boardDetail.css"/>
  
  <link rel="stylesheet" href="/styles/chatRoom.css">
</head>
<body>

<div id="innerBoardDetail">
<input type="hidden" id=board_id value="${board.board_id}"/>
  <div class="item--XQC">
    <div class="auto-group-fgyx-zW4">
      <div class="button-6oz">
        <img class="vector-36-stroke-Q3z" src="/assets/vector-36-stroke.png"/>
        <div class="text-label-Kgk">목록으로</div>
      </div>
      <c:if test="${principal.user.nickName ==  board.writer_nickname}">
	      <div class="group-5-znt">수정</div>
	      <div class="group-6-TgU">삭제</div>
      </c:if>
    </div>
    <div class="auto-group-jkgl-7W8">
      <div class="group-30929672-PiY">
        <p class="item--vTa">${board.give_talent}</p>
        <img class="movement-of-items-crC" src="/assets/movement-of-items.png"/>
        <p class="item--LnC">${board.receive_talent}</p>
      </div>
      <div class="auto-group-f1ex-GA4">
        <div class="auto-group-8whi-by2">
          <img class="vector-L9v" src="/assets/vector.png"/>
          <p class="yeonsul123navercom-fxt">작성자 : <label class="nickName">${board.writer_nickname}</label></p>
          <p class="item--NcQ">성별 : ${board.gender=='female'? '남' : '여'} </p>
          <!-- ${board.gender=='w'? '남' : '여'} -->
        </div>
        <div class="auto-group-ogqn-h8t">
          <div class="group-9-3iY">
            <p class="item-123-PGc">조회수 : ${board.read_count }</p>
            <p class="item-2023-10-22-11-23-12-UKz">게시일 : ${board.register_date }</p>
          </div>
<%--           <c:if test="${principal.user.nickname !=  board.writer_nickname}"> --%>
          		<p class="item--n5n">신고 </p>
<%--           </c:if> --%>
        </div>
      </div>
    </div>
    <div class="auto-group-tmvr-Fk4">${board.title }</div>
    <div class="group-20-JTS">
      <p class="item--cDE">
      ${board.contents }
      </p>
      <div class="auto-group-dgqx-KG4">
        <img class="location-3xk" src="/assets/location.png"/>
        <div class="item--Bp4">${board.city_name } ${board.district_name }</div>
      </div>
    </div>
    <div class="frame-45-qdi">
      <div class="component-9-NNk">
        <div class="auto-group-ewde-v9N">
          <img class="attach-rHv" src="/assets/attach.png"/>
          <div class="jdk-11020windows-x64binexe-NXA">첨부파일 : jdk-11.0.20_windows-x64_bin.exe</div>
        </div>
        
      
      </div>

    <div class="auto-group-mjac-BEx">
      <div class="button-W2L">참여하기</div>
      <div class="button-kxG">문의하기</div>
    </div>
  </div>
</div>
</div>

<!-- 채팅방 폼 -->
	<div class="chatRoomDialog" style="display:none;">
	    <div class="chatRoom-header">
	    <div style="display:none;" class="roomId"></div>
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


<script>
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
	//문의하기에대한 채팅방생성
	$(".button-kxG").on("click", e =>{
			
		const param = {
				room_name : "[문의]"+$(".item--vTa").text()+"&"+$(".item--LnC").text(),
				receiver : $(".nickName").text(),
				board_id : $("#board_id").val(),
				agreeChat : "문의"
			};
			$.ajax({
				url:"/chat/createRoom",
				method: "POST",
				contentType: "application/json; charset=UTF-8",
				data: JSON.stringify(param),
				dataType:"json",
				success:function(json){
					
					 let roomInfo = json.roomInfo;
		    		 
		
		    		 $(".chatRoom-name").text(roomInfo.room_name);
		    		 if(roomInfo.sender == "${principal.user.nickName}"){
		    			 $(".chatRoom-receiver").html(roomInfo.receiver);
		    		 }
		    		 else{
		    			 $(".chatRoom-receiver").html(roomInfo.sender);
		    		 }
		    		 
		    		 roomId= roomInfo.room_id;
		    		 
		    		 $(".roomId").text(roomId);
		    		 
		    		 
		    		 //채팅방입장
		    		 ws.send("/pub/chat/message", {}
		 	        , JSON.stringify({type:'ENTER',room_id:roomId, sender : sender}));
		    		 
		    	if(json.exist){
		    			 let chatList = json.chatList;
		    		 	var chatListInfo = "";
			    		for(let i=0;i<chatList.length;i++){
			    			chatListInfo="";
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
								   	if(chat.read_yn=="N"){
					    		      chatListInfo+=` <div class="sender-readCount">1</div>`;
								   		
								   	}
								   	chatListInfo+=`</div>`;
			    			 }	
			    			 else{
								  	chatListInfo += `<div class="chat ch2">
								    		            <div class="textbox">`+decodeURIComponent(chat.message)+`</div>
								    		            <div class="receiver-time">`+time+`</div>`
								   	if(chat.read_yn=="N"){
						    		   chatListInfo+=` <div class="receiver-readCount">1</div>`;
								   		
								   	}
								    	chatListInfo+=`</div>`;
			    				 
			    			 }
			    			$('.wrap').append(chatListInfo); 
			    		 }
		    		 } 
			    		 chatRoom.dialog("open");
			    		 
			    		 var divElement = $(".wrap");
			    		 $(".wrap").scrollTop(divElement[0].scrollHeight);
					 
					 
				}
				
			});
	
	});
	
	
	//메세지 보내기
	$("#sendMessage").on("click",e => {

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
														,receiver:$(".nickName").text()
														}));
		//메시지 창 비우기
		$("#messageBox").val("");
	});
	
	$(".button-W2L").on("click",e => {
		const param = {
				board_id:$("#board_id").val()
				,writer_nickname: $(".nickName").text()
				,applyer_nickname: sender
				,give_talent: $(".item--vTa").text()
				,receive_talent: $(".item--LnC").text()
			};
		
		
		$.ajax({
			url:"/course/join",
			method: "POST",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify(param),
			dataType:"json",
			success:function(json){

				 if(json.bool == true){
					 alert("수강신청이 완료되었습니다.");
					 var course = json.course;
					 ws.send("/pub/join/course",{"content-type": "application/json;charset=utf-8"},JSON.stringify({
								type_string:"AGREE"
								,course_id:course.course_id
								,writer_nickname: course.writer_nickname
								,applyer_nickname:course.applyer_nickname
								,board_id:$('#board_id').val()
								}));
				 }
				 else if(json.bool == "done"){
					 alert("이미 신청한 게시글입니다.");
				 }
				 else{
					 alert("수강신청이 실패했습니다.");
				 }
			}
			
		});
	});
	
	//목록으로
	$(".text-label-Kgk").on("click",e => {
		var boardId = $(this).data("boardid");
		
		location.href="/board/list";
		
	});
	//삭제하기
	$(".group-6-TgU").on("click",e => {
		const param = {
				board_id:$("#board_id").val()
			};
		
		$.ajax({
			url:"/board/delete",
			method: "POST",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify(param),
			dataType:"json",
			success:function(json){
				if(json.bool === true){
					alert("게시글이 삭제되었습니다.");
					location.href="/board/list";
				}
				else{
					alert("게시글 삭제 중 오류가 발생하였습니다.");
				}
			}
			
		});
	});
	//수정하기
	$(".group-5-znt").on("click",e => {
		var boardId = $("#board_id").val();
		location.href="/board/revise/"+boardId;
	});
	
	
</script>





</body>