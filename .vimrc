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
set ttymouse=xterm2

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
set colorcolumn=81

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

" Use C++11 for Syntastic
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

" File type aliases
au BufNewFile,BufRead *.ejs set filetype=jst
au BufNewFile,BufRead *.less set filetype=less

" Fix Typescript
au BufNewFile,BufRead *.ts set filetype=typescript
au BufNewFile,BufRead *.ts set expandtab

" Fix GLSL
au BufNewFile,BufRead *.glsl set syntax=c
au BufNewFile,BufRead *.glsl set expandtab
au BufNewFile,BufRead *.glsl set autoindent
au BufNewFile,BufRead *.glsl set cindent
au BufNewFile,BufRead *.glsl set commentstring=//\ %s
let g:syntastic_disabled_filetypes=['glsl']

