"-----------------------------------------------------------------------------------------------------------------------
"Plugins: plugin-manager: vim-plug

call plug#begin()

	"Appearence:
	Plug 'https://github.com/morhetz/gruvbox'
	Plug 'itchyny/lightline.vim'
	Plug 'https://github.com/tmhedberg/SimpylFold'

	"Files:
	Plug 'https://github.com/preservim/nerdtree' |
				\ Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'https://github.com/ctrlpvim/ctrlp.vim'
	" Plug 'https://github.com/christoomey/vim-tmux-navigator' TODO: Add when felt need

	"Autocompletion:
	Plug 'SirVer/ultisnips'
	Plug 'https://github.com/tpope/vim-commentary'
	Plug 'neoclide/coc.nvim', {'branch': 'release'} "Soon to switch to deoplete or dcc as ALE + COC has a lot of redundancy, don't like how much VSCode-ish it sounds like
	Plug 'evanleck/vim-svelte'
	Plug 'alvan/vim-closetag'

	"Git:
	Plug 'https://github.com/tpope/vim-fugitive'
	Plug 'https://github.com/airblade/vim-gitgutter'
	"hooks4git --init and .hooks4git.ini file for git hooks

	"Fixers:
	Plug 'editorconfig/editorconfig-vim'
	Plug 'https://github.com/embear/vim-uncrustify'
	Plug 'https://github.com/simonrw/vim-yapf'
	Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
	Plug 'https://github.com/pangloss/vim-javascript'

	"Linters: TODO: Go through available config options
	Plug 'https://github.com/dense-analysis/ale'
	Plug 'eslint/eslint'

	"AI:
	" Plug 'madox2/vim-ai' TODO: Need to understand configs correctly

	"Retired:
	"Plug 'https://github.com/nanotech/jellybeans.vim'
	"Plug 'sainnhe/edge'
	"Plug 'https://github.com/tell-k/vim-autopep8'

call plug#end()

"-----------------------------------------------------------------------------------------------------------------------
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
set showcmd
syntax on
filetype on
filetype plugin indent on
set expandtab
"Change leader to Spacebar (from \)
nnoremap <SPACE> <Nop>
let mapleader=" "

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

"---------------
"Vim Integrated Terminal Settings

"open terminal below all splits
cabbrev bterm bo term

"For Windows->Powershell:
"set shell=C:\\WINDOWS\\sysnative\\WindowsPowerShell\\v1.0\\powershell.exe
"set shell=cmd
"set shellcmdflag=/c
"set termguicolors
"set t_ut=""

"-----------------------------------------------------------------------------------------------------------------------
"Appearence:

"---------------
"Colorscheme Settings:
"typeface/font-family set in terminal: cutive-mono
colorscheme gruvbox
set background=dark

"---------------
"Lightline Settings:
let g:lightline = {'colorscheme': 'gruvbox'}

"-----------------------------------------------------------------------------------------------------------------------
"Files:

"---------------
"NERDTree Settings:
let g:NERDTreeWinPos = "right"
" Toggle NERDTree with a keybinding
nnoremap <C-]> :NERDTreeToggle<CR>
"Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
"Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Don't show the help line at the top
let g:NERDTreeMinimalUI=1

"---------------
"NERDTree Git Settings:
let g:NERDTreeGitStatusAsync = 1

"---------------
"CTRLP Settings:
let g:ctrlp_match_window = 'top,order:ttb'
let g:ctrlp_use_caching = 1
let g:ctrlp_cache_dir = '~/.cache/ctrlp'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules|bower_components|dist|build|out|__pycache__|venv|env|coverage|\.next|\.cache)$',
  \ 'file': '\v\.(exe|dll|so|pyc|class|jar|log|zip|tar|gz|7z|DS_Store|swp|tmp|bak|orig)$',
  \ }
nnoremap <Leader>mru :CtrlPMRU<CR>

"-----------------------------------------------------------------------------------------------------------------------
"Autocompletion:

"---------------
"Ultisnips Settings:
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
nnoremap <Leader>snip :UltiSnipsEdit<CR>

"---------------
"Vim Commentary Settings:
autocmd FileType c,cpp setlocal commentstring=//\ %s
autocmd FileType javascript,typescript setlocal commentstring=//\ %s
autocmd FileType javascript.jsx,typescript.tsx setlocal commentstring={/*\ %s */}
autocmd FileType svelte setlocal commentstring=<!--%s-->

"---------------
"COCnvim Settings: :CocInstall coc-clangd coc-pyright coc-tsserver coc-json @yaegassy/coc-tailwindcss3
filetype plugin on
let g:coc_diagnostic_disable=1

"Use <C-k> and <C-j> to go up and down in the auto-completion dropdown
inoremap <expr> <c-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <c-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Show documentation (hover info)
" nnoremap <silent> K :call CocActionAsync('doHover')<CR>
" autocmd CursorHoldI * silent! call CocActionAsync('showSignatureHelp')
" autocmd CursorHold * silent call CocActionAsync('highlight')

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gD <Plug>(coc-declaration)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <leader>ff :CocList files<CR>

" Refactoring
nnoremap <leader>rn <Plug>(coc-rename)

inoremap <silent><expr> <TAB>    coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "\<Tab>" : coc#refresh()
inoremap <expr>        <S-TAB>  coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <CR>     coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <C-@>    coc#refresh()
" Ctrl-C and Esc cancel completion if popup visible, else exit insert mode
inoremap <silent><expr> <C-c> coc#pum#visible()
      \ ? (coc#pum#cancel() . "\<C-c>")
      \ : "\<C-c>"

"---------------
"CloseTags Settings:
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.svelte'

"-----------------------------------------------------------------------------------------------------------------------
"Git:

"---------------
"Fugitive:
nnoremap <leader>gs :G status<CR>
nnoremap <leader>gd :Gdiffsplit<CR>
nnoremap <leader>gt :G difftool<CR>
nnoremap <leader>gb :G blame<CR>
nnoremap <leader>gl :G log<CR>
nnoremap <leader>gc :G commit<CR>
nnoremap <leader>gp :G push<CR>
nnoremap <leader>gP :G pull<CR>
"100s more, TODO

"---------------
"GitGutter:
let g:gitgutter_enabled = 1
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
set updatetime=100

"-----------------------------------------------------------------------------------------------------------------------
"Fixers:

"---------------
"Uncrustify:
autocmd BufWritePre <buffer> if (&filetype == 'cpp') | :call Uncrustify() | endif
autocmd BufWritePre <buffer> if (&filetype == 'c') | :call Uncrustify() | endif
autocmd BufWritePre <buffer> if (&filetype == 'h') | :call Uncrustify() | endif

"---------------
"Yapf:
autocmd BufWritePre <buffer> if (&filetype == 'python') | :call Yapf() | endif

"---------------
"EditorConfig:
let g:EditorConfig_exec_path = '~/.editorconfig'

"---------------
"Prettier::
let g:prettier#exec_cmd_path = "./node_modules/.bin/prettier"

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
let g:ale_cmake_executable = 'cmake'
"Linters: (clangd, eslint, tslint, flake8...something for react?)
"100s more, TODO

"-----------------------------------------------------------------------------------------------------------------------
"AI:


"-----------------------------------------------------------------------------------------------------------------------
"Archive:

" colorscheme habamax
" colorscheme edge
" colorscheme jellybeans

"---------------
"Edge Settings:

"let g:edge_better_performance = 1
"let g:edge_diagnostic_line_highlight = 1
"colorscheme edge

"-----------------------------------------------------------------------------------------------------------------------
