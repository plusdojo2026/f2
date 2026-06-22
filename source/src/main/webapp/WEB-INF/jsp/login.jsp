<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <meta charset="UTF-8">
	<head>
		<meta charset="UTF-8">
		<title>ログイン画面</title>
        <style>
            body{
                margin:0;
                height:3376px;
                width:1560px;
                max-width:3080px;
/*                background-color: red;*/
                transition: transform 0.5s ease;
            }
            .background{
/*                background-color:aqua;*/
                height:3376px;
                width:auto;
            }
            .bg1{
                margin:0;
                position:absolute;
                height:3376px;
                transition: transform 0.5s ease;
            }
            .bg2{
                margin:0;
                position:absolute;
                height:3376px;
                transform-origin:right bottom;
                transition: transform 0.5s ease;
            }
            .blackbord{
                position:absolute;
                transform:scale(0.8);
                transition: transform 0.5s ease;
                display:inline-block;
            }
            .blackbord-back{
                position:absolute;
                transform:scale(0.8);
                transition: transform 0.5s ease;
            }
            .black{
                display:block;
            }
            .question{
                background-color: pink;
                position:absolute;
                top:15%;
                left:13%;
                width:800px;
                height:1150px;
            }
            .deformation{
                position:absolute;
                background-color:blue;
                width:100px;
                height:100px;
            }
            .bg1.wall{
                transform:translateX(1000px);
                transition: transform 0.5s ease;
            }
            .bg2.floor{
                transform:skewX(-40deg) scale(0.8) scaleY(1.3);
                transition: transform 0.5s ease;
            }
            .blackbord.menu{
                transform:skewX(-10deg) scale(0.8);
                transition: transform 0.5s ease;
            }
            .blackbord-back.menu{
                transform:skewX(10deg) scale(0.8) translate(290px,-100px) scaleY(0.9);
                transition: transform 0.5s ease;
            }
            
            .signboard{
                position:absolute;
                backface-visibility:hidden;
                transform:scale(0.2);
/*                transform:skewX(0deg);*/
                display:inline-block;
                transition: transform 0.5s ease;
            }
            .signboard.menu{
                transform:translateX(1000px) scale(0.2);
                transition: transform 0.5s ease;
            }
            .signboard.rotate{
                transform:rotateY(180deg) scale(0.2);
                transition:transform 0.5s ease;
            }
            
            .signboard-back{
                position:absolute;
                backface-visibility:hidden;
                transform:scale(0.2) rotateY(180deg);
/*                transform:skewX(0deg);*/
                display:inline-block;
                transition: transform 0.5s ease;
            }
            
            .signboard-back.rotate{
                transform:rotateY(0deg) scale(0.2);
                transition:transform 0.5s ease;
            }
        </style>
	</head>
	<body>
<!--		<a href="/f2/MenuServlet">戻る</a>-->
        
		<div class="background">
            <img src="image/cafe-back2.png" class="bg1" id="bg1">
			<img src="image/cafe-back.png" class="bg2" id="bg2">
		</div>
        
        <div class="signboard" id="signboard">
            <img src="image/看板.png" class="sign" onclick="SignInOut()">
        </div>
        <div class="signboard-back" id="signboard-back">
            <img src="image/看板2.png" class="sign" onclick="SignInOut()">
        </div>
        
        
        <div class="blackbord-back" id="blackbord-back">
            <img src="image/黒板2.png">
        </div>
        
        <div class="blackbord" id="blackbord" onclick="Deformation()">
            <img src="image/黒板.png" class="black">
            <div class="question">
                <form action="/f2/LoginServlet" method="post" class="input">
                    <input type="text" name="mail_add" placeholder="メールアドレス">
                    <input type="password" name="password" placeholder="パスワード">

                    <input type="submit" value="ログイン">
                    <input type="reset" value="リセット">
                    <c:if test="${not empty error}">
                        <p style="color:red; font-weight:bold;">${error}</p>
                    </c:if>
                </form>
            </div>
        </div>
        
	</body>
	<script>
		'use strict'
		
        if ('scrollRestoration' in history) {
          history.scrollRestoration = 'manual';
        }
        
        const Fimg=document.getElementById('blackbord');
        const Bimg=document.getElementById('blackbord-back');
        const signboard=document.getElementById('signboard');
        const signboardB=document.getElementById('signboard-back');
        
        function setBlackbordPosition(x,y){
            Fimg.style.top=y+'px';
            Fimg.style.left=x+'px';
        }
        function setBlackbordbackPosition(x,y){
            Bimg.style.top=y+'px';
            Bimg.style.left=x+'px';
        }
        
        function setSignboardPosition(x,y){
            signboard.style.top=y+'px';
            signboard.style.left=x+'px';
        }
        
        function setSignboardBackPosition(x,y){
            signboardB.style.top=y+'px';
            signboardB.style.left=x+'px';
        }
        
        const body=document.body;
        const Bfloor1=document.getElementById('bg1');
        const Bfloor2=document.getElementById('bg2');
        
        window.onload=function(){
            console.log('innerWidth '+window.innerWidth);
            console.log('innerHeight '+window.innerHeight);

            setBlackbordPosition(1250,1600);
            setBlackbordbackPosition(1250,1600);
            setSignboardPosition(-120,-100);
            setSignboardBackPosition(-120,-100);
            
            window.scrollBy({
                    top:window.innerHeight,
                    left:1000,
                    behavior:"auto"
            });
            
            setTimeout(()=>{
                document.body.style.width ='1560px';
                document.body.style.height ='3376px';
                body.style.transform='scale(1.4)';
                
                
                setTimeout(()=>{
                    Fimg.classList.add('menu');
                    Bimg.classList.add('menu');
                    signboard.classList.add('menu');
                    Bfloor1.classList.add('wall');
                    Bfloor2.classList.add('floor');
                    window.scrollTo({
                        top:window.innerWidth,
                        left:1400,
                        behavior:"smooth"
                    });
                },500);
            },1000);
        }

        function Deformation(){
            
            Fimg.classList.remove('menu');
            Bimg.classList.remove('menu');
            signboard.classList.remove('menu');
            Bfloor1.classList.remove('wall');
            Bfloor2.classList.remove('floor');
            document.body.style.transformOrigin='bottom';
            setTimeout(()=>{
                
                
                window.scrollTo({
                    top:2500,
                    left:1800,
                    behavior:"smooth"
                });
                setTimeout(()=>{
//                    document.body.style.width ='2240px';
//                    document.body.style.height ='3376px';
                    document.body.style.transformOrigin='bottom';
                    document.body.style.transform='scale(1.8)';
                    
                },500);
            },50);
        }
        
        let rotate='zoom';
        function SignInOut(){
            if(rotate==='zoom'){
                setTimeout(()=>{
                    Fimg.classList.remove('menu');
                    Bimg.classList.remove('menu');
                    signboard.classList.remove('menu');
                    Bfloor1.classList.remove('wall');
                    Bfloor2.classList.remove('floor');

                    window.scrollTo({
                        top:4000,
                        left:50,
                        behavior:'smooth'
                    });

                    setTimeout(()=>{
                        document.body.style.width ='1300px';
                        document.body.style.height ='1200px';
                        body.style.transform='scale(3.3)';
                    },500);
                },50);
                rotate='close';
            }else if(rotate==='close'){
                signboard.classList.add('rotate');
                signboardB.classList.add('rotate');
                rotate='open';
            }else if(rotate==='open'){
                signboard.classList.remove('rotate');
                signboardB.classList.remove('rotate');
                rotate='close';
            }
            
        }
	</script>
</html>