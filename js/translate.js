const $ = (element) => document.querySelector(element);

const btnTranslate = $("#btn-translate");
const content = $(".presentation-content");

let lang = "en";

const textEnglish = `
        <p>
          GAIT is a web platform created specifically for Probitec Autos to
          improve the distribution and management of its products across the
          country. Our goal is to provide an excellent shopping experience by
          ensuring security, trust, and real-time order tracking.
        </p>
        <p>
          We use artificial intelligence to give personalized recommendations
          and help increase sales, adapting to the specific needs of each
          customer. From managing users to making order processes more
          efficient, GAIT ensures a simple, clear, and secure system.
        </p>
        <p>
          We are Sebastián Sosa and Cristian Mora, the developers of GAIT. With
          this platform, we want to offer practical and innovative solutions to
          improve and simplify the client’s business processes. Our focus is to
          combine customer needs with the latest technology to create a platform
          that not only solves current challenges but also helps businesses
          grow.
        </p>`;

const textSpanish = `
        <p>
          GAIT es una plataforma web diseñada exclusivamente para Probitec
          Autos, con el objetivo de optimizar la distribución y gestión de sus
          productos a nivel nacional. Buscamos ofrecer una experiencia de compra
          excepcional, garantizando seguridad, confianza y un seguimiento de
          pedidos en tiempo real.
        </p>
        <p>
          Utilizamos inteligencia artificial para ofrecer recomendaciones
          personalizadas y mejorar las ventas, adaptándonos a las necesidades
          específicas del cliente. Desde la gestión de usuarios hasta la
          optimización de pedidos, GAIT asegura un proceso eficiente,
          transparente y seguro.
        </p>
        <p>
          Somos Sebastián Sosa y Cristian Mora, los desarrolladores detrás de
          GAIT. Por medio de esta plataforma buscamos implementar soluciones
          tecnológicas eficientes e innovadoras, con el objetivo de optimizar y
          mejorar los procesos comerciales del cliente. Nuestro enfoque es
          unificar las necesidades del cliente con los avances tecnológicos más
          relevantes, creando una plataforma que no solo resuelva sus retos
          actuales, sino que también impulse su crecimiento.
        </p>`;

btnTranslate.addEventListener("click", () => {
  if (lang === "es") {
    lang = "en";
    content.innerHTML = textSpanish;
    btnTranslate.style.color = "#000";
  } else {
    lang = "es";
    content.innerHTML = textEnglish;
    btnTranslate.style.color = "#7552f2";
  }
});
