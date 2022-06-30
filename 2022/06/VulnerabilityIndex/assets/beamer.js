function createElement(tag0, class0) {
  let newEL = document.createElement(tag0);
  newEL.classList.add(class0);
  return newEL;
}

// Helper functions ==========================================================
function addTitleColorBanners(slideDOM) {
  let newClasses = [1,2,3,4].map(x => "title-header-" + x);
  newClasses.map(x => createElement("div", x))
            .forEach(x => slideDOM.prepend(x));
}

function addTitleLogo(slideDOM) {
  let imgDOM = createElement("img");
  imgDOM.src = "assets/logo.png";
  imgDOM.classList.add("title-logo");
  slideDOM.appendChild(imgDOM);
}

function addSlideLogo(slideDOM) {
  let imgDOM = createElement("img");
  imgDOM.src = "assets/logo.png";
  imgDOM.classList.add("img-logo");
  slideDOM.appendChild(imgDOM);
}

function addColorBanners(slideDOM) {
  let newClasses = ["header-banner", "footer-banner-one", "footer-banner-two",
                    "footer-banner-three"];
  newClasses.map(x => createElement("div", x))
            .forEach(x => slideDOM.appendChild(x));
}

function changeBackgroundColor(slideDOM) {
  slideDOM.style = "background-color: 'white';";
}

function addUnderline(h2DOM) {
  if (h2DOM.innerText !== "") {
    h2DOM.classList.add("header-underline");
  }
}

// Apply theme to slides =================================================
function addTheme(doc) {
  let titleSlide = doc.querySelector(".title-slide");
  addTitleColorBanners(titleSlide);
  addTitleLogo(titleSlide);

  let allSlides = doc.querySelectorAll("slide:not(:first-child)");
  allSlides.forEach(addColorBanners);
  allSlides.forEach(changeBackgroundColor);
  allSlides.forEach(addSlideLogo);

  let h2DOM = doc.querySelectorAll("h2");
  h2DOM.forEach(addUnderline);
}

addTheme(document);
