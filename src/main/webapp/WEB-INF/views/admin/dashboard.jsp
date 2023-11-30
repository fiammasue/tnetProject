<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> 


<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <link rel="icon" href="/favicon.ico" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="theme-color" content="#000000" />
  <title>MemberList</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto%3A400"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Barlow%3A400%2C500"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C500%2C700"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins%3A500%2C700"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Capriola%3A400"/>
  <link rel="stylesheet" href="/styles/memberlist.css"/>
  <link rel="stylesheet" href="/styles/dashboard.css"/>
  
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
  
<!-- 구글차트 연동을 위한 script head부분에 추가해야함  -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

//대충 구글차트 패키지 가져오기
google.charts.load('current', {'packages':['corechart']});

var strList = ${strlist};
var titleList = ${titlelist};

console.log("strList 나이별: " ,strList);

// 차트 함수를 콜백해줌
google.charts.setOnLoadCallback(function() {
  for (var i = 0; i < titleList.length; i++) {

		var title = titleList[i]
		console.log("title : ",title);
		console.log("str 나이별",strList[i])
		var chartDivHTML = `<div class="chart_div" id="` + title + `" ></div>`;
		
	    // chart_area를 chart_area에 추가
	    $('#chart_area').append(chartDivHTML);
	
	    drawPieChart(title, strList[i]);
       }
});


//차트 그리기 함수
function drawPieChart(title, str,info,flag) {
 console.log("drawPieChart title ",title)
 console.log("drawPieChart str ",str)
	var data = google.visualization.arrayToDataTable(str);

  // 차트옵션 설정
var options = {
  'legend': 'right',
  'title': title,
  'titlePosition': 'out', // 제목을 그래프 바깥에 표시
  'titleTextStyle': {
    color: 'gray',
    fontSize: 17,
    bold: true,
    italic: false,
    textAlign: 'left' // 왼쪽 정렬
  },
  'width': 290,
  'height': 150,
  'backgroundColor': 'transparent',
  'colors': ['#F8BBD0', '#BBDEFB', '#C8E6C9', '#FFF59D', '#ECEFF1'],
  'pieSliceText': 'percentage',
  'pieSliceTextStyle': {
    color: 'gray',
    fontSize: 8
  }
};
  
  if(flag==2){
	  console.log("차트그릴영역 : ",info)
	  var chart = new google.visualization.PieChart(info);
	  chart.draw(data, options);
  }
  else{
  console.log("차트그릴영역 : ",document.getElementById(title))
  var chart = new google.visualization.PieChart(document.getElementById(title));
  chart.draw(data, options);
	  
  }  
  //차트 div영역에 그리기
}
  

var line_datas = ${line_datas};
  
  //꺾은선 그래프 차트 API가져오기
google.charts.load('current', {'packages':['line']});
google.charts.setOnLoadCallback( function() {
	for (var i = 0; i < line_datas.length; i++) {
	   
	var line_data = line_datas[i]
	var id_value = "chart"+i
	console.log("id_value : "+id_value)
	var chartDivHTML = `<div class="chart_div" id=` + id_value + `" ></div>`;
	
    // chart_area를 chart_area에 추가
    $('#line_chart_area').append(chartDivHTML);

    drawChart(line_data,id_value);
   }
});
  
function drawChart(line_data,id_value) {

	console.log("line_data : ",line_data)
      var data2 = new google.visualization.DataTable();
      data2.addColumn('string', 'Year');
      data2.addColumn('number', 'count');
      data2.addRows(line_data);

      var options = {
        chart: {
        },
        width: 400,
        height: 300,
        pointSize: 10,  // 원하는 크기로 조절
        series: {
          0: { pointShape: 'circle' }  // 다른 모양도 시도 가능(square, triangle, diamond 등)
        }
      };

      var chart = new google.charts.Line(document.getElementById(id_value));
      chart.draw(data2, google.charts.Line.convertOptions(options));
    }



</script>
  
