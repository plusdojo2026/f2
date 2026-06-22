<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>スタート画面|じぇね×りんく</title>
<style>
html,body{
/* スクロール禁止 */
/* overflow:hidden; */
margin:0;
padding: 0;
width: 100%;
height: 100vh;
background-image: url("image/starthaikei.png");
background-size: cover;
background-position: center; 
background-repeat: no-repeat;          
background-attachment: fixed;
display: flex;
flex-direction: column; 
justify-content: center;
align-items: center;
gap: 40px;
}
.logo-layer{
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100vh;
  background-color: #ffffff; 
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 9999;
  animation: fadeOutSplash 2.5s forwards;
}
.logo-img {
  width: 800px; 
  height: auto;
}

@keyframes fadeOutSplash {
  0% {
    opacity: 1;
    visibility: visible;
  }
  80% {
    opacity: 1;
    visibility: visible;
  }
  100% { 
    opacity: 0;
    visibility: hidden; 
  }
}

.record-player {
  position: relative;
  width: 1000px;
  height: 700px;
  
  transform: rotate(90deg) scale(1.2);
  transform-origin: 500px 350px; 
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

.recordcases{
  position: fixed; 
  width: 700px;  
  height: 700px;
  bottom: -250px;    
  left: 50px;        
  display: flex;
  justify-content: space-between; 
  pointer-events: none;   
  align-items: flex-end;    
  z-index: 30;

}
.recordcases img{
  position: absolute;
  bottom: 0;
  left: 0;
  width: 550px;
  height: auto;
  display: block;
  pointer-events: auto;
  transform-origin: left bottom;
}
.recordcases .record3{
  transform: rotate(-40deg) translate(-20px, 20px);
}
.recordcases .record2{
  transform: rotate(-25deg) translate(-15px, 15px);
}
.recordcases .record5{
  transform: rotate(-10deg) translate(-5px, 40px);
}

.eightball{
  position: fixed;
  bottom: 20px;
  right: 20px;        
  width: 300px;
  height: auto;
  z-index: 30;
}

.eightball img{
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

  <div class="word_name">${word}</div>
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

<div onclick="location.href='${pageContext.request.contextPath}/home.jsp'">
</div>

</body>
</html>