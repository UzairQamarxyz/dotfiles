set t_Co=256
"" coc and ALE compatibility
let g:ale_disable_lsp = 1

call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'tpope/vim-surround'
Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'deviantfero/wpgtk.vim'
Plug 'alvan/vim-closetag'
Plug 'sbdchd/neoformat'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'honza/vim-snippets'
Plug 'w0rp/ale'
Plug 'ludovicchabant/vim-gutentags'
Plug 'airblade/vim-rooter'
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
"" set shiftwidth=4	"" Number of auto-indent spaces
set smartindent	"" Enable smart-indent
set smarttab	"" Enable smart-tabs
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

"" coc fix
" Floating Menu Colors
hi Pmenu ctermbg=1
hi Pmenu ctermfg=15

" Error Highlight Colors
hi CocWarningSign ctermbg=15
hi CocWarningSign ctermfg =6

" Error Highlight Colors
hi CocErrorSign ctermbg=15
hi CocErrorSign ctermfg =1

" Info Colors
hi CocInfoSign ctermbg=1
hi CocInfoSign ctermfg=15

" Cursor Highlight Colors
hi CursorColumn ctermbg=1
hi CursorColumn ctermfg=15

"""""""""""""""
"" SHORTCUTS
"""""""""""""""

" FZF
nnoremap <C-p> :execute 'Files'<CR>

" Code Folding
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

"" No Highlight
" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space><Space> :nohlsearch<Bar>:echo<CR>

" Disable auto reset clipboard when pasting
"" now it is possible to paste many times over selected text
xnoremap <expr> p 'pgv"'.v:register.'y`>'
xnoremap <expr> P 'Pgv"'.v:register.'y`>'

" Replace all is aliased to S.
nnoremap S :%s///g<Left><Left><Left>

"" Vim Splits
" Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"" Resizing
nnoremap <C-Left> :vertical resize -5<cr>
nnoremap <C-Down> :resize +5<cr>
nnoremap <C-Up> :resize -5<cr>
nnoremap <C-Right> :vertical resize +5<cr>

"" Vim Tabs
" nnoremap <C-Left> :tabprevious<CR>
" nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

"" Neoformat
" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" let g:neoformat_verbose = 1
nnoremap = :Neoformat<CR>

" Better indent support for PHP by making it possible to indent HTML sections
" as well.
if exists("b:did_indent")
  finish
endif
" This script pulls in the default indent/php.vim with the :runtime command
" which could re-run this script recursively unless we catch that:
if exists('s:doing_indent_inits')
  finish
endif
let s:doing_indent_inits = 1
runtime! indent/php.vim
unlet s:doing_indent_inits
function! GetPhpHtmlIndent(lnum)
  if exists('*HtmlIndent')
    let html_ind = HtmlIndent()
  else
    let html_ind = HtmlIndentGet(a:lnum)
  endif
  let php_ind = GetPhpIndent()
  " priority one for php indent script
  if php_ind > -1
    return php_ind
  endif
  if html_ind > -1
    if getline(a:lnum) =~ "^<?" && (0< searchpair('<?', '', '?>', 'nWb')
          \ || 0 < searchpair('<?', '', '?>', 'nW'))
      return -1
    endif
    return html_ind
  endif
  return -1
endfunction
setlocal indentexpr=GetPhpHtmlIndent(v:lnum)
setlocal indentkeys+=<>>

"" CoC
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

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

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

""""""""""""""""""""
"" Plugins Settings
""""""""""""""""""""
" Neoformat
" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" let g:neoformat_verbose = 1 " only affects the verbosity of Neoformat

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


" vim-closetag
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.vue, *.html,*.xhtml,*.phtml,*.js,*.blade.php'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

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

" Give more space for displaying messages.
set cmdheight=2

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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"" ALE
let g:ale_sign_column_always = 1
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \'javascript': ['eslint'],
  \ 'vue':['eslint']
  \ }
let g:ale_linters = { 'javascript': ['eslint'],'vue':['eslint'] }

let g:ale_php_phpcs_executable='./vendor/bin/phpcs'
let g:ale_php_php_cs_fixer_executable='./vendor/bin/php-cs-fixer'
let g:ale_fixers = {'php': ['php-cs-fixer']}
