" Fix shell
set shell=/bin/bash

" Not compatible with Vi
set nocompatible

" Vundle
source ~/.vimrc_vundle

" Bundles
source ~/.vimrc_bundles

" User files (optional)
silent! source ~/.vimrc_user

" Enable mouse
set mouse=a

" Relative line numbers
set nu
set rnu

" Fix backspace
set backspace=indent,eol,start

" Colors
set t_Co=256
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
colorscheme obsidian
syntax on

" Powerline
set laststatus=2

" Ruler
set colorcolumn=80

" Tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
let g:indentLine_char = '|'
let g:indentLine_color_term = 239

" Wrapping, side-scrolling
set nowrap

" Highlight search things
set hlsearch

" When pressing return after typing a comment, don't automatically start a new
" comment
au FileType * setlocal formatoptions-=r

" When a macro is created on q, let space replay that macro
noremap <Space> @q

" Eliminate delay in switching modes
set timeoutlen=1000 ttimeoutlen=0

" Highlight cursor line
set cursorline

" Disable spellchecking
set nospell

" File type aliases
au BufNewFile,BufRead *.ejs set filetype=jst

