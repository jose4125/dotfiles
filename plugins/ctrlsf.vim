Plug 'dyng/ctrlsf.vim'

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

