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
  	left: 50%;       /* 左からの位置 */
  	transform: translate(-50%, -50%); /* 中央に配置 */
  	color: white;
  	font-size: 72px;
  	font-weight: bold;
  	text-shadow: 0 0 5px black; 
}

/* 戻るボタン１ */
.btn_box{
  position: absolute;
  top: 20px;
  left: 20px;
  margin: 0;
  z-index: 10
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
</style>
<script src="https://cdn.jsdelivr.net/npm/image-map-resizer@1.0.10/js/imageMapResizer.min.js"></script>
</head> 

<body>
    <div class="gesture">
        
        <img src="image/bear-back2.png"  class="bearback">

        <img src="image/bear-nose.png"  class="bearnose" id="bearnose" usemap="#bearnoseMap">
		<map name="bearnoseMap">
  			<area shape="circle" coords="249,387,48" href="#" alt="" />
		</map>
		
		<div class="gesture_word" id="gesture_word"><c:out value="${word.word}"></c:out></div>
		
		<div class="btn_box">
  			<a href="/webapp/HomeServlet" class="btn animation">Back</a>
		</div>
    </div>

<script src="js/gesture.js"></script>
<script>
	imageMapResize();
</script>
</body>

