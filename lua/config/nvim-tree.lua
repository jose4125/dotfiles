vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1

vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>r', ':NvimTreeRefresh<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>n', ':NvimTreeFindFile<CR>', {noremap = true})

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

require'nvim-tree'.setup{
  update_focused_file = {
    enable = true,
  },
  view = {
    width = 40,
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {
        { key = {"<CR>", "o", "l"},   cb = tree_cb("edit") },
        { key = "v",                  cb = tree_cb("vsplit") },
        { key = "s",                  cb = tree_cb("split") },
        { key = {"<BS>", 'h'},        cb = tree_cb("close_node") },
        { key = "<C-s>",              cb = tree_cb("system_open") },
      }
    },
  }
}
