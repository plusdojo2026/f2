<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ホーム画面</title>
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
    /* display:block; */
    transition:transform 0.5s ease;
    transform:translate(0px,-422px) scale(2);
}
.zentai.top{
    transition:transform 0.5s ease;
    transform:translate(0px,422px) scale(2);
}
.zentai.left{
    transition:transform 0.5s ease;
    transform:translate(195px,-500px) scale(2);
}
.zentai.right{
    transition:transform 0.5s ease;
    transform:translate(-195px,-500px) scale(2);
}
.zentai.center{
    transition:transform 0.5s ease;
    transform:translate(0px,-500px) scale(2);
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
    /* left:-25px; */
    position:absolute;
}
.form-search{
    background-color:yellow;
    top:30%;
    left:32%;
    width:40%;
    height:17%;
    position:absolute;
}
.search-title{
    background-color:yellowgreen;
    width:100%;
    height:20%;
    font-size:10%;
    text-align:center;
    margin-top:0px;
}
.select-eraandgenre{
    background-color:azure;
    width:100%;
    height:15%;
    margin-top:5%; 
    display:flex;
}
.age{
    background-color:fuchsia;
    height:100%;
    width:20%;
    left:10%;
    margin:0 10% 0 20%;
}
.genre{
    background-color: indianred;
    height:20%;
    width:20%;
    right:10%;
    margin:0 20% 0 10%;
}
.selectbox{
    font-size:10%;
    text-align:center;
}
select{
    font-size:10%;
    width:100%;
    height:50%;
    text-align:center;
}
.searchbox{
    text-align:center;
    margin:15px 0 0 0;
    width:100%;
    height:50px;
    background-color:salmon;
}
input.word{
    font-size:20px;
    height:100%;
    width:80%;
}
input.sub{
    font-size:20px;
    height:100%;
    width:15%;
}
.gamen2{
    background-color:pink;
    margin:0;
    width:50%;
    height:100%;
}
.record{
    /* transform-origin:center center; */
    /* background-color:blue; */
    width:45%;/*700px*/
    height:25%;/*1000px*/
    /*カーソル形式*/
    cursor:pointer;
    text-align: center;
    transition: clip-path 0.5s;
    transform:translate(-50%,0%);
    position:absolute;
    transition: 0.5s ease;
    /* clip-path: polygon(0 0, 100% 0, 100% 100%, 0 100%); */
    padding:0;
}
.record img{
    margin:0;
    /* width:700px;
    height:1000px; */
    width:100%;
    height:auto;
    position:absolute;
    top:0px;
    left:0px;
}

.record-top{
    width:100%;
    height:100%;
    margin:0;
    transition:transform 0.5s ease;
}
.record.polygon{
    /* clip-path:polygon(10% 30%,90% 30%,100% 70%,0 70%); */
    height:100px;
    transition:transform 0.5s ease;
    /* transform:translate(0,-20%); */
}
.record-top.polygon{
    /* clip-path:polygon(10% 30%,90% 30%,100% 70%,0 70%); */
    transition:transform 0.5s ease;
    transform:scaleY(0.1);
}
.record-under{
    width:100%;
    height:300px;
    margin:0;
    /* background-color:blue; */
    transform-origin:top center;
    transition: 0.5s ease;
    transform:rotateX(90deg) translateY(9%);
}

.record-under.polygon{
    transform:rotateX(0deg) translateY(-10.5%); 
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
    background-color: blueviolet;
    transition: 0.5s ease;
}

    .desk{
/*        background-color:aquamarine;*/
        position:absolute;
        width:100%;
        height:auto;
        margin:0;
        transition:transform 0.5s ease;
/*        transition: clip-path 0.5s;*/
        transform-origin:center center;
/*        clip-path: polygon(0 0, 100% 0, 100% 100%, 0 100%);*/
    }
    
    .desk.polygon{
        transition:transform 0.5s ease;
        transform:perspective(500px) rotateX(65deg) skewX(-5deg) translate(0px,0px) scaleX(1.3);
        /* transform:perspective(500px) translate(0px,0%) scaleX(1); */
/*        clip-path:polygon(10% 30%,90% 30%,100% 70%,0 70%);*/
    }
    
