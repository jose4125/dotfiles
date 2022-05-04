local null_ls = require('null-ls')
local formatting = null_ls.builtins.formatting
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  sources = {
    formatting.prettier.with({
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "jsonc", "yaml", "markdown", "graphql", "handlebars", "svelte" },
      only_local = "node_modules/.bin",
    }),
    formatting.stylelint,
    formatting.prismaFmt,
    formatting.black,
    formatting.isort,
    formatting.cmake_format,
    formatting.dart_format,
    formatting.terraform_fmt,
    formatting.codespell,
    formatting.lua_format.with({
      extra_args = {
        '--no-keep-simple-function-one-line', '--no-break-after-operator', '--column-limit=100',
        '--break-after-table-lb', '--indent-width=2'
      }
    }),
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            -- on 0.8, you should use vim.lsp.buf.format instead
            callback = function()
              vim.lsp.buf.format()
            end
        })
    end
  end,
})
