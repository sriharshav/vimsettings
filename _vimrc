set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

set nobackup "Set off backup files"
set noswapfile "Set off swap files"
set noundofile

"Fonts"
set guifont=Consolas:h13:cANSI
"set guifont=Inconsolata\ Medium\ 14

"Tabs"
set stal=2 
set tabstop=2
set shiftwidth=2
set expandtab

set autoindent
set copyindent

"GUI Options"
set guioptions-=T "No Toolbar"
set guioptions-=r "No right scroll "
"set guioptions-=m /*"No menu "*/

"Show number
set number

"Color scheme"
colorscheme cobaltish "tried zellner, selenitic, now cobaltish suits me best"

map <F2> :NERDTreeToggle \| :silent NERDTreeMirror<CR>
let g:NERDTreeWinPos = "right"
let NERDTreeQuitOnOpen = 1

"Cursor to underscore"
set guicursor+=n:hor10-Cursor/lCursor
