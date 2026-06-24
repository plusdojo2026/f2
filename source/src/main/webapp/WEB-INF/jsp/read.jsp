<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>読み当てゲーム</title>
<style>
html,body{
    /* スクロール禁止 */
    overflow:hidden;
}

html{
	margin:0;
	padding:0;
	width:100%;
	height:100%;
}
body{
	display:flex;
	justify-content:center;
	align-items:center;
	margin:0;
	padding:0;
	width:100%;
	height:100%;
}
.box{
	width:390px;
	height:844px;
	position:relative;
	overflow:hidden;
	background-color:red;
	margin:0;
}

.read {
    margin: 0;
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
    top: -40px;   /* 上からの位置 */
    left: 11.25px;  /* 左からの位置 */
    max-width: 95%;
    transform:scale(0.9);
}

.channel {
    position: absolute;
    top: -20px;   /* 上からの位置 */
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
	font-size: 32px;
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
 	height: 60px;
 	width: 100%;
	font-size: 24px;
	font-weight: bold;
	padding: 5px;
	background-color: #ddd;
}

.tf {
    position: absolute;
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
    position: absolute;
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
    z-index:80;
}

.clear.show {
    opacity: 1;
    pointer-events: auto;
}

.clear-buttons {
	position: absolute;  
    margin-top: 30px;
    bottom: 200px;
    display: flex;
    gap: 40px;
}

.clear-buttons button {
    font-size: 20px;
    padding: 10px 24px;
    cursor: pointer;
}

.word-info {
    position: absolute;   
    top: 600px;           /* 好きな位置に調整 */
    left: 5px;
    color: white;
    font-size: 28px;
}

.btn_box{
    position:absolute;
    z-index:10;
}

.back{
    left:20px;
    top:20px;
}

.help{
    right:20px;
    top:20px;
}

.btn{
    display:inline-block;
	
	width: 60px;
    padding:10px 18px;

    background:rgb(90,95,170);
    color:#fff;

    border:2px solid #333;

    cursor:pointer;

    text-decoration:none;

    font-size:18px;
    font-weight:bold;
    padding-left: 30px
}

.overlay{
    display:none;

    position:absolute;
    top:0;
    left:0;
    width:100%;
    height:100%;

    background:rgba(0,0,0,.5);
    z-index:100;
}

.setumei{
    display:none;

    position:fixed;
    left:50%;
    top:50%;
    transform:translate(-50%,-50%);

    z-index:101;

    background:white;
    padding:20px;
    border-radius:10px;
}

.setumei.show{
    display:block;
}

.close-btn{
    display:block;
    margin-top:20px;
    padding:8px 16px;
    cursor:pointer;
}

@media (max-width:390px){

#screen{
    width:100vw;
    height:100vh;
}

.quiz{
    width:100%;
    height:100%;
}

}

</style>
<script src="https://cdn.jsdelivr.net/npm/image-map-resizer@1.0.10/js/imageMapResizer.min.js"></script>
</head>
<body>
<div class="box">
	<div class="read">
		<img src="image/tv-back-haikei.png" class="tv" id="tv" usemap="#tvMap">
		<map name="tvMap">
			<area shape="rect" coords="4,168,390,451" href="#" alt="" id="tv_area"/>
		</map>
		<img src="image/tv-screen.png" class="screen" id="screen1" style="pointer-events: none;">
		<img src="image/tv-screen1.png" class="screen hide" id="screen2" style="pointer-events: none;">
		<img src="image/tv-channel.png" class="channel" usemap="#channelMap">
		<map name="channelMap">
    		<area shape="rect" coords="620,1266,788,1434" href="#" alt="" id="channel_area"/>
		</map>

		<div class="read_word" id="read_word"><c:out value="${word.word}"></c:out></div>
		
		<div class="btn_box back">
	  		<a href="/f2/HomeServlet" class="btn animation">Back</a>
		</div>
		<div class="btn_box help">
	  		<div class="btn animation" onclick="help()">Help</div>
		</div>
		
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
	
	<div class="overlay" id="overlay"></div>
    <div class="setumei" id="setumei">
    テレビ画面をたたけ<br>そこにすべてがある。
    <button id="closeBtn" class="close-btn" onclick="closeHelp()">閉じる</button>
    </div>
	
</div>
	<script>
	imageMapResize();
	</script>
	
    <script src="js/read.js"></script>
</body>
</html>