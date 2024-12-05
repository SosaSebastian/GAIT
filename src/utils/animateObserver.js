const Rocket = document.querySelector("#Rocket");
const observedElement = document.querySelector("#about");

const callback = (entries, observer) => {
  entries.forEach((entry) => {
    if (entry.isIntersecting) {
      Rocket.classList.add("lauch");
      observer.unobserve(entry.target);
    }
  });
};

const observer = new IntersectionObserver(callback, {
  root: null,
  threshold: 0.8,
});

observer.observe(observedElement);