.letter{
    /* transform-origin:center center; */
    /* background-color:green; */
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
    /* background-color:yellowgreen; */
}
.letter2{
    width:100%;
    height:100%;
    margin:0;
    position:absolute;
    /* background-color:black; */
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
    /* display:none; */
    /* background-color:white; */
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
    /* background-color: blanchedalmond; */
    width:47%;
    height:10%;
    margin:0;
    position:absolute;
/*    display:none;*/
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
.selectQuiz{
    background-color:red;
    position:absolute;
    width:70%;
    height:20%;
    top:90%;
    left:20%
}
.selectGesture{
    background-color:blue;
    position:absolute;
    width:70%;
    height:20%;
    top:150%;
    left:20%
}
.selectRead{
    background-color:yellow;
    position:absolute;
    width:70%;
    height:20%;
    top:200%;
    left:20%;
}

.button{
    background-color:brown;
    width:10%;
    height:5%;
    margin:0;
    position:absolute;
    display:none;
    z-index:1000;
}
.button.show{
    display:block;
    opacity:1;
}

.eight{
    /* transform-origin:center center; */
    /* background-color:darkgray; */
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
    background-color:white;
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
    background-color:white;
    position:absolute;
    width:6%;
    height:7%;
    display:none;
    z-index:1000;
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
    position:absolute;
}
.record-case{
    /* transform-origin:center center; */
    /* background-color:aqua; */
    cursor:pointer;
    width:32%;
    height:20%;
    position:absolute;
    transition: 0.5s ease;
}
/* .record-case.bigrecordcase{
    transform:scale(1.4);
} */
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
    width:10%;
    height:5%;
    background-color: blue;
}
</style>
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
                        <select name="era_no">
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
                    <input type="submit" value="送信" class="sub">
                </div>
            </form>
        </div> 
    </div>
    <div class="side"></div>
</div>

<!--背景-->
<div class="desk" id="desk">
    <img src="image/背景3.png">
</div>

<div class="main2">
    <div class="side"></div>
    
    <div class="gamen2" Id="gamen2">
        <div class="record" id="record" data-mode="random" onclick="goToPosition()">
            <div class="record-top" id="record-top">
                <img src="image/record-player-notuse90.png">
                <img src="image/record-notuse90.png" class="loop" id="loop">
                <img src="image/record-needle90.png">
            </div>
            <div class="record-under" id="record-under">
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
                	<p class="magic-genre" id="magic-genre">pタグ</p>
                	<input type="hidden" id="magic-input" value="1">
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


<div class="menu" id="menu" onclick="menuServlet()"></div>

</div>
<!-- レイヤー -->
<div id="overlay" class="overlay"></div>
<div class="button" id="button" onclick="closeRayer()"></div>
<div class="letdocument" id="letdocument">
    <img src="image/letter-document2.png">
    <div class="selectQuiz" id="selectQuiz" onclick="quizServlet()"></div>
    <div class="selectGesture" id="selectGesture"  onclick="gestureServlet()"></div>
    <div class="selectRead" id="selectRead" onclick="readServlet()"></div>
</div>

<div class="eightright" id="eightright" onclick="selectRight()"></div>
<div class="eightleft" id="eightleft" onclick="selectLeft()"></div>

</div>






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
    setShelfPosition(0,0);
    setMenuPosition(110,434);
    
    
    
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
    

    if(mode==='random'){
        //ランダムでお題を表示する
        console.log('お題ランダム表示');
        disk.classList.remove('loop');
        disk.classList.add('random');
        setTimeout(()=>{
            disk.classList.remove('random');
            disk.classList.add('loop');
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
        fortune='genre';
    }
    
}

let fortune='select';
const eightwhite=document.getElementById('eight-white');
function goToCenter(){
    // document.body.style.zoom='2.2';

    setEightPosition(155,700);
    setLetterPosition(350,660);
    setRecordcasePosition(-100,715);

    eight.classList.add('bigeight');
    eightwhite.classList.add('show');

    if(fortune==='select'){
        zentai.classList.add('center');
        mode='backhome';
        fortune='genre';
    }else if(fortune==='genre'){
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
        document.getElementById('magic-form').submit();
        
        eight.classList.add('shake-animation');
    }
}

let val=1;
let magicgenre=document.getElementById('magic-genre');
let hidden=document.getElementById('magic-hidden');
function selectRight(){
    console.log(val);
    val+=1;
    if(val>=6){
        val=1;
    }
    hidden.value=val;
    magicgenre.textContent=val;
}
function selectLeft(){
    console.log(val);
    val-=1;
    if(val<=0){
        val=5;
    }
    hidden.value=val;
    magicgenre.textContent=val;
}

function quizServlet(){
	window.location.href="QuizServlet";
}
function gestureServlet(){
	window.location.href="GestureServlet";
}
function readServlet(){
	window.location.href="ReadServlet";
}
function menuServlet(){
	window.location.href="MenuServlet";
}

// document.getElementsByClassName('eight').addEventListner('')
</script>
</html>