vim.cmd('filetype plugin indent on')
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hlsearch = true
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.whichwrap = 'b,s,<,>,[,],h,l'
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.expandtab = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.undofile = true
vim.opt.showmatch = true
vim.o.guicursor = table.concat(
                      {
      [[n-v-c-i:block,ci-ve:ver25,r-cr:hor20,o:hor50]],
      [[a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor]],
      [[sm:block-blinkwait175-blinkoff150-blinkon175]]
    }, ','
                  )

vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 10
vim.opt.showmode = false
vim.opt.cursorline = true
vim.opt.fileencoding = 'utf-8'
vim.opt.guifont='JetBrainsMono_Nerd_Font:h15'
-- vim.opt.guifont='FiraCode_Nerd_Font:h16'
vim.opt.shortmess = vim.opt.shortmess + 'c'
vim.opt.list = true
vim.opt.listchars = {tab = '▸ ', trail = '·'}
vim.opt.autoread = true
vim.opt.cmdheight = 2
vim.opt.updatetime = 300
vim.wo.colorcolumn = '80'

vim.cmd [[
  set includeexpr=substitute(v:fname,'^/','','g')
]]

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.showtabline = 2
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false
vim.opt.signcolumn = "yes"

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}

vim.cmd [[
  fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
  endfun

  autocmd BufWritePre * :call TrimWhitespace()
]]