</head>
<body>
<div class="memberlist-Bwn">
  <div class="allgroup-Lpg">
    <!-- 초록색 배경 -->
    <div class="greenbackground-sZi">
    </div>
      <!-- 메뉴바 -->
	  <tiles:insertDefinition name="menuBar" />
		  
        <!-- Dash board -->
        <div class="whitearea-Nnc tap_content " id="tab1">
          <p class="t-net-dashboard-CJc">T - Net DashBoard</p>

          <!-- 카운트 영역 -->
          <div class="countingarea-Mqi">
            <!-- 진행중인수업 카운트 -->
            <div class="classcountinarea-sp4">
              <img class="icon-nRE" src="/assets/icon-k5E.png"/>
              <div class="group-187-i3z">
                <p class="item--eCY">진행중인 수업</p>
                <div class="item-96-jDz count_number">${count.inprogress}</div>
              </div>
              <div class="togle-RMi custom-select"> 
			   <div class="search_date" >
			  	기간을 선택해주세요
				  <input type="date" name="start_date" placeholder="시작일" value={props.date} required style="display: none;">
				  <input type="date" name="end_date" placeholder="종료일"  value={props.date} required style="display: none;">
				  <input type="hidden"  clss ="count_kind"  value="inprogress"/>
			   </div>
              </div>
            </div>

            <!-- 완료된 수업 카운트 -->
            <div class="completeclassarea-6AL">
              <img class="icon-CDN" src="/assets/icon-stt.png"/>
              <div class="letter-jDJ">
                <p class="item--f6x">완료된 수업</p>
                <div class="item-38-MVa count_number">${count.completed}</div>
              </div>
              <div class="togle-S1E custom-select">
                 <div class="search_date" >
				  기간을 선택해주세요
				  <input type="date" name="start_date" placeholder="시작일" value={props.date} required style="display: none;">
				  <input type="date" name="end_date" placeholder="종료일"  value={props.date} required style="display: none;">
				  <input type="hidden"  clss ="count_kind" value="completed"/>
				 </div>
              </div>
            </div>

            <!-- 기부왕 카운트 -->
            <div class="givekingarea-6cG">
              <img class="icon-QN4" src="/assets/icon.png"/>
              <div class="group-187-XxU">
                <p class="item--4Bi ">회원가입수</p>
                <div class="item-23-AEk count_number">${count.donationking}</div>
              </div>
               <div class="togle-fSQ custom-select">
                 <div class="search_date" >
				  기간을 선택해주세요
				  <input type="date" name="start_date" placeholder="시작일" value={props.date} required style="display: none;">
				  <input type="date" name="end_date" placeholder="종료일"  value={props.date} required style="display: none;">
				  <input type="hidden"  clss ="count_kind" value="donationking"/>
				 </div>
               </div>
            </div>
          </div><!-- 카운트 영역 끝 -->


        <!-- 차트 영역 -->
          <div class="auto-group-jz1n-jeY">
            <!-- 막대 차트 영역 -->
            <div class="bargrape-HRA">
              <div class="auto-group-cjhn-mbE"> 
                <p class="item--VGL">연도별 추이</p>
                <!-- 토글 -->
               <div class="group-30929674-c64 custom-select " id="linechart_toggle">
                   <select class="form-select" aria-label="Default select example">
				    <option selected class="item--iet" value="0" >회원 인원</option>
				    <option class="item--iet" value="1" >완료된 수업</option>
				  </select>
				  <div class="arrow">
				    <img src="/assets/polygon-2-Kip.png" alt="Dropdown Arrow">
				  </div>
               </div>
               <form class="file_down" action="<c:url value='/download/csvfile'/>" method="post" >
               <img id="down_images" class="download_img"  src="/assets/download_image.png" alt="Download">
               <input type="hidden" class="kind_of_download" name="kind_of_download"/>
               </form>
               
              </div>
               <div class="group-184-JNC line_chart_area">
               	<div class="chart_div_line total_class" id="chart0" ></div>
               	<div class="chart_div_line total_user" id="chart1" ></div>
               </div>
            </div>
           

            <!-- 파이 차트 영역 -->
            <div class="piechart-ojW">
              <div class="auto-group-8seu-Wdv">
                <p class="item--SXa ">배우고 싶은 재능 Top5</p>
	              <div class="group-30929675-YqW custom-select">
                   <select class="form-select" id="pieCharttoggle">
				    <option selected value="age">나이</option>
				    <option value="gender">성별</option>
				   </select>
				   <div class="arrow">
				    <img  src="/assets/polygon-2-Kip.png" alt="Dropdown Arrow">
				   </div>
                 </div>
                 <form class="file_down"  action="<c:url value='/download/csvfile'/>" method="post" >
		             <img id="down_images" class="download_img"  src="/assets/download_image.png" alt="Download">
		             <input type="hidden" class="kind_of_download" name="kind_of_download"/>
	             </form>
              </div>
              <div class="auto-group-xle4-eGG">
				  <div id="chart_area"></div>
              </div>
            </div>
          </div>

        </div><!-- Dash board 흰배경 부분 끝-->


  </div><!--영역끝 지우면 안됨 -->
