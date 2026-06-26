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
const nose = document.getElementById("nose");

bearnose.addEventListener("click", (e) => {
	e.preventDefault(); // href="#" の遷移を止める
	nose.classList.add("press-effect");
    
    requestAnimationFrame(animate);
    
    setTimeout(() => {
    nose.classList.remove("press-effect");
  }, 150);
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