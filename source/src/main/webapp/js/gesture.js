/**
 * 
 */
 'use strict';
 
 function animate(){
 	fetch("GestureServlet?reroll=true")
	.then(res => res.json())
 	.then(data => {
    	document.getElementById("gesture_word").innerText = data.theme;
    	adjustGestureWord();
    	
   	});
 }
 
 // クリックでアニメーション開始
const bearnose = document.getElementById("bearnose");

bearnose.addEventListener("click", (e) => {
	e.preventDefault(); // href="#" の遷移を止める
    requestAnimationFrame(animate);
});

//フォントサイズ自動調整
function adjustGestureWord(){

    const gestureWord = document.getElementById("gesture_word");

    let size = 36;
    const minSize = 18;

    gestureWord.style.fontSize = size + "px";

    while(
        (gestureWord.scrollWidth > gestureWord.clientWidth ||
         gestureWord.scrollHeight > gestureWord.clientHeight)
        &&
        size > minSize
    ){
        size--;
        gestureWord.style.fontSize = size + "px";
    }

}

adjustGestureWord();