</div><!-- 영역끝 지우면 안됨-->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

//윈도우가 로드되면 selected차트 띄우기
$(document).ready(function() {
    // 라인차트 토글의 셀렉트의 옵션의 selected가 있는 옵션의 value값 찾기
    var selectedOption = $('#linechart_toggle select option:selected').val();

    $('.line_chart_area .chart_div_line').each(function() {
        var conID = this.id;
        var lastCharacter = conID.charAt(conID.length - 1); // 마지막 글자 추출
        if (lastCharacter !== selectedOption) {
        	  $(this).css('opacity', 0); // 처음에 none으로 하면 그래프 깨져서 나머지는 투명하게해서 안보이게 
        }
    });
});

/* $('.custom-select select')는 select의 요소 그니까 select태그가 뽑히는 거잖아?
		그니까 select박스를 누르는 순간 click 이벤트가 발생하는 거지...
		그럼 div값을 바꾸기위해서는 선택한 셀렉트 박스의 옵션태그의 링크나 값을 가져와야하는거네 */

$('#linechart_toggle select').on('change', function() {
    var selectedValue = $(this).find(":selected").val();
    console.log("선택된 값 : ",selectedValue)
    
    $('.line_chart_area .chart_div_line').each(function() {
    	console.log($('.line_chart_area .chart_div_line'))
        var conID = this.id;
        var lastCharacter = conID.charAt(conID.length - 1); // 마지막 글자 추출
        console.log("div의 마지막 값들: ", lastCharacter);
        if (lastCharacter !== selectedValue) {
            this.style.display = 'none';
        }else{
        	 $(this).css('opacity', 1); // 그래프 투명도 조절
        	this.style.display = 'block';
        }
    });      
});


//파이차트 토글 변경되면 파이차트 그래프 변경하기
$('#pieCharttoggle').on('change', function() {
	
	var group_kind = $(this).val();
	console.log("group_kind : ", group_kind);
	
	//div영역에 있는 차트 지우기
	$('#chart_area .chart_div').each(function() {
    	$(this).remove();
    });
	
	updatePieCharts(group_kind);
	
});

