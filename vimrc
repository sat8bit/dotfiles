""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set number

" タブの設定
set tabstop=2
set softtabstop=2
set sw=2
set expandtab

" 文字コードの設定
set encoding=utf8
set fileencoding=utf8
set fileencodings=utf8,eucjp,sjis

" バッファの設定
set hidden

" キーマップ
noremap <C-n> :bn<CR>
noremap <C-p> :bp<CR>
noremap <C-h> <C-w><C-h>
noremap <C-j> <C-w><C-j>
noremap <C-k> <C-w><C-k>
noremap <C-l> <C-w><C-l>
noremap <C-w> :bdel<CR>

noremap <C-f> :NERDTreeToggle<CR>

" 補完の設定
set wildmenu
set wildmode=longest,list

filetype plugin indent on

" Makefile only settings
let _curfile=expand("%:r")
if _curfile == 'Makefile'
  set noexpandtab
endif
