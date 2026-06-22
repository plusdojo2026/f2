<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>クイズゲーム</title>
<style>

html,body{
    /* スクロール禁止 */
    overflow:hidden;
}

.quiz {
    margin: 8px;
    position: relative;
    display: inline-block;
    width: 100%;
}

.quiz img{
    width: 100%;
}

.steam {
    position: absolute;
    top: 20px;   /* 上からの位置 */
    left: 20px;  /* 左からの位置 */
}

.coffee {
    display: block;
    /* width: 90%; */
}

.spoon {
    position: absolute;
    top: 20px;   /* 上からの位置 */
    left: -20px;  /* 左からの位置 */
}

.off {
    position: absolute;
    top: 20px;   /* 上からの位置 */
    left: 30px;  /* 左からの位置 */
   display: none;
}


.text-overlay {
  position: absolute;
  top: 20%;        /* 上からの位置 */
  left: 50%;       /* 左からの位置 */
  transform: translate(-50%, -50%); /* 中央に配置 */
  color: #d2691e;
  font-size: 72px;
  font-weight: bold;
  text-shadow: 0 0 5px black; /* 読みやすくする */
}
</style>
<script src="https://cdn.jsdelivr.net/npm/image-map-resizer@1.0.10/js/imageMapResizer.min.js"></script>
</head>
<body>
	<div class="quiz">
        <img src="image/steam.png" class="steam" id="steam">
        <img src="image/coffee-back.png" class="coffee">
        <img src="image/spoon1.png" class="spoon" id="spoon1" usemap="#spoonMap">
        <map name="spoonMap">
            <area shape="rect" coords="13,579,318,654" href="#" id="spoon1_area" >
        </map>
        <div class="spoon-wrap"><img src="image/spoon2.png" class="spoon off" id="spoon2"></div>
        <div class="text-overlay" id="quiz_word"><c:out value="${word.word}"></c:out></div>
        
        <div class="btn_box back">
  			<a href="/f2/HomeServlet" class="btn animation">Back</a>
		</div>
		<div class="btn_box help">
  			<div class="btn animation" onclick="help()">Help</div>
		</div>
    </div>
    
    
    <div class="overlay" id="overlay"></div>
    <div class="setumei" id="setumei">
    あｋｄｓぁｆｊｄｌｋｆじゃｌｄｆじゃｌｋｓｊｄｆぁｓｆｄ
    <button id="closeBtn" class="close-btn" onclick="closeHelp()">閉じる</button>
    </div>
    
    <script src="js/quiz.js"></script>
    <script>
        imageMapResize();
    </script>
<script>
'use strict'
function help(){
	const overlay=document.getElementById('overlay');
	const setumei=document.getElementById('setumei');
	
	setumei.style.top=300+"px";
	setumei.style.left=300+"px";
	overlay.style.display='flex';
	setumei.classList.add('show');	
}


function closeHelp(){
	const setumei =document.getElementById('setumei');
	const overlay = document.getElementById('overlay');
	
    setumei.classList.remove('show');
    setumei.style.display = 'none';
    overlay.style.display = 'none';
}
</script>
</body>
</html>