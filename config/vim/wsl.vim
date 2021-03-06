" Install Plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plug Manager
call plug#begin('~/.config/nvim/plug')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" themes
Plug 'altercation/vim-colors-solarized'
Plug 'luochen1990/rainbow'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" auto complete
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'

" python dev
Plug 'davidhalter/jedi-vim'
Plug 'vim-scripts/indentpython.vim'
" show indent line
Plug 'Yggdroot/indentLine'

" grammar check/highlight
Plug 'w0rp/ale'
Plug 'junegunn/vim-easy-align'
Plug 'plytophogy/vim-virtualenv'
Plug 'scrooloose/nerdcommenter'

" golang dev
Plug 'fatih/vim-go'

" sh
Plug 'z0mbix/vim-shfmt', { 'for': 'sh'  }

" hive sql
Plug 'autowitch/hive.vim'
Plug 'JessicaKMcIntosh/Vim'

" toml
Plug 'cespare/vim-toml'

" thrift
Plug 'solarnz/thrift.vim'

" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" tools
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/LeaderF'
Plug 'majutsushi/tagbar'
Plug 'astroshot/ag.vim'
" Plug 'epmatsw/ag.vim'
" Plug 'mileszs/ack.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'easymotion/vim-easymotion'
Plug 'mbbill/undotree'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'

Plug 'itchyny/vim-cursorword'
Plug 'lfv89/vim-interestingwords'

call plug#end()

" basic config
" colorscheme solarized
set background=dark

set shortmess=atI
set backspace=indent,eol,start
set nu
set ruler
set showcmd
set showmatch
set cursorline
syntax on
set incsearch                  " find as you type search
set hlsearch                   " highlight search terms
set winminheight=0             " windows can be 0 line high
set ignorecase                 " case insensitive search
set smartcase                  " case sensitive when uc present
set wildmenu                   " show list instead of just completing
set wildmode=list:longest,full " command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]  " backspace and cursor keys wrap to
set scrolljump=5               " lines to scroll when cursor leaves screen
set scrolloff=3                " minimum lines to keep above and below cursor
set foldenable                 " auto fold code
set gdefault                   " the /g flag on :s substitutions by default

let g:solarized_termcolors=256

set encoding=utf-8
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936

" set indent for most codes
set expandtab
set autoindent
set fileformat=unix

set tabstop=4
set softtabstop=4
set shiftwidth=4

set fdm=indent

" Do not write backup file if vim is being called by `crontab -e`
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup

" set clipboard=unnamed

" .py files
au BufNewFile,BufRead *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4

au BufNewFile,BufRead *.yaml,*.yml,*.json
\ set tabstop=2 |
\ set softtabstop=2 |
\ set shiftwidth=2

autocmd FileType vim
\ set tabstop=2 |
\ set softtabstop=2 |
\ set shiftwidth=2

" map <leader> to `,`, default '\'
let g:mapleader = ","
nnoremap ; :
set clipboard+=unnamedplus

" edit vimrc
nmap <leader>e :e $MYVIMRC<CR>
" reload vimrc
nmap <leader>r :so $MYVIMRC<CR>

" remember to execute `/usr/bin/python3 -m pip install neovim`
let g:python3_host_prog = '/usr/bin/python3'
let python_highlight_all = 1

" for .hql files
au BufNewFile,BufRead *.hql set filetype=hive expandtab
" for .q files
au BufNewFile,BufRead *.q set filetype=hive expandtab

autocmd BufWinEnter quickfix nnoremap <silent> <buffer>
  \   q :cclose<cr>:lclose<cr>
autocmd BufEnter * if (winnr('$') == 1 && &buftype ==# 'quickfix' ) |
  \   bd|
  \   q | endif

" ----------------------------------------------------------------------------------------------------------------------
" plugins config
" NERDTree
" open a NERDTree automatically when vim starts up
" autocmd VimEnter * NERDTree
" place the cursor in the editor
autocmd VimEnter * wincmd w
" open a NERDTree automatically when vim starts up if no files were specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" close vim when the only left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <C-n> :NERDTreeToggle<CR>

" display row number in NERDTree
" let NERDTreeShowLineNumbers = 1
" set width
" let NERDTreeWinSize=20
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\~$', '__pycache__$[[dir]]', '\.swp$']

" close rainbow in nerdtree
let g:rainbow_conf = {
\    'separately': {
\       'nerdtree': 0
\    }
\}

" airline settings.
let g:airline_theme = 'solarized'
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.maxlinenr = '㏑'

" show absolute file path in status line
let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
" show tab number in tab line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

let g:airline#extensions#bufferline#enabled = 1

let g:rainbow_active = 1

" Tagbar
" map <C-m> :TagbarToggle<CR>

" nerdtree highlighting
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" fugitive
" this makes Gdiff uses vertical spilter
set diffopt+=vertical

" gitgutter
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_modified_removed = '>_'

" NERDCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" easy align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" for ack
" if executable('ag')
  " let g:ackprg = 'ag --vimgrep'
" endif

" shfmt
let g:shfmt_fmt_on_save = 1
let g:shfmt_extra_args = '-i 4'

" vim-multiple-cursors
let g:multi_cursor_use_default_mapping = 0
" Default mapping
" let g:multi_cursor_start_word_key      = '<C-n>'
" let g:multi_cursor_select_all_word_key = '<A-n>'
" let g:multi_cursor_start_key           = 'g<C-n>'
" let g:multi_cursor_select_all_key      = 'g<A-n>'
" let g:multi_cursor_next_key            = '<C-n>'
" let g:multi_cursor_prev_key            = '<C-p>'
" let g:multi_cursor_skip_key            = '<C-x>'
" let g:multi_cursor_quit_key            = '<Esc>'
let g:multi_cursor_start_word_key = '<C-m>'
