<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!doctype html>
<html lang="ko">

<head>
	<title>MyPage_course_recruiting</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="/vendor/linearicons/style.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="/styles/myPage.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="/assets/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="/assets/favicon.png">
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
									<li><a href="/myPage/course_recruiting" class="active">모집 중인 내 강의</a></li>
									<li><a href="/myPage/course_proceeding" class="">진행 중인 강의</a></li>
									<li><a href="#" class="">신청이 온 진행중 강의</a></li>
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
					<div class="row">
						<div class="container">
							
							<div class="panel-heading">
								<h1 class="panel-title recruiting">모집중</h3>
							</div>
							<!-- BASIC TABLE -->
							<div class="panel">
								<div class="table_course">
									
									<div class="delete-button">
										<button class="allDelete">선택삭제</button>
									</div>

									<table class="group-table">
										<tr>
										<th class="column-header"><input type="checkbox" class="checkbox-input"></th>
										<th class="column-header">게시글 번호</th>
										<th class="column-header">게시글 제목</th>
										<th class="column-header">주는 재능</th>
										<th class="column-header">&</th>
										<th class="column-header">받을 재능</th>
										<th class="column-header">삭제여부</th>
										</tr>
										
										<c:forEach var="kanban" items="${kanbanList}">
										<tr>
										<td class="data-cell"><input type="checkbox" class="checkbox-input"></td>
										<td class="data-cell">${kanban.board_id}</td>
										<td class="data-cell title">${kanban.title}</td>
										<td class="data-cell">${kanban.give_talent}</td>
										<td class="data-cell"><img class="give-and-take-icon" src="/assets/giveAndTake.png"/></td>
										<td class="data-cell">${kanban.receive_talent}</td>
										<td class="data-cell"><button>삭제</button></td>
										</tr>
										</c:forEach>
										
										<c:if test="${empty kanbanList}">
						            	<tr>
						            		<td class="search">검색결과가 없습니다</td>
						             	</tr>
							            </c:if>
							            <!-- 
										<tr>
										<td class="data-cell"><input type="checkbox" class="checkbox-input"></td>
										<td class="data-cell">02</td>
										<td class="data-cell title">고등 수학 가르쳐 주실 분 구합니다</td>
										<td class="data-cell">과탐</td>
										<td class="data-cell"><img class="give-and-take-icon" src="/assets/giveAndTake.png"/></td>
										<td class="data-cell">수학</td>
										<td class="data-cell"><button>삭제</button></td>
										</tr>
										<tr>
										<td class="data-cell"><input type="checkbox" class="checkbox-input"></td>
										<td class="data-cell">03</td>
										<td class="data-cell title">피아노 가르쳐 주실 분 구합니다. 보컬수 ...</td>
										<td class="data-cell">보컬</td>
										<td class="data-cell"><img class="give-and-take-icon" src="/assets/giveAndTake.png"/></td>
										<td class="data-cell">피아노</td>
										<td class="data-cell"><button>삭제</button></td>
										</tr>
										<tr>
										<td class="data-cell"><input type="checkbox" class="checkbox-input"></td>
										<td class="data-cell">04</td>
										<td class="data-cell title">운전 연수해주실 분</td>
										<td class="data-cell">코딩</td>
										<td class="data-cell"><img class="give-and-take-icon" src="/assets/giveAndTake.png"/></td>
										<td class="data-cell">운전</td>
										<td class="data-cell"><button>삭제</button></td>
										</tr>
										<tr>
										<td class="data-cell"><input type="checkbox" class="checkbox-input"></td>
										<td class="data-cell">05</td>
										<td class="data-cell title">피아노 가르쳐 주실 분 구합니다. 보컬수 ...</td>
										<td class="data-cell">보컬</td>
										<td class="data-cell"><img class="give-and-take-icon" src="/assets/giveAndTake.png"/></td>
										<td class="data-cell">피아노</td>
										<td class="data-cell"><button>삭제</button></td>
										</tr> -->
									</table>
									
								</div>  
								  
							</div>
							<!-- END BASIC TABLE -->
						</div>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
	</div>
	<!-- Javascript -->
	<script src="/vendor/jquery/jquery.min.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
</body>

</html>
