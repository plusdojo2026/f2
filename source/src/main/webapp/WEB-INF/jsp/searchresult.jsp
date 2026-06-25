<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>検索結果画面</title>
<style>

            html{
                margin:0;
                padding:0;
                width:100%;
                height:100%;
            }
            body{
                display:flex;
                justify-content:center;
                align-items:center;
            }
            .box{
                width:390px;
                height:844px;
                position:relative;
                overflow:hidden;
                background-color:red;
            }
img{
    width:100%;
    height:auto;
    object-fit:cover;
    vertical-align: bottom;
}
.zentai{
    background-color:purple;
    width:100%;
    height:100%;
    margin:0;
}
.zentai.top{
    transform:translate(0px,422px) scale(2);
}

.main{
    /* background-color:aquamarine; */
    display:flex;
    width:100%;
    height:50%;
    margin:0;
}
.main2{
    /* background-color:aquamarine; */
    display:flex;
    width:100%;
    height:25%;
    margin:0;
}
.side{
    background-color:yellow;
    width:25%;
    height:100%;
    margin:0;
}
.gamen{
    background-color:red;
    margin:0;
    width:50%;
    height:100%;
}
.shelf{
    position:absolute;
    background-color:dodgerblue;
    width:100%;
    height:50%;
}
.shelf img{
     left:-1.5%; 
    position:absolute;
}

.gamen2{
    background-color:pink;
    margin:0;
    width:50%;
    height:100%;
}
.record{
    width:45%;/*700px*/
    height:29%;/*1000px*/
    /*カーソル形式*/
    cursor:pointer;
    text-align: center;
    transition: clip-path 0.5s;
    transform-origin: bottom;
    transform:translate(-50%,0%);
    position:absolute;
    /* clip-path: polygon(0 0, 100% 0, 100% 100%, 0 100%); */
    padding:0;
}
.record img{
    margin:0;
    width:100%;
    height:auto;
    position:absolute;
    top:0px;
    left:0px;
}

.record-top{
    position:absolute;
    top:0%;
    width:100%;
    height:100%;
    margin:0;
    transform-origin:bottom center;
}
.record.polygon{
    transform:scaleY(1) translate(-50%,-80%);
}
.record-top.polygon{
    transform:scaleY(0.1);
}
.record-under{
    top:97%;
    position:absolute;
    width:100%;
    height:34%;
    margin:0;
    transform-origin:top center;
    transform:rotateX(90deg) translate(0%);
}

.record-under.polygon{
    transform:rotateX(0deg) translateY(7%); 
}

.loop{
    animation:move 3s linear infinite;
    transform-origin:50% 40.7%;
}
@keyframes move{
    0%{transform:rotate(0deg);}
    100%{transform:rotate(360deg);}
}
.random{
    animation:spins 0.5s linear 1;
    transform-origin:50% 40.7%;
    transition:transform 0.5s ease;
}
@keyframes spins{
    0%{transform:rotate(0deg) scale(1);}
    50%{transform:rotate(180deg) scale(1.08);}
    100%{transform:rotate(360deg) scale(1);}
}
    .desk{
        position:absolute;
        width:100%;
        height:auto;
        margin:0;
        transform-origin:center center;
    }
    
    .desk.polygon{
        transform:perspective(500px) rotateX(65deg) skewX(-5deg) translate(0px,0px) scaleX(1.3);
    }
 
.kuuhaku{
    background:darkred;
    width:100%;
    height:20%;
    margin:0;
}
.scroll{
    position:absolute;
    /* display:flex; */
    overflow-x:scroll;
    /* margin:15% auto; */
    max-width:390px;
    height:27%;
    width:100%;
    background-color:red;
    display:flex;
}

.item{
    width:35%;
    height:48%;
    aspect-ratio:1/1;
    margin:5%;
    background-color: blue;
    flex-shrink:0;
}

.item.end{
    background-color:yellow;
}
#column{
    display:absolute;
	grid-template-columns:1fr 1fr;
}

