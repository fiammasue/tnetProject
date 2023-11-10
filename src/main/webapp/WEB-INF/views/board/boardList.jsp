<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <link rel="icon" href="/favicon.ico" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="theme-color" content="#000000" />
  <title>게시판 목록</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter%3A800"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins%3A300"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A300%2C500%2C700%2C800"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto%3A500%2C700"/>
  <!-- 부트스트랩 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="/styles/boardList.css"/>
  <style>
	  	.lesson-cards2 {
		  list-style: none;
		  padding: 0;
		  display: flex;
		  flex-wrap: wrap;
		  justify-content: flex-start; /* 왼쪽부터 정렬 */
		  gap: 20px;
		  margin-top: 1%;
		  margin-left: 10%;
		  margin-right: 10%;
		}
		
		.lesson-card2 {
		  background-color: #fff;
		  border: 1px solid #ddd;
		  border-radius: 8px;
		  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
		  overflow: hidden;
		     width: calc(25% - 20px); /* 3개씩 배치, 간격 제외한 너비 조정 */
		  margin-bottom: 20px;
		}
		
		.lesson-image2 a{
		  max-width: 100%;
		  height: auto;
		  display: block;
		  color: inherit; /* 부모 요소의 글자 색을 상속 */
		}
		
		.lesson-details2 {
		  padding: 16px;
		}
		
		.lesson-title2 {
		  font-size: 1.25rem;
		  margin-bottom: 8px;
		  color: #333;
		}
		
		.lesson-description2 {
		  font-size: 0.875rem;
		    margin-bottom: 16px;
		    color: #666;
		    width: 230px;
		    height: 40px;
		    overflow: hidden;
		}
		
		.lesson-meta2 {
		  font-size: 0.875rem;
		  color: #555;
		}
		
		.lesson-image2 {
		  display: flex;
		  align-items: center;
		  justify-content: space-between; /* 가운데 정렬 및 좌우 정렬 공간 분배 */
		}
		
		#detail2 {
		  float: right;
		  padding: 5px 12px; /* 버튼 크기 조절을 위한 패딩 추가 */
		  background-color: green; color: #fff;
		  border-radius: 4px; /* 둥근 테두리 적용 (선택 사항) */
		}
		select {
		 width: calc(20% - 20px);
		}
		#mForm{
		width:1200px;
		}
  </style>
</head>
<body>

	<form name="pageForm" id="pageForm" action="<c:url value='/board/list'/>" method="post">
		<input  name="pageNo" id="pageNo" value="${result.board.pageNo}"/>
		<input  name="pageLength" id="pageLength" value="${result.board.pageLength}"/>
		<input  name="city_code" id="city_code" value="${result.board.city_code}"/>
		<input  name="district_code" id="district_code" value="${result.board.district_code}"/>
		<input  name="high_code" id="high_code" value="${result.board.high_code}"/>
		<input  name="low_code" id="low_code" value="${result.board.low_code}"/>
	
	</form>
    <div class="item--XFN">

      <div class="item--Vua">게시판</div>
      <form name="mForm" id="mForm" action="<c:url value='/board/list'/>" method="post">
	      	<input type="hidden" name="pageNo" id="pageNo" value="${result.board.pageNo }"/>
	      <div class="auto-group-qmuj-WZn">
	      <!-- 검색하는 값에 대해서 전달하는 form -->
	      <!--  현재 페이지 번호  -->
	        <div class="group-30929677-Xjn">
	        <select id="cityBox" name="city_code" class="form-select" aria-label="Default select example" style="margin-right:10px;">
	          <option value="0" >시</option>
		          <c:forEach var="city" items="${cityList }">
		          	<option value="${city.city_code}" ${result.board.city_code == city.city_code? 'selected="selected"':''  }>${city.city_name }</option>
		          </c:forEach>
	        </select>
	        </div>
	        <div class="group-30929678-Je4">
	          <select id="districtBox" name="district_code" class="form-select" aria-label="Default select example">
	            <option value="0" >구</option>
	            <c:forEach var="district" items="${districtList }">
		          	<option class="district_name" value="${district.district_code}" ${result.board.district_code == district.district_code?  'selected="selected"':'' }>${district.district_name }</option>
		          </c:forEach>
	          </select>
	        </div>
	        <div class="group-30929675-2Cg">
	          <select id="highBox" name="high_code" class="form-select" aria-label="Default select example" style="margin-right:10px;">
	            <option value="0" >대분류</option>
	            <c:forEach var="high" items="${talentHighList }">
		          	<option value="${high.high_code}" ${result.board.high_code == high.high_code? 'selected="selected"':'' }>${high.high_name }</option>
		          </c:forEach>
	          </select>
	        </div>
	        <div class="group-30929676-uQt"> 
	        <select id="smallBox" name="low_code" class="form-select" aria-label="Default select example">
	          <option value="0" >기부받고싶은재능</option>
	          <c:forEach var="small" items="${talentSmallList }">
	          	<option class="small_name" value="${small.low_code}" ${result.board.low_code == small.low_code? 'selected="selected"':''} >${small.low_name }</option>
	          </c:forEach>
	        </select>
	      </div>
	        <!-- 돋보기를 누르면 검색된다. -->
	        <img onClick="jsSearchValue()" class="secondary-cricle-button-LFJ" src="/assets/Secondary Cricle Button.png"/>
	      </div>
      </form>



    <ul class="lesson-cards2">
    
	    <c:forEach var="board" items="${result.boardList }">
		      <li class="lesson-card2">
		        <div class="lesson-image2">
		            <img src="/assets/usericon1.png">
		            <span>${board.give_talent }</span>
		            <img src="/assets/exchageicon.png">
		            <span>${board.receive_talent }</span>
		            <img src="/assets/usericon2.png">
		        </div>
		        <div class="lesson-details2">
		            <p class="lesson-description2">${board.contents }</p>
		            <div class="lesson-meta2">
		                <img src="/assets/locationicon.png">
		                <span class="lesson-location2">${board.city_name } ${board.district_name }</span>
		                <input class="board-detail" type="button" id="detail2" value="DETAIL" data-boardid="${board.board_id}"></input>
		            </div>
		        </div>
		      </li>
	      </c:forEach>
     </ul>



      <!-- 페이징 -->
      <div class="auto-group-yf6p-kc8">

	      <c:if test="${result.board.navStart != 1 }">
	        <img onClick="javascript:jsPageNo(${result.board.navStart-1 })" class="circle-rfA" src="/assets/circle-rMe.png"/>
	       </c:if>
	       <c:forEach var="item" begin="${result.board.navStart}" end="${result.board.navEnd }">
		        <c:choose>
		        	<c:when test="${result.board.pageNo == item }">
		        		<div class="circle-nYp" onClick="javascript:jsPageNo(${item })">${item }</div>
		        	</c:when>
		        	<c:otherwise>
		        		<div class="circle-dZS" onClick="javascript:jsPageNo(${item })">${item }</div>
		        	</c:otherwise>
		        </c:choose>
		   </c:forEach>
