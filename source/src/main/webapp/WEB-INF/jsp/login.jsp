<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ログイン画面</title>
		<link rel="stylesheet" href="/f2/css/login.css">
	</head>
	<body>
		<a href="/f2/MenuServlet">戻る</a>
		<div class="background">
			<img src="/f2/image/ログイン背景(仮).png" class="bg">
		</div>
		<div class="container">
			<img src="/f2/image/blackbord.png" class="board board-tilt" id="board">
			<form action="/f2/LoginServlet" method="post" class="input">
				<input type="text" name="mail_add" placeholder="メールアドレス">
				<input type="password" name="password" placeholder="パスワード">
			
				<input type="submit" value="ログイン">
				<input type="reset" value="リセット">
				<c:if test="${not empty error}">
					<p style="color:red; font-weight:bold;">${error}</p>
				</c:if>
			</form>
		</div>
	</body>
	<script>
		'use strict'
		
	    window.addEventListener("load", () => {
	        const board = document.getElementById("board");
	        board.classList.remove("board-tilt");
	        board.classList.add("board-front");
	    });
	</script>
</html>