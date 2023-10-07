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
	Plug 'neoclide/coc.nvim', {'branch': 'release'} "Soon to switch to deoplete or dcc as ALE + COC has a lot of redundancy, don't like how much VSCode-ish it sounds like
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
let g:ale_cpp_uncrustify_options = '--no-backup --config .uncrustify.cfg'


"---
"Ultisnips Settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"---

"---
"Edge Settings
colorscheme edge
"---

"---
"Vim Integrated Terminal Settings

"open terminal below all splits
cabbrev bterm bo term

"---

"---
"coc.nvim Settings
filetype plugin on

let b:coc_diagnostic_disable=1
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "\<Tab>" : coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-@> coc#refresh()

" :CocInstall coc-clangd coc-pyright coc-tsserver coc-json @yaegassy/coc-tailwindcss3

"---






