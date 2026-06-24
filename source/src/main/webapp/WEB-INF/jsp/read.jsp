<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>読み当てゲーム</title>
<style>
html,body{
    /* スクロール禁止 */
    overflow:hidden;
}

.read {
    margin: 8px;
    position: relative;
    display: inline-block;
    width: 100%;
}

.read img{
    width: 100%;
}

.tv {
    display: block;
    /* width: 90%; */
}

.screen {
    position: absolute;
    top: -95px;   /* 上からの位置 */
    left: 22.5px;  /* 左からの位置 */
    max-width: 95%;
    transform:scale(0.9);
}

.channel {
    position: absolute;
    top: -50px;   /* 上からの位置 */
    left: 15%;  /* 左からの位置 */
    max-width: 90%;
}

.hide {
    position: absolute;
    display: none;
}

.read_word{
 	position: absolute;
	top: 37.5%;        /* 上からの位置 */
	left: 50%;       /* 左からの位置 */
	transform: translate(-50%, -50%); /* 中央に配置 */
	color: white;
	font-size: 72px;
	font-weight: bold;
	text-shadow: 0 0 5px black; /* 読みやすくする */
	z-index:50;
}
.ansForm{
	position: absolute;
	top: 60.5%;        /* 上からの位置 */
	left: 40%;       /* 左からの位置 */
	transform: translate(-50%, -50%); /* 中央に配置 */
}

.ansText{
 	height: 150px;
 	width: 110%;
	font-size: 72px;
	font-weight: bold;
	padding: 10px;
	background-color: #ddd;
}

.tf {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.6);
    color: white;
    font-size: 48px;
    display: flex;
    justify-content: center;
    align-items: center;
    opacity: 0;
    pointer-events: none;
    transition: opacity 0.3s;
}

.tf.show {
    opacity: 1;
    pointer-events: auto;
}

.clear {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.7);
    color: yellow;
    font-size: 60px;
    display: flex;
    justify-content: center;
    align-items: center;
    opacity: 0;
    pointer-events: none;
    transition: opacity 0.4s;
}

.clear.show {
    opacity: 1;
    pointer-events: auto;
}

.clear-buttons {
	position: absolute;  
    margin-top: 30px;
    display: flex;
    gap: 40px;
}

.clear-buttons button {
    font-size: 30px;
    padding: 10px 30px;
    cursor: pointer;
}

.word-info {
    position: absolute;   
    top: 900px;           /* 好きな位置に調整 */
    left: 100px;
    color: white;
    font-size: 28px;
}

</style>
<script src="https://cdn.jsdelivr.net/npm/image-map-resizer@1.0.10/js/imageMapResizer.min.js"></script>
</head>
<body>
	<div class="read">
		<img src="image/tv-back-haikei.png" class="tv" id="tv" usemap="#tvMap">
		<map name="tvMap">
			<area shape="rect" coords="4,168,390,451" href="#" alt="" id="tv_area"/>
		</map>
		<img src="image/tv-screen.png" class="screen" id="screen1">
		<img src="image/tv-screen1.png" class="screen hide">
		<img src="image/tv-channel.png" class="channel" usemap="#channelMap">
		<map name="channelMap">
    		<area shape="rect" coords="620,1266,788,1434" href="#" alt="" id="channel_area"/>
		</map>

		<div class="read_word" id="read_word"><c:out value="${word.word}"></c:out></div>
		<div class="tf" id="tf"></div>
		<div class="word-info">
    		<div id="word-meaning"></div>
    		<div id="word-pronounce"></div>
		</div>
		<div id="clear" class="clear">
			<div>クリア！！</div>
			<div class="clear-buttons">
        		<button id="retry-btn">もう一度</button>
        		<button id="end-btn">終了する</button>
    		</div>
		</div>
		

		<form id="ansForm" class="ansForm">
    		<input type="text" id="pronounce" name="pronounce" placeholder="Answer" class="ansText">
		</form>
	</div>
	
	<script>
	imageMapResize();
	</script>
	
    <script src="js/read.js"></script>
</body>
</html>