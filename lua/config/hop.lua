require'hop'.setup()

vim.api.nvim_set_keymap("n", "W", "<cmd>lua require'hop'.hint_words()<cr>", {silent = true})
vim.api.nvim_set_keymap("n", "L", "<cmd>lua require'hop'.hint_lines()<cr>", {silent = true})
vim.api.nvim_set_keymap("n", "s", "<cmd>lua require'hop'.hint_char2()<cr>", {silent = true})
vim.api.nvim_set_keymap("v", "W", "<cmd>lua require'hop'.hint_words()<cr>", {silent = true})
vim.api.nvim_set_keymap("v", "L", "<cmd>lua require'hop'.hint_lines()<cr>", {silent = true})
vim.api.nvim_set_keymap("v", "s", "<cmd>lua require'hop'.hint_char2()<cr>", {silent = true})
