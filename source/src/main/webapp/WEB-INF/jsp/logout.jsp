<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>ログイン画面</title>
		<link rel="stylesheet" href="/f2/css/login.css">
	</head>
	<body data-scene="board">
		<div id="view">
			<div id="camera">
				<img src="/f2/image/ログイン背景2.png" id="bg">
				<div id="board" class="board">
					<div class="board-inner">
						<img src="/f2/image/看板1.png" class="board-front">
					</div>
					<form action="/f2/LogoutServlet" method="post" class="input2">
						<p>ログアウトしますか？</p>
						<div class="buttonArea">
							<input type="submit" value="Yes" class="yes">
							<div class="noHover">No</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>
	<script src="/f2/js/login.js"></script>
</html>