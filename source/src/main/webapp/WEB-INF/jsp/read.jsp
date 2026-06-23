<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>読み当てゲーム</title>
<style>
html,body{
    /* スクロール禁止 */
    overflow:hidden;
}

.read {
    margin: 8px;
    position: relative;
    display: inline-block;
    width: 100%;
}

.read img{
    width: 100%;
}

.tv {
    display: block;
    /* width: 90%; */
}

.screen {
    position: absolute;
    top: -95px;   /* 上からの位置 */
    left: 22.5px;  /* 左からの位置 */
    max-width: 95%;
    transform:scale(0.9);
}

.channel {
    position: absolute;
    top: -50px;   /* 上からの位置 */
    left: 15%;  /* 左からの位置 */
    max-width: 90%;
}

.hide {
    position: absolute;
    display: none;
}

.read_word{
  position: absolute;
  top: 37.5%;        /* 上からの位置 */
  left: 50%;       /* 左からの位置 */
  transform: translate(-50%, -50%); /* 中央に配置 */
  color: white;
  font-size: 72px;
  font-weight: bold;
  text-shadow: 0 0 5px black; /* 読みやすくする */
}
</style>
</head>
<body>
	<div class="read">
		<img src="image/tv-back-haikei.png" class="tv" id="tv">
		<img src="image/tv-screen.png" class="screen" id="screen1">
		<img src="image/tv-screen1.png" class="screen hide">
		<img src="image/tv-channel.png" class="channel">
        <div class="read_word"><c:out value="${word.word}"></c:out></div>
	</div>

    <script>
        'use strict'
        const spoon1 = document.getElementById("screen1");
        const spoon2 = document.getElementById("screen2");
        const quiz_word = document.getElementById("read_word");

        function animate(timestamp) {
            


	        //お題変更機能
			 if (!actiond) {
				actiond = true;//ここでtrueにすることで上の!actiondが動作しない
				fetch("QuizServlet?reroll=true")
				.then(res => res.json())
 				.then(data => {
					document.getElementById("read_word").innerText = data.theme;
   				});
			}
    
        }

        // クリックでアニメーション開始
        const spoon1_area = document.getElementById("channel_area");

        channel_area.addEventListener("click", (e) => {
            e.preventDefault(); // href="#" の遷移を止める
            startTime = null;
            requestAnimationFrame(animate);
        });
    </script>
</body>
</html>