<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>スタート画面|じぇね×りんく</title>
<style>

html {
  background-color: #ffffff; 
  width: 100%;
  height: 100%;
  margin: 0 ;
  padding: 0 ;
  overflow: hidden ; 
  display: flex ;
  justify-content: center ;
  align-items: center ;
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


.main-link-area {
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0;
  left: 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 40px;
  z-index: 10;
  cursor: pointer;
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
  width: 80%; 
  height: auto;
}

@keyframes fadeOutSplash {
  0% { opacity: 1; visibility: visible; }
  80% { opacity: 1; visibility: visible; }
  100% { opacity: 0; visibility: hidden; pointer-events: none; }
}

.record-player {
  position: relative;
  width: 1000px;
  height: 700px;
  transform: rotate(90deg) scale(0.5); 
  transform-origin: center center; 
  margin-top: -40px;
}

.record-player .bg-player,
.record-player .disk,
.record-player .needle,
.record-player img {
  width: 100%;
  height: 100%;
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
  height: 260px;
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
.recordcases .record3 { transform: rotate(-35deg) translate(-10px, 10px); }
.recordcases .record2 { transform: rotate(-25deg) translate(-5px, 5px); }
.recordcases .record5 { transform: rotate(-5deg) translate(0px, 20px); }

.eightball {
  position: absolute;
  bottom: 20px;
  right: 20px;        
  width: 150px; 
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

<div id="splash" class="logo-layer">
  <img src="image/logo.png" class="logo-img">
</div>

<div class="main-link-area" onclick="location.href='/f2/HomeServlet'">

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
    <img src="image/record-retro2.png" class="record2" />
    <img src="image/record-retro1.png" class="record5" />
  </div>

  <div class="eightball">
    <img src="image/eightball-black.png" class="blackball">
    <img src="image/eightball-white.png" class="whiteball">
  </div>

</div>



</body>
</html>