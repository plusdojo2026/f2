<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>メニュー画面</title>
		<link rel="stylesheet" href="/f2/css/login.css">
	</head>
	<body data-scene="menu">
		<div id="view">
			<div id="camera">
				<img src="/f2/image/ログイン背景(仮).png" id="bg">
				<div class="signupHover"></div>
				<div class="loginHover"></div>
				<div class="${isLogin ? 'logoutHover' : 'logoutDisable'}"></div>
			</div>
		</div>
	</body>
	<script src="/f2/js/login.js"></script>
</html>