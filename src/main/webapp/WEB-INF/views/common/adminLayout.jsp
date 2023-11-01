<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title"/></title>

<link rel="stylesheet" href="/styles/mainpage.css"/> 

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script> 
</head>
<body>
	<div id="container">

		<div id="content">
			<tiles:insertAttribute name="body"/>
		</div>		

	</div>
</body>
</html> 