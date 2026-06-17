<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>メニュー画面</title>
	</head>
	<body>
		<a href="/f2/SignupServlet">新規登録</a>
		<a href="/f2/LoginServlet">ログイン</a>
		<c:if test="${not empty sessionScope.user_no}">
			<form action="LogoutServlet" method="get">
				 <button type="submit">ログアウト</button>
			</form>
		</c:if>
	</body>
</html>