@media (max-width:390px){

.box{
    width:100vw;
    height:100vh;
}

.zentai{
    width:100%;
    height:100%;
}
</style>
</head>
<body>

	<div class="box" id="box">
		<div class="zentai top" id="zentai">
			<div class="zentai2">
			
			<div class="main">
			    <div class="side"></div>
			    <div class="gamen">
			         <div class="shelf" id="shelf">
			            <img src="image/tana3.png">
			        </div> 
			    </div>
			    <div class="side"></div>
			</div>
			
			<!--背景-->
			<div class="desk polygon" id="desk">
			    <img src="image/背景3.png">
			</div>
			
			<div class="main2">
			    <div class="side"></div>
			    
			    <div class="gamen2" Id="gamen2">
			        <div class="record polygon" id="record">
			            <div class="record-top polygon" id="record-top">
			                <img src="image/record-player-notuse90.png">
			                <img src="image/record-notuse90.png" class="loop" id="loop">
			                <img src="image/record-needle90.png">
			            </div>
			            <div class="record-under polygon" id="record-under">
			                <img src="image/record-player-under.png">
			            </div>
			            
			        </div>
			        
			    </div>
			    <div class="side"></div>
			</div>
			
			<div class="game"></div>
			
			<div class="kuuhaku"></div>
		</div>
			
			<!-- <div id="column"> -->
			    <div class="scroll" id="scroll">
			        <c:forEach var="l" items="${list}" >
						<p class="item" id="item">
							<c:out value="${l.word}" /><br>
							<c:out value="${l.era_name}" /><br>
							<c:out value="${l.genre_name}" /><br>
						</p>
					</c:forEach>
			    </div>
			<!-- </div> -->
			</div>
			
			
			
			
			<!-- レイヤー -->
			<div id="overlay" class="overlay"></div>
			<div class="button" id="button" onclick="closeRayer()"></div>
	</div>

</body>
<script>
'use strict'
		
if ('scrollRestoration' in history) {
    history.scrollRestoration = 'manual';
}
    
const BASE_WIDTH = 390;
const BASE_HEIGHT = 844;

const container = document.querySelector(".box");

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
    
//移動画像の座標指定用関数(absoluteはid取得のみ変更可能)
const zentai=document.getElementById('zentai');
const record = document.getElementById('record');
const button=document.getElementById('button');
const shelf=document.getElementById('shelf');
const desk=document.getElementById('desk');
const column=document.getElementById('column');
const scroll=document.getElementById('scroll');



function setRecordPosition(x,y){
    record.style.top=y+"px";
    record.style.left=x+"px";
}
function setButtonPosition(x,y){
    button.style.top=y+"px";
    button.style.left=x+"px";
}
function setShelfPosition(x,y){
    shelf.style.top=y+"px";
    shelf.style.left=x+"px";
}
function setDeskPosition(x,y){
    desk.style.top=y+"px";
    desk.style.left=x+"px";
}
function setColumnPosition(x,y){
    column.style.top=y+"px";
    column.style.left=x+"px";
}
function setScrollPosition(x,y){
    scroll.style.top=y+"px";
    scroll.style.left=x+"px";
}

//読み込み時、画面中央を表示
window.onload=function(){
    //id属性のみ指定可能
	setShelfPosition(0,0);
    setRecordPosition(195,300);
    setDeskPosition(0,200);
};

//遷移用
const recordunder=document.getElementById('record-under');
const recordtop=document.getElementById('record-top');

function closeRayer(){
    if(open==='goclose'){
        setLetterPosition(235,650);
        letter.classList.remove('rotate');
        letter31.classList.remove('rotate');
        letdocument.classList.remove('show');
        button.classList.remove('show');
        overlay.style.display = 'none';

        setTimeout(()=>{
            letter21.classList.remove('rotate');
        },400);

        open='open';
    }else if(fortune==='shakes'){
        setEightPosition(155,700);
        eight.classList.remove('eight-genre');
        button.classList.remove('show');
        right.classList.remove('show');
        left.classList.remove('show');
        overlay.style.display = 'none';
        fortune='genre';
    }
    
}


// document.getElementsByClassName('eight').addEventListner('')
</script>
</html>