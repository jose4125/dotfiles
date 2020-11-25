syntax on
filetype on
filetype plugin indent on

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
set nu
set nowrap
set smartcase
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

if has('nvim')
  call plug#begin('~/.local/share/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vuciv/vim-bujo'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-dispatch'
Plug 'jparise/vim-graphql'
Plug 'chemzqm/vim-jsx-improve'
Plug 'leafgarland/typescript-vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'tpope/vim-commentary'
Plug 'b4b4r07/vim-hcl'
Plug 'fatih/vim-hclfmt'
Plug 'ekalinin/dockerfile.vim'
Plug 'skanehira/docker-compose.vim'
Plug 'kkvh/vim-docker-tools'
Plug 'pearofducks/ansible-vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'luochen1990/rainbow'
Plug 'mattn/emmet-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'ntpeters/vim-better-whitespace'
Plug 'APZelos/blamer.nvim'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-sneak'
Plug 'jez/vim-better-sml'
Plug 'Yggdroot/indentLine'
"  I AM SO SORRY FOR DOING COLOR SCHEMES IN MY VIMRC, BUT I HAVE
"  TOOOOOOOOOOOOO
Plug 'gruvbox-community/gruvbox'
Plug 'skbolton/embark'
Plug 'haishanh/night-owl.vim'
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug '/home/mpaulson/personal/vim-be-good'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" if exists('g:vscode')
"   " VS Code extension
"   source $HOME/.config/nvim/vscode/settings.vim
" endif

let g:sneak#label = 1
let g:blamer_enabled = 1
let g:rainbow_active = 1
let g:rainbow_conf = {
\ 'separately': {
\   'html': 0,
\ }
\}

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'


if (has("termguicolors"))
  set termguicolors
endif

"colorscheme gruvbox
 colorscheme embark
" let g:lightline = {
"       \ 'colorscheme': 'embark',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
"       \ },
"       \ 'component_function': {
"       \   'gitbranch': 'FugitiveHead'
"       \ },
"       \ }

let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
" let g:airline_theme='embark'

if executable('rg')
  let g:rg_derive_root='true'
endif


let mapleader = " "

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹ ",
    \ "Staged"    : "✚ ",
    \ "Untracked" : "✭ ",
    \ "Renamed"   : "➜ ",
    \ "Unmerged"  : "═ ",
    \ "Deleted"   : "✖ ",
    \ "Dirty"     : "✗ ",
    \ "Clean"     : "✔︎ ",
    \ 'Ignored'   : '☒ ',
    \ "Unknown"   : "? "
    \ }

if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif


let g:signify_sign_show_text = 0

let g:miniBufExplMapWindowNavVim = 1


highlight SignifySignAdd                  ctermbg=green                guibg=#00ff00
highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#ff0000
highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00

map <Leader>t :MBEToggle<cr>
map <Leader>bn :MBEbn<cr>
map <Leader>bp :MBEbp<cr>

nmap <Leader>cs :CocSearch<Space>
nmap <Leader>bb :buffers<CR>:buffer<Space>
map ]b :bn<cr>
map [b :bp<cr>
map gd :bd<cr>

" Use preset argument to open it
nmap <space>e :CocCommand explorer<CR>
nmap <space>ef :CocCommand explorer --preset floating<CR>

" graphql
au BufNewFile,BufRead *.prisma setfiletype graphql

" vim-jsx
autocmd BufRead,BufNewFile *.tsx setlocal syntax=javascript.jsx

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>
" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

"nnoremap fj :m .+1<CR>==
"nnoremap fk :m .-2<CR>==
"inoremap fj <Esc>:m .+1<CR>==gi
"inoremap fk <Esc>:m .-2<CR>==gi
"vnoremap fj :m '>+1<CR>gv=gv
"vnoremap fk :m '<-2<CR>gv=gv
"

inoremap {<CR> {<CR>}<C-o>O
inoremap [<CR> [<CR>]<C-o>O
inoremap (<CR> (<CR>)<C-o>O

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

nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <C-g> :Rg<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <C-f> :Files<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

map <leader>n :NERDTreeToggle<CR>

" vim TODO
nmap <Leader>tu <Plug>BujoChecknormal
nmap <Leader>th <Plug>BujoAddnormal
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"

" Vim with me
"nnoremap <leader>vwm :colorscheme gruvbox<bar>:set background=dark<CR>
"nmap <leader>vtm :highlight Pmenu ctermbg=gray guibg=gray

vnoremap X "_d
inoremap <C-c> <esc>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" command! -nargs=0 Prettier :CocCommand prettier.formatFile
inoremap <silent><expr> <c-space> coc#refresh()

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart


nmap <leader>gl :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gs :G<CR>


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
