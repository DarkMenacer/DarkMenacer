"------------------------------------------------------------
"Plugins: plugin-manager: vim-plug

call plug#begin()

	"Appearence:
	Plug 'https://github.com/preservim/nerdtree'
	Plug 'itchyny/lightline.vim'
	Plug 'sainnhe/edge'

	"Autocompletion:
	Plug 'SirVer/ultisnips'
	Plug 'neoclide/coc.nvim', {'branch': 'release'} "Soon to switch to deoplete or dcc as ALE + COC has a lot of redundancy, don't like how much VSCode-ish it sounds like

	"Fixers:
	Plug 'https://github.com/embear/vim-uncrustify'
	Plug 'https://github.com/tell-k/vim-autopep8' "Switch to yapf, need to solve indentation to space (not tab) constraint of autopep8 (yapf is more flexible)
	Plug 'editorconfig/editorconfig-vim'
	Plug 'prettier/vim-prettier', { 'do': 'sudo npm install --frozen-lockfile --production  --legacy-peer-deps' }

	"Linters:
	Plug 'https://github.com/dense-analysis/ale'
	Plug 'https://github.com/tpope/vim-commentary'
	Plug 'eslint/eslint'
call plug#end()

"------------------------------------------------------------
"Appearence:

"---------------
"VimVariables:
set relativenumber
set nu rnu
set tabstop=4
set softtabstop=4
set autoindent
set shiftwidth=4
set mouse=a
set cursorline
set foldmethod=syntax
set foldlevel=99
set nowrap
set backspace=indent,eol,start
"colorscheme habamax
syntax on
filetype on
filetype plugin indent on
set expandtab

"---------------
"Vim Integrated Terminal Settings

"open terminal below all splits
cabbrev bterm bo term

"---------------
"Edge Settings:
colorscheme edge

"---------------
"NERDTree Settings:
let g:NERDTreeWinPos = "right"

"Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

"Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"------------------------------------------------------------
"Autocompletion:

"---------------
"Ultisnips Settings:
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"---------------
"COCnvim Settings: :CocInstall coc-clangd coc-pyright coc-tsserver coc-json @yaegassy/coc-tailwindcss3
filetype plugin on
let g:coc_diagnostic_disable=0
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "\<Tab>" : coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-@> coc#refresh()
"BUG: :call CocAction('diagnosticToggle') after opening file from NERDTree

"------------------------------------------------------------
"Fixers:

"---------------
"Uncrustify:
autocmd BufWritePre <buffer> if (&filetype == 'cpp') | call Uncrustify() | endif
autocmd BufWritePre <buffer> if (&filetype == 'c') | call Uncrustify() | endif

"---------------
"Autopep8:
" autocmd BufWritePre <buffer> if (&filetype == 'python') | call Autopep8() | endif
let g:autopep8_max_line_length = 999
let g:autopep8_disable_show_diff = 1
let g:autopep8_on_save = 1
let g:autopep8_ignore = "W191,E101,E111"

"---------------
"EditorConfig:
let g:EditorConfig_exec_path = '~/.editorconfig'

"---------------
"Prettier:
"let g:prettier#autoformat = 1
"let g:prettier#autoformat_require_pragma = 0

"------------------------------------------------------------
"Linters:

"---------------
"Programming Language Variables:
let g:python3_host_prog= '/usr/bin/python3'

"---------------
"ALE Settings:
let g:ale_fix_on_save = 0
let g:ale_virtualtext_cursor = 'disabled'
let g:ale_cpp_clangd_options = "-stdlib=libc++ -std=c++20"
"Linters: (clangd, eslint, tslint, flake8...something for react?)

"------------------------------------------------------------
