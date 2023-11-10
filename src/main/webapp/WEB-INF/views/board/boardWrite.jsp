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
  <title>게시판 글쓰기</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter%3A300%2C700"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A300%2C400%2C500%2C700"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto%3A400%2C500"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins%3A300"/>
  <!-- 부트스트랩 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
         rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
         integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="/styles/boardWrite.css"/>

  <style>
	.ck-editor__editable {
		height: 339px;
	}
  </style>
</head>
<body>
  
		<div class="item--TEG">
			 <form id="mForm" method="post" action="<c:url value=''/>" >
			  <div class="auto-group-ckbr-jBn">
			    <p class="item--CLG">글쓰기</p>
			    <p class="writer-tyn"><span> 작성자 :</span> <span id="name">${principal.user.nickName }</span></p>
			  </div>
			  <div class="auto-group-musn-abi">
			  	<input type="submit" class="button-J1v" value="등록하기" />
			    <!-- <div class="button-J1v">등록하기</div> -->
			    <div class="button-8Wk">취소하기</div>
			  </div>
			  <div class="button-zJ4">
			    <img class="vector-36-stroke-t8Y" src="/assets/vector-36-stroke.png"/>
			    <div class="text-label-bYk">목록으로</div>
			  </div>
			  <div class="auto-group-fxx8-tXr">
			    <div class="item-3-3--QFJ">
			    <!--   <textarea style="margin: 0px;width: 741px;height: 378px;resize: none;">
			        제가 개발자로 취직한지 어언 3년 이제 이직을 해야하는데 3년전과는 달리 토스점수를 원하더군요 
			      그래서 점수가 필요한데 제가 할줄아는게 컴퓨터 뿐이네요 엑셀이나 이런것을 가르쳐 드릴테니
			      영어를 알려주실  영어천재님 모십니다!!
			      </textarea> -->
			      
			   
				<textarea id="editor" name="editor"></textarea><br/>
				
			    </div>
			  </div>
			  <div class="auto-group-btma-Dc4">
			    <label for="title" style="margin:0px;">제목 :</label>
			    <input id="title" type="text" style="margin:0px 10px; height: 15px;width: 100%;" placeholder="제목을 작성해주세요"/>
			  </div>
			  <div class="auto-group-qnps-4cg">
			    <p class="item--YXr">위치</p>
			    <select id="cityBox" name="city_code" class="form-select" aria-label="Default select example" style="margin-right:10px;">
		          <option value="0" >시</option>
			          <c:forEach var="city" items="${cityList }">
			          	<option value="${city.city_code}" ${result.board.city_code == city.city_code? 'selected="selected"':''  }>${city.city_name }</option>
			          </c:forEach>
		        </select>
			    <div class="auto-group-z3ag-QTa">
			      <select id="districtBox" name="district_code" class="form-select" aria-label="Default select example">
		            <option value="0" >구</option>
		            <c:forEach var="district" items="${districtList }">
			          	<option class="district_name" value="${district.district_code}" ${result.board.district_code == district.district_code?  'selected="selected"':'' }>${district.district_name }</option>
			          </c:forEach>
		          </select>
			    </div>
			  </div>
			  <div class="group-18-PKW">
			    
			    <p class="item--gZW">기부할재능</p>
			     <select id="give_highBox" name="give_high_code" class="form-select" aria-label="Default select example" style="margin-right:10px;">
		            <option value="0" >대분류</option>
		            <c:forEach var="high" items="${talentHighList }">
			          	<option value="${high.high_code}" ${result.board.high_code == high.high_code? 'selected="selected"':'' }>${high.high_name }</option>
			          </c:forEach>
		          </select>
			    <select id="give_smallBox" name="give_low_code" class="form-select" aria-label="Default select example">
		          <option value="0" >기부할재능</option>
		          <c:forEach var="small" items="${talentSmallList }">
		          	<option class="give_small_name" value="${small.low_code}" ${result.board.low_code == small.low_code? 'selected="selected"':''} >${small.low_name }</option>
		          </c:forEach>
		        </select>
			    <p class="item--i8p">기부 받고 싶은 재능</p>
			    <select id="receive_highBox" name="receive_high_code" class="form-select" aria-label="Default select example" style="margin-right:10px;">
		            <option value="0" >대분류</option>
		            <c:forEach var="high" items="${talentHighList }">
			          	<option value="${high.high_code}" ${result.board.high_code == high.high_code? 'selected="selected"':'' }>${high.high_name }</option>
			          </c:forEach>
		          </select>
			    <select id="receive_smallBox" name="receive_low_code" class="form-select" aria-label="Default select example">
		          <option value="0" >기부받고싶은재능</option>
		          <c:forEach var="small" items="${talentSmallList }">
		          	<option class="receive_small_name" value="${small.low_code}" ${result.board.low_code == small.low_code? 'selected="selected"':''} >${small.low_name }</option>
		          </c:forEach>
		        </select>
			  </div>
			  <div class="button-6oa">첨부파일 추가</div>
			  <!-- 리스트 총괄하는 div -->
			  <div class="frame-49-NFJ">
			    <!-- 한줄에 대한 것을 관리하는 div -->
			    <div class="component-15-hHa">
			      <div class="auto-group-rdqs-RjN">
			        <input type="file">
			      </div>
			      <img class="vector-142-Xvp" src="REPLACE_IMAGE:27:969"/>
			    </div>
			<!-- 한줄끝 -->
			  </div>
			  <!-- 리스트총괄 끝 -->
			  <!-- 헤더 -->
			</form>
		</div>
	
