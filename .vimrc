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

" Background
highlight NonText ctermbg=234

" Ruler
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=234

" Split line
set fillchars+=vert:│
hi VertSplit ctermbg=237 ctermfg=239 guibg=NONE

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

" Syntastic settings
let g:syntastic_error_symbol = '✗✗'
let g:syntastic_style_error_symbol = '✠✠'
let g:syntastic_warning_symbol = '∆∆'
let g:syntastic_style_warning_symbol = '≈≈'
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_always_populate_loc_list = 1
nnoremap ]w :lnext<CR>
nnoremap [w :lprevious<CR>

" File type aliases
au BufNewFile,BufRead *.ejs set filetype=jst
au BufNewFile,BufRead *.less set filetype=less

" Fix Typescript
au BufNewFile,BufRead *.ts set filetype=typescript
au BufNewFile,BufRead *.ts set expandtab

" Fix GLSL files for Graphics class (.vert, .frag)
au BufNewFile,BufRead *.vert set filetype=glsl
au BufNewFile,BufRead *.frag set filetype=glsl

" Fix GLSL
au BufNewFile,BufRead *.glsl,*.vert,*.frag set syntax=c
au BufNewFile,BufRead *.glsl,*.vert,*.frag set expandtab
au BufNewFile,BufRead *.glsl,*.vert,*.frag set autoindent
au BufNewFile,BufRead *.glsl,*.vert,*.frag set cindent
au BufNewFile,BufRead *.glsl,*.vert,*.frag set commentstring=//\ %s
let g:syntastic_disabled_filetypes=['glsl', 'vert', 'frag']

" Fix EMJ
au BufNewFile,BufRead *.emj set syntax=java
au BufNewFile,BufRead *.emj set expandtab
au BufNewFile,BufRead *.emj set autoindent
au BufNewFile,BufRead *.emj set cindent
au BufNewFile,BufRead *.emj set commentstring=//\ %s

" Fix airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts=1
function! AirLineDrew()
  function! Modified()
    return &modified ? " +" : ''
  endfunction
  function! ReadOnly()
    if &readonly || !&modifiable
      return ' '
    else
      return ''
  endfunction

  call airline#parts#define_raw('filename', '%<%f')
  call airline#parts#define_function('modified', 'Modified')
  call airline#parts#define_function('readonly', 'ReadOnly')

  let g:airline_section_b = airline#section#create(['readonly', 'filename'])
  let g:airline_section_c = airline#section#create([''])
  let g:airline_section_gutter = airline#section#create(['modified', '%='])
  let g:airline_section_x = airline#section#create_right([''])
  let g:airline_section_y = airline#section#create(['%l / %L'])
  let g:airline_section_z = airline#section#create(['branch'])
endfunction
autocmd Vimenter * call AirLineDrew()
call AirLineDrew()
let g:airline#extensions#default#section_truncate_width = {
  \ 'x': 60,
  \ 'y': 60
  \ }
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'v'  : 'V',
  \ 'V'  : 'V-L',
  \ 'c'  : 'C',
  \ '' : 'V-B',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC | AirlineRefresh
    autocmd BufWritePost $MYVIMRC AirlineRefresh
augroup END " }

" Git gutter
let g:gitgutter_sign_added = '·'
let g:gitgutter_sign_modified = '·'
let g:gitgutter_sign_removed = '·'
let g:gitgutter_sign_removed_first_line = '·'
let g:gitgutter_sign_modified_removed = '·'

" Easymotion
let mapleader = "\<Space>"
map <Leader> <Plug>(easymotion-prefix)

