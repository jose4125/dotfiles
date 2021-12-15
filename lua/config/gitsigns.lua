require('gitsigns').setup{
  current_line_blame = true,
  numhl = true,
  keymaps = {
    -- Default keymap options
    noremap = true,

    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'"},

    ['n <leader>us'] = '<cmd>Gitsigns stage_hunk<CR>',
    ['v <leader>us'] = ':Gitsigns stage_hunk<CR>',
    ['n <leader>uu'] = '<cmd>Gitsigns undo_stage_hunk<CR>',
    ['n <leader>ur'] = '<cmd>Gitsigns reset_hunk<CR>',
    ['v <leader>ur'] = ':Gitsigns reset_hunk<CR>',
    ['n <leader>uR'] = '<cmd>Gitsigns reset_buffer<CR>',
    ['n <leader>up'] = '<cmd>Gitsigns preview_hunk<CR>',
    ['n <leader>ub'] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
    ['n <leader>uS'] = '<cmd>Gitsigns stage_buffer<CR>',
    ['n <leader>uU'] = '<cmd>Gitsigns reset_buffer_index<CR>',

    -- Text objects
    ['o ih'] = ':<C-U>Gitsigns select_hunk<CR>',
    ['x ih'] = ':<C-U>Gitsigns select_hunk<CR>'
  },
}
