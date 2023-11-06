<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()"> <!-- 인증이 됐는지안됐는지 확인하는 구문 -->
   <sec:authentication property="principal" var="principal"/> <!-- property로 가져와서 var 데이터타입으로 대입하겠다는뜻 -->
</sec:authorize>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
    
   <style>
      .or-divider {
            display: flex;
            align-items: center;
            text-align: center;
            color: #999;
        }

        .divider-line {
            flex-grow: 1;
            border: 1.3px solid #ccc;
        }
  </style>
  
</head>
<body>
  <div id="container">   
  	<c:choose> 
  		<c:when test="${empty principal}">
  		
		    <header>
		      <a href="#"><img id="logo" src="/assets/logo.png" alt="" ></a>
		      <nav id="menubar">
		        <ul id="topMenu">
		          <li><a href="#">join </a></li>
		          <li><a id="loginForm" href="javascript:void(0)">login </a></li>
		          <li><a href="#">notice</a></li>
		          <li><a href="#">lesson</a></li>
		          <li><a href="#"><img id="bell" src="/assets/bell3(3).png" alt=""></a></li>
		        </ul>
		      </nav>
		    </header>
	    </c:when>
	    <c:otherwise>
	    	<header>
		      <a href="#"><img id="logo" src="/assets/logo.png" alt="" ></a>
		      <nav id="menubar">
		        <ul id="topMenu">
		          <li><a href="/logout.do">logout </a></li>
		          <li><a href="#">notice</a></li>
		          <li><a href="#">lesson</a></li>
		          <li><a href="#">mypage</a></li>
		          <li><a href="#"><img id="bell" src="/assets/bell3(3).png" alt=""></a></li>
		        </ul>
		      </nav>
		    </header>
	    </c:otherwise>
  	</c:choose>
  </div>

	<div id="LoginDialog">
	  <form class="login-form" id="loginFormTag" method="post" action="<c:url value='/auth/login.do'/>" >
	    <h4 class="mb-3"><b>로그인</b></h4>
	    <div class="form-group">
	      <label for="nickname">닉네임</label>
	      <input type="text" name = "username" class="form-control" id="nickname" placeholder="" required>
	      <div class="invalid-feedback">
	        닉네임을 입력해주세요.
	      </div>
	    </div>
	
	    <div class="form-group">
	      <label for="password">비밀번호</label>
	      <input type="password" name ="password" class="form-control" id="password" placeholder="" required>
	      <div class="invalid-feedback">
	        비밀번호를 입력해주세요.
	      </div>
	    </div>
	
	    <button class="btn btn-secondary btn-lg btn-block"  type="submit">로그인</button>
	    
	    <div class="or-divider">
	      <div class="divider-line"></div>
	      <div>or</div>
	      <div class="divider-line"></div>
    	</div>
    
	    <a href="https://kauth.kakao.com/oauth/authorize?client_id=5837fcd202ac37e5ba6e78d6f6b575ed&redirect_uri=http://127.0.0.1:8090/auth/kakao/callback&response_type=code"><img id="kakaoLogin" src="/assets/kakao_login_medium_wide.png"  style="width: 460px; height: 45px;"/></a>
	  </form>
	</div>
	
<script>
	/* 로그인 다이얼로그 창 띄우는 jquery */
	var loginDialog = $( "#LoginDialog" ).dialog({
	 autoOpen: false,
	 height: 500,
	 width: 500,
	 modal: true,
	 close: function() {
	 }
	});
	
	/* 로그인 다이얼로그 이벤트핸들러*/
	$("#loginForm").on("click", function() {
		loginDialog.dialog("open");
	});
	
</script>
</body>
</html>
