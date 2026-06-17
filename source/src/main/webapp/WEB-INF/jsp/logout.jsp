<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ログアウト画面</title>
	</head>
	<body>
		<p>ログアウトしますか？</p>
		<form action="/f2/LogoutServlet" method="post">
			<button type="submit">Yes</button>
		</form>
		<a href="/f2/MenuServlet">No</a>
	</body>
</html>