
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
                margin:0;
                display:flex;
                justify-content:center;
                align-items:center;
            }
            .box{
                width:390px;
                height:844px;
                position:relative;
                overflow:hidden;
                margin:0;
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
    display:flex;
    flex-direction:row;
    overflow-x:scroll;
    overflow-y:hidden;
    height:230px;
    width:47%;
    left: 0;
/*    background-color:red;*/
    /* margin:15% auto; */
    max-width:390px;
    height:27%;
    width:100%;
    background-color:red;
    display:flex;
}
    .for{
        display:grid;
        width:50%;
        height:100%;
        grid-auto-flow:column;
        grid-template-rows:repeat(2,1fr);
        gap:10px;
    }
.item{
    height:85%;
    aspect-ratio:1/1;
    margin:2.5%;
    transition:transform 1.0s ease;
    z-index: 1001;
}
.item img{
    width:47%;
    height:auto;
    object-fit:cover;
    display:block;
    position:absolute;
}

.coment{
	position:absolute;
	font-size:10px;
	width:47%;
	height:auto;
}
.coment.show{
    display:none;
}
#column{
    display:absolute;
	grid-template-columns:1fr 1fr;
}

@media (max-width:390px){
    #screen{
        width:100vw;
        height:100vh;
    }
}

.overlay{
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:120%;
    background:rgba(0,0,0,0.3);
    display:none;
    justify-content:center;
    align-items:center;
    z-index:100;
}
.choice{
    display:none;
    position:absolute;
    height:15%;
    aspect-ratio:1/1;
    margin:2.5%;
    background-color: yellow;
    opacity:0;
    visibility: hidden;
    z-index:1001;
    transform:scale(0.5);
    transition:opacity 0.5s,visibility 0.5s;
}
.choice.show{
    transform:scale(1);
    transition:transform 1s ease;
    display:block;
    visibility: visible;
    opacity:1;
}
.button{
    margin:0;
    position:absolute;
    display:none;
    z-index:1000;
    
    width:50px;
    height:30px;
    padding:0;
    background:rgb(90,95,170);
    color:#fff;

    cursor:pointer;
    text-align:center;

    text-decoration:none;

    font-size:14px;
    padding-top:9px;
    font-weight:bold;
    transform:scale(0.75);
}
.button.show{
    display:block;
    opacity:1;
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


    <div class="scroll" id="scroll">
        <%--<c:forEach var="l" items="${list}" class="for">--%>
        <div class="for">
        <c:forEach var="l" items="${list}">
        
			<div class="item" id="item" onclick="diskChoice()">
                <img src="image/recordcase1.jpeg">
                <div class="coment">
					<c:out value="${l.word}"/><br>
	                <c:out value="${l.era_name}"/><br>
					<c:out value="${l.genre_name}" /><br>
				</div>
			</div>
		
		</c:forEach>
		</div>
    </div>
</div>




<!-- レイヤー -->
<div id="overlay" class="overlay"></div>
<div class="choice" id="choice">
</div>
<div class="button" id="button" onclick="closeRayer()"></div>
</div>
</div>
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
const choice=document.getElementById('choice');



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
function setChoicePosition(x,y){
    choice.style.top=x+"px";
    choice.style.left=y+"px";
}


const eras=document.querySelectorAll('.era');
//読み込み時、画面中央を表示
window.onload=function(){
    //id属性のみ指定可能
	setShelfPosition(0,0);
    setRecordPosition(195,300);
    setDeskPosition(0,200);

    setScrollPosition(105,70);
    setChoicePosition(110,130);
    setButtonPosition(100,20);
    
};

//遷移用
const recordunder=document.getElementById('record-under');
const recordtop=document.getElementById('record-top');
const overlay=document.getElementById('overlay');
const item=document.getElementById('item');


function diskChoice(){
	overlay.style.display='flex';
    choice.classList.add('show');
    button.classList.add('show');
    item.classList.add('show');
}

function closeRayer(){
	overlay.style.display = 'none';
	choice.classList.remove('show');
    button.classList.remove('show');
    item.classList.remove('show');
    
}


// document.getElementsByClassName('eight').addEventListner('')
</script>
</html>