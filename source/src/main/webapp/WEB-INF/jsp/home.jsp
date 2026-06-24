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

<p>検索画面</p><br>
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
<option value="0">指定なし</option>
<option value="1">用語</option>
<option value="2">物品・サービス</option>
<option value="3">人物</option>
<option value="4">ゲーム・アニメ</option>
<option value="5">音楽</option>
</select>
<input type="text" name="word">
<input type="submit" value="送信" class="sub">
</form>

<br>
<p>マジックエイトボール</p><br>
<form class="magic" method="POST" action="/f2/MagicServlet">
<select name="genre_no">
<option value="0">指定なし</option>
<option value="1">用語</option>
<option value="2">物品・サービス</option>
<option value="3">人物</option>
<option value="4">ゲーム・アニメ</option>
<option value="5">音楽</option>
</select>
<input type="submit" value="送信" class="sub">
</form>

<br>

<p>ゲーム選択</p><br>
<div>
<button onclick="quizServlet()">クイズゲーム</button>
<button onclick="gestureServlet()">ジェスチャーゲーム</button>
<button onclick="readServlet()">読みあてゲーム</button>
</div>

<br>
<p>メニューボタン</p><br>
<div>
<button onclick="menuServlet()">メニュー</button>
</div>


</body>
<script>
function quizServlet(){
	window.location.href="QuizServlet";
}
function gestureServlet(){
	window.location.href="GestureServlet";
}
function readServlet(){
	window.location.href="ReadServlet";
}
function menuServlet(){
	window.location.href="MenuServlet";
}
</script>
</html>



