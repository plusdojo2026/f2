/**
 * 
 */
 'use strict';

const steam = document.getElementById("steam");
const spoon1 = document.getElementById("spoon1");
const spoon2 = document.getElementById("spoon2");
const quiz_word = document.getElementById("quiz_word");

let startTime = null;
const duration = 1500; // 1.5秒
let actiond = false;//一回だけお題を変更するための変数

function animate(timestamp) {
    if (!startTime) startTime = timestamp;

    let elapsed = timestamp - startTime;
    let progress = elapsed / duration;

     if (progress > 1) progress = 1;

    // １＋半回転
    let angle = progress * Math.PI * 1.5;

    // 楕円の半径
    let rx = 100; // 横方向
    let ry = 25; // 縦方向

     // 座標計算
    let x = Math.cos(angle) * rx;
    let y = Math.sin(angle) * ry;

    //傾きの演出
    function getTilt(progress) {
        if (progress < 0.5) {
            // 前半：0 → 30
            let t = progress / 0.5; 
             return t * 20; 
        } else {
            // 後半：30 → 0
            let t = (progress - 0.5) / 0.5;
            return 30 - t * 30;
        }
    } 
    let rotateZ = getTilt(progress);  // 0° → 360°
       
    //消すとたまに動きが不安定になる
    function getTilt(progress) {
        if (progress < 0.5) {
            // 前半：0 → 30
            let t = (progress - 0.5) / 0.5; 
            return t * 30; 
        } else {
            // 後半：30 → 0
            let t = progress / 0.5;
            return 30 - t * 30;
        }
    } 
    let rotateX = getTilt(progress);
    
    //混ぜる用のスプーン表示　湯気、おいてあるスプーン、お題の非表示
    steam.classList.add("off");
    spoon1.classList.add("off");
    spoon2.classList.remove("off");
    quiz_word.classList.add("off");
    
    // スプーンを動かす
    spoon2.style.opacity = 0 + progress * 0.3;
    spoon2.style.transform = `translate(${x}px, ${y}px)  rotateZ(${rotateZ}deg)`;
    spoon2.style.opacity = 1 - progress * 0.3;

    if (progress > 0.7) {
         let fadeInProgress = (progress - 0.7) / 0.3; // 0〜1 に正規化

        steam.style.opacity = fadeInProgress;
        spoon1.style.opacity = fadeInProgress;
        quiz_word.style.opacity = fadeInProgress;

        steam.classList.remove("off");
           spoon1.classList.remove("off");
        quiz_word.classList.remove("off");
    }
	
	 //お題変更機能
    if (!actiond) {
        actiond = true;//ここでtrueにすることで上の!actiondが動作しない
    	fetch("QuizServlet?reroll=true")
			.then(res => res.json())
 			.then(data => {
    			document.getElementById("quiz_word").innerText = data.theme;
    			adjustQuizWord();
   			});
 	}
	
    if (progress < 1) {
        requestAnimationFrame(animate);
    } else {
        // 終了後の後処理
         setTimeout(() => {
            spoon2.classList.add("off");
            spoon2.style.transform = "translate(0,0)";
            spoon2.style.opacity = 1;
        
            steam.style.opacity = 1;
            spoon1.style.opacity = 1;
            quiz_word.style.opacity = 1;
            actiond = false;
        }, 50);
    }
    
}

//ヘルプボタンの処理
function help(){

    const overlay=document.getElementById("overlay");
    const setumei=document.getElementById("setumei");

    overlay.style.display="block";
    setumei.classList.add("show");
	console.log(document.getElementById("setumei").innerHTML);
}

//ヘルプ内の戻るボタン処理
function closeHelp(){

    const overlay=document.getElementById("overlay");
    const setumei=document.getElementById("setumei");

    overlay.style.display="none";
    setumei.classList.remove("show");

}

//文字数に応じてフォントサイズを変える処理
function adjustQuizWord(){

    const quizWord = document.getElementById("quiz_word");

    let size = 23;      // 初期サイズ
    const minSize = 3; // 最小サイズ

    quizWord.style.fontSize = size + "px";

    while(
        quizWord.scrollWidth > quizWord.clientWidth &&
        size > minSize
    ){
        size--;
        quizWord.style.fontSize = size + "px";
    }

}

adjustQuizWord();

// クリックでアニメーション開始
const spoon1_area = document.getElementById("spoon1_area");

spoon1_area.addEventListener("click", (e) => {
    e.preventDefault(); // href="#" の遷移を止める
    startTime = null;
    requestAnimationFrame(animate);
});