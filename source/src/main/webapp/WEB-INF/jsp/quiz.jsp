<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>クイズゲーム</title>
<style>

body{
    /* スクロール禁止 */
    margin:0;
    overflow:hidden;
}

#screen{
    position:relative;

    width:390px;
    height:844px;

    margin:auto;
    overflow:hidden;
}

.quiz {
	margin:0;
    position: relative;
}

.steam {
	width: 100%;
    position: absolute;
    top: 20px;   /* 上からの位置 */
    left: 20px;  /* 左からの位置 */
}

.coffee {
	width: 100%;
    display: block;
    /* width: 90%; */
}

.spoon {
	width: 100%;
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


.text-overlay{
    position:absolute;
    width:67%;
    top:20%;
    left:53%;
    transform:translate(-50%,-50%);
    white-space: nowrap;
    text-align:center;
    color:#d2691e;
    overflow:hidden;
    font-weight:bold;
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
	<div id="screen">
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
	    <p>スプーンを押せ。<br>さすれば全てが現れる。</p>
	    <button id="closeBtn" class="close-btn" onclick="closeHelp()">閉じる</button>
	    </div>
    </div>
    
    
    <script src="js/quiz.js"></script>
    <script>
        imageMapResize();
    </script>
</body>
</html>