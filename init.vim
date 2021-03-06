call plug#begin()

" Gruvbox (colorscheme) 
Plug 'morhetz/gruvbox'

" ALE (Linting) 
Plug 'dense-analysis/ale'

" CoC (Autocompletion, Linting)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" YATS (Typescript syntax highlighting)
Plug 'HerringtonDarkholme/yats.vim'

" FZF (File Search)
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" startify (Start Screen)
Plug 'mhinz/vim-startify'

" NerdTree (File Display)
Plug 'preservim/nerdtree'

" GitGutter (Git Diff Tool)
Plug 'airblade/vim-gitgutter'

" Git Fugitive (Git Status Tool)
Plug 'tpope/vim-fugitive'

" AutoPairs (closing brackets automatically) 
Plug 'jiangmiao/auto-pairs' 

" Rainbow (bracket highlighting)
Plug 'luochen1990/rainbow'

" LightLine (Status Line)
Plug 'itchyny/lightline.vim'

" Lightline integration with ALE
Plug 'maximbaz/lightline-ale'

" IndentLine (Display Indentation)
Plug 'Yggdroot/indentLine'

" Easy Motion (quick vim motions)
Plug 'easymotion/vim-easymotion'

" commentary.vim (Commenting Support) 
Plug 'tpope/vim-commentary'

" vim-surround (dealing with brackets)
Plug 'tpope/vim-surround'

" undotree (Undo History Visualizer)
Plug 'mbbill/undotree'

" vim-toml (TOML syntax coloring)
Plug 'cespare/vim-toml'

call plug#end()

" Color Scheme
colo gruvbox 

" Rainbow brackets
let g:rainbow_active = 1

" Autocomplete in command menu
set wildmenu

" Use tab and return to navigate autocomplete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <SPACE>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <SPACE>f  <Plug>(coc-format-selected)
nmap <SPACE>f  <Plug>(coc-format-selected)

" Remap for default EasyMotion movements
map <SPACE> <Plug>(easymotion-prefix)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Status Line
let g:lightline = {
  \ 'colorscheme': 'gruvbox',  
  \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
  \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ },
  \ }

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }

let g:lightline.active = { 
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'filename', 'gitbranch', 'readonly', 'modified' ] ],  
      \   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
      \              [ 'lineinfo' ]]
      \ }

" Show line number and relative line numbers
set number
set relativenumber

" Spaces in a tab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Highlight current line, matching braces, searches
set cursorline
set showmatch
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>

" Folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

" Splits
set splitbelow
set splitright

" Let the mouse move between splits, scroll, enter visual mode, etc
set mouse=a
 
" At least 5 lines are visible below and above the cursor
set scrolloff=5

" Ensure that the start screen shows
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif

" Display NerdTree automatically on startup and quit automatically
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Enable true color
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" ALE settings
let g:ale_linters_explicit = 1
let g:ale_linters = {'cpp': ['clang'], 'rust': ['rls']}
let g:ale_fix_on_save = 1
let g:ale_fixers = {
    \ 'rust': ['rustfmt']
\ }
let g:ale_rust_rls_config = {
	\ 'rust': {
		\ 'clippy_preference': 'on'
	\ }
\ }
let g:ale_cpp_clang_options = '-Weverything -std=c++17'
let g:ale_list_window_size = 5
let g:ale_close_preview_on_insert = 1
let g:ale_echo_cursor = 1
" Auto close ALE error window
autocmd QuitPre * if empty(&bt) | lclose | endif
" Key mappings for next error
nmap <silent><s-e> <Plug>(ale_next_wrap)
" Key mapping to display full error
nmap <silent><s-f> :ALEDetail<CR>
" Persistent undo
set undofile

" Key mapping for changing windows
nmap <silent><s-w> <C-w>

" Key mapping for going back
nmap <silent><s-o> <C-o>

" Key mapping for redo 
nmap <silent><s-r> <C-r>

" Mapping k and j to use visual lines
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k

" Making FZF ignore gitignored files
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