<!-- 		        <div class="circle-Wt8">3</div> -->
<!-- 		        <div class="circle-nqe">4</div> -->
<!-- 		        <div class="circle-scC">5</div> -->
	        <c:if test="${result.board.navEnd != result.board.totalPageSize}">
	        	<img onClick="javascript:jsPageNo(${result.board.navEnd+1 })" class="circle-kvt" src="/assets/circle.png"/>
	        </c:if>

        <div><a href='<c:url value="/ckeditorForm.do"/>'>게시글작성</a></div>

      </div>
    </div>
    
    
	<script type="text/javascript">
	$(document).on("click", ".board-detail", function() {
	    var boardId = $(this).data("boardid");
	    const param = {
				board_id: boardId
		};
	    
	    location.href="/board/detail/"+boardId;
	});
	
	$(".button-6E4").on("click", function() {
		location.href="/board/write";
	});
	
	//다음페이지로 가기
	function jsPageNo(pageNo) {
		if($("#low_code").val()==" "){
			alert($("#low_code").val())
			
		}
// 		if ($("#cityBox").val( ) == 0) {
// 			$("#cityBox").val("0");
// 		}
// 		if ($("#districtBox").val() == 0) {
// 			$("#districtBox").val("0");
// 		}
// 		if ($("#highBox").val() == 0) {
// 			$("#highBox").val("0");
// 		}
// 		if ($("#smallBox").val() == 0) {
// 			$("#smallBox").val("0");
// 		}
		document.querySelector("#pageForm > #pageNo").value = pageNo;
		//페이지번호가 계속 기본값 10으로 초기화되는 문제가 발생해서 그냥 직접 대입해줬음
		document.querySelector("#pageForm > #pageLength").value = ${result.board.pageLength};
		document.querySelector("#pageForm").submit();
	    	
	}
	//검색을 누르면 페이징할때 검색해서 들어간다.
	function jsSearchValue(){
		
		
		
		
// 		$("#mForm > #pageNo").val("1");
		
		document.querySelector("#mForm > #pageNo").value = 1;

		
		
		
		
		
		document.querySelector("#mForm").submit();
	}
	
	
		//시 선택시 지역 뜨는 거
		$("#cityBox").on("change", function() {
			var city = $("#cityBox option:selected").val();
			const param = {
					city_code: city
			};
		    $.ajax({
		    	url:"/board/districtCode" ,
		    	type:"POST",
		    	contentType: "application/json; charset=UTF-8",
		    	data:JSON.stringify(param),
		    	dataType:"json",
		    	success:function(json){
		    		$(".district_name").remove();
		    		
		    		var districtCode = json.districtCode;
		    		var districtInfo ="";
		    		
		    		for(let i=0;i<districtCode.length;i++){
		    			
		    			var district = districtCode[i];
		    			districtInfo +=`	<option class="district_name" value="`+ district.district_code +`">`+district.district_name+`</option>`
		    		}
		    		
		    		$("#districtBox").append(districtInfo);
		    		
		    		
		    	}
		    }); 
			
		});
		
		//대분류선택시 소분류 뜨는거
		$("#highBox").on("change", function() {
			var high = $("#highBox option:selected").val();
			const param = {
					high_code:high
			};
			
			$.ajax({
		    	url:"/board/lowCode" ,
		    	type:"POST",
		    	contentType: "application/json; charset=UTF-8",
		    	data:JSON.stringify(param),
		    	dataType:"json",
		    	success:function(json){
		    		$(".small_name").remove();
		    		
		    		var small_code = json.talentSmallCode;
		    		var smallInfo ="";
		    		
		    		for(let i=0;i<small_code.length;i++){
		    			
		    			var small = small_code[i];
		    			smallInfo +=`<option class="small_name" value="`+small.low_code +`">`+small.low_name +`</option>`
		    		}
		    		
		    		$("#smallBox").append(smallInfo);

		    	}
		    }); 
		
		});
	
		
		
		
		
	
	</script>   
    
    
    
    
    
</body>