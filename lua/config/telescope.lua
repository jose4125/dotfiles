local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    layout_config = {
      prompt_position = "top",
      horizontal = {mirror = false},
      vertical = {mirror = false},
    },
    find_command = {'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
    prompt_prefix = "> ",
    selection_caret = ">> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",

    file_sorter = require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =require'telescope.sorters'.get_generic_fuzzy_sorter,
    path_display = {},
    winblend = 0,
    border = {},
    borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons = true,
    use_less = true,
    set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,


    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ['<leader>q'] = actions.close,
        -- ['<leader>j'] = actions.move_selection_next,
        -- ['<leader>k'] = actions.move_selection_previous,
      },
      n = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ['<leader>q'] = actions.close,
        -- ['<leader>j'] = actions.move_selection_next,
        -- ['<leader>k'] = actions.move_selection_previous,
      }
    }
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
  }
}

vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope git_files<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fs', '<cmd>Telescope grep_string<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fl', '<cmd>Telescope live_grep<cr>', {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fch', '<cmd>Telescope command_history<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fsh', '<cmd>Telescope search_history<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fm', '<cmd>Telescope marks<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fr', '<cmd>Telescope resume<cr>', {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>gc', '<cmd>Telescope git_commits<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gbc', '<cmd>Telescope git_bcommits<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gb', '<cmd>Telescope git_branches<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gs', '<cmd>Telescope git_status<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gss', '<cmd>Telescope git_stash<cr>', {noremap = true})

vim.api.nvim_set_keymap(
    'n',
    '<leader>p',
    ":lua require'telescope'.extensions.project.project{}<CR>",
    {noremap = true, silent = true}
)


require('telescope').load_extension('fzf')
require('telescope').load_extension('neoclip')
require'telescope'.load_extension('project')

