import js from "@eslint/js";
import globals from "globals";
import tseslint from "typescript-eslint";
import astro from "eslint-plugin-astro";

export default [
  js.configs.recommended,
  ...tseslint.configs.recommended,
  ...astro.configs.recommended,
  {
    // `js.configs.recommended` turns on `no-undef`, which knows about no
    // runtime globals until they are declared. Config files, scripts and the
    // SSR side of the app all read `process`; components touch `window`.
    languageOptions: {
      globals: { ...globals.node, ...globals.browser },
    },
    rules: {
      "no-console": ["error", { allow: ["warn", "error"] }],
      "@typescript-eslint/no-unused-vars": ["error", { argsIgnorePattern: "^_" }],
      "@typescript-eslint/no-explicit-any": "error",
    },
  },
  {
    // One-shot CLI entry points: printing progress is the whole job.
    files: ["src/db/**", "scripts/**"],
    rules: { "no-console": "off" },
  },
  { ignores: ["dist/**", ".astro/**", "node_modules/**", "drizzle/**"] },
];
