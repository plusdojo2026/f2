<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ホーム画面</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
@media (max-width:390px){
    #screen{
        width:100vw;
        height:100vh;
    }
}
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
    width:100%;
    height:100%;
    margin:0;
    /* display:block; */
    transition:transform 0.7s ease;
    transform:translate(0px,-422px) scale(2);
}
.zentai.top{
    transition:transform 1s ease;
    transform:translate(0px,422px) scale(2);
}
.zentai.left{
    transition:transform 0.7s ease;
    transform:translate(195px,-500px) scale(2);
}
.zentai.right{
    transition:transform 0.7s ease;
    transform:translate(-195px,-500px) scale(2);
}
.zentai.center{
    transition:transform 0.7s ease;
    transform:translate(0px,-500px) scale(2);
}

.main{
    display:flex;
    width:100%;
    height:50%;
    margin:0;
}
.main2{
    display:flex;
    width:100%;
    height:25%;
    margin:0;
}
.side{
    width:25%;
    height:100%;
    margin:0;
}
.gamen{
    margin:0;
    width:50%;
    height:100%;
}
.shelf{
    position:absolute;
    width:100%;
    height:50%;
}
.shelf img{
     left:-1.5%; 
    position:absolute;
}
.form-search{
	font-weight:bold;
    top:34%;
    left:29.5%;
    width:160px;
    height:60px;
    position:absolute;
    z-index:100;
}
.search-title{
    width:100%;
    height:40%;
    font-size:15px;
    text-align:center;
    margin-top:0px;
}
.select-eraandgenre{
    width:100%;
    height:40%;
    margin-top:0%; 
    display:flex;
}
.age{
    height:100%;
    width:30%;
    margin:0 10%;
}
.genre{
    height:100%;
    width:30%;
    margin:0 10%;
}
.selectbox{
	height:10%;
    font-size:8px;
    text-align:center;
    margin:0;
}
select{
    font-size:6px;
    width:100%;
    height:50%;
    margin:0;
    text-align:center;
}
.searchbox{
    text-align:center;
    width:100%;
    height:22%;
}
input.word{
    font-size:10%;
    height:80%;
    width:75%;
}
input.sub{
    text-align: center;
    font-size:6px;
    height:100%;
    width:15%;
    background:rgb(90,95,170);
    color:#fff;
    padding:0
}
.gamen2{
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
    transition: 1s ease;
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
    transition:transform 1s ease;
}
.record.polygon{
    transform:scaleY(1) translate(-50%,-80%);
    transition:transform 1s ease;
}
.record-top.polygon{
    transition:transform 1s ease;
    transform:scaleY(0.1);
}
.record-under{
    top:97%;
    position:absolute;
    width:100%;
    height:34%;
    margin:0;
    transform-origin:top center;
    transition:transform 1s ease;
    transform:rotateX(90deg) translate(0%);
}

.record-under.polygon{
    transition:transform 1s ease;
    transform:rotateX(0deg) translateY(7%); 
}

