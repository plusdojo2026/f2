<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>スタート画面|じぇね×りんく</title>
<style>

html {
  background-color: #222 !important; 
  width: 100vw !important;
  height: 100vh !important;
  margin: 0 !important;
  padding: 0 !important;
  overflow: hidden !important; 
  display: flex !important;
  justify-content: center !important;
  align-items: center !important;
}

body {
  position: relative !important;
  width: 390px !important;
  max-width: 390px !important;
  min-width: 390px !important;
  height: 844px !important;
  max-height: 844px !important;
  min-height: 844px !important;
  

  overflow: hidden !important; 
  margin: 0 auto !important;
  padding: 0 !important;
  
  
  background-image: url("image/starthaikei.png") !important;
  background-size: cover !important;
  background-position: center !important; 
  background-repeat: no-repeat !important;       
  

  display: flex !important;
  flex-direction: column !important; 
  justify-content: center !important;
  align-items: center !important;
  gap: 40px !important;
  
 
  border: 1px solid #ffffff !important;
  box-shadow: 0 0 30px rgba(0,0,0,0.8) !important;
  box-sizing: border-box !important;
}


.logo-layer {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: #ffffff; 
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 9999;
  animation: fadeOutSplash 2.5s forwards;
}

.logo-img {
  width: 90%; 
  height: auto;
}

@keyframes fadeOutSplash {
  0% { opacity: 1; visibility: visible; }
  80% { opacity: 1; visibility: visible; }
  100% { opacity: 0; visibility: hidden; }
}


.record-player {
  position: relative;
  width: 1000px;
  height: 700px;
  transform: rotate(90deg) scale(0.35); 
  transform-origin: center center; 
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

.word_name {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%) rotate(-90deg); 
  z-index: 20; 
  width: 400px;
  height: auto;
  word-break: break-all;  
  overflow-wrap: break-word;
  
  font-size: 60px;      
  font-weight: bold;    
  color: #1E3A8A;   
  text-align: center;
  pointer-events: none;  
}


.recordcases {
  position: absolute; 
  width: 100%;  
  height: 200px;
  bottom: 0;    
  left: 0;        
  display: flex;
  justify-content: space-between; 
  pointer-events: none;   
  align-items: flex-end;    
  z-index: 30;
}


.recordcases img {
  position: absolute;
  bottom: -30px;
  left: -20px;
  width: 180px;
  height: auto;
  display: block;
  pointer-events: auto;
  transform-origin: left bottom;
}
.recordcases .record3 { transform: rotate(-40deg) translate(-10px, 10px); }
.recordcases .record2 { transform: rotate(-25deg) translate(-5px, 5px); }
.recordcases .record5 { transform: rotate(-10deg) translate(0px, 20px); }


.eightball {
  position: absolute;
  bottom: 20px;
  right: 20px;        
  width: 100px; 
  height: 100px;
  z-index: 30;
}

.eightball img {
  position: absolute; 
  bottom: 0;
  right: 0;
  width: 100%; 
  height: auto;
}
</style>

</head>
<body>
<div class="logo-layer">
  <img src="image/logo.png" class="logo-img">
</div>
<div onclick="location.href='/f2/HomeServlet'">
<div class="record-player">
  <div class="bg-player">
    <img src="image/record-player-notuse.png" alt="record" />
  </div>
  
  <div id="img2" class="disk">
    <img src="image/disk-black.png" alt="disk" />
  </div>
  
  <div id="img3" class="needle">
    <img src="image/record-needle.png" alt="needle" />
  </div>

  <div class="word_name">${word.word}</div>
</div> 
<div class="recordcases">
  <img src="image/recordcase3.jpeg" class="record3" />
  <img src="image/recordcase2.jpeg" class="record2" />
  <img src="image/recordcase5.jpeg" class="record5" />

</div>
<div class="eightball">
  <img src ="image/eightball-black.png" class="blackball">
  <img src ="image/eightball-white.png" class="whiteball">
</div>


</div>

</body>
</html>