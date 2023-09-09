set relativenumber
set nu rnu
set tabstop=4
set autoindent
set shiftwidth=4
set mouse=a
set cursorline
setlocal foldmethod=syntax
set foldlevel=99
set nowrap
set backspace=indent,eol,start
"colorscheme habamax
syntax on
filetype on

" Autocomplete brackets
"inoremap { {}<Esc>ha
"inoremap ( ()<Esc>ha
"inoremap [ []<Esc>ha
"inoremap " ""<Esc>ha
"inoremap ' ''<Esc>ha
"inoremap ` ``<Esc>ha

"plugin-manager: vim-plug
call plug#begin()
	Plug 'https://github.com/preservim/nerdtree'
	Plug 'https://github.com/dense-analysis/ale'
	Plug 'SirVer/ultisnips'
	Plug 'itchyny/lightline.vim'
	Plug 'sainnhe/edge'
	Plug 'https://github.com/tpope/vim-commentary'
call plug#end()

"---
" NERDTree Settings
let g:NERDTreeWinPos = "right"

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


"---
"ALE Settings
let b:ale_fixers = {'javascript': ['prettier', 'eslint'], 'python': ['autopep8'], 'cpp': ['uncrustify'], 'c': ['uncrustify']}
let g:ale_fix_on_save = 1
let g:ale_virtualtext_cursor = 'disabled'
let g:ale_cpp_clangd_options = "-stdlib=libc++ -std=c++20"

"---
"Ultisnips Settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"---

"---
"Edge settings
colorscheme edge
"---