.disk-word{
	position:absolute;
	font-weight:bold;
	text-align:center;
	width:70%;
	top:47%;
	left:15%;
	color: #1E3A8A;
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
.game{
    width:100%;
    height:25%;
    transition: 0.5s ease;
}

    .desk{
        position:absolute;
        width:100%;
        height:auto;
        margin:0;
        transition:transform 1s ease;
        transform-origin:center center;
    }
    
    .desk.polygon{
        transition:transform 1s ease;
        transform:perspective(500px) rotateX(65deg) skewX(-5deg) translate(0px,0px) scaleX(1.3);
    }
    
    .floor{
    	position:absolute;
    	width:100%;
    	height:auto;
    	margin:0;
    }
.letter{
    cursor:pointer;
    width:31%;
    height:19%;
    position:absolute;
    transition: 0.5s ease;
    transform:rotate(-30deg);
}
.letter.bigletter{
    transform:scale(1.3) rotate(0deg);
}
.letter.rotate{
    transform:rotate(30deg) scale(0.8);
}
.letter img{
    position:absolute;
}
.letter1{
    width:100%;
    height:50%;
    margin:0;
    position:relative;
}
.letter2{
    width:100%;
    height:100%;
    margin:0;
    position:absolute;
    transform-origin:top center;
    transition:transform 0.5s ease;
    transform:rotateX(0deg);
}
.letter2.rotate{
    transform:rotateX(90deg);
}
.letter3{
    width:100%;
    height:100%;
    margin:0;
    position:absolute;
    transform-origin:bottom center;
    transition:transform 0.5s ease;
    transform:rotateX(90deg);
}
.letter3.rotate{
    transform:rotateX(0deg);
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

.letdocument{
    width:47%;
    height:10%;
    margin:0;
    position:absolute;
    opacity:0;
    visibility: hidden;
    z-index:1001;
    transition:opacity 0.5s,visibility 0.5s;
}

.letdocument.show{
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

.eight{
    cursor:pointer;
    width:80px;
    height:80px;
    position:absolute;
    z-index: 1000;
    transition:0.5s ease;
}
.eight img{
    position:absolute;
}
.eight-white{
    width:100%;
    height:100%;

    transform-origin: center;
    transform:scaleY(0.7) rotate(180deg) translate(-3px,25px);
}
.eight-white.show{
    transition:transform 0.5s ease;
    transform:scaleY(1) rotate(0deg) translate(0px,0px);

}
.eight.bigeight{
    transform:scale(1.3);
}
.eight.eight-genre{
    transform:scale(1.7);
}
.eightright{
    position:absolute;
    width:6%;
    height:7%;
    display:none;
    z-index:1000;
}
.eightright.show{
    display:block;
}
.eightleft{
    position:absolute;
    width:6%;
    height:7%;
    display:none;
    z-index:1000;
    transform:scale(1.1);
}
.eightleft.show{
    display:block;
}
@keyframes shake{
    0%{transform:translateY(0) scale(1.7);}
    20%{transform:translateY(-80px) scale(1.7);}
    40%{transform:translateY(80px) scale(1.7);}
    60%{transform:translateY(-80px) scale(1.7);}
    80%{transform:translateY(80px) scale(1.7);}
    100%{transform:translateY(0) scale(1.7);}
}
.eight.shake-animation{
    animation: shake 0.8s ease-in-out;
}
.magic-genre{
	font-size:13px;
	font-weight:bold;
	text-align:center;
    position:absolute;
    width:55%;
    height:50%;
    top:27%;
    left:22%;
    margin:0;
    display:none;
}
.record-case{
    cursor:pointer;
    width:32%;
    height:20%;
    position:absolute;
    transition: 0.5s ease;
}

.record-case img{
    position:absolute;
}
.recordcase1{
    transform-origin: left top;
    transform:rotate(-40deg) translate(-23px,5px);
    transition:transform 0.5s ease;
}
.recordcase2{
    transform-origin:left top;
    transform:rotate(-25deg) translate(-15px,2px);
    transition:transform 0.5s ease;
}
.recordcase3{
    transform-origin:left top;
    transform:rotate(-10deg);
    transition:transform 0.5s ease;
}
.recordcase1.big{
    transform:rotate(-30deg) translate(-35px,-36px) scale(1.1);
    transition:transform 0.5s ease;
}
.recordcase2.big{
    transform:rotate(40deg) translate(80px,-100px) scale(1.1);
    transition:transform 0.5s ease;
}
.recordcase3.big{
    transform:rotate(0deg) scale(1.4);
    transition:transform 0.5s ease;
}
.kuuhaku{
    background:darkred;
    width:100%;
    height:20%;
    margin:0;
}
.menu{
    position:absolute;
    text-align:center;
    width:90px;
    height:30px;
    padding:0;
    background:rgb(90,95,170);
    color:#fff;

    cursor:pointer;

    text-decoration:none;

    font-size:14px;
    padding-top:9px;
    font-weight:bold;
    padding-left:1%;
    transform:scale(0.75);
}

</style>
<script src="https://cdn.jsdelivr.net/npm/image-map-resizer@1.0.10/js/imageMapResizer.min.js"></script>
</head>
<body>

<div class="box" id="box">
<div class="zentai" id="zentai">
<div class="zentai2">

<div class="main">
    <div class="side"></div>
    <div class="gamen">
         <div class="shelf" id="shelf">
            <img src="image/tana3.png">
            <form class="form-search" method="POST" action="/f2/SearchServlet">
                <div class="search-title">レコード検索</div>
                <div class="select-eraandgenre">
                    <div class="age">
                        <div class="selectbox">年代</div>
                        <select name="era_no">
                            <option value="0">指定なし</option>
                            <option value="1">昭和後期</option>
                            <option value="2">平成初期</option>
                            <option value="3">平成中期</option>
                            <option value="4">平成後期</option>
                            <option value="5">令和</option>
                        </select>
                    </div>
                    <div class="genre">
                        <div class="selectbox">ジャンル</div>
                        <select name="genre_no">
                            <option value="0">指定なし</option>
                            <option value="1">用語</option>
                            <option value="2">物品・サービス</option>
                            <option value="3">人物</option>
                            <option value="4">ゲーム・アニメ</option>
                            <option value="5">音楽</option>
                        </select>
                    </div>
                </div>
                <div class="searchbox">
                    <input type="text" name="word" class="word"> 
                    <input type="submit" value="検索" class="sub">
                </div>
            </form>
        </div> 
    </div>
    <div class="side"></div>
</div>

<!--背景-->
<img src="image/floor.JPG" class="floor" id="floor">
<div class="desk" id="desk">
    <img src="image/背景3.png">
</div>

<div class="main2">
    <div class="side"></div>
    
    <div class="gamen2" Id="gamen2">
        <div class="record" id="record">
            <div class="record-top" id="record-top"  data-mode="random" onclick="goToPosition()">
                <img src="image/record-player-notuse90.png">
                <img src="image/record-notuse90.png" class="loop" id="loop">
                <div class="disk-word"><c:out value="${word.word}"/></div>>
                <img src="image/record-needle90.png">
            </div>
            <div class="record-under" id="record-under" onclick="goToPosition()">
                <img src="image/record-player-under.png">
            </div>
            
        </div>
        
    </div>
    <div class="side"></div>
</div>

<div class="game"></div>
        <div class="eight" id="eight" onclick="goToCenter()">
            <img src="image/eightball-black.png">
            <div class="eight-white" id="eight-white">
                <img src="image/eightball-white.png">
                <form id="magic-form"method="POST" action="/f2/MagicServlet">
                	<p class="magic-genre" id="magic-genre">用語</p>
                	<input type="hidden" id="magic-hidden" value="1" name="genre_no">
                </form>
                
            </div>
        </div>
        <div class="letter" id="letter">
            <div class="letter1" id="letter1">
                
                <div class="letter3" id="letter3">
                    <img src="image/letter-seal2.png">
                </div>
            </div>
            <div class="letter1" id="letter1" onclick="goToRight()">
                <img src="image/letter.png">
                <div class="letter2" id="letter2">
                    <img src="image/letter-seal1.png">
                </div>
            </div>
        </div>
        <div class="record-case" id="record-case"onclick="goToLeft()">
            <div class="recordcase1" id="recordcase1">
                <img src="image/recordcase1.jpeg">
            </div>
            <div class="recordcase2" id="recordcase2">
                <img src="image/recordcase2.jpeg">
            </div>
            <div class="recordcase3" id="recordcase3">
                <img src="image/recordcase3.jpeg">
            </div>
        </div>

<div class="kuuhaku"></div>


<div class="menu" id="menu" onclick="menuServlet()">メニュー</div>

</div>
<!-- レイヤー -->
<div id="overlay" class="overlay"></div>
<div class="button" id="button" onclick="closeRayer()">✕</div>
<div class="letdocument" id="letdocument">
    <img src="image/letter-document2.png" usemap="#letterMap">
    <map name="letterMap">
  		<area shape="rect" coords="110,616,1567,930" href="/f2/QuizServlet" alt="" />
  		<area shape="rect" coords="103,1016,1570,1344" href="/f2/GestureServlet" alt="" />
  		<area shape="rect" coords="119,1445,1560,1744" href="/f2/ReadServlet" alt="" />
	</map>
</div>

<div class="eightright" id="eightright" onclick="selectRight()">
	<img src="image/left-select.png">
</div>
<div class="eightleft" id="eightleft" onclick="selectLeft()">
	<img src="image/right-select.png">
</div>

</div>






</div>
<script>
	imageMapResize();
</script>
</body>
<script>
'use strict'
		
if ('scrollRestoration' in history) {
    history.scrollRestoration = 'manual';
}
    
    
//移動画像の座標指定用関数(absoluteはid取得のみ変更可能)
const zentai=document.getElementById('zentai');
const record = document.getElementById('record');
const recordcase=document.getElementById('record-case');
const eight=document.getElementById('eight');
const letter=document.getElementById('letter');
const letdocument=document.getElementById('letdocument');
//const eightgenre=document.getElementById('eight-genre');
const button=document.getElementById('button');
const right=document.getElementById('eightright');
const left=document.getElementById('eightleft');
const shelf=document.getElementById('shelf');
const desk=document.getElementById('desk');
const menu=document.getElementById('menu');
const floor=document.getElementById('floor');


function setRecordPosition(x,y){
    record.style.top=y+"px";
    record.style.left=x+"px";
}
function setRecordcasePosition(x,y){
    recordcase.style.top=y+"px";
    recordcase.style.left=x+"px";
}
function setEightPosition(x,y){
    eight.style.top=y+"px";
    eight.style.left=x+"px";
}
function setLetterPosition(x,y){
    letter.style.top=y+"px";
    letter.style.left=x+"px";
}
function setLetterDocumentPosition(x,y){
    letdocument.style.top=y+"px";
    letdocument.style.left=x+"px";
}
//function setEightGenrePosition(x,y){
//    eightgenre.style.top=y+"px";
//    eightgenre.style.left=x+"px";
//}
function setButtonPosition(x,y){
    button.style.top=y+"px";
    button.style.left=x+"px";
}

function setRightPosition(x,y){
    right.style.top=y+"px";
    right.style.left=x+"px";
}
function setLeftPosition(x,y){
    left.style.top=y+"px";
    left.style.left=x+"px";
}
function setShelfPosition(x,y){
    shelf.style.top=y+"px";
    shelf.style.left=x+"px";
}
function setDeskPosition(x,y){
    desk.style.top=y+"px";
    desk.style.left=x+"px";
}
function setMenuPosition(x,y){
    menu.style.top=y+"px";
    menu.style.left=x+"px";
}
function setFloorPosition(x,y){
	floor.style.top=y+"px";
    floor.style.left=x+"px";
}

//読み込み時、画面中央を表示
window.onload=function(){
    //id属性のみ指定可能
    // zentai.style.zoom='1.5';
    
    // 真ん中（195,422）
    setRecordPosition(195,377);
    setEightPosition(193,643);
    setLetterPosition(190,660);
    setRecordcasePosition(70,715);
    setLetterDocumentPosition(200,540);
    setRightPosition(101,660);
    setLeftPosition(266,660);
    setDeskPosition(0,422);
    setFloorPosition(0,422);
    setShelfPosition(0,0);
    setMenuPosition(95,427);
    
    
    
//    setEightGenrePosition(635,2400);
    
//    setShelfPosition(290,150);
    
    

//    window.scrollTo({
//        top:3376,
//        left:window.innerWidth/2,
//        behavior:'auto';
//    });

    // window.scroll(window.innerWidth/2,window.innerHeight);
    console.log(window.innerHeight);//3376
    console.log(window.innerWidth/2);//780
};

//遷移用
let mode='random';

const disk=document.getElementById('loop');
function goToPosition(){
    // document.body.style.zoom='2.0';

    // setRecordcasePosition(300,2800);
    // setEightPosition(750,2500);
    // setLetterPosition(700,2600);
    // setDeskPosition(0,window.innerHeight/2);

    setRecordPosition(195,377);
    // setRecordPosition(window.innerWidth/2,377);
    console.log(window.innerWidth/2);
    setEightPosition(193,643);
    setLetterPosition(190,660);
    setDeskPosition(0,422);

    //サイズ初期化
    recordcase.classList.remove('bigrecordcase');
    letter.classList.remove('bigletter');
    eight.classList.remove('bigeight');
    desk.classList.remove('polygon');
    eightwhite.classList.remove('show');
    case1.classList.remove('big');
    case2.classList.remove('big');
    case3.classList.remove('big');

    
    zentai.classList.remove('right');
    zentai.classList.remove('left');
    zentai.classList.remove('center');
    menu.style.display='none';
    

    if(mode==='random'){
        //ランダムでお題を表示する
        console.log('お題ランダム表示');
        disk.classList.remove('loop');
        disk.classList.add('random');
        setTimeout(()=>{
            disk.classList.remove('random');
            disk.classList.add('loop');
            window.location.href="HomeServlet";
        },500);
    }else if(mode==='backhome'){
        //ホームのホームに戻る
        console.log('戻る機能');
        zentai.classList.remove('top');
        mode='random';
        search='chose-letter';
        open='close';
        fortune='select';
        setRecordcasePosition(70,715);
        record.classList.remove('polygon');
        recordtop.classList.remove('polygon');
        recordunder.classList.remove('polygon');
        menu.style.display='block';
    }
}

let search='chose-letter';
const recordunder=document.getElementById('record-under');
const recordtop=document.getElementById('record-top');
const case1=document.getElementById('recordcase1');
const case2=document.getElementById('recordcase2');
const case3=document.getElementById('recordcase3');
function goToLeft(){
    // record.dataset.mode="BackHome";
    setRecordcasePosition(10,650);
    setEightPosition(300,643);
    setLetterPosition(300,660);
    menu.style.display='none';
    
    setTimeout(()=>{
        case1.classList.add('big');
        case2.classList.add('big');
        case3.classList.add('big');
    },50);

    if(search==='gosearch'){
        //検索画面へ
        zentai.classList.remove('left');
        zentai.classList.add('top');

        search='chose-letter';
        setRecordPosition(195,300);
        // setRecordPosition(window.innerWidth/2,300);
        console.log(window.innerWidth/2);

        setDeskPosition(0,200);
        record.classList.add('polygon');
        recordtop.classList.add('polygon');
        recordunder.classList.add('polygon');
        desk.classList.add('polygon');

    }else if(search==='chose-letter'){
        //画面遷移
        zentai.classList.add('left');

        search='gosearch';
        mode='backhome';
    }
    
    mode='backhome';
}

let open='close';
let letter3=document.getElementById('letter3');
const letter31=document.getElementById('letter3');
let letter2=document.getElementById('letter2');
const letter21=document.getElementById('letter2');
const overlay =document.getElementById('overlay');

function goToRight(){
    // record.dataset.mode="BackHome";

    setLetterPosition(235,650);
    setRecordcasePosition(0,715);
    setEightPosition(19,643);
    menu.style.display='none';

    letter.classList.add('bigletter');

    if(open==='close'){
        //閉じ状態
        console.log('閉じ');
        zentai.classList.add('right');
        mode='backhome';
        open='open';
    }else if(open==='open'){
        //開き状態
        console.log('開き');
        // letter3.style.display='block';
        // letter2.style.display='none';

        setLetterPosition(290,680);
        setButtonPosition(200,470);
        letter21.classList.add('rotate');
        letter.classList.add('rotate');

        letdocument.classList.add('show');
        button.classList.add('show');
        overlay.style.display='flex';

        setTimeout(()=>{
            letter31.classList.add('rotate');
        },400);
        
        //一旦の機能
        open='goclose';
    }else if(open==='goclose'){
        letter.classList.remove('rotate');
        letter31.classList.remove('rotate');
        
        setTimeout(()=>{
            letter21.classList.remove('rotate');
        },400);

        open='open';
    }
    
}

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
        magicgenre.style.display='none';
        fortune='genre';
    }
    
}

let fortune='select';
let magicgenre=document.getElementById('magic-genre');
const eightwhite=document.getElementById('eight-white');
function goToCenter(){
    // document.body.style.zoom='2.2';

    setEightPosition(155,700);
    setLetterPosition(350,660);
    setRecordcasePosition(-100,715);
    menu.style.display='none';

    eight.classList.add('bigeight');
    eightwhite.classList.add('show');

    if(fortune==='select'){
        zentai.classList.add('center');
        mode='backhome';
        fortune='genre';
    }else if(fortune==='genre'){
    	magicgenre.style.display="block";
        setEightPosition(155,650);
        setButtonPosition(110,470);
        eight.classList.add('eight-genre');
        button.classList.add('show');
        overlay.style.display='flex';
        right.classList.add('show');
        left.classList.add('show');
        fortune='shakes';
    }else if(fortune==='shakes'){
        setEightPosition(155,650);
        right.classList.remove('show');
        left.classList.remove('show');
        
        eight.classList.add('shake-animation');

        eight.addEventListener('animationend',() =>{
        document.getElementById('magic-form').submit();
        },{once: true})
    }
}

let val=1;
let word;
let hidden=document.getElementById('magic-hidden');
function selectRight(){
    console.log(val);
    val+=1;
    if(val>=6){
        val=1;
    }
    magicgenre.style.fonsSize="13px";
    switch(val){
    case 1:
    	word='用語';
    	break;
    case 2:
    	word='物品・サービス';
    	magicgenre.style.fonsSize="5px";
    	break;
    case 3:
    	word='人物';
    	break;
    case 4:
    	word='ゲーム・アニメ';
    	magicgenre.style.fonsSize="5px";
    	break;
    case 5:
    	word='音楽';
    	break;
    }
    hidden.value=val;
    magicgenre.textContent=word;
}
function selectLeft(){
    console.log(val);
    val-=1;
    if(val<=0){
        val=5;
    }
    magicgenre.style.fonsSize="13px";
    switch(val){
    case 1:
    	word='用語';
    	break;
    case 2:
    	word='物品・サービス';
    	magicgenre.style.fonsSize="5px";
    	break;
    case 3:
    	word='人物';
    	break;
    case 4:
    	word='ゲーム・アニメ';
    	magicgenre.style.fonsSize="5px";
    	break;
    case 5:
    	word='音楽';
    	break;
    }
    hidden.value=val;
    magicgenre.textContent=word;
}

function menuServlet(){
	window.location.href="MenuServlet";
}

// document.getElementsByClassName('eight').addEventListner('')
</script>
</html>