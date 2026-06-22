/**
 * 
 */
 'use strict';
 
 function animate(){
 	fetch("GestureServlet?reroll=true")
	.then(res => res.json())
 	.then(data => {
    	document.getElementById("gesture_word").innerText = data.theme;
   	});
 }
 
 // クリックでアニメーション開始
const bearnose = document.getElementById("bearnose");

bearnose.addEventListener("click", (e) => {
	e.preventDefault(); // href="#" の遷移を止める
    requestAnimationFrame(animate);
});

