<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()"> <!-- 인증이 됐는지안됐는지 확인하는 구문 -->
   <sec:authentication property="principal" var="principal"/> <!-- property로 가져와서 var 데이터타입으로 대입하겠다는뜻 -->
</sec:authorize>

<!doctype html>
<html lang="ko">

<head>
	<title>MyPage_calendar</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<!-- <link rel="stylesheet" href="/vendor/bootstrap/css/bootstrap.min.css"> -->
	<link rel="stylesheet" href="/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="/vendor/linearicons/style.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="/styles/myPage.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="/assets/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="/assets/favicon.png">
	<!-- FullCalendar -->
	<link href='/resources/fullcalendar-5.6.0/lib/main.css' rel='stylesheet' />
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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
								</ul>
							</div>
						</li>
						<li><a href="/myPage/calendar" class="active"><i class="fa fa-calendar"></i> <span>일정 관리</span></a></li>
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
					<div id="calendar"></div>

					<!-- 일청추가 모달 -->
				    <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
				        aria-hidden="true">
				        <div class="modal-dialog" role="document">
				            <div class="modal-content">
				                <div class="modal-header">
				                    <h5 class="modal-title" id="exampleModalLabel">일정을 입력하세요.</h5>
				                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                        <span aria-hidden="true">&times;</span>
				                    </button>
				                </div>
				                <div class="modal-body">
				                    <div class="form-group">
				                    	<label for="taskId" class="col-form-label">진행중인 강의 선택</label>
					                    <select class="form-control" id="lecture_select" name="lecture_select">
					                        <!-- 여기에 수강 강의 목록을 동적으로 추가 -->
					                    </select>
					                    <input type="hidden" id="editScheduleId" name="editScheduleId" value="">
				                        <label for="taskId" class="col-form-label">일정 내용</label>
				                        <input type="text" class="form-control" id="calendar_content" name="calendar_content">
				                        <label for="taskId" class="col-form-label">시작 날짜</label>
				                        <input type="datetime-local" class="form-control" id="calendar_start_datetime" name="calendar_start_datetime">
				                        <label for="taskId" class="col-form-label">종료 날짜</label>
				                        <input type="datetime-local" class="form-control" id="calendar_end_datetime" name="calendar_end_datetime">
				                    	<label for="calendar_color" class="col-form-label">일정 색상 선택</label>
										<select class="form-control" id="calendar_color" name="calendar_color">
										    <option value="#3498db" style="color: #3498db; font-weight:bold;">파란색</option>
										    <option value="#2ecc71" style="color: #2ecc71; font-weight:bold;">녹색</option>
										    <option value="#e74c3c" style="color: #e74c3c; font-weight:bold;">빨간색</option>
										    <option value="#f39c12" style="color: #f39c12; font-weight:bold;">주황색</option>
										    <option value="#9b59b6" style="color: #9b59b6; font-weight:bold;">보라색</option>
										    <option value="#1abc9c" style="color: #1abc9c; font-weight:bold;">청록색</option>
										    <option value="#f1c40f" style="color: #f1c40f; font-weight:bold;">노란색</option>
										    <option value="#34495e" style="color: #34495e; font-weight:bold;">회색</option>
										</select>
				                    </div>
				                </div>
				                <div class="modal-footer">
				                    <button type="button" class="btn btn-warning" id="addCalendar">추가</button>
				                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
				                        id="sprintSettingModalClose">취소</button>
				                </div>
				    
				            </div>
				        </div>
				    </div>

					<!-- 일정 상세보기 모달 -->
					<div class="modal fade" id="eventModal" tabindex="-1" role="dialog" aria-labelledby="eventModalLabel" aria-hidden="true">
					    <div class="modal-dialog" role="document">
					        <div class="modal-content">
					            <div class="modal-header">
					                <h5 class="modal-title" id="eventModalLabel">일정 상세 정보</h5>
					                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					                    <span aria-hidden="true">&times;</span>
					                </button>
					            </div>
					            <div class="modal-body">
					                <!-- 일정 상세 정보를 표시할 내용 -->
					                <div id="eventDetails">
					                	<p><strong>강의 번호: </strong> <span id="eventCourse_id"></span></p>
					                    <p><strong>일정 제목:</strong> <span id="eventTitle"></span></p>
					                    <p><strong>시작 일시:</strong> <span id="eventStartDate"></span></p>
					                    <p><strong>종료 일시:</strong> <span id="eventEndDate"></span></p>
					                    
					                    <!-- 기타 필요한 정보들 추가 -->
						                <!-- hidden input field로 schedule_id 저장 -->
	                					<input type="hidden" id="eventSchedule_id">
					                </div>
					            </div>
					            <div class="modal-footer">
					                <!-- 수정 및 삭제 버튼 -->
					                <button type="button" class="btn btn-primary" id="editEventBtn">수정</button>
					                <button type="button" class="btn btn-danger" id="deleteEventBtn">삭제</button>
					            </div>
					        </div>
					    </div>
					</div>
					

				</div>
			</div>
		</div>
	</div>
	
	<!-- JavaScript -->
	<script src="/vendor/jquery/jquery.min.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
    <!-- fullCalendar API -->
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
	<script>

	/* 캘린더 기본 구성 */
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			locale: "ko",
			initialView: 'dayGridMonth',
			headerToolbar: {
				left: 'prev,next today',
				center: 'title',
				right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
			},
			contentHeight: 650 ,
			headerToolbar: {
                center: 'addEventButton' // headerToolbar에 버튼을 추가
            }, 
            /* 해당 회원의 캘린더 정보 가져오기 */
            events: function (fetchInfo, successCallback, failureCallback) {
                // 서버에서 일정 데이터를 받아오는 Ajax 호출
                $.ajax({
                    url: '/myPage/calendarList',  // 서버에서 데이터를 받아올 API의 URL
                    method: 'GET',
                    success: function (response) {
                        // 받아온 데이터를 FullCalendar에서 사용하는 형식으로 가공
                        var events = response.map(function (event) {
                        	// 서버에서 받아온 날짜 및 시간을 ISO 8601 형식으로 변환
                            var isoStartDate = new Date(event.start_date).toISOString();
                            var isoEndDate = new Date(event.end_date).toISOString();
                            
                        	return {
                        		id: event.schedule_id, // id 필드에 schedule_id 저장
                                title: event.schedule_title,
                                start: isoStartDate,
                                end: isoEndDate,
                                color: event.schedule_color,
                                extendedProps: { // 사용자 지정 데이터를 extendedProps에 저장
                                    course_id: event.course_id,
                                    schedule_id: event.schedule_id
                                }
                            };
                            
                        });
                        console.log('Events:', events); // 확인을 위해 이 줄을 추가
                        successCallback(events);
                    },
                    error: function (error) {
                        console.error('Error fetching events:', error);
                        failureCallback(error);
                    }
                });
            },
            
         	/* 해당 일정을 눌렀을 때 상세보기 */
            eventClick: function (info) {
                // 클릭한 일정의 정보를 모달에 표시
                $('#eventCourse_id').text(info.event.extendedProps.course_id);
                $('#eventTitle').text(info.event.title);
                $('#eventStartDate').text(info.event.start.toLocaleString());
                $('#eventEndDate').text(info.event.end.toLocaleString());

             	// schedule_id를 모달에 추가
                $('#eventModal').attr('data-schedule-id', info.event.extendedProps.schedule_id);

             
                // 모달 창 열기
                $('#eventModal').modal('show');
                
                
                /* 상세보기에서 삭제버튼 클릭시 */
            	$('#deleteEventBtn').off('click').on('click', function () {
            		var eventId = info.event.id;  // 클릭한 이벤트의 ID
            		console.log(eventId);
            	    
            	    if (confirm('정말로 이 일정을 삭제하시겠습니까?')) {
            	        // 서버로 삭제 요청을 보냅니다.
            	        $.ajax({
            	            url: '/myPage/deleteSchedule',
            	            method: 'POST',
            	            data:{ schedule_id: eventId },
            	            success: function (response) {
            	                alert('일정이 성공적으로 삭제되었습니다.');
            	                
            	             	// 모달 창 닫기
            	                $('#eventModal').modal('hide');
            	             	
            	             	// 해당 이벤트를 캘린더에서 제거
            	                calendar.refetchEvents();  // 캘린더를 새로고침

            	             	
            	            },
            	            error: function (error) {
            	                console.error('Error deleting event:', error);
            	            	
            	            }
            	        });
            	    } 

                	// 모달 창 닫기
                    $('#eventModal').modal('hide');
            	    
            	});

            },
            
            /* 일정 추가하기 */
            customButtons: {
                addEventButton: { // 추가한 버튼 설정
                    text : "일정 추가",  // 버튼 내용
                    click : function(){ // 버튼 클릭 시 이벤트 추가
                        $("#calendarModal").modal("show"); // modal 나타내기

                     	// 입력필드 초기화
                        $("#lecture_select").val("");  // Assuming lecture_select is a select element
                        $("#calendar_content").val("");
                        $("#calendar_start_datetime").val("");
                        $("#calendar_end_datetime").val("");
                        $("#calendar_color").val("#3498db");  // Set default color
                        
                     	// 이벤트 핸들러 등록
                        $("#addCalendar").off("click").on("click", function () {  
                            handleAddCalendarEvent(calendar);
                        });
                        
                    }
                }
            },   
            editable: true,
            displayEventTime: true
			
		});
		calendar.render();

	});
	
	function handleAddCalendarEvent(calendar) {
	    var course_id = $("#lecture_select option:selected").val();
	    var title = $("#calendar_content").val();
	    var start_datetime = $("#calendar_start_datetime").val();
	    var end_datetime = $("#calendar_end_datetime").val();
	    var schedule_color = $("#calendar_color").val(); 
	    if (!schedule_color) {
	        schedule_color = "#3498db"; 
	    }

	    // 내용 입력 여부 확인
	    if (!course_id) {
	        alert("일정을 추가할 강의를 선택하세요.");
	    } else if (title == null || title == "") {
	        alert("내용을 입력하세요.");
	    } else if (start_datetime == "" || end_datetime == "") {
	        alert("날짜를 입력하세요.");
	    } else if (new Date(end_datetime) - new Date(start_datetime) < 0) {
	        alert("종료일이 시작일보다 먼저입니다.");
	    } else {
	        // datetime-local 값을 Date 객체로 변환
	        var start_date = new Date(start_datetime);
	        var end_date = new Date(end_datetime);

	        // 날짜를 "YYYY-MM-DD HH:mm:ss" 형식으로 변환
	        var formatted_start_date = start_date.getFullYear() + '-' +
	            ('0' + (start_date.getMonth() + 1)).slice(-2) + '-' +
	            ('0' + start_date.getDate()).slice(-2) + ' ' +
	            ('0' + start_date.getHours()).slice(-2) + ':' +
	            ('0' + start_date.getMinutes()).slice(-2) + ':00';

	        var formatted_end_date = end_date.getFullYear() + '-' +
	            ('0' + (end_date.getMonth() + 1)).slice(-2) + '-' +
	            ('0' + end_date.getDate()).slice(-2) + ' ' +
	            ('0' + end_date.getHours()).slice(-2) + ':' +
	            ('0' + end_date.getMinutes()).slice(-2) + ':00';

	        // 정상적인 입력 시
	        var obj = {
	            course_id: course_id,
	            schedule_title: title,
	            start_date: formatted_start_date,
	            end_date: formatted_end_date,
	            schedule_color: schedule_color
	        }; 

	        console.log(obj); 

	        // 서버에 데이터 전송 (Ajax 등을 사용하여 API 호출)
	        $.ajax({
	            url: '/myPage/addSchedule',
	            method: 'POST',
	            contentType: "application/json; charset=UTF-8",
	            dataType: "json",
	            data: JSON.stringify(obj),
	            success: function (response) {
	                console.log("Response Data:", response); 
	             	
	                alert(response.message);

	                calendar.refetchEvents();  // 캘린더를 새로고침
	            },
	            error: function (error) {
	                console.error('Error adding event:', error);
	            }
	        });

	        // 모달 닫기 등 필요한 후속 작업 수행
	        $("#calendarModal").modal("hide");
	    }
	}
	
	
	/* 수강 강의 목록 가져오기 (드롭다운으로 나타내기 위함) */
	function loadLectureList() {
		var lectureSelect = $('#lecture_select');
	    
	    // 목록 초기화
	    lectureSelect.empty();
	    
	    // 기본값 추가
	    lectureSelect.append($('<option>', {
	        value: '',
	        text: '강의를 선택하세요.' // 또는 다른 원하는 문구
	    }));
	    
	    $.ajax({
	        url: '/myPage/courseListSelect', // 실제로 사용할 서버 API 엔드포인트
	        method: 'GET',
	        dataType: 'json',
	        success: function (data) {

	        	// 서버에서 받아온 데이터를 드롭다운 목록에 추가
	            for (var i = 0; i < data.length; i++) {
	                lectureSelect.append($('<option>', {
	                    value: data[i].course_id,
	                    text: data[i].title
	                }));
	            }
	        },
	        error: function (error) {
	            console.error('Error loading lecture list:', error);
	        }
	    });
	}

	// 모달이 열릴 때 수강 강의 목록을 로드
	$('#calendarModal').on('show.bs.modal', function () {
	    loadLectureList();
	});

	
	
	</script>
</body>

</html>
