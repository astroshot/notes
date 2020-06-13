"
" ██    ██ ██ ███    ███     ██ ███████      █████  ██     ██ ███████ ███████  ██████  ███    ███ ███████ 
" ██    ██ ██ ████  ████     ██ ██          ██   ██ ██     ██ ██      ██      ██    ██ ████  ████ ██      
" ██    ██ ██ ██ ████ ██     ██ ███████     ███████ ██  █  ██ █████   ███████ ██    ██ ██ ████ ██ █████
"  ██  ██  ██ ██  ██  ██     ██      ██     ██   ██ ██ ███ ██ ██           ██ ██    ██ ██  ██  ██ ██
"   ████   ██ ██      ██     ██ ███████     ██   ██  ███ ███  ███████ ███████  ██████  ██      ██ ███████ 
"
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
Plug 'iCyMind/NeoSolarized'
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
" Plug 'fatih/vim-go'

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
" Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins'  }

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
set termguicolors
colorscheme NeoSolarized
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

au BufNewFile,BufRead *.yaml,*.yml,*.json,*.vim,.vimrc
\ set tabstop=2 |
\ set softtabstop=2 |
\ set shiftwidth=2

autocmd FileType vim
\ set tabstop=2 |
\ set softtabstop=2 |
\ set shiftwidth=2

" map <leader> to space, default '\'
let g:mapleader = ","
nnoremap ; :
set clipboard+=unnamedplus

let g:solarized_termcolors=256
nmap <leader>e :e $MYVIMRC<CR>
nmap <leader>r :so $MYVIMRC<CR>

" remember to execute `/usr/bin/python3 -m pip install neovim`
let g:python3_host_prog = '/usr/bin/python3'
let python_highlight_all = 1

" ale config
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '--'

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
" startify
let s:header = [
      \ '',
      \ '     __  __________    __    ____     _____ __  ______  ________ ___       _____ _    ________ ',
      \ '    / / / / ____/ /   / /   / __ \   / ___// / / / __ \/ ____/ //_/ |     / /   | |  / / ____/ ',
      \ '   / /_/ / __/ / /   / /   / / / /   \__ \/ /_/ / / / / /   / ,<  | | /| / / /| | | / / __/    ',
      \ '  / __  / /___/ /___/ /___/ /_/ /   ___/ / __  / /_/ / /___/ /| | | |/ |/ / ___ | |/ / /___    ',
      \ ' /_/ /_/_____/_____/_____/\____/   /____/_/ /_/\____/\____/_/ |_| |__/|__/_/  |_|___/_____/    ',
      \ '',
      \ ]

let s:footer = [
      \ '',
      \ ' ██   █    █          ▄  █ ██   ▄█ █         █▀▄▀█ ▄███▄     ▄▀  ██     ▄▄▄▄▀ █▄▄▄▄ ████▄    ▄   ',
      \ ' █ █  █    █         █   █ █ █  ██ █         █ █ █ █▀   ▀  ▄▀    █ █ ▀▀▀ █    █  ▄▀ █   █     █  ',
      \ ' █▄▄█ █    █         ██▀▀█ █▄▄█ ██ █         █ ▄ █ ██▄▄    █ ▀▄  █▄▄█    █    █▀▀▌  █   █ ██   █ ',
      \ ' █  █ ███▄ ███▄      █   █ █  █ ▐█ ███▄      █   █ █▄   ▄▀ █   █ █  █   █     █  █  ▀████ █ █  █ ',
      \ '    █     ▀    ▀        █     █  ▐     ▀        █  ▀███▀    ███     █  ▀        █         █  █ █ ',
      \ '   █                   ▀     █                 ▀                   █           ▀          █   ██ ',
      \ '  ▀                         ▀                                     ▀                              ',
      \ '',
      \ ]

let g:startify_custom_header = startify#center(s:header)
let g:startify_custom_footer = startify#center(s:footer)

function! s:set_startify_left_padding() abort
  let g:startify_padding_left = winwidth(0)/2 - 20
endfunction

autocmd! FileType startify
autocmd  FileType startify set laststatus=0 showtabline=0
  \| autocmd BufLeave <buffer> set laststatus=2 showtabline=2
autocmd User Startified setlocal buflisted

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

" leaderF config
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_ShowDevIcons = 0
let g:Lf_PreviewResult = {'Function': 1, 'BufTag': 0, 'File': 1 }

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
" let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation
" let g:NERDDefaultAlign = 'left'
" Enable trimming of trailing whitespace when uncommenting
" let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
" let g:NERDToggleCheckAllLines = 1

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

" Problems? https://github.com/Shougo/defx.nvim/issues
" Defx config
call defx#custom#option('_', {
  \ 'winwidth': 30,
  \ 'split': 'vertical',
  \ 'direction': 'topleft',
  \ 'show_ignored_files': 0,
  \ 'buffer_name': '',
  \ 'toggle': 1,
  \ 'resume': 1
  \})

nmap <silent> <Leader>d :Defx <cr>

