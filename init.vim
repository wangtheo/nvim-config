" Plugins

call plug#begin()

" Seoul256 (Colorscheme)
Plug 'junegunn/seoul256.vim'

" CoC (Autocompletion, Linting)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Vdebug (debugging in vim)
Plug 'vim-vdebug/vdebug'

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

" LightLine (Status Line)
Plug 'itchyny/lightline.vim'

" IndentLine (Display Indentation)
Plug 'Yggdroot/indentLine'

" commentary.vim (Commenting Support) 
Plug 'tpope/vim-commentary'

" undotree (Undo History Visualizer)
Plug 'mbbill/undotree'

call plug#end()

" Color Scheme
let g:seoul256_background = 234
colo seoul256

" Autocomplete in command menu
set wildmenu

" Use tab and return to navigate autocomplete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Autocompletion colors
highlight Pmenu ctermbg=2 guibg=2
highlight PmenuSel ctermbg=235 guibg=235

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
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Status Line
let g:lightline = {
  \ 'colorscheme': 'seoul256',  
  \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
  \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ },
  \ }

" Show line number and relative line numbers
set number
set relativenumber

" Spaces in a tab
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

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

" Display NerdTree automatically on startup
autocmd vimenter * NERDTree

" Debugging Options (Wayfair PHP)
let g:vdebug_options = {
  \ 'path_maps': { "/wayfair/data/codebase/php": "Users/tw715u/codebase/php" },
\ }
