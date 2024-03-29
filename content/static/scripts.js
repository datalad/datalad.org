// Add observer to check when typewriter element scrolls into view and add/remove animation class
const observer = new IntersectionObserver(entries => {
  entries.forEach(entry => {
    const console = entry.target.querySelector('.typewriter-text');
    // At intersection, add animation class and return
    if (entry.isIntersecting) {
      console.classList.add('typing');
      return;
    }
    // Not intersecting: remove class
    console.classList.remove('typing');
  });
});
// Tell observer to track the correct element
observer.observe(document.querySelector('.card-img.use-datalad'));

// Check for click outside navbar, close dropdown menu
document.addEventListener("click", (evt) => {
  // Since the checkbox input element is not a child of the navbar
  // we need to check for all these elements individually
  const navbar = document.getElementById("navbar");
  const menu_label = document.getElementById("burger_label");
  const menu_checkbox = document.getElementById("burger");
  let targetElement = evt.target; // clicked element
  do {
      if ((targetElement == navbar)
          || (targetElement == menu_label)
          || (targetElement == menu_checkbox)){
          // This is a click inside. Do nothing, just return.
          return;
      }
      // Go up the DOM
      targetElement = targetElement.parentNode;
  } while (targetElement);

  // Click outside the navbar detected
  if (menu_checkbox.checked) {
    menu_checkbox.checked = false;
  }
});

// Close dropdown menu
function closeMenu() {
  const menu_checkbox = document.getElementById("burger");
  if (menu_checkbox.checked) {
    menu_checkbox.checked = false;
  }
}

function copyCitation() {
  // https://stackoverflow.com/questions/60581285/execcommand-is-now-obsolete-whats-the-alternative
  // https://www.sitepoint.com/clipboard-api/
  selectText = document.getElementById("citation_text").textContent;
  navigator.clipboard.writeText(selectText)
    .then(() => { })
    .catch((error) => { alert(`Copy failed! ${error}`) })
    // this.showCopyTooltip = true;
}

function copyCode(text) {
  // https://stackoverflow.com/questions/60581285/execcommand-is-now-obsolete-whats-the-alternative
  // https://www.sitepoint.com/clipboard-api/
  navigator.clipboard.writeText(text)
    .then(() => { })
    .catch((error) => { alert(`Copy failed! ${error}`) })
}

// Change "Use DataLad" display
var gooeyVideo = document.getElementById("gooey_video");
gooeyVideo.style.display = "none";
var timer = null
var interval = 20000
startTimer()

function startTimer() {
  if (timer !== null) return;
  timer = setInterval(toggleUseDataLadRadio, interval);
}

function stopTimer() {
  clearInterval(timer);
  timer = null
}

function resetTimer() {
  stopTimer()
  startTimer()
}

function selectUseDataLad(val, src) {
  // Grab elements
  var consoleImg = document.getElementById("console_img");
  var typedText = document.getElementById("typed_text");
  var gooeyVideo = document.getElementById("gooey_video");
  // Set display
  if (val==="console") {
    consoleImg.style.display = "";
    typedText.style.display = "";
    gooeyVideo.style.display = "none";
  } else {
    consoleImg.style.display = "none";
    typedText.style.display = "none";
    gooeyVideo.style.display = "";
  }
  if (src==="click") {
    resetTimer()
  }
  
}

function toggleUseDataLadRadio() {
  var radioConsole = document.getElementById("console-select");
  var radioGooey = document.getElementById("gooey-select");
  if (radioConsole.checked) {
    radioConsole.checked = false;
    radioGooey.checked = true;
    selectUseDataLad("gooey", "timer")
  } else {
    radioGooey.checked = false;
    radioConsole.checked = true;
    selectUseDataLad("console", "timer")
  }
}