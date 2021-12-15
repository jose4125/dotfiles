require('neoclip').setup()

vim.api.nvim_set_keymap(
  "n",
  "<leader>nc",
  [[<Cmd>lua require('telescope').extensions.neoclip.plus()<CR>]],
  { noremap = true, silent = true }
)

