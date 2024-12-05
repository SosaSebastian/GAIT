/** @type {import('tailwindcss').Config} */
export default {
  content: ["./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}"],
  theme: {
    extend: {
      colors: {
        dark: "#15043B",
        accent: "#F2E200",
        primary: "#4C0DD4",
        secondary: "#8D0DD4",
      },
    },
  },
  plugins: [],
};
