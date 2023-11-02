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
  <title>Group 30929655</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Charmonman%3A400"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Capriola%3A400"/>
  <link rel="stylesheet" href="/styles/adminlogin.css"/>
</head>
<body>
<div class="group-30929655-teU">
  <div class="group-194-cqN">
    <img class="group-30929654-9aQ" src="/assets/group-30929654.png"/>
    <div class="rectangle-169-f2x">
    </div>
    <img class="icon-x-letter-afi" src="/assets/icon-x-letter.png"/>
    <div class="rectangle-170-hEY">
    </div>
    <div>
      <p class="id-b52">ID</p><input type="text" class="rectangle-170-hEY" id="ID">
      <p class="pass-UuW">PASS</p><input type="password" class="rectangle-171-PWg" id="PASS">
    </div>
    <input class="rectangle-172-7Bn admin_login_button" type ="button" value="관리자 로그인"/>
  </div>
</div>
<script>

const button = $(#admin_login_button);
button.on("click", admin_login);

function admin_login(){
	
	const admin_id = $(#ID).val();
	const admin_pass = $(#PASS).val();	
	
}

</script>
</body>