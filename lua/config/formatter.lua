local prettier = function()
  return {
    exe = "./node_modules/.bin/prettier",
    args = {"--stdin-filepath", vim.fn.shellescape(vim.api.nvim_buf_get_name(0))},
    stdin = true,
  }
end

local eslint = function()
  return {
    exe = "./node_modules/.bin/eslint",
    args = {"--stdin", "--stdin-filename", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--fix-to-stdout"},
    stdin = true
  }
end

require "formatter".setup {
  logging = false,
  filetype = {
    css = { prettier },
    scss = { prettier },
    html = { prettier },
    javascript = { prettier },
    javascriptreact = { prettier },
    typescript = { prettier },
    typescriptreact = { prettier },
    markdown = { prettier },
    json = { prettier },
    jsonc = { prettier },
    vue = { prettier },
    terraform = {
      function()
        return {
          exe = "terraform",
          args = { "fmt", "-" },
          stdin = true
        }
      end
    },
    python = {
      -- Configuration for psf/black
      function()
        return {
          exe = "black", -- this should be available on your $PATH
          args = { '-' },
          stdin = true,
        }
      end
    }
    -- lua = {
    --   -- stylua
    --   function()
    --     return {
    --       exe = "stylua",
    --       args = { "--config-path", "~/.config/.stylua.toml", "-" },
    --       stdin = true,
    --     }
    --   end,
    -- },
  },
}

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.vue,*.html,*css,*json FormatWrite
augroup END
]], true)
