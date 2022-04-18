vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap

-- map('i', 'jj', '<Esc>', {noremap = true})
map('n', '<Leader>h', ':wincmd h<CR>', {noremap = true})

map('n', '<Leader>j', ':wincmd j<CR>', {noremap = true})
map('n', '<Leader>k', ':wincmd k<CR>', {noremap = true})
map('n', '<Leader>l', ':wincmd l<CR>', {noremap = true})


map('v', 'K', ":m '<-2<CR>gv=gv", {noremap = true})
map('v', 'J', ":m '>+1<CR>gv=gv", {noremap = true})

map('n', '<leader>c', '<cmd>Bdelete!<CR>', {noremap = true, silent = true})

-- map('n', 'd', '"_d', {noremap = true})
map('n', 'dD', '"_dd', {noremap = true})
-- map('n', 'c', '"_c', {noremap = true})
map('n', 'cC', '"_cc', {noremap = true})
-- map('v', 'c', '"_c', {noremap = true})
-- map('v', 'X', '_d', {noremap = true})

map('n', '<CR>', ':noh<CR><CR>', {noremap = true})
map('n', '<esc>', ':noh<return><esc>', {noremap = true})
map('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
map('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})


map('n', '<C-c>', '"+y', {noremap = true})
map('v', '<C-c>', '"+y', {noremap = true})
map('n', '<C-v>', '"+gP', {noremap = true})
map('v', '<C-v>', '"+gP', {noremap = true})

map('n', ';;', '<Esc>A;<Esc>', {noremap = true})
map('n', ',,', '<Esc>A,<Esc>', {noremap = true})
