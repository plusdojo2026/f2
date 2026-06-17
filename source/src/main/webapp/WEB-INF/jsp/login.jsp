<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ログイン画面</title>
	</head>
	<body>
		<form action="/f2/LoginServlet" method="post">
			<label>メールアドレス:
				<input type="text" name="mail_add">
			</label>
			<label>パスワード:
				<input type="password" name="password">
			</label>
			<input type="submit" name="submit" value="登録">
      		<input type="reset" name="reset" value="リセット">
		</form>
		<a href="/f2/MenuServlet">戻る</a>
	</body>
</html>