"--------------------------------------------------------------------------
" General settings
"--------------------------------------------------------------------------

syntax on
filetype on
filetype plugin indent on

"set mouse=a
set guicursor=
"set noshowmatch
set relativenumber
set hlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set nu
set nowrap
set smartcase
set ignorecase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set cursorline
set encoding=UTF-8
set guifont=JetBrainsMono_Nerd_Font:h15
"set guifont=FiraCode_Nerd_Font:h16
set shortmess-=S
set nocompatible
set list
set listchars=tab:▸\ ,trail:·


set includeexpr=substitute(v:fname,'^/','','g')
"set suffixesadd=.js,.vue,.scss,.py


" Set to auto read when a file is changed from the outside
set autoread


" Show matching brackets when text indicator is over them
set showmatch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Use Unix as the standard file type
set ffs=unix,dos,mac


set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80

set autoread
au CursorHold * checktime


let mapleader = "\<space>"

highlight ColorColumn ctermbg=0 guibg=lightgrey


"--------------------------------------------------------------------------
" Key maps
"--------------------------------------------------------------------------

" map ESC to jj
inoremap jj <Esc>

map ]b :bn<cr>
map [b :bp<cr>
map gd :bd<cr>

nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>

vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

vnoremap X "_d
inoremap <C-c> <esc>

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" TAB in general mode will move to text buffer
nnoremap <silent> <TAB> :bnext<CR>

" SHIFT-TAB will go back
nnoremap <silent> <S-TAB> :bprevious<CR>

nnoremap <C-c> "+y
vnoremap <C-c> "+y
nnoremap <C-v> "+gP
vnoremap <C-v> "+gP

"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------

if has('nvim')
  call plug#begin('~/.local/share/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/vim-fugitive.vim
source ~/.config/nvim/plugins/undotree.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/bujo.vim
source ~/.config/nvim/plugins/signature.vim
source ~/.config/nvim/plugins/vim-styles-components.vim
source ~/.config/nvim/plugins/vim-commentary.vim
source ~/.config/nvim/plugins/vim-hclfmt.vim
source ~/.config/nvim/plugins/docker-compose.vim
source ~/.config/nvim/plugins/vim-docker-tools.vim
source ~/.config/nvim/plugins/vim-which-key.vim
source ~/.config/nvim/plugins/emmet-vim.vim
source ~/.config/nvim/plugins/vim-snake.vim
source ~/.config/nvim/plugins/vim-tmux-navigator.vim
source ~/.config/nvim/plugins/vim-tmux-focus-events.vim
source ~/.config/nvim/plugins/vim-better-whitespace.vim
source ~/.config/nvim/plugins/vim-surround.vim
source ~/.config/nvim/plugins/vim-visual-multi.vim
source ~/.config/nvim/plugins/editorconfig-vim.vim
source ~/.config/nvim/plugins/popup-nvim.vim
source ~/.config/nvim/plugins/pleenary-nvim.vim
source ~/.config/nvim/plugins/ctrlsf.vim
source ~/.config/nvim/plugins/splitjoin.vim
source ~/.config/nvim/plugins/indent-blankline-nvim.vim
source ~/.config/nvim/plugins/nvim-treesitter.vim
source ~/.config/nvim/plugins/nvim-ts-rainbow.vim
source ~/.config/nvim/plugins/gitsigns-nvim.vim
source ~/.config/nvim/plugins/nvim-autopairs.vim
source ~/.config/nvim/plugins/nvim-ts-autotag.vim
source ~/.config/nvim/plugins/stabilize-nvim.vim

source ~/.config/nvim/plugins/embark.vim
source ~/.config/nvim/plugins/dracula.vim
source ~/.config/nvim/plugins/vim-airline.vim
source ~/.config/nvim/plugins/vim-airline-themes.vim
source ~/.config/nvim/plugins/vim-devicons.vim

call plug#end()
doautocmd User PlugLoaded


"--------------------------------------------------------------------------
" Lua plugins setup
"--------------------------------------------------------------------------


" let g:signify_sign_add = '██'

lua << EOF
require("stabilize").setup()
-- gitsigns
require('gitsigns').setup {
  current_line_blame = true,
  numhl = true,
  }

-- autopairs
require('nvim-autopairs').setup{}

-- indent-blankline.nvim
vim.opt.list = true
require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
    context_patterns = { 'class', 'return', 'function', 'method', '^if', '^while', 'jsx_element', '^for', '^object', '^table', 'block',
    'arguments', 'if_statement', 'else_clause', 'jsx_element', 'jsx_self_closing_element', 'try_statement',
    'catch_clause', 'import_statement', 'operation_type' }
}

-- treesitter
require("nvim-treesitter.configs").setup {
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  },
  autotag = {
    enable = true,
  }
}
EOF

" telescope setup
lua << EOF
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "top",
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_defaults = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}

EOF

"--------------------------------------------------------------------------
" Miscellaneous
"--------------------------------------------------------------------------

colorscheme embark
" colorscheme dracula

if executable('rg')
  let g:rg_derive_root='true'
endif

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 50)
augroup END

autocmd BufWritePre * :call TrimWhitespace()
