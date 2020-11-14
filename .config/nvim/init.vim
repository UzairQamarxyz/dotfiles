call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'tpope/vim-surround'
Plug 'ap/vim-css-color'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'deviantfero/wpgtk.vim'
Plug 'lambdalisue/suda.vim'
Plug 'alvan/vim-closetag'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'sbdchd/neoformat'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf.vim'
Plug 'honza/vim-snippets'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-abolish'
call plug#end()

"" General
set number	"" Show line numbers
set relativenumber  "" Show relative number lines
set linebreak	"" Break lines at word (requires Wrap lines)
set showbreak=+++	"" Wrap-broken line prefix
""set textwidth=100	"" Line wrap (number of cols)
set showmatch	"" Highlight matching brace
""set spell	"" Enable spell-checking

set hlsearch	"" Highlight all search results
set smartcase	"" Enable smart-case search
set ignorecase	"" Always case-insensitive
set incsearch	"" Searches for strings incrementally

set autoindent	"" Auto-indent new lines
set expandtab	"" Use spaces instead of tabs
set shiftwidth=4	"" Number of auto-indent spaces
set smartindent	"" Enable smart-indent
set smarttab	"" Enable smart-tabs
set softtabstop=4	"" Number of spaces per Tab
set clipboard=unnamedplus
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o  "" Disable Auto Comment Insertion


"" Advanced
set ruler	"" Show row and column ruler information
set undolevels=1000	"" Number of undo levels
set backspace=indent,eol,start	"" Backspace behaviour

"" Vim Splits
set splitbelow
set splitright

"" wpgtk
colorscheme wpgtkAlt
let g:airline_theme='wpgtk'

"""""""""""""""
"" SHORTCUTS
"""""""""""""""
" Save file as sudo on files that require root permission
cnoremap w!! execute 'w suda://%'

"" No Highlight
" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Disable auto reset clipboard when pasting
"" now it is possible to paste many times over selected text
xnoremap <expr> p 'pgv"'.v:register.'y`>'
xnoremap <expr> P 'Pgv"'.v:register.'y`>'

"" Auto Complete Tags
" Enter <// then Space to automatically close the tag
" :iabbrev <// </<C-X><C-O>

" Replace all is aliased to S.
nnoremap S :%s///g<Left><Left><Left>

"" Vim Splits
" Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"" Resizing
"nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
"nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

"" Neoformat
nnoremap = :Neoformat<CR>

""""""""""""""""""""
"" Plugins Settings
""""""""""""""""""""
" Neoformat
let g:neoformat_haskell_ormolu = { 'exe': 'ormolu', 'args': [] }
let g:neoformat_enabled_haskell = ['ormolu']

" Nerd commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" Airline
let g:airline_powerline_fonts = 1

" vim-closetag
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.vue, *.html,*.xhtml,*.phtml,*.js,*.php'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
            \ 'typescript.tsx': 'jsxRegion,tsxRegion',
            \ 'javascript.jsx': 'jsxRegion',
            \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

"" coc
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
