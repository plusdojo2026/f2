<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<c:if test="${not empty sessionScope.user_no}">
		    <form action="LogoutServlet" method="post">
		        <button type="submit">ログアウト</button>
		    </form>
		</c:if>
	</body>
</html>