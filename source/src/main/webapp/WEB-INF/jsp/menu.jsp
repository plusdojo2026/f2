<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>メニュー画面</title>
		<link rel="stylesheet" href="login.css">
	</head>
	<body>
		<div id="bg" class="bg">
		    <img src="ログイン背景(仮).png">
		</div>
	</body>
	<script>
		const image=document.getElementById('bg');
		function setImagePosition(x,y){
		image.style.top=y+'px';
		image.style.left=x+'px';
		}

		window.onload=function(){
		setImagePosition(window.innerWidth,800);
		}
	</script>
</html>