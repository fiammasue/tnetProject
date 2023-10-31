<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
	<title>MyPage_course</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="vendor/linearicons/style.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="styles/MyPage.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
</head>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li><a href="MyPage_userInfo.html" class=""><i class="lnr lnr-user"></i> <span>내 정보</span></a></li>
						<li>
							<a href="#subPages" data-toggle="collapse" class="active"><i class="lnr lnr-pencil"></i> <span>강의 목록</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages" class="collapse in">
								<ul class="nav">
									<li><a href="MyPage_course_recruiting.html" class="">모집 중인 내 강의</a></li>
									<li><a href="MyPage_course_proceeding.html" class="active">진행 중인 강의</a></li>
									<li><a href="#" class="">신청이 온 진행중 강의</a></li>
								</ul>
							</div>
						</li>
						<li><a href="MyPage_calendar.html" class=""><i class="fa fa-calendar"></i> <span>일정 관리</span></a></li>
						<li><a href="MyPage_chatRoom.html" class=""><i class="fa fa-envelope"></i> <span>채팅방 목록</span></a></li>
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
						<div class="tab-content active" id="tab1">
							<div class="row">
								<div class="kanban-board">
									<div class="bucket accept">
										<div class="task-group accept">
											<img class="icon" src="assets/accept-icon.png"/>
											<p class="label">수락</p>
										</div>
										<div class="tasks">
											<div class="task-card">
												<div class="status accept">진행 결정!</div>
												<p class="task-name">Short task name</p>
												<div class="details">
													<p class="requester">요청자 : 유저이</p>
													<p class="date">2022/09/27</p>
												</div>
											</div>
											<!-- 나머지 작업 카드 -->
											<div class="task-card">
												<div class="status accept">진행 결정!</div>
												<p class="task-name">Short task name</p>
												<div class="details">
													<p class="requester">요청자 : 유저이</p>
													<p class="date">2022/09/27</p>
												</div>
											</div>
											<div class="task-card">
												<div class="status accept">진행 결정!</div>
												<p class="task-name">Short task name</p>
												<div class="details">
													<p class="requester">요청자 : 유저이</p>
													<p class="date">2022/09/27</p>
												</div>
											</div>
											<div class="task-card">
												<div class="status accept">진행 결정!</div>
												<p class="task-name">Short task name</p>
												<div class="details">
													<p class="requester">요청자 : 유저이</p>
													<p class="date">2022/09/27</p>
												</div>
											</div>
											<div class="task-card">
												<div class="status accept">진행 결정!</div>
												<p class="task-name">Short task name</p>
												<div class="details">
													<p class="requester">요청자 : 유저이</p>
													<p class="date">2022/09/27</p>
												</div>
											</div>
										</div>

										<div class="separator"></div>
									</div>

									<div class="bucket waiting">
										<div class="task-group waiting">
											<img class="icon" src="assets/waiting-icon.png"/>
											<p class="label">대기</p>
										</div>
										<div class="tasks">
											<div class="task-card">
												<div class="status waiting">요청 기다리는중!</div>
												<p class="task-name">방송 댄스 배우실 분 구해요!!</p>
												<div class="details">
													<p class="requester">요청자 : 유저이</p>
													<p class="date">2022/09/27</p>
												</div>
											</div>
											<!-- 나머지 작업 카드 -->
											<div class="task-card">
												<div class="status waiting">요청 기다리는중!</div>
												<p class="task-name">방송 댄스 배우실 분 구해요!!</p>
												<div class="details">
													<p class="requester">요청자 : 유저이</p>
													<p class="date">2022/09/27</p>
												</div>
											</div>
											<div class="task-card">
												<div class="status waiting">요청 기다리는중!</div>
												<p class="task-name">방송 댄스 배우실 분 구해요!!</p>
												<div class="details">
													<p class="requester">요청자 : 유저이</p>
													<p class="date">2022/09/27</p>
												</div>
											</div>
										</div>
									</div>

									<div class="bucket reject">

										<div class="task-group reject">
											<img class="icon" src="assets/reject-icon.png"/>
											<p class="label">거절</p>
										</div>
										<div class="tasks">
											<div class="task-card">
												<div class="status reject">요청 거절..</div>
												<p class="task-name">방송 댄스 배우실 분 구해요!!</p>
												<div class="details">
													<p class="requester">요청자 : 유저이</p>
													<p class="date">2022/09/27</p>
												</div>
											</div>
											<!-- 나머지 작업 카드 -->
											<div class="task-card">
												<div class="status reject">요청 거절..</div>
												<p class="task-name">방송 댄스 배우실 분 구해요!!</p>
												<div class="details">
													<p class="requester">요청자 : 유저이</p>
													<p class="date">2022/09/27</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="tab-content" id="tab2">
							<div class="row">
								<div class="kanban-board">
									<div class="bucket completed">
										<div class="task-group completed">
										  <img class="icon" src="assets/completed-icon.png"/>
										  <div class="label">완료</div>
										</div>
										<div class="tasks">
											<div class="task-card">
												<div class="status completed">완료된 강의입니다</div>
												<p class="task-name">Short task name</p>
												<div class="details">
														<p class="requester">요청자 : 유저이</p>
														<p class="date">2022/09/27</p>
												</div>
											</div>
											<!-- 나머지 작업 카드 -->
											<div class="task-card">
												<div class="status completed">완료된 강의입니다</div>
												<p class="task-name">Short task name</p>
												<div class="details">
														<p class="requester">요청자 : 유저이</p>
														<p class="date">2022/09/27</p>
												</div>
											</div>
											<div class="task-card">
												<div class="status completed">완료된 강의입니다</div>
												<p class="task-name">Short task name</p>
												<div class="details">
														<p class="requester">요청자 : 유저이</p>
														<p class="date">2022/09/27</p>
												</div>
											</div>
											<div class="task-card">
												<div class="status completed">완료된 강의입니다</div>
												<p class="task-name">Short task name</p>
												<div class="details">
														<p class="requester">요청자 : 유저이</p>
														<p class="date">2022/09/27</p>
												</div>
											</div>
											<div class="task-card">
												<div class="status completed">완료된 강의입니다</div>
												<p class="task-name">Short task name</p>
												<div class="details">
														<p class="requester">요청자 : 유저이</p>
														<p class="date">2022/09/27</p>
												</div>
											</div>
											<div class="task-card">
												<div class="status completed">완료된 강의입니다</div>
												<p class="task-name">Short task name</p>
												<div class="details">
														<p class="requester">요청자 : 유저이</p>
														<p class="date">2022/09/27</p>
												</div>
											</div>
									  	</div>
									</div>

									<div class="bucket completed-waiting">
										<div class="task-group completed-waiting">
											<img class="icon" src="assets/waiting-icon.png"/>
											<p class="label">대기</p>
										</div>
										<div class="tasks">
											<div class="task-card">
												<div class="status completed-waiting">완료 확인받길 기다리는중..</div>
												<p class="task-name">방송 댄스 배우실 분 구해요!!</p>
												<div class="details">
													<p class="requester">요청자 : 유저이</p>
													<p class="date">2022/09/27</p>
												</div>
											</div>
											<!-- 나머지 작업 카드 -->
											<div class="task-card">
												<div class="status completed-waiting">완료 확인받길 기다리는중..</div>
												<p class="task-name">방송 댄스 배우실 분 구해요!!</p>
												<div class="details">
													<p class="requester">요청자 : 유저이</p>
													<p class="date">2022/09/27</p>
												</div>
											</div>
											<div class="task-card">
												<div class="status completed-waiting">완료 확인받길 기다리는중..</div>
												<p class="task-name">방송 댄스 배우실 분 구해요!!</p>
												<div class="details">
													<p class="requester">요청자 : 유저이</p>
													<p class="date">2022/09/27</p>
												</div>
											</div>
										</div>
									</div>

									<div class="bucket trash">
									  <div class="task-group trash">
										  <img class="icon2" src="assets/trash.png"/>
										  <div class="label">휴지통</div>
									  </div>
									  <div class="tasks">
											<div class="task-card">
												<div class="status trash">완료된 강의 삭제!</div>
												<p class="task-name">방송 댄스 배우실 분 구해요!!</p>
												<div class="details">
													<p class="requester">요청자 : 유저이</p>
													<p class="date">2022/09/27</p>
												</div>
											<!-- 나머지 작업 카드 -->
											</div>
									  </div>
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
	<!-- Javascript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script>
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
		
    </script>
</body>

</html>
