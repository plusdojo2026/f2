<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ジェスチャーゲーム|じぇね×りんく</title>
<style>

body{
    margin:0;
    width:100%;
    height:100%;

    display:flex;
    justify-content:center;
    align-items:center;
}

.view{
    width:390px;
    height:844px;

    position:relative;
    overflow:hidden;

    margin:auto;
    background-color:red;
}

#camera {
    width:100%;
    height:100%;
    position:relative;

    transition:transform 1.5s;
    transform-origin:center center;
}

.gesture {
   	position: relative;
   	display: inline-block;
   	width: 100%;
   	height: 100%
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
   	top: 422px;
   	left: 195px;
   	transform: translate(-50%, -50%); 
   	max-width: 90%;
   	max-height: 90%;
   	object-fit: contain;
}

.gesture_word {
    position: absolute;
    top: 565.48px;
    left: 199.875px;
    transform: translate(-50%, -50%);
    white-space: nowrap;

    width: 76%;          /* 追加 */
    text-align: center;  /* 追加 */

    color: #663600;
    font-size: 36px;
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
  	font-size: 25px;
  	font-weight: bold;
  	text-align: center;
  	line-height: 45px;
  	letter-spacing: 2px;
  	width:135px;
    height:60px;
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
    display:none;
    position:absolute;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background:rgba(0,0,0,.3);
    z-index:100;
}
 
.setumei{
    display:none;
    position:absolute;
    left:50%;
    top:50%;
    transform:translate(-50%,-50%);
    width:70%;
    max-width:300px;
    background:white;
    padding:20px;
    border-radius:10px;
    z-index:101;
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

@media (max-width:390px){

    .view{
        width:100vw;
        height:100vh;
    }

}
</style>
<script src="https://cdn.jsdelivr.net/npm/image-map-resizer@1.0.10/js/imageMapResizer.min.js"></script>
</head> 

<body>
<div class="view">
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
    鼻を押せ。<br>そこにすべてがある。
    <button id="closeBtn" class="close-btn" onclick="closeHelp()">閉じる</button>
    </div>
</div>   

</body>
<script src="js/gesture.js"></script>
<script>
	imageMapResize();
</script>
<script>
'use strict'

const BASE_WIDTH = 390;
const BASE_HEIGHT = 844;

const container = document.querySelector(".view");

function resize() {
    const scale = Math.min(
        window.innerWidth / BASE_WIDTH,
        window.innerHeight / BASE_HEIGHT
    );

    container.style.transform = `scale(${scale})`;
    container.style.transformOrigin = "center center";
}

resize();
window.addEventListener("resize", resize);

function help(){

    const overlay=document.getElementById("overlay");
    const setumei=document.getElementById("setumei");

    overlay.style.display="block";
    setumei.classList.add("show");

}


function closeHelp(){

    const setumei = document.getElementById("setumei");
    const overlay = document.getElementById("overlay");

    setumei.classList.remove("show");
    overlay.style.display = "none";

}
</script>
</html>