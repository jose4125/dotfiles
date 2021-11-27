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

highlight ColorColumn ctermbg=0 guibg=lightgrey

" let g:polyglot_disabled = ['scss']

if has('nvim')
  call plug#begin('~/.local/share/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
" Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vuciv/vim-bujo'
Plug 'kshenoy/vim-signature'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'AndrewRadev/tagalong.vim'
Plug 'tpope/vim-commentary'
Plug 'fatih/vim-hclfmt'
Plug 'skanehira/docker-compose.vim'
Plug 'kkvh/vim-docker-tools'
Plug 'liuchengxu/vim-which-key'
" Plug 'luochen1990/rainbow'
Plug 'mattn/emmet-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'ntpeters/vim-better-whitespace'
Plug 'APZelos/blamer.nvim'
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-sneak'
" Plug 'Yggdroot/indentLine'
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'dyng/ctrlsf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
"  I AM SO SORRY FOR DOING COLOR SCHEMES IN MY VIMRC, BUT I HAVE
"  TOOOOOOOOOOOOO
Plug 'skbolton/embark'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

call plug#end()


let g:sneak#label = 1
let g:blamer_enabled = 1
let g:rainbow_active = 1
let g:rainbow_conf = {
\ 'separately': {
\   'html': 0,
\   'scss': 0,
\ }
\}

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif


if (has("termguicolors"))
  set termguicolors
endif

colorscheme embark
" colorscheme dracula

let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

if executable('rg')
  let g:rg_derive_root='true'
endif


let mapleader = " "

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

let g:signify_sign_add = '██'
let g:signify_sign_change = '██'
let g:signify_sign_delete = '██'

set updatetime=100

highlight SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
highlight SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE
highlight SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE

" highlight SignifySignAdd                  ctermbg=green                guibg=#00ff00
" highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#ff0000
" highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00

" map ESC to jj
inoremap jj <Esc>
"vim commentary
xmap cc <Plug>Commentary
nmap ccc <Plug>CommentaryLine


map <Leader>t :MBEToggle<cr>
map <Leader>bn :MBEbn<cr>
map <Leader>bp :MBEbp<cr>

" nmap <Leader>cs :CocSearch<Space>
" nmap <Leader>bb :buffers<CR>:buffer<Space>
map ]b :bn<cr>
map [b :bp<cr>
map gd :bd<cr>

" indent-blankline.nvim
lua << EOF
require("nvim-treesitter.configs").setup {
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  indent = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  }
}

vim.opt.list = true

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
EOF

" Use preset argument to open it
nmap <space>e :CocCommand explorer<CR>

" coc prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>
" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" TAB in general mode will move to text buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <silent> <S-TAB> :bprevious<CR>

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 }}
let $FZF_DEFAULT_OPTS='--reverse'

nnoremap <C-c> "+y
vnoremap <C-c> "+y
nnoremap <C-v> "+gP
vnoremap <C-v> "+gP

" ctrlsf
nmap <leader>S <Plug>CtrlSFPrompt''
nnoremap <leader>SS :CtrlSFOpen<CR>
nnoremap <leader>ts :CtrlSFToggle<CR>
"inoremap <leader>ts <Esc>:CtrlSFToggle<CR>

let g:ctrlsf_search_mode = 'async'
let g:ctrlsf_auto_focus = {
    \ "at": "done",
    \ "duration_less_than": 1000
    \ }

let g:ctrlsf_mapping = {
    \ "next": "n",
    \ "prev": "N",
    \ }

" telescope
nnoremap <leader>p <cmd>Telescope find_files<cr>
nnoremap <leader>gf <cmd>Telescope git_files<cr>
nnoremap <leader>fe <cmd>Telescope file_browser<cr>
nnoremap <leader>of <cmd>Telescope oldfiles<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>mk <cmd>Telescope marks<cr>
nnoremap <leader>gc <cmd>Telescope git_commits<cr>
nnoremap <leader>gbc <cmd>Telescope git_bcommits<cr>
nnoremap <leader>gb <cmd>Telescope git_branches<cr>
nnoremap <leader>gs <cmd>Telescope git_status<cr>
nnoremap <leader>gsh <cmd>Telescope git_stash<cr>
nnoremap <leader>ch <cmd>Telescope command_history<cr>
nnoremap <leader>tr <cmd>Telescope treesitter<cr>
nnoremap <leader>co <cmd>Telescope commands<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
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

" nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <C-g> :Rg<CR>
nnoremap <Leader>ff :GFiles<CR>
nnoremap <Leader>fs :Files<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv


" vim TODO
nmap <Leader>tu <Plug>BujoChecknormal
nmap <Leader>th <Plug>BujoAddnormal
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"

vnoremap X "_d
inoremap <C-c> <esc>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
nnoremap <leader>cr :CocRestart

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" fungitive
nmap <leader>Gs :G<CR>
nmap <leader>Gl :diffget //3<CR>
nmap <leader>Gh :diffget //2<CR>


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
