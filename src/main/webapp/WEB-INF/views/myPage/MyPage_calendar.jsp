<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
	<title>MyPage_calendar</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="vendor/linearicons/style.css">
	<link rel="stylesheet" href="vendor/chartist/css/chartist-custom.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="styles/MyPage.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="assets/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/favicon.png">
	<!-- FullCalendar -->
	<link href='/resources/fullcalendar-5.6.0/lib/main.css' rel='stylesheet' />
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
							<a href="#subPages" data-toggle="collapse" class="collapsed"><i class="lnr lnr-pencil"></i> <span>강의 목록</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages" class="collapse ">
								<ul class="nav">
									<li><a href="MyPage_course_recruiting.html" class="">모집 중인 내 강의</a></li>
									<li><a href="MyPage_course_proceeding.html" class="">진행 중인 강의</a></li>
									<li><a href="#" class="">신청이 온 진행중 강의</a></li>
								</ul>
							</div>
						</li>
						<li><a href="MyPage_calendar.html" class="active"><i class="fa fa-calendar"></i> <span>일정 관리</span></a></li>
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
					<div id="calendar"></div>


				</div>
			</div>
		</div>
	</div>
	<!-- Javascript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	    <!-- fullCalendar API -->
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
	<script>

	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView: 'dayGridMonth',
			contentHeight: 650 ,
			//aspectRatio: 5// 기본값 : 1.35 | Type : Float
								// 너비가 높이의 두 배
			
		});
		calendar.render();
	});

	</script>
</body>

</html>
