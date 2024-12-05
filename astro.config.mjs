// @ts-check
import { defineConfig } from "astro/config";

import icon from "astro-icon";
import tailwind from "@astrojs/tailwind";

// https://astro.build/config
export default defineConfig({
  integrations: [tailwind(), icon()],
  base: "GAIT",
  site: "https://SosaSebastian.github.io",
});
