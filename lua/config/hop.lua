require'hop'.setup()

-- vim.api.nvim_set_keymap("n", "h", "<cmd>lua require'hop'.hint_words()<cr>", {silent = true})
-- vim.api.nvim_set_keymap("n", "l", "<cmd>lua require'hop'.hint_lines()<cr>", {silent = true})
vim.api.nvim_set_keymap("n", "s", "<cmd>lua require'hop'.hint_char2()<cr>", {silent = true})
vim.api.nvim_set_keymap("v", "h", "<cmd>lua require'hop'.hint_words()<cr>", {silent = true})
vim.api.nvim_set_keymap("v", "l", "<cmd>lua require'hop'.hint_lines()<cr>", {silent = true})
vim.api.nvim_set_keymap("v", "s", "<cmd>lua require'hop'.hint_char2()<cr>", {silent = true})
