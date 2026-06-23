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
	<body data-scene="login">
		<div id="view">
			<div id="camera">
				<img src="/f2/image/ログイン背景(仮)2.png" id="bg">
				<div class="backHover">Back</div>
				<form action="/f2/LoginServlet" method="post" class="input1">
					<input type="text" name="mail_add" placeholder="メールアドレス">
					<input type="password" name="password" placeholder="パスワード">
					
					<div>
						<input type="submit" id="loginButton" value="ログイン">
						<input type="reset" value="リセット">
					</div>
					<div class="error">
						<c:if test="${not empty error}">
							<p>${error}</p>
						</c:if>
					</div>
				</form>
			</div>
		</div>
	</body>
	<script src="/f2/js/login.js"></script>
</html>