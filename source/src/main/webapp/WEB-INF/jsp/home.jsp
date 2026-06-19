<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ホーム画面</title>
<style>
.record{
background-color:red;

}
</style>
</head>
<body>
<div>
<div class="record">
</div>
</div>

<form class="search" method="POST" action="/f2/SearchServlet">
<select name="era_no">
<option value="0">指定なし</option>
<option value="1">昭和後期</option>
<option value="2">平成初期</option>
<option value="3">平成中期</option>
<option value="4">平成後期</option>
<option value="5">令和</option>
</select>
<select name="genre_no">
</select>
<input type="text" name="word">
</form>
</body>
</html>