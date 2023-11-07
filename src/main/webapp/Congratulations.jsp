<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BuyMe</title>
</head>
<style>
	body {
  margin: 0;
  padding: 0;
  background-color: #ABDBC1;
}

h1 {
  font-size: 4rem;
  text-align: center;
  height: 70vh;
  line-height: 70vh;
  color: #fcedd8;
  background-color: #ABDBC1;
  font-family: "Niconne", cursive;
  font-weight: 700;
  text-shadow: 5px 5px 0 #eb452b, 10px 10px 0 #efa032, 15px 15px 0 #46b59b,
    20px 20px 0 #017e7f, 25px 25px 0 #052939, 30px 30px 0 #c11a2b;
}
@keyframes confetti-slow {
  0% {
    transform: translate3d(0, 0, 0) rotateX(0) rotateY(0);
  }
  100% {
    transform: translate3d(25px, 105vh, 0) rotateX(360deg) rotateY(180deg);
  }
}
@keyframes confetti-medium {
  0% {
    transform: translate3d(0, 0, 0) rotateX(0) rotateY(0);
  }
  100% {
    transform: translate3d(100px, 105vh, 0) rotateX(100deg) rotateY(360deg);
  }
}
@keyframes confetti-fast {
  0% {
    transform: translate3d(0, 0, 0) rotateX(0) rotateY(0);
  }
  100% {
    transform: translate3d(-50px, 105vh, 0) rotateX(10deg) rotateY(250deg);
  }
}
.confetti-container {
  perspective: 700px;
  position: absolute;
  overflow: hidden;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
}
.confetti {
  position: absolute;
  z-index: 1;
  top: -10px;
  border-radius: 0;
}
.confetti--animation-slow {
  animation: confetti-slow 2.25s linear 1 forwards;
}
.confetti--animation-medium {
  animation: confetti-medium 1.75s linear 1 forwards;
}
.confetti--animation-fast {
  animation: confetti-fast 1.25s linear 1 forwards;
}
.buttonHolder{ text-align: center; }
input {
  border-top-style: hidden;
  border-right-style: hidden;
  border-left-style: hidden;
  border-bottom-style: groove;
  background-color: #eee;
  text-align: center;
}
</style>

<body>

<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="Home.jsp">BuyMe: Home</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
            aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav me-auto mb-2 mb-md-0">
                <li class="nav-item">
                    <a class="nav-link" href="DisplayAlert.jsp">My_Alerts</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="AuctionHistory.jsp">Auction_History</a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="postQuestion.jsp">Help_QA</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ChooseAuctionItem.jsp">Sell_Item</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="BidStatus.jsp">Bid_Alerts</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Logout.jsp">Log Out</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<br><br><br>


	<div class="js-container">
  		<h1>Congratulations 
  		you have brought the product!</h1>
	</div>
	<div class = "buttonHolder">
		<form action = "Home.jsp">
  		<input type = "submit" value = "Home Page" style = "height: 50px; width:100; font-family: monospace; border-radius: 20px; background-color: #FFAC63">
  		</form>
	</div>
	
	<script>
	
const Confettiful = function (el) {
	  this.el = el;
	  this.containerEl = null;

	  this.confettiFrequency = 3;
	  this.confettiColors = ["#fce18a", "#ff726d", "#b48def", "#f4306d"];
	  this.confettiAnimations = ["slow", "medium", "fast"];

	  this._setupElements();
	  this._renderConfetti();
	};

	Confettiful.prototype._setupElements = function () {
	  const containerEl = document.createElement("div");
	  const elPosition = this.el.style.position;

	  if (elPosition !== "relative" || elPosition !== "absolute") {
	    this.el.style.position = "relative";
	  }

	  containerEl.classList.add("confetti-container");

	  this.el.appendChild(containerEl);

	  this.containerEl = containerEl;
	};

	Confettiful.prototype._renderConfetti = function () {
	  this.confettiInterval = setInterval(() => {
	    const confettiEl = document.createElement("div");
	    const confettiSize = Math.floor(Math.random() * 3) + 7 + "px";
	    const confettiBackground = this.confettiColors[
	      Math.floor(Math.random() * this.confettiColors.length)
	    ];
	    const confettiLeft = Math.floor(Math.random() * this.el.offsetWidth) + "px";
	    const confettiAnimation = this.confettiAnimations[
	      Math.floor(Math.random() * this.confettiAnimations.length)
	    ];

	    confettiEl.classList.add(
	      "confetti",
	      "confetti--animation-" + confettiAnimation
	    );
	    confettiEl.style.left = confettiLeft;
	    confettiEl.style.width = confettiSize;
	    confettiEl.style.height = confettiSize;
	    confettiEl.style.backgroundColor = confettiBackground;

	    confettiEl.removeTimeout = setTimeout(function () {
	      confettiEl.parentNode.removeChild(confettiEl);
	    }, 3000);

	    this.containerEl.appendChild(confettiEl);
	  }, 25);
	};

	window.confettiful = new Confettiful(document.querySelector(".js-container"));

</script>

</body>
</html>