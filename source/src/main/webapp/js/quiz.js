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
        }, 50);
    }
}

    // クリックでアニメーション開始
const spoon1_area = document.getElementById("spoon1_area");

spoon1_area.addEventListener("click", (e) => {
    e.preventDefault(); // href="#" の遷移を止める
    startTime = null;
    requestAnimationFrame(animate);
});