set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'tpope/vim-fugitive'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'scrooloose/nerdtree'
call plug#end()

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾' 


function! Prettier()
  execute '! prettier --single-quote --write %'
endfunction

" map prettier
nmap <c-k> :call Prettier()<CR>


noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" map ctrl+s to save
" nmap <c-s> :w<CR>

"set rtp+=~/.fzf
"set rtp+=~/usr/local/opt/fzf
" map fzf
nmap <c-o> :FZF<CR>

syntax enable
set encoding=utf-8
filetype plugin on

" Tab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set expandtab

" Interface
set wildmenu        " set vim menu
set ruler           " show cursor position
set cursorline      " hightlight for actual line
"set number          " show numbers
set hlsearch        " set highlight for search
set nowrap          " set no wrap for big lines
set nobackup        " set no backup
set incsearch
set backspace=2     " backspace size
set autowrite       " autosave
autocmd InsertLeave * set nopaste " Disable paste mode on leaving insert mode
