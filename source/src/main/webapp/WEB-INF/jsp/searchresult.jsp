<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach var="e" items="${list}" >
	<form method="POST" action="/webapp/UpdateDeleteServlet1">
	ワードナンバー<input type="hidden" name="word_no" value="${e.word_no}">
	ワード<input type="text" name="word" value="${e.word}"><br>
	発音<input type="text" name="pronounce" value="${e.pronounce}"><br>
	意味<input type="text" name="meaning" value="${e.meaning}"><br>
	年代<input type="text" name="era_no" value="${e.era_name}"><br>
	ジャンル<input type="text" name="genre_no" value="${e.genre_name}"><br>
	レベル<input type="text" name="level" value="${e.level}"><br>
	履歴<input type="text" name="viewed" value="${e.viewed}"><br>
	</form>
	<hr>
</c:forEach>
<c:if test="${empty list}">
<p>指定された条件に一致するデータはありません。</p>
</c:if>
<a href="/webapp/HomeServlet">ホームへ戻る</a>
</body>
</html>