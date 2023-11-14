<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()"> <!-- 인증이 됐는지안됐는지 확인하는 구문 -->
   <sec:authentication property="principal" var="principal"/> <!-- property로 가져와서 var 데이터타입으로 대입하겠다는뜻 -->
</sec:authorize>

<!doctype html>
<html lang="ko">

<head>
	<title>MyPage_course</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="/vendor/linearicons/style.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="/styles/myPage.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="/assets/img/favicon.png">
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
							<a href="#subPages" data-toggle="collapse" class="active"><i class="lnr lnr-pencil"></i> <span>강의 목록</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages" class="collapse in">
								<ul class="nav">
									<li><a href="/myPage/course_recruiting" class="">모집 중인 내 강의</a></li>
									<li><a href="/myPage/course_proceeding" class="active">진행 중인 강의</a></li>
									<!-- <li><a href="#" class="">신청이 온 진행중 강의</a></li> -->
								</ul>
							</div>
						</li>
						<li><a href="/myPage/calendar" class=""><i class="fa fa-calendar"></i> <span>일정 관리</span></a></li>
						<li><a href="/myPage/chatRoom" class=""><i class="fa fa-envelope"></i> <span>채팅방 목록</span></a></li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">


					<div class="container">
						<div class="tabs">
							<div class="tab-button active" onclick="openTab('tab1', 'tab2')" id="tab-button1">진행 중인 강의</div>
							<div class="tab-button" onclick="openTab('tab2', 'tab1')" id="tab-button2">완료된 강의</div>
						</div>
						<div class="panel tab-content active" id="tab1">
							<div class="row">
								<div class="kanban-board">
									<div class="bucket accept">
										<div class="task-group accept">
											<img class="icon" src="/assets/accept-icon.png"/>
											<p class="label">수락</p>
										</div>
										<div class="tasks">
										<c:choose>
									        <c:when test="${empty kanbanBoard_Accept}">
									            <!-- <p>-&nbsp;&nbsp;수락한 강의가 없습니다.</p> -->
									        </c:when>
									        <c:otherwise>
												<c:forEach var="course" items="${kanbanBoard_Accept}">
												<c:choose>
								                    <c:when test="${course.status_code == '진행 취소요청 보냄' || course.status_code == '진행 취소요청이 왔어요'}">
													<div class="task-card dontMove" id="course-${course.course_id}" data-courseid="${course.course_id}" data-boardid="${course.board_id}">
														<div class="status accept dontMove">${course.status_code}</div>
														<p class="task-name dontMove">
														<script>
									                        var originalTitle = "${course.title}";
									                        var truncatedTitle = originalTitle.length > 16 ? (originalTitle.substring(0, 16) + '...') : originalTitle;
									                        document.write(truncatedTitle);
									                    </script>
									                    </p>
														<div class="details">
									                        <c:choose>
																<c:when test="${course.applyer_nickname == principal.user.nickName}">
																	<p class="requester">신청자 : ${course.applyer_nickname}</p>
																</c:when>
																<c:otherwise>
																	<p class="requester">요청자 : ${course.applyer_nickname}</p>
																</c:otherwise>
															</c:choose>
											                <p class="date">${course.start_date}</p>
														</div>
													</div>
													</c:when>
										        	<c:otherwise>
													<div class="task-card" id="course-${course.course_id}" data-courseid="${course.course_id}" data-boardid="${course.board_id}">
														<div class="status accept">${course.status_code}</div>
														<p class="task-name">
														<script>
									                        var originalTitle = "${course.title}";
									                        var truncatedTitle = originalTitle.length > 16 ? (originalTitle.substring(0, 16) + '...') : originalTitle;
									                        document.write(truncatedTitle);
									                    </script>
									                    </p>
														<div class="details">
									                        <c:choose>
																<c:when test="${course.applyer_nickname == principal.user.nickName}">
																	<p class="requester">신청자 : ${course.applyer_nickname}</p>
																</c:when>
																<c:otherwise>
																	<p class="requester">요청자 : ${course.applyer_nickname}</p>
																</c:otherwise>
															</c:choose>
											                <p class="date">${course.start_date}</p>
														</div>
													</div>
								                    </c:otherwise>
								                </c:choose>
												</c:forEach>
											</c:otherwise>
										</c:choose>	
										</div>
										
										

										<div class="separator"></div>
									</div>

									<div class="bucket waiting">
										<div class="task-group waiting">
											<img class="icon" src="/assets/waiting-icon.png"/>
											<p class="label">대기</p>
										</div>
										<div class="tasks waiting">
										<c:choose>
									        <c:when test="${empty kanbanBoard_Waiting}">
									            <!-- <p>-&nbsp;&nbsp;대기중인 강의가 없습니다.</p> -->
									        </c:when>
								        	<c:otherwise>
												<c:forEach var="course" items="${kanbanBoard_Waiting}">
												<c:choose>
								                    <c:when test="${course.applyer_nickname == principal.user.nickName}">
													<div class="task-card dontMove" id="course-${course.course_id}" draggable="false" data-courseid="${course.course_id}" data-boardid="${course.board_id}">
														<div class="status waiting dontMove">${course.status_code}</div>
														<p class="task-name dontMove">
														<script>
									                        var originalTitle = "${course.title}";
									                        var truncatedTitle = originalTitle.length > 16 ? (originalTitle.substring(0, 16) + '...') : originalTitle;
									                        document.write(truncatedTitle);
									                    </script>
									                    </p>
														<div class="details">
									                        <p class="requester">신청자 : ${course.applyer_nickname}</p>
											                <p class="date">${course.start_date}</p>
														</div>
													</div>
													</c:when>
										        	<c:otherwise>
													<div class="task-card" id="course-${course.course_id}" draggable="true" ondragstart="drag(event)" data-courseid="${course.course_id}" data-boardid="${course.board_id}">
														<div class="status waiting">${course.status_code}</div>
														<p class="task-name">
														<script>
									                        var originalTitle = "${course.title}";
									                        var truncatedTitle = originalTitle.length > 16 ? (originalTitle.substring(0, 16) + '...') : originalTitle;
									                        document.write(truncatedTitle);
									                    </script>
									                    </p>
														<div class="details">
									                        <p class="requester">요청자 : ${course.applyer_nickname}</p>
											                <p class="date">${course.start_date}</p>
														</div>
													</div>
								                    </c:otherwise>
								                </c:choose>
												</c:forEach>
											</c:otherwise>
										</c:choose>	
										</div>
									</div>

									<div class="bucket reject">

										<div class="task-group reject">
											<img class="icon" src="/assets/reject-icon.png"/>
											<p class="label">거절</p>
										</div>
										<div class="tasks">
										<c:choose>
									        <c:when test="${empty kanbanBoard_Reject}">
									          <!--   <p>-&nbsp;&nbsp;거절한 강의가 없습니다.</p> -->
									        </c:when>
								        	<c:otherwise>
												<c:forEach var="course" items="${kanbanBoard_Reject}">
												<c:choose>
								                    <c:when test="${course.applyer_nickname == principal.user.nickName}">
													<div class="task-card dontMove" id="course-${course.course_id}" draggable="false" data-courseid="${course.course_id}" data-boardid="${course.board_id}">
														<div class="status reject dontMove">${course.status_code}</div>
														<p class="task-name dontMove">
														<script>
									                        var originalTitle = "${course.title}";
									                        var truncatedTitle = originalTitle.length > 16 ? (originalTitle.substring(0, 16) + '...') : originalTitle;
									                        document.write(truncatedTitle);
									                    </script>
									                    </p>
														<div class="details">
									                        <p class="requester">신청자 : ${course.applyer_nickname}</p>
											                <p class="date">${course.start_date}</p>
														</div>
													</div>
													</c:when>
										        	<c:otherwise>
													<div class="task-card" id="course-${course.course_id}" draggable="true" ondragstart="drag(event)" data-courseid="${course.course_id}" data-boardid="${course.board_id}">
														<div class="status reject">${course.status_code}</div>
														<p class="task-name">
														<script>
									                        var originalTitle = "${course.title}";
									                        var truncatedTitle = originalTitle.length > 16 ? (originalTitle.substring(0, 16) + '...') : originalTitle;
									                        document.write(truncatedTitle);
									                    </script>
									                    </p>
														<div class="details">
									                        <p class="requester">요청자 : ${course.applyer_nickname}</p>
											                <p class="date">${course.start_date}</p>
														</div>
													</div>
								                    </c:otherwise>
								                </c:choose>
												</c:forEach>
											</c:otherwise>
										</c:choose>	
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="panel tab-content" id="tab2">
							<div class="row">
								<div class="kanban-board">
									<div class="bucket completed">
										<div class="task-group completed">
										  <img class="icon" src="/assets/completed-icon.png"/>
										  <div class="label">완료</div>
										</div>
										<div class="tasks">
										<c:choose>
									        <c:when test="${empty kanbanBoard_Completed}">
									           <!--  <p>-&nbsp;&nbsp;완료된 강의가 없습니다.</p> -->
									        </c:when>
							        		<c:otherwise>
												<c:forEach var="course" items="${kanbanBoard_Completed}">
													<div class="task-card" id="course-${course.course_id}" draggable="true" ondragstart="drag(event)" data-courseid="${course.course_id}" data-boardid="${course.board_id}">
														<div class="status completed">${course.status_code}</div>
														<p class="task-name">
														<script>
									                        var originalTitle = "${course.title}";
									                        var truncatedTitle = originalTitle.length > 16 ? (originalTitle.substring(0, 16) + '...') : originalTitle;
									                        document.write(truncatedTitle);
									                    </script>
									                    </p>
														<div class="details">
															<c:choose>
											                    <c:when test="${course.applyer_nickname == principal.user.nickName}">
											                        <p class="requester">신청자 : ${course.applyer_nickname}</p>
											                    </c:when>
											                    <c:otherwise>
											                        <p class="requester">요청자 : ${course.applyer_nickname}</p>
											                    </c:otherwise>
											                </c:choose>
											                <p class="date">${course.start_date}</p>
														</div>
													</div>
												</c:forEach>
											</c:otherwise>
										</c:choose>	
									  	</div>
									</div>

									<div class="bucket completed-waiting">
										<div class="task-group completed-waiting">
											<img class="icon" src="/assets/waiting-icon.png"/>
											<p class="label">대기</p>
										</div>
										<div class="tasks">
										<c:choose>
									        <c:when test="${empty kanbanBoard_Completed_Waiting}">
									            <!-- <p>-&nbsp;&nbsp;대기중인 강의가 없습니다.</p> -->
									        </c:when>
							        		<c:otherwise>
												<c:forEach var="course" items="${kanbanBoard_Completed_Waiting}">
												<c:choose>
											        <c:when test="${course.status_code == '완료 결정 기다리는 중..'}">
														<div class="task-card dontMove" id="course-${course.course_id}" draggable="false" data-courseid="${course.course_id}" data-boardid="${course.board_id}">
															<div class="status completed-waiting dontMove">${course.status_code}</div>
															<p class="task-name dontMove">
															<script>
										                        var originalTitle = "${course.title}";
										                        var truncatedTitle = originalTitle.length > 16 ? (originalTitle.substring(0, 16) + '...') : originalTitle;
										                        document.write(truncatedTitle);
										                    </script>
										                    </p>
															<div class="details">
																<c:choose>
												                    <c:when test="${course.applyer_nickname == principal.user.nickName}">
												                        <p class="requester">신청자 : ${course.applyer_nickname}</p>
												                    </c:when>
												                    <c:otherwise>
												                        <p class="requester">요청자 : ${course.applyer_nickname}</p>
												                    </c:otherwise>
												                </c:choose>
												                <p class="date">${course.start_date}</p>
															</div>
														</div>
													</c:when>
									        		<c:otherwise>
														<div class="task-card" id="course-${course.course_id}" draggable="true" ondragstart="drag(event)" data-courseid="${course.course_id}" data-boardid="${course.board_id}">
															<div class="status completed-waiting">${course.status_code}</div>
															<p class="task-name">
															<script>
										                        var originalTitle = "${course.title}";
										                        var truncatedTitle = originalTitle.length > 16 ? (originalTitle.substring(0, 16) + '...') : originalTitle;
										                        document.write(truncatedTitle);
										                    </script>
										                    </p>
															<div class="details">
																<c:choose>
												                    <c:when test="${course.applyer_nickname == principal.user.nickName}">
												                        <p class="requester">신청자 : ${course.applyer_nickname}</p>
												                    </c:when>
												                    <c:otherwise>
												                        <p class="requester">요청자 : ${course.applyer_nickname}</p>
												                    </c:otherwise>
												                </c:choose>
												                <p class="date">${course.start_date}</p>
															</div>
														</div>
													</c:otherwise>
												</c:choose>
												</c:forEach>
											</c:otherwise>
										</c:choose>	
										</div>
									</div>

									<div class="bucket trash">
										<div class="task-group trash">
											<img class="icon2" src="/assets/trash.png"/>
											<div class="label">휴지통</div>
										</div>
									    <div class="tasks">
									    <c:choose>
									        <c:when test="${empty kanbanBoard_Trash}">
									            <!-- <p>-&nbsp;&nbsp;삭제된 강의가 없습니다.</p> -->
									        </c:when>
							        		<c:otherwise>
												<c:forEach var="course" items="${kanbanBoard_Trash}">
												<c:choose>
								                    <c:when test="${course.status_code == '취소된 강의 삭제'}">
														<div class="task-card dontMove" id="course-${course.course_id}" draggable="false"data-courseid="${course.course_id}" data-boardid="${course.board_id}">
															<div class="status trash dontMove">${course.status_code}</div>
															<p class="task-name dontMove">
															<script>
										                        var originalTitle = "${course.title}";
										                        var truncatedTitle = originalTitle.length > 16 ? (originalTitle.substring(0, 16) + '...') : originalTitle;
										                        document.write(truncatedTitle);
										                    </script>
										                    </p>
															<div class="details">
																<c:choose>
																	<c:when test="${course.applyer_nickname == principal.user.nickName}">
																		<p class="requester">신청자 : ${course.applyer_nickname}</p>
																	</c:when>
																	<c:otherwise>
																		<p class="requester">요청자 : ${course.applyer_nickname}</p>
																	</c:otherwise>
																</c:choose>
																<p class="date">${course.start_date}</p>
															</div>
														</div>
													</c:when>
													<c:otherwise>
														<div class="task-card" id="course-${course.course_id}" draggable="true" ondragstart="drag(event)" data-courseid="${course.course_id}" data-boardid="${course.board_id}">
															<div class="status trash">${course.status_code}</div>
															<p class="task-name">
															<script>
										                        var originalTitle = "${course.title}";
										                        var truncatedTitle = originalTitle.length > 16 ? (originalTitle.substring(0, 16) + '...') : originalTitle;
										                        document.write(truncatedTitle);
										                    </script>
										                    </p>
															<div class="details">
																<c:choose>
																	<c:when test="${course.applyer_nickname == principal.user.nickName}">
																		<p class="requester">신청자 : ${course.applyer_nickname}</p>
																	</c:when>
																	<c:otherwise>
																		<p class="requester">요청자 : ${course.applyer_nickname}</p>
																	</c:otherwise>
																</c:choose>
																<p class="date">${course.start_date}</p>
															</div>
														</div>
													</c:otherwise>
												</c:choose>
												</c:forEach>
											</c:otherwise>
									    </c:choose>	
									    </div>
								    </div>
	
									
								</div>
							</div>
						</div>

					</div>



				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
	</div>
	
	
	
	<form id="viewForm" class="accept_detail" style="display: none;">
	    <div>
			<div class="task-card">
				<div class="status accept detail"></div>
				<p class="task-name detail-title"></p>
				<div class="details">
	                <p class="requester detail-user"></p>
	                <p class="date detail-date"></p>
				</div>
			</div>
	    <div class="button-container detail">
	        <button id="detail-complete" style="display:none;">진행 완료</button>
	        <button id="detail-cancel" style="display:none;">진행 취소</button>
			<button id="detail-reAccept" style="display:none;">다시 진행</button>
			<button id="detail-cancelAccept" style="display:none;">취소 완료</button>
	    </div>
	    
	    </div>
	</form>
	
	
	
	<!-- JavaScript -->
	<script src="/vendor/jquery/jquery.min.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		/* ************************************************************************** */
		/* 탭메뉴 */
		/* ************************************************************************** */
        function openTab(tabName, otherTabName) {
            var i, tabContent, tabButtons;
            tabContent = document.getElementsByClassName("tab-content");
            tabButtons = document.getElementsByClassName("tab-button");

            for (i = 0; i < tabContent.length; i++) {
                tabContent[i].style.display = "none";
                tabButtons[i].classList.remove("active");
            }
            
			document.getElementById(tabName).style.display = "block";
            document.querySelector("[onclick*='" + tabName + "']").classList.add("active");
            document.querySelector("[onclick*='" + otherTabName + "']").classList.remove("active");
        }

		// 첫 번째 탭 버튼에 대한 클릭 이벤트 핸들러
		const tabButton1 = document.getElementById('tab-button1');
		tabButton1.addEventListener('click', () => {
			tabButton1.classList.add('active');
			document.getElementById('tab-button2').classList.remove('active');
			// 다른 탭 버튼에 "active" 클래스를 제거
			// 탭 내용을 변경하거나 다른 작업을 수행할 수도 있음
		});

		// 두 번째 탭 버튼에 대한 클릭 이벤트 핸들러
		const tabButton2 = document.getElementById('tab-button2');
		tabButton2.addEventListener('click', () => {
			tabButton2.classList.add('active');
			document.getElementById('tab-button1').classList.remove('active');
			// 다른 탭 버튼에 "active" 클래스를 제거
			// 탭 내용을 변경하거나 다른 작업을 수행할 수도 있음
		});
		/* ************************************************************************** */
		
		$(document).ready(function() {
		/* ************************************************************************** */
		/* 칸반보드카드 */
		/* ************************************************************************** */
		// Step 1: HTML 구조를 기반으로 초기화합니다.
		const acceptBucket = document.querySelector('.bucket.accept .tasks');
		const waitingBucket = document.querySelector('.bucket.waiting .tasks');
		const rejectBucket = document.querySelector('.bucket.reject .tasks');
		const completedBucket = document.querySelector('.bucket.completed .tasks');
		const completedWaitingBucket = document.querySelector('.bucket.completed-waiting .tasks');
		const trashBucket = document.querySelector('.bucket.trash .tasks');
		
		
		// Step 2: 서버에서 데이터 가져와서 강의 카드를 동적으로 생성합니다.
		function createCourseCard(course, status) {
		    const card = document.createElement('div');
		    card.classList.add('task-card');
		    card.classList.add(`status ${status}`);
		
		    // 카드 내용 추가
		    const statusDiv = document.createElement('div');
		    statusDiv.textContent = course.status_code;
		    card.appendChild(statusDiv);
		
		    const nameP = document.createElement('p');
		    nameP.classList.add('task-name');
		    nameP.textContent = course.title;
		    card.appendChild(nameP);
		
		    const detailsDiv = document.createElement('div');
		
		    // 강의 상태에 따라 요청자/신청자 표시
		    const requesterP = document.createElement('p');
		    if (course.applyer_nickname === loginMember.id) {
		        requesterP.textContent = `신청자: ${course.applyer_nickname}`;
		    } else {
		        requesterP.textContent = `요청자: ${course.applyer_nickname}`;
		    }
		    detailsDiv.appendChild(requesterP);
		
		    // 날짜 표시
		    const dateP = document.createElement('p');
		    dateP.classList.add('date');
		    dateP.textContent = course.start_date;
		    detailsDiv.appendChild(dateP);
		
		    card.appendChild(detailsDiv);
		
		    return card;
		}
		
		
		// Step 3: 드래그 앤 드롭 기능 추가
		// * 현재 소스 버킷 확인하기 위함 *
		function findSourceBucket(card) {
		    if (card.closest('.bucket.accept')) {
		        return acceptBucket;
		    } else if (card.closest('.bucket.waiting')) {
		        return waitingBucket;
		    } else if (card.closest('.bucket.reject')) {
		        return rejectBucket;
		    } else if (card.closest('.bucket.completed')) {
		        return completedBucket;
		    } else if (card.closest('.bucket.completed-waiting')) {
		        return completedWaitingBucket;
		    } else if (card.closest('.bucket.trash')) {
		        return trashBucket;
		    } else {
		        return null;
		    }
		}
		//드래그 **************************************************************************
		/* 수락칸 이벤트리스너 */
		acceptBucket.addEventListener('dragover', allowDrop);
		acceptBucket.addEventListener('drop', function (event) {
			event.preventDefault();
	        const data = event.dataTransfer.getData('text/plain');
	        const card = document.getElementById(data);
	        const statusChange = card.querySelector('.status');
	        const dateElement = card.querySelector('.date');
	        const boardId = card.getAttribute('data-boardid');
	        
		 	// 현재 소스 버킷 확인
	        const sourceBucket = findSourceBucket(card);

	        // 이동을 허용할지 여부를 판단
	        if (sourceBucket === rejectBucket) {
	            return; // 거절칸에서 수락칸으로의 이동을 방지
	        }
	        
	     	// 서버에서 진짜 데이터가 바뀔 수 있도록 함
		    const courseId = card.getAttribute('data-courseid');
		    //---------------채팅방생성 및 재능기부 진행
		   const param = {
				agreeChat : "수락",
				receiver : $(".applyer_nickname").text(),
				board_id : boardId,
				course_id : courseId
			};
			$.ajax({
				url:"/chat/createRoom",
				method: "POST",
				contentType: "application/json; charset=UTF-8",
				data: JSON.stringify(param),
				dataType:"json",
				success:function(json){
					 if(json.bool==true){
						 alert("채팅방이 생성되었습니다.");
						 ws.send("/pub/join/agree",{},JSON.stringify({
								type:'ALARM'
								,type_string:"ALARM"
								,sender:json.chatRoom.sender
								,receiver:json.chatRoom.receiver
								}));
					 }
				}
				
			});
			
			
		    updateAccept(courseId);
		    
		    
		    
		    
		    
		    
		    
		    //화면 데이터 바뀔 수 있도록 함
	        // 클래스명, 상태 코드, 날짜 변경
	        statusChange.classList.remove('waiting');
	        statusChange.classList.add('accept');
	        statusChange.textContent = '진행 결정!';
	        
	     	// 현재 날짜로 업데이트
	        const currentDate = new Date();
	        const formattedDate = currentDate.toISOString().slice(0, 10);
	        dateElement.textContent = formattedDate;
	        
	        acceptBucket.appendChild(card);
		    
	        const waitingCards = document.querySelectorAll('.bucket.waiting .task-card');
	        waitingCards.forEach(waitingCard => {
	        	//대기칸에 있는 카드 중에 board_id가 같으면
	            if (waitingCard.getAttribute('data-boardid') === boardId) {
	                //거절칸에 추가
	                rejectBucket.appendChild(waitingCard);

	             	//화면 데이터 바뀔 수 있도록 함
	    	        // 클래스명, 상태 코드
	                const statusChange = waitingCard.querySelector('.status');
	                statusChange.classList.remove('waiting');
	                statusChange.classList.add('reject');
	                statusChange.textContent = '진행 요청 거절..';
	            }
	        });
	        acceptBucket.appendChild(card);
		    
		});
		
		/* 대기칸 이벤트리스너 */
		waitingBucket.addEventListener('dragover', allowDrop);
		waitingBucket.addEventListener('drop', function (event) {
		    event.preventDefault();
		    const data = event.dataTransfer.getData('text');
		    const card = document.getElementById(data);
		    const statusChange = card.querySelector('.status');
	        
		    const boardId = card.getAttribute('data-boardid'); // 대기칸으로 이동할 때 board_id를 가져옵니다.
			
		    console.log(boardId);
		    // 여기에서 'boardIdExistsInProgress' 함수를 사용하여 진행칸에 동일한 board_id가 있는지 확인합니다.
		    if (boardIdExistsInAccept(boardId)) {
		        alert('이미 진행을 결정한 강의입니다.');
		        return;
		    }
		    
		 	// 서버에서 진짜 데이터가 바뀔 수 있도록 함
		    const courseId = card.getAttribute('data-courseid');
		 	console.log(courseId);
		    updateWaiting(courseId);
		    
		  	//화면 데이터 바뀔 수 있도록 함
	        // 클래스명, 상태 코드, 날짜 변경
	        statusChange.classList.remove('reject');
	        statusChange.classList.add('waiting');
	        statusChange.textContent = '진행 요청이 왔어요!';
	        
		    waitingBucket.appendChild(card);
		    
		});

		// 같은 board_id가 진행칸에 있는지 확인하는 함수
		function boardIdExistsInAccept(boardId) {
		    const progressCards = document.querySelectorAll('.bucket.accept .task-card');
		    for (const card of progressCards) {
		        const cardBoardId = card.getAttribute('data-boardid');
		        console.log("cardBoardId : " , cardBoardId);
		        if (cardBoardId === boardId) {
		            return true; // 동일한 board_id가 진행칸에 있으면 true 반환
		        }
		    }
		    return false; // 동일한 board_id가 진행칸에 없으면 false 반환
		}
		
		/* 거절칸 이벤트리스너 */
		rejectBucket.addEventListener('dragover', allowDrop);
		rejectBucket.addEventListener('drop', function (event) {
		    event.preventDefault();
		    const data = event.dataTransfer.getData('text/plain');
		    const card = document.getElementById(data);
		    const statusChange = card.querySelector('.status');
	        
		 	// 현재 소스 버킷 확인
	        const sourceBucket = findSourceBucket(card);

	        // 이동을 허용할지 여부를 판단
	        if (sourceBucket === acceptBucket) {
	            return; // 수락칸에서 거절칸으로의 이동을 방지
	        }
	        
		 	// 서버에서 진짜 데이터가 바뀔 수 있도록 함
		    const courseId = card.getAttribute('data-courseid');
		    updateReject(courseId);
		    
		  	//화면 데이터 바뀔 수 있도록 함
	        // 클래스명, 상태 코드, 날짜 변경
	        statusChange.classList.remove('waiting');
	        statusChange.classList.add('reject');
	        statusChange.textContent = '진행 요청 거절..';
	        
		    rejectBucket.appendChild(card);
		});
		
		
		/* 완료수락칸 이벤트리스너 */
		completedBucket.addEventListener('dragover', allowDrop);
		completedBucket.addEventListener('drop', function (event) {
			event.preventDefault();
	        const data = event.dataTransfer.getData('text/plain');
	        const card = document.getElementById(data);
	        const statusChange = card.querySelector('.status');
	        
	     	// 서버에서 진짜 데이터가 바뀔 수 있도록 함
		    const courseId = card.getAttribute('data-courseid');
		    updateCompleted(courseId);
		    
		    //화면 데이터 바뀔 수 있도록 함
	        // 클래스명, 상태 코드, 날짜 변경
	        statusChange.classList.remove('completed-waiting');
	        statusChange.classList.remove('trash');
            statusChange.classList.add('completed');
            statusChange.textContent = '완료된 강의입니다';
	        
	        
	        completedBucket.appendChild(card);
		    
		});
		
		/* 완료대기칸 이벤트리스너 */
		completedWaitingBucket.addEventListener('dragover', allowDrop);
		completedWaitingBucket.addEventListener('drop', function (event) {
		    event.preventDefault();
		    const data = event.dataTransfer.getData('text');
		    const card = document.getElementById(data);
		    const statusChange = card.querySelector('.status');

	     	// 현재 소스 버킷 확인
	        const sourceBucket = findSourceBucket(card);

	        // 이동을 허용할지 여부를 판단
	        if (sourceBucket === completedBucket || sourceBucket === trashBucket) {
	            return; // 완료수락칸에서 완료대기칸으로의 이동을 방지, 휴지통에서 완료대기칸으로의 이동을 방지
	        }
	        
		 	// 서버에서 진짜 데이터가 바뀔 수 있도록 함
		    const courseId = card.getAttribute('data-courseid');
		    //updateReject(courseId);
		    
		  	//화면 데이터 바뀔 수 있도록 함
	        // 클래스명, 상태 코드, 날짜 변경
	        statusChange.classList.remove('trash');
	        statusChange.classList.add('completed-waiting');
	        statusChange.textContent = '완료 요청이 왔어요!';
	        
	        completedWaitingBucket.appendChild(card);
		    
		});
		
		/* 휴지통칸 이벤트리스너 */
		trashBucket.addEventListener('dragover', allowDrop);
		trashBucket.addEventListener('drop', function (event) {
		    event.preventDefault();
		    const data = event.dataTransfer.getData('text/plain');
		    const card = document.getElementById(data);
		    const statusChange = card.querySelector('.status');
	        
		 	// 현재 소스 버킷 확인
	        const sourceBucket = findSourceBucket(card);

	        // 이동을 허용할지 여부를 판단
	        if (sourceBucket === completedWaitingBucket) {
	            return; // 완료대기칸에서 휴지통칸으로의 이동을 방지
	        }
	        
		 	// 서버에서 진짜 데이터가 바뀔 수 있도록 함
		    const courseId = card.getAttribute('data-courseid');
		    updateTrash(courseId);
		    
		  	//화면 데이터 바뀔 수 있도록 함
	        // 클래스명, 상태 코드, 날짜 변경
	        statusChange.classList.remove('completed-waiting');
	        statusChange.classList.remove('completed');
	        statusChange.classList.add('trash');
	        statusChange.textContent = '완료된 강의 삭제';
	        
	        trashBucket.appendChild(card);
		});
		
		/* 대기칸에서 수락칸으로 옮겼을 때 상태코드 변화 update 함수 */
		function updateAccept(courseId) {
		    console.log(courseId);
		    
		    $.ajax({
		        url: '/myPage/updateAccept',
		        type: 'POST',
		        data: { course_id: courseId },  // Ajax 데이터로 courseId를 전달
		        success: function(response) {
		        	// 서버에서 업데이트된 데이터를 클라이언트로 받음
		            const updatedAcceptList = response.updatedAcceptList;
		        }
		    });
		}
		
		/* 대기칸에서 거절칸으로 옮겼을 때 상태코드 변화 update 함수 */
		function updateReject(courseId) {
		    console.log(courseId);
		    
		    $.ajax({
		        url: '/myPage/updateReject',
		        type: 'POST',
		        data: { course_id: courseId },  // Ajax 데이터로 courseId를 전달
		        success: function(response) {
		        	// 서버에서 업데이트된 데이터를 클라이언트로 받음
		            const updatedRejectList = response.updatedRejectList;
		        }
		    });
		}
		
		/* 거절칸에서 대기칸으로 옮겼을 때 상태코드 변화 update 함수 */
		function updateWaiting(courseId) {
		    
		    $.ajax({
		        url: '/myPage/updateWaiting',
		        type: 'POST',
		        data: { course_id: courseId },  // Ajax 데이터로 courseId를 전달
		        success: function(response) {
		        	// 서버에서 업데이트된 데이터를 클라이언트로 받음
		            const updatedWaitingList = response.updatedWaitingList;
		        }
		    });
		}
		
		/* 완료대기칸이나 휴지통에서 완료수락칸으로 옮겼을 때 상태코드 변화 update 함수 */
		function updateCompleted(courseId) {
		    
		    $.ajax({
		        url: '/myPage/updateCompleted',
		        type: 'POST',
		        data: { course_id: courseId },  // Ajax 데이터로 courseId를 전달
		        success: function(response) {
		        	// 서버에서 업데이트된 데이터를 클라이언트로 받음
		            const updatedCompletedList = response.updatedCompletedList;
		        }
		    });
		}
		
		/* 완료수락칸에서 휴지통칸으로 옮겼을 때 상태코드 변화 update 함수 */
		function updateTrash(courseId) {
		    
		    $.ajax({
		        url: '/myPage/updateTrash',
		        type: 'POST',
		        data: { course_id: courseId },  // Ajax 데이터로 courseId를 전달
		        success: function(response) {
		        	// 서버에서 업데이트된 데이터를 클라이언트로 받음
		            const updatedTrashList = response.updatedTrashList;
		        }
		    });
		}
		
		
		//드롭 ****************************************************************************
		function allowDrop(event) {
		    event.preventDefault();
		}
		
		function drop(event) {
		    event.preventDefault();
		    const data = event.dataTransfer.getData('text');
		    const card = document.getElementById(data);
		    event.target.appendChild(card);
		}
		// drag 함수 정의
      function drag(event) {
        event.dataTransfer.setData('text', event.target.id);
      }
		

		
		// Step 5
		// 대기 상태 칸반보드 카드 요소에 드래그 앤 드롭 이벤트를 추가
		const waitingCards = document.querySelectorAll('.bucket.waiting .task-card');
		
		waitingCards.forEach(card => {
		    card.setAttribute('draggable', 'true');
		    card.addEventListener('dragstart', function(event) {
		    	drag(event);
		    });
		    card.addEventListener('dragend', function() {
		        // 드래그 종료 후 필요한 동작 추가
		    	event.preventDefault();
		    });
		    card.addEventListener('dragenter', function() {
		        // 드래그된 항목이 들어왔을 때 필요한 동작 추가
		    	event.preventDefault();
		    });
		    card.addEventListener('dragleave', function() {
		        // 드래그된 항목이 범위를 벗어났을 때 필요한 동작 추가
		    	event.preventDefault();
		    });
		    card.addEventListener('dragover', function(event) {
		        event.preventDefault();
		    });
		    card.addEventListener('drop', function(event) {
		        event.preventDefault();
		        const courseId = card.getAttribute('data-courseid');
		        //updateAccept(courseId);
		        event.target.appendChild(document.getElementById(event.dataTransfer.getData('text')));

		    });
		});
		
		// 대기 상태(본인이 신청한글) 칸반보드 카드 요소에 드래그 앤 드롭 이벤트 해제
		const dontMoveCards = document.querySelectorAll('.bucket.waiting .task-card.dontMove');
		
		dontMoveCards.forEach(card => {
		    card.setAttribute('draggable', 'false');
		});
		    
		// 거절 상태 칸반보드 카드 요소에 드래그 앤 드롭 이벤트
		const rejectCards = document.querySelectorAll('.bucket.reject .task-card');

		rejectCards.forEach(card => {
		    card.setAttribute('draggable', 'true');
		    card.addEventListener('dragstart', function(event) {
		    	drag(event);
		    });
		    card.addEventListener('dragend', function() {
		        // 드래그 종료 후 필요한 동작 추가
		    	event.preventDefault();
		    });
		    card.addEventListener('dragenter', function() {
		        // 드래그된 항목이 들어왔을 때 필요한 동작 추가
		    	event.preventDefault();
		    });
		    card.addEventListener('dragleave', function() {
		        // 드래그된 항목이 범위를 벗어났을 때 필요한 동작 추가
		    	event.preventDefault();
		    });
		    card.addEventListener('dragover', function(event) {
		        event.preventDefault();
		    });
		    card.addEventListener('drop', function(event) {
		        event.preventDefault();
		        const courseId = card.getAttribute('data-courseid');
		        event.target.appendChild(document.getElementById(event.dataTransfer.getData('text')));

		    });
		});
		
		// 거절 상태(본인이 신청한글) 칸반보드 카드 요소에 드래그 앤 드롭 이벤트 해제
		const dontMove2Cards = document.querySelectorAll('.bucket.reject .task-card.dontMove');
		
		dontMove2Cards.forEach(card => {
		    card.setAttribute('draggable', 'false');
		});
		
		const completedCards = document.querySelectorAll('.bucket.completed .task-card');
		
		completedCards.forEach(card => {
		    card.setAttribute('draggable', 'true');
		    card.addEventListener('dragstart', function(event) {
		    	drag(event);
		    });
		    card.addEventListener('dragend', function() {
		        // 드래그 종료 후 필요한 동작 추가
		    	event.preventDefault();
		    });
		    card.addEventListener('dragenter', function() {
		        // 드래그된 항목이 들어왔을 때 필요한 동작 추가
		    	event.preventDefault();
		    });
		    card.addEventListener('dragleave', function() {
		        // 드래그된 항목이 범위를 벗어났을 때 필요한 동작 추가
		    	event.preventDefault();
		    });
		    card.addEventListener('dragover', function(event) {
		        event.preventDefault();
		    });
		    card.addEventListener('drop', function(event) {
		        event.preventDefault();
		        const courseId = card.getAttribute('data-courseid');
		        event.target.appendChild(document.getElementById(event.dataTransfer.getData('text')));
		    });
		});
		
		// 완료대기 상태 칸반보드 카드 요소에 드래그 앤 드롭 이벤트
		const completedWaitingCards = document.querySelectorAll('.bucket.completed-waiting .task-card');
		
		completedWaitingCards.forEach(card => {
		    card.setAttribute('draggable', 'true');
		    card.addEventListener('dragstart', function(event) {
		    	drag(event);
		    });
		    card.addEventListener('dragend', function() {
		        // 드래그 종료 후 필요한 동작 추가
		    	event.preventDefault();
		    });
		    card.addEventListener('dragenter', function() {
		        // 드래그된 항목이 들어왔을 때 필요한 동작 추가
		    	event.preventDefault();
		    });
		    card.addEventListener('dragleave', function() {
		        // 드래그된 항목이 범위를 벗어났을 때 필요한 동작 추가
		    	event.preventDefault();
		    });
		    card.addEventListener('dragover', function(event) {
		        event.preventDefault();
		    });
		    card.addEventListener('drop', function(event) {
		        event.preventDefault();
		        const courseId = card.getAttribute('data-courseid');
		        event.target.appendChild(document.getElementById(event.dataTransfer.getData('text')));
		    });
		});
		
		// 완료대기 상태(본인이 완료요청한 글) 칸반보드 카드 요소에 드래그 앤 드롭 이벤트 해제
		const completedWaiting2Cards = document.querySelectorAll('.bucket.completed-waiting .task-card.dontMove');
		
		completedWaiting2Cards.forEach(card => {
		    card.setAttribute('draggable', 'false');
		});
		
		// 휴지통 상태 칸반보드 카드 요소에 드래그 앤 드롭 이벤트
		const trashCards = document.querySelectorAll('.bucket.trash .task-card');
		
		trashCards.forEach(card => {
		    card.setAttribute('draggable', 'true');
		    card.addEventListener('dragstart', function(event) {
		    	drag(event);
		    });
		    card.addEventListener('dragend', function() {
		        // 드래그 종료 후 필요한 동작 추가
		    	event.preventDefault();
		    });
		    card.addEventListener('dragenter', function() {
		        // 드래그된 항목이 들어왔을 때 필요한 동작 추가
		    	event.preventDefault();
		    });
		    card.addEventListener('dragleave', function() {
		        // 드래그된 항목이 범위를 벗어났을 때 필요한 동작 추가
		    	event.preventDefault();
		    });
		    card.addEventListener('dragover', function(event) {
		        event.preventDefault();
		    });
		    card.addEventListener('drop', function(event) {
		        event.preventDefault();
		        const courseId = card.getAttribute('data-courseid');
		        event.target.appendChild(document.getElementById(event.dataTransfer.getData('text')));
		    });
		});
		
		// 휴지통 상태 칸반보드 카드 요소에 드래그 앤 드롭 이벤트 해제
		const trash2Cards = document.querySelectorAll('.bucket.completed-waiting .task-card.dontMove');
		
		trash2Cards.forEach(card => {
		    card.setAttribute('draggable', 'false');
		});

		
		$(document).ready(function() {
		    // 모달 대화 상자 초기화
		    $("#viewForm").dialog({
		        autoOpen: false, // 처음에는 자동으로 열리지 않음
		        modal: true, // 모달 형식으로 표시
		        width: 370,
		        height: 290,
		        buttons: {
		            "닫기": function() {
		                $(this).dialog("close");
		            }
		        },
		        close: function() {
		            // 모달이 닫힐 때 수행할 동작
		        }
		    });

		    // 클릭 이벤트 핸들러
		    $(".kanban-board .bucket.accept .tasks .task-card").click(function(e) {
		        e.preventDefault();
		        
		        const courseId = $(this).data("courseid");
		        console.log("Clicked Course ID:", courseId);
		        
		        $.ajax({
		            type: "POST",
		            url: '/myPage/detailAccept',
		            data: { course_id: courseId },
		            success: function(response) {
	            		const course = response.course;
	            		console.log(course);
	            		
	            		$(".status.accept.detail").text(course.status_code);
	            		$(".task-name.detail-title").text(course.title);
	            		$(".details .date.detail-date").text("시작날짜 : " + course.start_date);
	            		
	            		// 사용자 레이블 설정
	                    const requesterLabel = (course.applyer_nickname === "${loginMember.id}") ? '신청자' : '요청자';
	                    const labelText = requesterLabel + ": " + course.applyer_nickname;
	                    $(".details .requester.detail-user").text(labelText);

	            		// 모달 대화 상자 열기
	    		        $("#viewForm").dialog("open");
	            		
	            		if (course.status_code === '진행 결정!') {
	            			$("#detail-complete").show();
	                        $("#detail-cancel").show();
	                        $("#detail-reAccept").hide();
	                        $("#detail-cancelAccept").hide();
	            		} else if (course.status_code === '진행 취소요청 보냄') {
	            			$("#detail-complete").hide();
	                        $("#detail-cancel").hide();
	                        $("#detail-reAccept").show();
	                        $("#detail-cancelAccept").hide();
	            		} else if (course.status_code == '진행 취소요청이 왔어요'){
	            			$("#detail-complete").hide();
	                        $("#detail-cancel").hide();
	                        $("#detail-reAccept").hide();
	                        $("#detail-cancelAccept").show();
	            		} 
	            		
		            }
			       
		        
		        });
		    });
		    
		    
		    $("#detail-complete").click(function(e) {
		    	e.preventDefault();
		    	
		    	const courseId = $(".kanban-board .bucket.accept .tasks .task-card").data("courseid");
		    	console.log(courseId);
		    	
		    	$.ajax({
		            type: "POST",
		            url: '/myPage/updateCompletedWaiting',
		            data: { course_id: courseId },
		            success: function(response) {
	            		const updatedCompletedWaitingList = response.updatedCompletedWaitingList;
		            
	            		// "completedWaitingBucket"로부터 카드 리스트를 가져옴
	                    const completedWaitingBucket = $(".kanban-board .bucket.completedWaiting .tasks");
	                    
	                    // "acceptBucket"로부터 카드 리스트를 가져옴
	                    const acceptBucket = $(".kanban-board .bucket.accept .tasks");
	                    
	                 	// "acceptBucket"로부터 해당 테스크 카드를 찾아내어 제거하고
	                    const taskCard = $(".kanban-board .bucket.accept .tasks .task-card[data-courseid='" + courseId + "']");
	                    taskCard.remove();

	                 	// 테스크 카드 클래스 변경
	                    taskCard.removeClass("task-card").addClass("task-card dontMove");

	                    // status 클래스 변경
	                    const statusElement = taskCard.find(".status");
	                    statusElement.removeClass("accept").addClass("completed-waiting dontMove");
	                    statusElement.text("완료 결정 기다리는 중..");
	                    
	                    // "completedWaitingBucket"로 이동시킬 테스크 카드 생성
	                    const taskCardClone = taskCard.clone();

	                    // "completedWaitingBucket"에 테스크 카드 추가
	                    $(".kanban-board .bucket.completed-waiting .tasks").append(taskCardClone);

	                    
	                    $("#viewForm").dialog("close");
	                    alert('완료요청');
		            }
		            
		    	}); 
		    	
		    });
		    
		    $("#detail-cancel").click(function(e) {
		    	e.preventDefault();
		    	
		    	const courseId = $(".kanban-board .bucket.accept .tasks .task-card").data("courseid");
		    	console.log(courseId);
		    	
		    	$.ajax({
		            type: "POST",
		            url: '/myPage/updateCancel',
		            data: { course_id: courseId },
		            success: function(response) { 
	            		const updatedCalcelList = response.updatedCalcelList;

	                    // "acceptBucket"로부터 카드 리스트를 가져옴
	                    const acceptBucket = $(".kanban-board .bucket.accept .tasks");
	                    
	                    const taskCard = $(".kanban-board .bucket.accept .tasks .task-card[data-courseid='" + courseId + "']");
	                 
	                 	// 테스크 카드 클래스 변경
	                    taskCard.addClass("dontMove");

	                    // status 클래스 변경
	                    const statusElement = taskCard.find(".status");
	                    statusElement.addClass("dontMove");
	                    statusElement.text("진행 취소요청 보냄");
	                    
	                 	// title 클래스 변경
	                    const titleElement = taskCard.find(".task-name");
	                    titleElement.addClass("dontMove");
	                    
	                    $("#viewForm").dialog("close");
	                    alert('진행 취소 요청');
		           }
		            
		    	}); 
		    	
		    });
		    
		    $("#detail-reAccept").click(function(e) {
		    	e.preventDefault();
		    	
		    	const courseId = $(".kanban-board .bucket.accept .tasks .task-card.dontMove").data("courseid");
		    	console.log(courseId);
		    	
		    	$.ajax({
		            type: "POST",
		            url: '/myPage/updateReAccept',
		            data: { course_id: courseId },
		            success: function(response) { 
	            		const updatedReAcceptList = response.updatedReAcceptList;

	                    // "acceptBucket"로부터 카드 리스트를 가져옴
	                    const acceptBucket = $(".kanban-board .bucket.accept .tasks");
	                    
	                    const taskCard = $(".kanban-board .bucket.accept .tasks .task-card[data-courseid='" + courseId + "']");
	                 
	                 	// 테스크 카드 클래스 변경
	                    taskCard.removeClass("task-card dontMove").addClass("task-card");

	                    // status 클래스 변경
	                    const statusElement = taskCard.find(".status");
	                    statusElement.removeClass("accept dontMove").addClass("accept");
	                    statusElement.text("진행 결정!");
	                    
	                 	// title 클래스 변경
	                    const titleElement = taskCard.find(".task-name");
	                    titleElement.removeClass("dontMove");
	                    
	                    $("#viewForm").dialog("close");
	                    alert('다시 진행 요청');
		           }
		            
		    	}); 
		    	
		    });
		    
		    $("#detail-cancelAccept").click(function(e) {
		    	e.preventDefault();
		    	
		    	const courseId = $(".kanban-board .bucket.accept .tasks .task-card.dontMove").data("courseid");
		    	console.log(courseId);
		    	
		    	$.ajax({
		            type: "POST",
		            url: '/myPage/updateCancelAccept',
		            data: { course_id: courseId },
		            success: function(response) { 
	            		const updatedCancelAcceptList = response.updatedCancelAcceptList;
	                    
	            		// "trashBucket"로부터 카드 리스트를 가져옴
	                    const trashBucket = $(".kanban-board .bucket.trash .tasks");
	            		
	                    // "acceptBucket"로부터 카드 리스트를 가져옴
	                    const acceptBucket = $(".kanban-board .bucket.accept .tasks");
	                    
	                 	// "acceptBucket"로부터 해당 테스크 카드를 찾아내어 제거하고
	                    const taskCard = $(".kanban-board .bucket.accept .tasks .task-card[data-courseid='" + courseId + "']");
	                    taskCard.remove();
	                    
	                 	// 테스크 카드 클래스 변경
	                    taskCard.removeClass("task-card").addClass("task-card dontMove");

	                    // status 클래스 변경
	                    const statusElement = taskCard.find(".status");
	                    statusElement.removeClass("accept").addClass("trash dontMove");
	                    statusElement.text("취소된 강의 삭제");
	                    
	                    // "trashBucket"로 이동시킬 테스크 카드 생성
	                    const taskCardClone = taskCard.clone();

	                    // "trashBucket"에 테스크 카드 추가
	                    $(".kanban-board .bucket.trash .tasks").append(taskCardClone);
	                    
	                    $("#viewForm").dialog("close");
	                    alert('진행 취소 완료. 휴지통으로 이동합니다.');
		           }
		            
		    	}); 
		    	
		    });
		    
		    
		    
		    
		    
		    
		    
		});
	});
		
    </script>
</body>

</html>
