require('better_escape').setup {
    mapping = { 'ii', 'jj', 'jk', 'kj' },
    timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
    keys = '<Esc>', -- keys used for escaping, if it is a function will use the result every time
}
