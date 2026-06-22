<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>マジック画面|じぇね×りんく</title>
    <style>
        html, body {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100vh;
            background-size: cover;
            background-position: center; 
            background-repeat: no-repeat;          
            background-attachment: fixed;
            position: relative;
            overflow: hidden; 
        }

        .record-player {
        	pointer-events: none;
            position: absolute;
            top: 20px;
            left: 50%;
            transform: translateX(-50%) rotate(90deg) scale(0.95); 
            transform-origin: center center; 
            width: 1000px;
            height: 700px;
            z-index: 10;
        }

        .record-player .bg-player,
        .record-player .disk,
        .record-player .needle,
        .record-player img {
            width: 1000px;
            height: 700px;
            position: absolute;
            top: 0;
            left: 0;
        }

        .bg-player { z-index: 1; }
        .disk { z-index: 5; }
        .needle { z-index: 10; }

        .eightball {
        	pointer-events: none;
            position: absolute !important;
            top: 50% !important;
            left: 50% !important;
            transform: translate(-50%, -50%) !important;
            width: 1200px !important;  
            height: 1200px !important; 
            z-index: 100 !important;
        }
        
        .eightball img {
        	pointer-events: none;
            position: absolute !important; 
            top: 0 !important;
            left: 0 !important;
            width: 100% !important; 
            height: 100% !important;
            object-fit: contain !important;
        }
        
        .blackball { z-index: 101 !important; } 
        .whiteball { z-index: 102 !important; } 
        
        .text-overlay {
          pointer-events: none;
		  position: absolute;
		  top: 50%;        /* 上からの位置 */
		  left: 50%;       /* 左からの位置 */
		  transform: translate(-50%, -50%); /* 中央に配置 */
		  color: white;
		  font-size: 72px;
		  font-weight: bold;
		  text-shadow: 0 0 5px black; /* 読みやすくする */
		  z-index: 999 !important;
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
<script>
 imageMapResize();
 </script>
</body>
</html>
