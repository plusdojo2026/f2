<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>マジックエイトボール：テンプレート文</title>
</head>
	<body>
	<hr>
		<c:forEach var = "e" items="${sentence}">
			<form method="POST" action="/webapp/UpdateDeleteServlet">
				<input type="text" name="template" value="${e.template}"><br>
			</form>
		</c:forEach>
		<p>テンプレート文</p>
	</body>
</html>