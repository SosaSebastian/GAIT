import "swiper/css";
import "swiper/css/navigation";
import "swiper/css/pagination";

import Swiper from "swiper";
import { Navigation, Pagination } from "swiper/modules";

const swiper = new Swiper(".swiper", {
  grabCursor: true,
  pagination: {
    el: ".swiper-pagination",
  },
  navigation: {
    nextEl: ".swiper-button-next",
    prevEl: ".swiper-button-prev",
  },
  scrollbar: {
    el: ".swiper-scrollbar",
  },
  modules: [Navigation, Pagination],
});