// 문제점! 이 함수를 공통으로 파이차트를 그려주는 함수로 사용하고 싶음...
//그럴러면 ... 이게 어떤 주제로 뭘가져와야할지 알아야함
// 그러면 piesubject 해서 성별 인지 연령대인지 알려줘야함...!변수를 주면 될듯
//그리고 나중에 주제가 추가되면 xml만 바꾸면 잘 돌아가게.. ㅇ으응...
function updatePieCharts(group_kind) {
    if (group_kind === "age") {
        // "age" 그룹의 데이터를 가져오는 AJAX 요청
        $.ajax({
            url: "/piechart/age_group.do",
            method: "POST",
            success: function (json) {
                google.charts.setOnLoadCallback(function () {
                    var strList = json.str;  // JSON 데이터 문자열 목록
                    var titleList = json.title;  // 차트 제목 목록
                    console.log("ajax strList : ", strList);

                    // 새로운 차트를 추가하기 전에 "chart_area" div를 지우기
                    $('#chart_area').html("");

                    for (var i = 0; i < titleList.length; i++) {
                        var title = titleList[i];
                        console.log("ajax title : ", title);

                        // 새로운 차트 div 엘리먼트를 생성
                        var chartDiv = document.createElement("div");
                        chartDiv.className = "chart_div";
                        chartDiv.id = title;
                        var chartArea = document.getElementById("chart_area");
                        chartArea.appendChild(chartDiv);

                        // JSON 데이터 파싱
                        strList[i] = strList[i].replace(/'/g, '"');
                        var strListArray = JSON.parse(strList[i]);
                        var flag = 2;

                        // 파이 차트를 그리는 함수 호출
                        drawPieChart(title, strListArray, chartDiv, flag);
                    }
                });
            },
            error: function (error) {
                console.error("에러:", error);
            }
        });
    } else {
        // 다른 그룹의 데이터를 가져오는 AJAX 요청
        $.ajax({
            url: "/piechart/gender_group.do",
            method: "POST",
            success: function (json) {
                google.charts.setOnLoadCallback(function () {
                    var strList = json.genderstr;  // JSON 데이터 문자열 목록
                    var titleList = json.gendertitle;  // 차트 제목 목록
                    console.log("ajax strList : ", strList);

                    // 새로운 차트를 추가하기 전에 "chart_area" div를 지우기
                    $('#chart_area').html("");

                    for (var i = 0; i < titleList.length; i++) {
                        var title = titleList[i];
                        console.log("ajax title : ", title);

                        // 새로운 차트 div 엘리먼트를 생성
                        var chartDiv = document.createElement("div");
                        chartDiv.className = "chart_div";
                        chartDiv.id = title;
                        var chartArea = document.getElementById("chart_area");
                        chartArea.appendChild(chartDiv);

                        // JSON 데이터 파싱
                        strList[i] = strList[i].replace(/'/g, '"');
                        var strListArray = JSON.parse(strList[i]);
                        var flag = 2;

                        // 파이 차트를 그리는 함수 호출
                        drawPieChart(title, strListArray, chartDiv, flag);
                    }
                });
            },
            error: function (error) {
                console.error("에러:", error);
            }
        });
    }
}

// 기간선택 클릭시 달력 날짜 기간조회 뜨게
$('.search_date').on("click", function() {
    var date =$(this).find('input[type="date"]');
    date.css('display', 'block');
    
    // 이미 열려 있는 .search_date 요소를 숨김
    $('.search_date').not(this).find('input[type="date"]').css('display', 'none');
});
  

// 클릭된 요소가 .search_date 클래스를 가진 요소가 아닌 경우 다시 돌아가기
$(document).on("click", function(event) {
    if (!$(event.target).closest('.search_date').length) {
        $('.search_date input[type="date"]').css('display', 'none');
    }
});


//날짜 클릭하면
$('input[type="date"]').on('change', function() {
    var startDate = $(this).parent().find('input[name^="start_date"]').val();
    var endDate = $(this).parent().find('input[name^="end_date"]').val();
    console.log("startDate : ",startDate);
    console.log("endDate : ",endDate);
    
    // 시작 날짜와 종료 날짜 모두 선택한 경우에만 처리
    if (startDate && endDate) {
    	// 숫자 자리 찾아서
    	 var count_text_div =  $(this).parent().parent().parent().closest('div').find('.count_number');
       	console.log("count_text_div: ",count_text_div);
       	
       	var count_kind = $(this).siblings('input[type="hidden"][clss="count_kind"]').val();
       	console.log("count_kind: ", count_kind);
       	
    data={
    	start_date : startDate,
    	end_date : endDate,
    	count_kind : count_kind
       };
    
    console.log("data : ", data);
       
        $.ajax({
           url: "/admin/counts.do",
           method: "POST",
           contentType: "application/json; charset=UTF-8",
           data: JSON.stringify(data),
           success: function (json) {

					//새로 넣어주기
					console.log("json.count : ",json.count);
					count_text_div.empty();
        		    count_text_div.text(json.count);
               
           },
           error: function (error) {
               console.error("에러:", error);
           }
       }); 
       
       //선택된 날짜값 지우는거 나중에 ajax로 count값 변환한뒤 다른데 클릭하면 날짜값 지우게 해야지
		//$(this).parent().find('input[name^="start_date"]').val('');
       // $(this).parent().find('input[name^="end_date"]').val(''); 
   
    }
});

// 파일 다운로드 하기~~~~~
$(".download_img").on("click", function () {
    var kind_of = $(this).closest('div').find('select option:selected').val();
    
    var form =  $(this).closest('form.file_down');
    
   form.find('input.kind_of_download').val(kind_of);
   form.submit();
       
});

</script>

</body>
</html>