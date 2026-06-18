<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>スタート画面|じぇね×りんく</title>
<link rel="stylesheet" href="/webapp/css/home.css">
<style>
html,body{
    /* スクロール禁止 */
    /* overflow:hidden; */
    margin:0;
}

body{
    /* 6.1インチピクセル数 */
    width:1170px;
    height:2532px;
}
.bg-player{
z-index:1;
}

.disk{
z-index:5;
}

.needle{
z-index:10;
}
</style>

</head>
<body>
  <div class="bg-player">
    <img src="../image/record-player-notuse.png" alt="" />
  </div>
  
  <div id="img2" class="disk">
    <img src="../image/disk-black.png" alt="" />
  </div>
  
  <div id="img3" class="needle">
    <img src="../image/record-needle.png" alt="" />
  </div>


<div class="word_name">${word.word_name}</div>
<div onclick="location.href='${pageContext.request.contextPath}/home.jsp'">
</div>
</body>
</html>