<script>		
	let editor;
	ClassicEditor
	.create(document.querySelector('#editor'),{
		ckfinder: {	//얘가 없으면 base64로 동작한다. 이미지를 서버로 업로드할 수 있도록 만들어준다.
			uploadUrl : '/imageUpload?token=${token}'
		}
	})
	.then(editor => {
		console.log('Editor was initialized');
		window.editor = editor;
	})
	.catch(error => {
		console.error(error);
	});
	
	
	document.querySelector('#mForm').addEventListener("submit", e => {
		e.preventDefault();
		
		fetch("/ckeditorWrite", {
			method: "POST",
			headers: {
			    "Content-Type": "application/json",
			},
			/* 비동기로 token, title, editor를 서버로 전송한다. */
			body: JSON.stringify({
				token: '${token}',
				title: document.querySelector("#title").value,
				contents : document.querySelector("#editor").value,
				writer_nickname:document.querySelector("#name").value,
				district_code: document.querySelector("#districtBox").value,
				city_code: document.querySelector("#cityBox").value,
				give_talent: document.querySelector("#give_smallBox").value,
				receive_talent: document.querySelector("#receive_smallBox").value,
				high_code: document.querySelector("#receive_highBox").value
			}),
		})
		.then(response => response.json())
		.then(result => {
			location.href="/board/list";
		});
		
		return false;
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*select Box의 내용 변경하기 ajax*/
	//기부재능의 시코드 변경
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
	$("#give_highBox").on("change", function() {
		var high = $("#give_highBox option:selected").val();
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
	    		$(".give_small_name").remove();
	    		
	    		var small_code = json.talentSmallCode;
	    		var smallInfo ="";
	    		
	    		for(let i=0;i<small_code.length;i++){
	    			
	    			var small = small_code[i];
	    			smallInfo +=`<option class="give_small_name" value="`+small.low_code +`">`+small.low_name +`</option>`
	    		}
	    		
	    		$("#give_smallBox").append(smallInfo);

	    	}
	    }); 
	
	});
	
	//기부받을 재능의 대분류선택시 소분류 뜨는거
	$("#receive_highBox").on("change", function() {
		var high = $("#receive_highBox option:selected").val();
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
	    		$(".receive_small_name").remove();
	    		
	    		var small_code = json.talentSmallCode;
	    		var smallInfo ="";
	    		
	    		for(let i=0;i<small_code.length;i++){
	    			
	    			var small = small_code[i];
	    			smallInfo +=`<option class="receive_small_name" value="`+small.low_code +`">`+small.low_name +`</option>`
	    		}
	    		
	    		$("#receive_smallBox").append(smallInfo);

	    	}
	    }); 
	
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
 </script>
</body>