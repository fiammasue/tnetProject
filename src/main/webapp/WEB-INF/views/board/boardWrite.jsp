<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			    <p class="writer-tyn"><span> 작성자 :</span> <span id="name">관리자</span></p>
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
			    <input id="title" type="text" id="title" style="margin:0px 10px; height: 15px;width: 100%;" placeholder="제가 영어를 해야해서요"/>
			  </div>
			  <div class="auto-group-qnps-4cg">
			    <p class="item--YXr">위치</p>
			    <select class="form-select" aria-label="Default select example" style="margin-right:10px;">
			      <option selected>시</option>
			      <option value="1">One</option>
			      <option value="2">Two</option>
			      <option value="3">Three</option>
			    </select>
			    <div class="auto-group-z3ag-QTa">
			      <select class="form-select" aria-label="Default select example">
			        <option selected>구</option>
			        <option value="1">One</option>
			        <option value="2">Two</option>
			        <option value="3">Three</option>
			      </select>
			    </div>
			  </div>
			  <div class="group-18-PKW">
			    
			    <p class="item--gZW">기부할재능</p>
			    <select class="form-select" aria-label="Default select example" style="margin-right:10px;">
			      <option selected>대분류</option>
			      <option value="1">One</option>
			      <option value="2">Two</option>
			      <option value="3">Three</option>
			    </select>
			    <select class="form-select" aria-label="Default select example" style="margin-right:10px;">
			      <option selected>기부할재능</option>
			      <option value="1">One</option>
			      <option value="2">Two</option>
			      <option value="3">Three</option>
			    </select>
			    <p class="item--i8p">기부 받고 싶은 재능</p>
			    <select class="form-select" aria-label="Default select example" style="margin-right:10px;">
			      <option selected>대분류</option>
			      <option value="1">One</option>
			      <option value="2">Two</option>
			      <option value="3">Three</option>
			    </select>
			    <select class="form-select" aria-label="Default select example">
			      <option selected>기부받고싶은재능</option>
			      <option value="1">One</option>
			      <option value="2">Two</option>
			      <option value="3">Three</option>
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
				editor: document.querySelector("#editor").value,
			}),
		})
		.then(response => response.json())
		.then(result => console.log(result));
		
		return false;
	});
	
 </script>
</body>