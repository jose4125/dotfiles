local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

map("n", "<C-j>", "<cmd>lua require'smart-splits'.resize_up(2)<cr>", opts)
map("n", "<C-k>", "<cmd>lua require'smart-splits'.resize_down(2)<cr>", opts)
map("n", "<C-h>", "<cmd>lua require'smart-splits'.resize_left(2)<cr>", opts)
map("n", "<C-l>", "<cmd>lua require'smart-splits'.resize_right(2)<cr>", opts)


require('smart-splits').setup({
  -- Ignored filetypes (only while resizing)
  ignored_filetypes = {
    'nofile',
    'quickfix',
    'qf',
    'prompt',
  },
  -- Ignored buffer types (only while resizing)
  ignored_buftypes = { 'NvimTree' },
  -- when moving cursor between splits left or right,
  -- place the cursor on the same row of the *screen*
  -- regardless of line numbers. False by default.
  -- Can be overridden via function parameter, see Usage.
  move_cursor_same_row = false,
})
