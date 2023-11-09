local prettier = require("prettier")

prettier.setup({
  bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
  cli_options = {   
      trailingComma= "es5",
      tabWidth= 2,
      semi= true,
      singleQuote= false,
      bracketSpacing= true,
      bracketSameLine= true,
      arrowParens= "always",
      jsxSingleQuote= false,
      insertPragma= false,
      endOfLine= "lf",
      useTabs= false
  }
})
