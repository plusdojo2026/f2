/**
 * 
 */
 'use strict'
        const screen1 = document.getElementById("screen1");
        const screen2 = document.getElementById("screen2");
        const read_word = document.getElementById("read_word");
		let actiond = false;
		let startTime = null;
		let duration = 1000;
		let fade = true;

        function animate(timestamp) {
            if (!startTime) startTime = timestamp;

    		let elapsed = timestamp - startTime;
    		let progress = elapsed / duration;
			
			if (progress > 1) progress = 1;
			
    		screen2.classList.remove("off");
    		
    		if (fade === true) {
    			screen1.style.opacity = (1-progress);
    			screen2.style.opacity = progress;
    			read_word.style.opacity = (1-progress);
				
				if (progress >= 1) {
            		fade = false;
            		startTime = timestamp; // 時間をリセット
        		}
			} else if (fade === false) {
				screen1.style.opacity = progress;
    			screen2.style.opacity = (1-progress);
    			read_word.style.opacity = progress;
    			
    			if (progress >= 1) {
					screen2.classList.add("off");
				}
			}
			
	        //お題変更機能
			 if (!actiond) {
				actiond = true;//ここでtrueにすることで上の!actiondが動作しない
				fetch("ReadServlet?reroll=true")
				.then(res => res.json())
 				.then(data => {
					document.getElementById("read_word").innerText = data.theme;
   				});
			}
			if (progress < 1) {
        		requestAnimationFrame(animate);
    		}else {
        		// 終了後の後処理
         		setTimeout(() => {
            		screen2.classList.add("off");
            		actiond = false;
				});
			}
    
        }

        // クリックでアニメーション開始
        const tv_area = document.getElementById("tv_area");

        tv_area.addEventListener("click", (e) => {
            e.preventDefault(); // href="#" の遷移を止める
            startTime = null;
            requestAnimationFrame(animate);
        });
        
        const channel_area = document.getElementById("channel_area");
        
        document.getElementById("channel_area").addEventListener("click", function(e) {
            e.preventDefault();

            const pronounce = document.getElementById("pronounce").value;

            fetch("ReadServlet", {
                method: "POST",
                body: new URLSearchParams({ pronounce: pronounce })
            })
            .then(response => response.json())
            .then(data => {
	
                // ★ 正解/不正解を表示
                document.getElementById("tf").textContent = data.tf;
                
                document.getElementById("word-meaning").textContent = "意味: " + data.meaning;
                document.getElementById("word-pronounce").textContent = "読み: " + data.pronounce;
	
                if (data.game_count === 6 && data.tf === "正解！！！") {
                     showCorrectLayer(() => {

            			// 正解レイヤーが消えた後にクリアレイヤーを表示
            			showClearLayer();

            			// 意味と読みを消す
          		 		document.getElementById("word-meaning").textContent = "";
            			document.getElementById("word-pronounce").textContent = "";
            			document.getElementById("tf").textContent = "";
        			});

        			return;
                }
                
                // ★ 正解レイヤーを表示
                showCorrectLayer(() => {

                    // ★ 次の問題に書き換える
                    document.getElementById("read_word").textContent = data.theme;

                    // ★ 正解/不正解メッセージを消す
                    document.getElementById("tf").textContent = "";
                    
                    //意味と読みを消す
                    document.getElementById("word-meaning").textContent = "";
                    document.getElementById("word-pronounce").textContent = "";

                    // 入力欄をクリア
                    document.getElementById("pronounce").value = "";
                });
            });
            
        });
        
        //正解不正解レイヤー
        function showCorrectLayer(callback) {
            const layer = document.getElementById("tf");
            layer.classList.add("show");

            setTimeout(() => {
                layer.classList.remove("show");
                if (callback) callback();
            }, 2000);
        }
        
        //クリアレイヤー
        function showClearLayer() {
            const layer = document.getElementById("clear");
            layer.classList.add("show");
        }
        
        document.getElementById("retry-btn").addEventListener("click", () => {
    		location.reload(); // ゲームを最初からやり直す
		});
		
		document.getElementById("end-btn").addEventListener("click", () => {
    		window.location.href = "/f2/HomeServlet"; // ホームに戻る
		});
		
		
		
		
		
		
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