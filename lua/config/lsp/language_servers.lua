local nvim_lsp = require('lspconfig')
local configs = require'lspconfig.configs'
local jsonSchemas = require('config.lsp.settings.jsonls')


local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  buf_set_keymap('n', '<leader>gi', '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>', opts)
  buf_set_keymap('n', 'gtd', '<cmd>lua require("telescope.builtin").lsp_type_definitions()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', opts)
  buf_set_keymap('n', 'grr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gs', '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>', opts)
  buf_set_keymap('n', 'gws', '<cmd>lua require("telescope.builtin").lsp_workspace_symbols()<CR>', opts)
  buf_set_keymap('n', 'gds', '<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<CR>', opts)
  buf_set_keymap("n", "gt", "<cmd>Lspsaga lsp_finder<cr>", opts)

  -- lspsaga hover
  buf_set_keymap("n", "K",  "<cmd>Lspsaga hover_doc<cr>", opts)
  -- buf_set_keymap("n", "gp", "<cmd>Lspsaga preview_definition<cr>", opts)

  -- diagnostic
  buf_set_keymap('n', '<leader>df', '<cmd>lua vim.diagnostic.open_float(nil, { scope = "line", })<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<leader>db', '<cmd>lua require("telescope.builtin").diagnostics()<CR>', opts)
  -- lspsaga diagnostic
  buf_set_keymap("n", "<leader>dl", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
  buf_set_keymap("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
  buf_set_keymap("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
  -- buf_set_keymap('n', '<space>ft', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  -- lspsaga actions
  buf_set_keymap("n", "<leader>rr", "<cmd>Lspsaga rename<cr>", opts)
  buf_set_keymap("n", "<leader>a", "<cmd>Lspsaga code_action<cr>", opts)
  buf_set_keymap("x", "<leader>a", ":<c-u>Lspsaga range_code_action<cr>", opts)
  buf_set_keymap("n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", opts)
  buf_set_keymap("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", opts)

  -- lsp workspace
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
end

-- vim.g.markdown_fenced_languages = {
--   "ts=typescript"
-- }


local lsp_installer = require("nvim-lsp-installer")
local util = require("lspconfig.util")

local tsserver_root_dir = util.root_pattern "package.json"
local denols_root_dir = util.root_pattern("deno.json", "deno.jsonc", "tsconfig.json", ".git")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  local opts = {capabilities = capabilities, on_attach = on_attach}

  -- (optional) Customize the options passed to the server
  if server.name == "jsonls" then
    opts = vim.tbl_deep_extend("force", {
      settings = {
        json = {
          schemas = jsonSchemas
        }
      }
    }, opts)
  end

  -- if server.name == "emmet_ls" then
  --   opts = vim.tbl_deep_extend("force", {
  --     filetypes = {
  --         'html', 'typescriptreact', 'javascriptreact', 'javascript',
  --         'typescript', 'javascript.jsx', 'typescript.tsx', 'css'
  --     },
  --   }, opts)
  -- end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  if server.name == "stylelint_lsp" then
    opts = vim.tbl_deep_extend("force", {
      filetypes = {
        "scss", "less", "css", "sass"
      },
    }, opts)
  end

  if server.name == "denols" then
      opts.root_dir = function (fname)
          return not tsserver_root_dir(fname) and denols_root_dir(fname)
      end
  elseif server.name == "tsserver" then
      opts.root_dir = tsserver_root_dir
  end

  server:setup(opts)
end)
