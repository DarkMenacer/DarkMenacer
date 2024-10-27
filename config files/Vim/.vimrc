"-----------------------------------------------------------------------------------------------------------------------
"Plugins: plugin-manager: vim-plug

call plug#begin()

	"Appearence:
	Plug 'https://github.com/preservim/nerdtree'
	Plug 'itchyny/lightline.vim'
	Plug 'https://github.com/nanotech/jellybeans.vim'
	Plug 'https://github.com/tmhedberg/SimpylFold'

	"Autocompletion:
	Plug 'SirVer/ultisnips'
	Plug 'neoclide/coc.nvim', {'branch': 'release'} "Soon to switch to deoplete or dcc as ALE + COC has a lot of redundancy, don't like how much VSCode-ish it sounds like

	"Git:
	Plug 'https://github.com/tpope/vim-fugitive'
	Plug 'https://github.com/airblade/vim-gitgutter'
	"hooks4git --init and .hooks4git.ini file for git hooks

	"Fixers:
	Plug 'editorconfig/editorconfig-vim'
	Plug 'https://github.com/embear/vim-uncrustify'
	Plug 'https://github.com/simonrw/vim-yapf'
	Plug 'prettier/vim-prettier', { 'do': 'sudo npm install --frozen-lockfile --production  --legacy-peer-deps' } "Extreme Irritating, Need to switch completely to eslint only

	"Linters:
	Plug 'https://github.com/dense-analysis/ale'
	Plug 'https://github.com/tpope/vim-commentary'
	Plug 'eslint/eslint'

	"Retired:
	"Plug 'sainnhe/edge'
	"Plug 'https://github.com/tell-k/vim-autopep8'

call plug#end()

"-----------------------------------------------------------------------------------------------------------------------
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
colorscheme jellybeans
syntax on
filetype on
filetype plugin indent on
set expandtab
"typeface/font-family set in terminal: cutive-mono

"LazyShiftFinger:
command! -bar -nargs=* -complete=file -range=% -bang W         <line1>,<line2>write<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang Write     <line1>,<line2>write<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang Wq        <line1>,<line2>wq<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang WQ        <line1>,<line2>wq<bang> <args>
command! -bar                                  -bang Wqall     wqa<bang>
command! -bar -nargs=* -complete=file -range=% -bang We        <line1>,<line2>w<bang> | e <args>
command! -bar -nargs=* -complete=file -count   -bang Wnext     <count>wnext<bang> <args>
command! -bar -nargs=* -complete=file -count   -bang Wprevious <count>wprevious<bang> <args>
command! -bar -nargs=* -complete=file          -bang E         edit<bang> <args>
command! -bar -nargs=* -complete=file          -bang Edit      edit<bang> <args>
command! -bar                                  -bang Q         quit<bang>
command! -bar                                  -bang Quit      quit<bang>
command! -bar                                  -bang Qall      qall<bang>
command! -bar -nargs=? -complete=option              Set       set <args>
command! -bar -nargs=? -complete=help                Help      help <args>
command! -bar -nargs=* -complete=file          -bang Make      make<bang> <args>
command! -bar -nargs=* -complete=buffer        -bang Bdel      bdel<bang> <args>
command! -bar -nargs=* -complete=buffer        -bang Bwipe     bwipe<bang> <args>
command! -bar -nargs=* -complete=file          -bang Mksession mksession<bang> <args>
command! -bar -nargs=* -complete=dir           -bang Cd        cd<bang> <args>
command! -bar                                        Messages  messages
command! -bar -nargs=+ -complete=file          -bang Source    source<bang> <args>

"For Windows->Powershell:
"set shell=C:\\WINDOWS\\sysnative\\WindowsPowerShell\\v1.0\\powershell.exe
"set termguicolors
"set t_ut=""


"---------------
"Vim Integrated Terminal Settings

"open terminal below all splits
cabbrev bterm bo term

"---------------
"NERDTree Settings:
let g:NERDTreeWinPos = "right"

"Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

"Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"---------------
"Lightline Settings:

let g:lightline = {'colorscheme': 'jellybeans'}

"-----------------------------------------------------------------------------------------------------------------------
"Autocompletion:

"---------------
"Ultisnips Settings:
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"---------------
"COCnvim Settings: :CocInstall coc-clangd coc-pyright coc-tsserver coc-json @yaegassy/coc-tailwindcss3
filetype plugin on
let g:coc_diagnostic_disable=1

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"use exuberant ctags for ctrl-click: Run 'ctags —extras=-F -R' in terminal to generate the tags file

inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "\<Tab>" : coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-@> coc#refresh()

"-----------------------------------------------------------------------------------------------------------------------
"Fixers:

"---------------
"Uncrustify:
autocmd BufWritePre <buffer> if (&filetype == 'cpp' || &filetype == 'c') | :call Uncrustify() | endif
autocmd BufWritePre <buffer> if (&filetype == 'hpp' || &filetype == 'h') | :call Uncrustify() | endif

"---------------
"Yapf:
autocmd BufWritePre <buffer> if (&filetype == 'python') | :call Yapf() | endif

"---------------
"EditorConfig:
let g:EditorConfig_exec_path = '~/.editorconfig'

"-----------------------------------------------------------------------------------------------------------------------
"Linters:

"---------------
"Programming Language Variables:
let g:python3_host_prog= '/usr/bin/python3'
autocmd BufLeave *.py set noexpandtab
autocmd BufReadPost *.py set expandtab
autocmd BufEnter *.py set expandtab

"---------------
"ALE Settings:
let g:ale_fix_on_save = 0
let g:ale_virtualtext_cursor = 'disabled'
let g:ale_cpp_clangd_options = "-stdlib=libc++ -std=c++20"
"Linters: (clangd, eslint, tslint, flake8...something for react?)

"---------------
"Vim Commentary Settings:
autocmd FileType c,cpp setlocal commentstring=//\ %s

"-----------------------------------------------------------------------------------------------------------------------
"Archive:

"colorscheme habamax

"---------------
"Edge Settings:

"let g:edge_better_performance = 1
"let g:edge_diagnostic_line_highlight = 1
"colorscheme edge

"-----------------------------------------------------------------------------------------------------------------------
