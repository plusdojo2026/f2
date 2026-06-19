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
	<body>
		<div class="background">
		    <div class="screen menu-view"></div>
		</div>
		<div class="container">
			<div class="board-area">
				<img src="/f2/image/blackbord.png" class="board board-front" id="board">
				<div class="menu">
					<a href="/f2/SignupServlet">新規登録</a>
					<a href="/f2/LoginServlet">ログイン</a>
					<c:if test="${not empty sessionScope.user_no}">
						<form action="LogoutServlet" method="get">
							 <button type="submit">ログアウト</button>
						</form>
					</c:if>
				</div>
			</div>
		</div>
	</body>
</html>