<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ジェスチャーゲーム|じぇね×りんく</title>
<style>
    html,body{
/* スクロール禁止 */
/* overflow:hidden; */
margin:0;
padding: 0;
width: 100%;
height: 100vh;
background-size: cover;
background-position: center; 
background-repeat: no-repeat;          
background-attachment: fixed;
display: flex;
flex-direction: column; 
justify-content: center;
align-items: center;
}

.gesture{
    position: relative; 
    width: 100%;
    height: 100vh;
    overflow: hidden;
}
.bearback{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: contain;
    object-position: center;
    z-index: 1;   
}

.bearnose{
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%); 
    max-width: 80%;
    max-height: 60vh;
    object-fit: contain;
    z-index: 2; 
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
</head> 

<body>
    <div class="gesture">
        
        <img src="image/bear-back.png"  class="bearback">

        <img src="/webapp/image/bear-nose.png"  class="bearnose">

    </div>
    <div class="btn_box">
  <a href="${pageContext.request.contextPath}/home.jsp" class="btn animation">Back</a>

  <div class="randomword">
        <c:out value="${word}"></c:out>
    </div>
</div>
</body>

