<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" href="/vendor/chartist/css/chartist-custom.css">
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
					<h2 class="panel-title recruiting">채팅방 목록</h3>
				</div>
				<div class="container-fluid">
					<div class="panel chat-room-list">
						<div class="chat-frames">
							<div class="chat-room">
								<div class="user-info">
									<img class="user-avatar" src="/assets/user_chat.png"/>
									<p class="user-name">유저이</p>
								</div>
								<div class="chat-details">
									<p class="room-title">영어 알려주는 방</p>
									<p class="room-schedule">언제가 편하실까요?</p>
								</div>
								<div class="chat-metadata">
									<p class="chat-timestamp">7:36 PM</p>
									<div class="unread-messages">3</div>
								</div>
							</div>
							<!-- Add more chat room entries here -->
							<div class="chat-room">
								<div class="user-info">
									<img class="user-avatar" src="/assets/user_chat.png"/>
									<p class="user-name">유저이</p>
								</div>
								<div class="chat-details">
									<p class="room-title">영어 알려주는 방</p>
									<p class="room-schedule">언제가 편하실까요?</p>
								</div>
								<div class="chat-metadata">
									<p class="chat-timestamp">7:36 PM</p>
									<div class="unread-messages">3</div>
								</div>
							</div>
							<div class="chat-room">
								<div class="user-info">
									<img class="user-avatar" src="/assets/user_chat.png"/>
									<p class="user-name">유저이</p>
								</div>
								<div class="chat-details">
									<p class="room-title">영어 알려주는 방</p>
									<p class="room-schedule">언제가 편하실까요?</p>
								</div>
								<div class="chat-metadata">
									<p class="chat-timestamp">7:36 PM</p>
									<div class="unread-messages">3</div>
								</div>
							</div>
							<div class="chat-room">
								<div class="user-info">
									<img class="user-avatar" src="/assets/user_chat.png"/>
									<p class="user-name">유저이</p>
								</div>
								<div class="chat-details">
									<p class="room-title">영어 알려주는 방</p>
									<p class="room-schedule">언제가 편하실까요?</p>
								</div>
								<div class="chat-metadata">
									<p class="chat-timestamp">7:36 PM</p>
									<div class="unread-messages">3</div>
								</div>
							</div>
							<div class="chat-room">
								<div class="user-info">
									<img class="user-avatar" src="/assets/user_chat.png"/>
									<p class="user-name">유저이</p>
								</div>
								<div class="chat-details">
									<p class="room-title">영어 알려주는 방</p>
									<p class="room-schedule">언제가 편하실까요?</p>
								</div>
								<div class="chat-metadata">
									<p class="chat-timestamp">7:36 PM</p>
									<div class="unread-messages">3</div>
								</div>
							</div>
							<div class="chat-room">
								<div class="user-info">
									<img class="user-avatar" src="/assets/user_chat.png"/>
									<p class="user-name">유저이</p>
								</div>
								<div class="chat-details">
									<p class="room-title">영어 알려주는 방</p>
									<p class="room-schedule">언제가 편하실까요?</p>
								</div>
								<div class="chat-metadata">
									<p class="chat-timestamp">7:36 PM</p>
									<div class="unread-messages">3</div>
								</div>
							</div>
							<div class="chat-room">
								<div class="user-info">
									<img class="user-avatar" src="/assets/user_chat.png"/>
									<p class="user-name">유저이</p>
								</div>
								<div class="chat-details">
									<p class="room-title">영어 알려주는 방</p>
									<p class="room-schedule">언제가 편하실까요?</p>
								</div>
								<div class="chat-metadata">
									<p class="chat-timestamp">7:36 PM</p>
									<div class="unread-messages">3</div>
								</div>
							</div>
							<div class="chat-room">
								<div class="user-info">
									<img class="user-avatar" src="/assets/user_chat.png"/>
									<p class="user-name">유저이</p>
								</div>
								<div class="chat-details">
									<p class="room-title">영어 알려주는 방</p>
									<p class="room-schedule">언제가 편하실까요?</p>
								</div>
								<div class="chat-metadata">
									<p class="chat-timestamp">7:36 PM</p>
									<div class="unread-messages">3</div>
								</div>
							</div>
							<div class="chat-room">
								<div class="user-info">
									<img class="user-avatar" src="/assets/user_chat.png"/>
									<p class="user-name">유저이</p>
								</div>
								<div class="chat-details">
									<p class="room-title">영어 알려주는 방</p>
									<p class="room-schedule">언제가 편하실까요?</p>
								</div>
								<div class="chat-metadata">
									<p class="chat-timestamp">7:36 PM</p>
									<div class="unread-messages">3</div>
								</div>
							</div>
						</div>
					</div>
					


				</div>
			</div>
		</div>
	</div>
		
	<!-- Javascript -->
	<script src="/vendor/jquery/jquery.min.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>

</body>

</html>
