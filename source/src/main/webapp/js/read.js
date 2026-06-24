/**
 * 
 */
 'use strict'
        const spoon1 = document.getElementById("screen1");
        const spoon2 = document.getElementById("screen2");
        const quiz_word = document.getElementById("read_word");
		let actiond = false;
		let startTime = null;

        function animate(timestamp) {
            


	        //お題変更機能
			 if (!actiond) {
				actiond = true;//ここでtrueにすることで上の!actiondが動作しない
				fetch("ReadServlet?reroll=true")
				.then(res => res.json())
 				.then(data => {
					document.getElementById("read_word").innerText = data.theme;
   				});
				actiond = false;
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