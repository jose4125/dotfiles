Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 }}
let $FZF_DEFAULT_OPTS='--reverse'

nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-g> :Rg<CR>
nnoremap <Leader>ff :GFiles<CR>
nnoremap <Leader>fs :Files<CR>

