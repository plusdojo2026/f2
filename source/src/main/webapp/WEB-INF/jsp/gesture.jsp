<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ジェスチャーゲーム|じぇね×りんく</title>
<style>

html,body{
    /* スクロール禁止 */
   	overflow:hidden;
}

body{
    margin:0;

    display:flex;
    justify-content:center;

    min-height:100vh;
}

#view{
    width:390px;
    height:844px;

    overflow:hidden;
    position:relative;
}

.gesture {
   	margin: 8px;
   	position: relative;
   	display: inline-block;
   	width: 100%;
}

.gesture img{
   	width: 100%;
}

.bearback {
   	display: block;
    /* width: 90%; */
}

.bearnose {
   	position: absolute;
   	top: 50%;
   	left: 50%;
   	transform: translate(-50%, -50%); 
   	max-width: 100%;
   	max-height: 60vh;
   	object-fit: contain;
}

.gesture_word {
    position: absolute;
  	top: 70%;        /* 上からの位置 */
  	left: 51.25%;       /* 左からの位置 */
  	transform: translate(-50%, -50%); /* 中央に配置 */
  	color: #663600;
  	font-size: 72px;
  	font-weight: bold;
  	text-shadow: 0 0 5px #473838; 
}

/* 戻るボタン１ */
.btn_box{
  	position: absolute;
  	margin: 0;
  	z-index: 10
}

.back{
	cursor: pointer;
	top: 20px;
  	left: 20px;
}

.help{
	cursor: pointer;
	top: 20px;
  	right: 40px;
}

.btn{
  	color: #FFF;
  	font-size: 50px;
  	font-weight: bold;
  	text-align: center;
  	line-height: 90px;
  	letter-spacing: 2px;
  	width: 350px;
  	height: 100px;
  	top: 8px;
  	left: 8px;
  	margin: auto;
  	background: #5a5faa;
  	position: relative;
 	display: block;
  	text-decoration: none; 
}

.btn:before,
.btn:after{
  	position: absolute;
  	content: "";
  	width: 20%;
  	height: 50%;
}

.btn:before{
  	top: 0;
  	left: 0;
  	border-left: 2px solid #000;
  	border-top: 2px solid #000;
}

.btn:after{
 	bottom: 0;
 	right: 0;
 	border-right: 2px solid #000;
  	border-bottom: 2px solid #000;
}

.btn:hover:before,
.btn:hover:after{
	width: 98%;
	height: 98%;
}

.btn:hover{
	background: #818FBF;
}

/*アニメーション*/
.btn, 
.animation:before,
.animation:after{
 	transition: all 0.3s ease;
 }
 
 .overlay{
 	position:fixed;
	top:0;
	left:0;
	width:100vw;
	height:100vh;
	background:rgba(0,0,0,0.3);
	display:none;
	justify-content:center;
	align-items:center;
	z-index:100;
 }
 
 .setumei{
 	background-color:white;
 	position:absolute;
 	width:50%;
 	height:50%;
 	margin:0;
	opacity:0;
	visibility: hidden;
	z-index:1001;
	transition:opacity 0.5s,visibility 0.5s;
 }
 .setumei.show{
 	display:block;
	visibility: visible;
	opacity:1;
 }
 
 .close-btn {
 	position: fixed;
	position: absolute;
	bottom: 10px;
	right: 10px;
	background: #d3d3d3;
	font-size: 24px;
	cursor: pointer;
	padding: 5px 10px;
	border-radius: 4px;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/image-map-resizer@1.0.10/js/imageMapResizer.min.js"></script>
</head> 

<body>
<div id="view">
    <div class="gesture">
        
        <img src="image/bear-back2.png"  class="bearback">

        <img src="image/bear-nose.png"  class="bearnose" usemap="#bearnoseMap">
		<map name="bearnoseMap">
  			<area shape="circle" coords="249,386,62" href="#" alt="" id="bearnose"/>
		</map>
		
		<div class="gesture_word" id="gesture_word"><c:out value="${word.word}"></c:out></div>
		
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
 </div>   

<script src="js/gesture.js"></script>
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