call defx#custom#column('git', {
  \   'indicators': {
  \     'Modified'  : '•',
  \     'Staged'    : '✚',
  \     'Untracked' : 'ᵁ',
  \     'Renamed'   : '≫',
  \     'Unmerged'  : '≠',
  \     'Ignored'   : 'ⁱ',
  \     'Deleted'   : '✖',
  \     'Unknown'   : '⁇'
  \   }
  \ })

call defx#custom#column('mark', { 'readonly_icon': '🔒', 'selected_icon': '✔' })

" Events
" ---
augroup user_plugin_defx
  autocmd!
  " Define defx window mappings
  autocmd FileType defx call <SID>defx_mappings()

  " Delete defx if it's the only buffer left in the window
  autocmd WinEnter * if &filetype == 'defx' && winnr('$') == 1 | bdel | endif

  " Move focus to the next window if current buffer is defx
  autocmd TabLeave * if &filetype == 'defx' | wincmd w | endif
augroup END

" Internal functions
" ---
function! s:jump_dirty(dir) abort
  " Jump to the next position with defx-git dirty symbols
  let l:icons = get(g:, 'defx_git_indicators', {})
  let l:icons_pattern = join(values(l:icons), '\|')

  if ! empty(l:icons_pattern)
    let l:direction = a:dir > 0 ? 'w' : 'bw'
    return search(printf('\(%s\)', l:icons_pattern), l:direction)
  endif
endfunction

function! s:defx_toggle_tree() abort
  " Open current file, or toggle directory expand/collapse
  if defx#is_directory()
    return defx#do_action('open_or_close_tree')
  endif
  return defx#do_action('multi', ['drop'])
endfunction

function! s:defx_mappings() abort
  " Defx window keyboard mappings
  setlocal signcolumn=no expandtab

  nnoremap <silent><buffer><expr> <CR>  defx#do_action('drop')
  nnoremap <silent><buffer><expr> l     <sid>defx_toggle_tree()
  nnoremap <silent><buffer><expr> h     defx#async_action('cd', ['..'])
  nnoremap <silent><buffer><expr> st    defx#do_action('multi', [['drop', 'tabnew'], 'quit'])
  nnoremap <silent><buffer><expr> s     defx#do_action('open', 'botright vsplit')
  nnoremap <silent><buffer><expr> i     defx#do_action('open', 'botright split')
  nnoremap <silent><buffer><expr> P     defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> K     defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N     defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> dd    defx#do_action('remove_trash')
  nnoremap <silent><buffer><expr> r     defx#do_action('rename')
  nnoremap <silent><buffer><expr> x     defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> .     defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> yy    defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> ~     defx#async_action('cd')
  nnoremap <silent><buffer><expr> q     defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Tab> winnr('$') != 1 ?
    \ ':<C-u>wincmd w<CR>' :
    \ ':<C-u>Defx -buffer-name=temp -split=vertical<CR>'
  " Defx's buffer management
  nnoremap <silent><buffer><expr> q      defx#do_action('quit')
  nnoremap <silent><buffer><expr> se     defx#do_action('save_session')
  nnoremap <silent><buffer><expr> <C-r>  defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>  defx#do_action('print')

  " File/dir management
  nnoremap <silent><buffer><expr><nowait> c  defx#do_action('copy')
  nnoremap <silent><buffer><expr><nowait> m  defx#do_action('move')
  nnoremap <silent><buffer><expr><nowait> p  defx#do_action('paste')
  nnoremap <silent><buffer><expr><nowait> r  defx#do_action('rename')
  nnoremap <silent><buffer><expr> dd defx#do_action('remove_trash')
  nnoremap <silent><buffer><expr> K  defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N  defx#do_action('new_multiple_files')

  " Jump
  nnoremap <silent><buffer>  [g :<C-u>call <SID>jump_dirty(-1)<CR>
  nnoremap <silent><buffer>  ]g :<C-u>call <SID>jump_dirty(1)<CR>

  " Change directory
  nnoremap <silent><buffer><expr><nowait> \  defx#do_action('cd', getcwd())
  nnoremap <silent><buffer><expr><nowait> &  defx#do_action('cd', getcwd())
  nnoremap <silent><buffer><expr> <BS>  defx#async_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~     defx#async_action('cd')
  nnoremap <silent><buffer><expr> u   defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> 2u  defx#do_action('cd', ['../..'])
  nnoremap <silent><buffer><expr> 3u  defx#do_action('cd', ['../../..'])
  nnoremap <silent><buffer><expr> 4u  defx#do_action('cd', ['../../../..'])

  " Selection
  nnoremap <silent><buffer><expr> *  defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr><nowait> <Space>
    \ defx#do_action('toggle_select') . 'j'

  nnoremap <silent><buffer><expr> S  defx#do_action('toggle_sort', 'Time')
  nnoremap <silent><buffer><expr> C
    \ defx#do_action('toggle_columns', 'indent:mark:filename:type:size:time')
endfunction

" vim: set ts=2 sw=2 tw=80 noet :

