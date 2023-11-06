<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
    'titleTextStyle': {color: 'black', 
				        fontSize: 20, 
				        bold: true, 
				        italic: false,
				        textAlign: 'center'},
    'width': 290,
    'height': 150,
    'backgroundColor': 'transparent'
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
        height: 300
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
    <div class="menubargroup-nwa">
      <div class="auto-group-tqda-4PJ">
        <div class="frame-2-naC">
          <div class="main-logo-LLp">
            <p class="caption-6Kz">Admin Dashboard</p>
            <p class="t-net-zRN">T-net.</p>
          </div>
          <div class="auto-group-e7b6-7Vz tab_menu">
            <div class="group-30929683-3uS defaultarea">
              <img class="icon-yo6" src="/assets/icon-RhJ.png"/>
              <a class="analytics-uRr" href="<c:url value='/admin/home'/>">Analytics</a>
            </div>
            <div class="group-30929684-Ruz">
              <img class="icon-NKS" src="/assets/icon-E2L.png"/>
              <a class="board-list-u4U" href="<c:url value='/admin/boardlist'/>" >Board List</a>
            </div>
            <div class="group-30929685-3Ag">
              <img class="icon-Nye" src="/assets/icon-j28.png"/>
              <a class="notice-list-WKA"  href="<c:url value='/admin/noticelist'/>">Notice List</a>
            </div>
            <div class="group-30929686-eRN">
              <img class="icon-Pdr" src="/assets/icon-p7z.png"/>
              <a class="member-list-8LY" href="<c:url value='/admin/memberlist'/>" >Member List</a>
            </div>
            <div class="group-30929687-Ghe">
              <img class="icon-alert-circle-1v8" src="/assets/icon-alert-circle-HqJ.png"/>
              <p class="complain-LSc">Complain</p>
            </div>
          </div>
        </div>
      </div>
      <div class="menubottomletter-rQx">
        <p class="made-with-by-peterdraw-abr">Made with ♥ by Peterdraw</p>
        <p class="talent-networks-pronesis-Ux8">
        Talent -NetWork’s  
        <br/>
        @pro_nesis
        </p>
      </div>

       <!-- 콘텐츠 영역 탭누르면 바뀌는 부분 -->

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
                <div class="item-96-jDz">96</div>
              </div>
                <div class="togle-RMi custom-select">
                   <select class="form-select" aria-label="Default select example">
				    <option selected class="item--iet" >년</option>
				    <option value="1" class="item--iet" >월</option>
				    <option value="2" class="item--iet" >주</option>
				  </select>
				  <div class="arrow">
				    <img  src="/assets/polygon-2-Kip.png" alt="Dropdown Arrow">
				  </div>
               </div>
            </div>

            <!-- 완료된 수업 카운트 -->
            <div class="completeclassarea-6AL">
              <img class="icon-CDN" src="/assets/icon-stt.png"/>
              <div class="letter-jDJ">
                <p class="item--f6x">완료된 수업</p>
                <div class="item-38-MVa">38</div>
              </div>
                            <div class="togle-S1E custom-select">
                   <select class="form-select" aria-label="Default select example">
				    <option selected class="item--9wE" >년</option>
				    <option value="1" class="item--iet" >월</option>
				    <option value="2" class="item--iet" >주</option>
				  </select>
				  <div class="arrow">
				    <img  src="/assets/polygon-2-Kip.png" alt="Dropdown Arrow">
				  </div>
               </div>
            </div>

            <!-- 기부왕 카운트 -->
            <div class="givekingarea-6cG">
              <img class="icon-QN4" src="/assets/icon.png"/>
              <div class="group-187-XxU">
                <p class="item--4Bi">기부왕왕</p>
                <div class="item-23-AEk">23</div>
              </div>
               <div class="togle-fSQ custom-select">
                   <select class="form-select" aria-label="Default select example">
				    <option selected class="item--9wE" >년</option>
				    <option value="1" class="item--iet" >월</option>
				    <option value="2" class="item--iet" >주</option>
				  </select>
				  <div class="arrow">
				    <img  src="/assets/polygon-2-Kip.png" alt="Dropdown Arrow">
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
				    <option value="1" class="item--iet" >완료된 수업</option>
				    <option value="2" class="item--iet" >Two</option>
				    <option value="3" class="item--iet" >Three</option>
				  </select>
				  <div class="arrow">
				    <img  src="/assets/polygon-2-Kip.png" alt="Dropdown Arrow">
				  </div>
               </div>
              </div>
               <div class="group-184-JNC line_chart_area">
               	<div class="chart_div_line total_class" id="chart0" ></div>
               	<div class="chart_div_line total_user" id="chart1" ></div>
               </div>
            </div>
           

            <!-- 파이 차트 영역 -->
            <div class="piechart-ojW">
              <div class="auto-group-8seu-Wdv">
                <p class="item--SXa ">인기 과목</p>
	              <div class="group-30929675-YqW custom-select">
                   <select class="form-select" id="pieCharttoggle">
				    <option selected value="0">나이</option>
				    <option value="1">성별</option>
				   </select>
				   <div class="arrow">
				    <img  src="/assets/polygon-2-Kip.png" alt="Dropdown Arrow">
				   </div>
                 </div>
              </div>
              <div class="auto-group-xle4-eGG">
				  <div id="chart_area"></div>
              </div>
            </div>
          </div>

        </div><!-- Dash board 흰배경 부분 끝-->

    </div><!-- 메뉴바 끝 -->
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
	
	//div영역에 있는 차트 지우기
	$('#chart_area .chart_div').each(function() {
    	$(this).remove();
    });
	
	updatePieCharts();
	
});

// 문제점! 이 함수를 공통으로 파이차트를 그려주는 함수로 사용하고 싶음...
//그럴러면 ... 이게 어떤 주제로 뭘가져와야할지 알아야함
// 그러면 piesubject 해서 성별 인지 연령대인지 알려줘야함...!변수를 주면 될듯
//그리고 나중에 주제가 추가되면 xml만 바꾸면 잘 돌아가게.. ㅇ으응...
function updatePieCharts(){
	$.ajax({
	      url: "/piechart.do", 
	      method: "POST",
	      success: function (json) {
	        //if (json.status) {
	        	google.charts.setOnLoadCallback(function() {
	        		var strList = json.genderstr;
	        		var titleList = json.gendertitle;
	        		console.log("ajax strList : ",strList)
	        		 $('#chart_area').html("");
	        		for (var i = 0; i < titleList.length; i++) {
	        			  var title = titleList[i];
	        			  console.log("ajax title : ",title);
	        			  var chartDiv = document.createElement("div");
	        		      chartDiv.className = "chart_div";
	        		      chartDiv.id = title;
	        		      var chartArea = document.getElementById("chart_area");
	        		      chartArea.appendChild(chartDiv);

	        			  // DOM 요소를 직접 선택하여 전달
	        			  var chartDiv = document.getElementById(title);
	        			  strList[i] = strList[i].replace(/'/g, '"');
	        			  var strListArray = JSON.parse(strList[i]);
	        			  flag = 2;
	    
	        			  drawPieChart(title, strListArray, chartDiv,flag);
	        			    
	        			}
	        		
	        		});

	      //  }else{
	       // 	alert("데이터불ㄹ오기 실패!")
	        //}
	      },
	      error: function (error) {
	        console.error("Error:", error);
	      }
	    });
	
}

</script>

</body>
</html>