local null_ls = require('null-ls')
local formatting = null_ls.builtins.formatting

null_ls.setup({
  sources = {
    formatting.prettier.with({
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
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
          vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
      end
  end,
})
