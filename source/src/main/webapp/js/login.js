// カメラ位置
const cameraPos = {
	menu:{
		x:-95,
		 y:-100,
		zoom:1.5
	},

	login:{
		x:-230,
		y:-190,
		zoom:2.2
	},

	signup:{
		x:-230,
		y:-190,
		zoom:2.2
	},

	board:{
		x:700,
		y:590,
		zoom:7.6
	}
};


// カメラ移動
const camera = document.getElementById("camera");
function move(position, animate = true){
	const p = cameraPos[position];

	if(!p){
		console.error(position + " が定義されていません");
		return;
	}

	camera.style.transition = animate ? "transform 1.5s" : "none";
	camera.style.transform = `translate(${p.x}px, ${p.y}px) scale(${p.zoom})`;

}

//新規登録→登録完了画面時など、スライドする時に使うもの
function slide(toPosition, duration = 1500){
	const to = cameraPos[toPosition];

	camera.style.transition = `transform ${duration}ms ease`;

	camera.style.transform = `translate(${to.x}px, ${to.y}px) scale(currentZoom)`;

}

//ズーム、スライドなどのエフェクトを管理
function playEffect(effect, position, nextPage, fromPosition = null){
	switch(effect){
		case "zoom":
			move(position);
			
			setTimeout(function(){
				location.href = nextPage;
			},1500);
			
			break;
		case "slide":
			slide(position);
			
			setTimeout(function(){
				location.href = nextPage;
			},1500);
			
			break;
		case "none":
			location.href = nextPage;
			
			break;
		default:
			console.error(effect + " が存在しません");
	}s
}


// 初期表示時のズーム制御
function initScene(){
	const sceneName = document.body.dataset.scene;
	const params = new URLSearchParams(location.search);
	const from = params.get("from") || document.body.dataset.from;

	let animate = true;

	// メニュー→ログイン
	if(sceneName == "login" && params.get("from") == "menu"){
		animate = false;
	}

	// メニュー→新規登録
	if(sceneName == "signup" && params.get("from") == "menu"){
		animate = false;
	}

	// メニュー→ログアウト
	if(sceneName == "board" && params.get("from") == "menu"){
		animate = false;
	}
    
	if(sceneName == "board" && from == "signup"){
		animate = false;
	}

	// ログイン・新規登録→メニュー
	if(sceneName == "menu" && (params.get("from") == "login" ||params.get("from") == "signup")){
		animate = false;
	}

	move(sceneName, animate);
}

initScene();


// デバッグ用（クリック座標取得）
// 完成したら削除してOK
const bg = document.getElementById("bg");

bg.addEventListener("click", function(e){
	console.log("X:", e.offsetX, "Y:", e.offsetY);
});


// Hover・クリック共通処理
function setHover(selector, position, nextPage, effect, fromPosition = null){
	const obj = document.querySelector(selector);

	if(!obj) return;

	obj.addEventListener("mouseenter",function(){
		obj.style.background="rgba(255,255,255,.2)";
	});

	obj.addEventListener("mouseleave",function(){
		obj.style.background="transparent";
	});

	obj.addEventListener("click",function(){
		playEffect(effect,position,nextPage,fromPosition);
	});
}

function setBoard(selector, nextPosition, nextPage){
	const board = document.querySelector(selector);

	if(!board) return;

	board.addEventListener("click", function(){
		board.classList.add("is-flipped");
		
		setTimeout(function(){
			playEffect("zoom",nextPosition,nextPage);
		},3000);
	});
}


// Back・クリック共通処理
function setBack(selector, position, nextPage, effect, fromPosition = null){
	const obj = document.querySelector(selector);

	if(!obj) return;

	obj.addEventListener("mouseenter",function(){
		obj.style.background="rgba(255,255,255,.2)";
	});

	obj.addEventListener("mouseleave",function(){
		obj.style.background="rgba(172,170,170,1)";
	});

	obj.addEventListener("click",function(){
		playEffect(effect,position,nextPage,fromPosition);
    });
}


function setSubmitEffect(buttonId, formSelector, effect, position){
	const button = document.getElementById(buttonId);
	const form = document.querySelector(formSelector);

	if(!button || !form) return;

	button.addEventListener("click", function(e){
		e.preventDefault();

		if(effect == "zoom"){
			move(position);
		}else if(effect == "slide"){
			slide(position);
		}

		setTimeout(function(){
			form.submit();
		},1500);
	});
}


// メニュー画面のボタン
setHover(".loginHover","login","/f2/LoginServlet?from=menu","zoom");
setHover(".signupHover","signup","/f2/SignupServlet?from=menu","zoom");
setHover(".logoutHover","board","/f2/LogoutServlet?from=menu","zoom");

setBack(".backHover","menu","/f2/MenuServlet?from=login","zoom");
setBack(".backHover","menu","/f2/MenuServlet?from=signup","zoom");
setBack(".noHover","menu","/f2/MenuServlet?from=board","zoom");

setBoard("#board","menu","/f2/MenuServlet?from=board");
setBoard("#board","menu","/f2/MenuServlet?from=signup");

setSubmitEffect("loginButton",".input1","zoom","menu");
setSubmitEffect("signupButton",".input1","slide","board");


// ログイン画面・新規登録画面の戻るボタン
// （作ったら有効になる）
function setBackButton(selector, fromScene){
	const button = document.querySelector(selector);

	if(!button) return;

	button.addEventListener("click", function(e){
		e.preventDefault();
		move("menu");

		setTimeout(function(){
			location.href = "/test/MenuServlet?from=" + fromScene;
		},1500);
	});
}