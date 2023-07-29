const game = document.getElementById("game");
const game_bg = document.getElementById("game_bg");
const minion = document.getElementById("minion");
const commit = document.getElementById("commit");
// const coffee = document.getElementById("coffee");
const score = document.getElementById("score");
const button = document.getElementById("startstop2button");
const button_div = document.getElementById("startstop2");
button_div.onclick = startStop;
var active = false;
var timer = null;

const message = document.getElementById("message");
message.innerText = ''

function jump() {
  if (active) {
    minion.classList.add("jump-animation");
    setTimeout(() =>
      minion.classList.remove("jump-animation"), 500);
  }
}

document.addEventListener('keydown', (event) => {
  if ((event.code == "Space") || (event.key == " ")) {
    if (!minion.classList.contains('jump-animation')) {
      jump();
    }
  }
})

function startStop() {

  if (active) {
      active = false;
      button_div.style.backgroundImage = "url(../../img/404_yes.svg)";
      commit.classList.remove("commit-animation");
      // coffee.classList.remove("coffee-animation");
      clearInterval(timer);
      timer = null;
      disableAll()

  } else {
    active = true;
    score.innerText = 0;
    message.innerText = ''
    button_div.style.backgroundImage = "url(../../img/404_no.svg)";
    enableAll();
    set_active();
    
  }
}

function set_active() {
  commit.classList.add("commit-animation")
  // coffee.classList.add("coffee-animation")
  timer = setInterval(() => {
    const minionTop = parseInt(window.getComputedStyle(minion).getPropertyValue('top'));
    score.innerText++;
    
    // obstacles = ["commit", "coffee"]
    obstacles = ["commit"]

    for (var i = 0; i<obstacles.length ;i++) {
      var obs = document.getElementById(obstacles[i])
      var obsLeft = parseInt(window.getComputedStyle(obs).getPropertyValue('left'));
      
      if (obsLeft < 0) {
        obs.style.display = 'none';
      } else {
        obs.style.display = ''
      }
    
      if (obsLeft < 50 && obsLeft > 0 && minionTop > -280) {
        lines = score.innerText
        message.innerText = "Congrats!\nYou committed " + lines + " lines of code :-)\nPlay again?"
        message.style.display = "block";
        startStop();
      }
    }


    // if (commitLeft < 0) {
    //   commit.style.display = 'none';
    // } else {
    //   commit.style.display = ''
    // }

    // if (commitLeft < 50 && commitLeft > 0 && minionTop > -280) {
    //   lines = score.innerText
    //   message.innerText = "Congrats!\nYou committed " + lines + " lines of code :-)\nPlay again?"
    //   message.style.display = "block";
    //   startStop();
    // }
  }, 80)
}


function disableAll() {
  atts = ["game_bg", "score", "minion", "commit"]
  for(var i = 0; i < atts.length; i++){
    document.getElementById(atts[i]).style.opacity = "0.4";
  }
}

function enableAll() {
  atts = ["game_bg", "score", "minion", "commit"]
  for(var i = 0; i < atts.length; i++){
    document.getElementById(atts[i]).style.opacity = "1";
  }
}