<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>マジック画面|じぇね×りんく</title>
    <style>
html {
	background-color: #ffffff;
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
	overflow: hidden;
	display: flex;
	justify-content: center;
	align-items: center;
}

body {
	position: relative ;
  width: 390px ;
  max-width: 390px;
  min-width: 390px;
  height: 844px;
  max-height: 844px;
  min-height: 844px;
  
  overflow: hidden; 
  margin: 0 auto;
  padding: 0 ;
  
  background-image: url("image/starthaikei.png");
  background-size: cover;
  background-position: center; 
  background-repeat: no-repeat;       
  
  display: flex;
  flex-direction: column; 
  justify-content: center;
  align-items: center;
  gap: 40px;
}

.record-player {
	pointer-events: none;
	position: absolute;
	top: 40px;
	left: 50%;
	transform: translateX(-50%) rotate(90deg);
	transform-origin: center center;
	width: 360px;
	height: 252px;
	z-index: 10;
}

.record-player .bg-player, .record-player .disk, .record-player .needle,
	.record-player img {
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
}

.bg-player {
	z-index: 1;
}

.disk {
	z-index: 5;
}

.needle {
	z-index: 10;
}

.eightball {
	pointer-events: none;
	position: absolute;
	top: 55%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 340px;
	height: 340px;
	z-index: 100;
}

.eightball img {
	pointer-events: none;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: contain;
}

.blackball {
	z-index: 101;
}

.whiteball {
	z-index: 102;
}

.text-overlay {
	pointer-events: none;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: black;
	font-size: 24px;
	font-weight: bold;
	text-shadow: 0 0 5px white;
	z-index: 999 !important;
	text-align: center;
	width: 80%;
	word-break: break-all;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/image-map-resizer@1.0.10/js/imageMapResizer.min.js"></script>
</head>
<body>
<div>
    
    <div class="record-player">
        <div class="bg-player">
            <img src="image/record-player-notuse.png" alt="record" />
        </div>
    </div> 
    
    <div class="eightball">
        <img src="image/eightball-black.png" class="blackball" alt="black">
        <img src="image/eightball-white.png" class="whiteball" alt="white">
        <div class="text-overlay" id="sentence"><c:out value="${temple.sentence}">aaa</c:out></div>
    </div>
    <a href="HomeServlet"
       style="position:absolute; left:0; top:0; width:100%; height:100%; display:block;">
    </a>
</div>

 
</body>
</html>