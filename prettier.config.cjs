/** @type {import("prettier").Config} */
module.exports = {
  plugins: [require.resolve("prettier-plugin-tailwindcss")],
  overrides: [
    {
      files: ["*.ts", "*.js", "*.tsx", "*.jsx", "*.cjs"],
      options: {
        trailingComma: "es5",
        tabWidth: 2,
        semi: true,
        singleQuote: false,
      },
    },
  ],
};
