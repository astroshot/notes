"  +-+-+-+ +-+-+ +-+-+-+-+-+-+-+
"  |v|i|m| |i|s| |a|w|e|s|o|m|e|
"  +-+-+-+ +-+-+ +-+-+-+-+-+-+-+
"
" It may cause E10: \ should be followed by /, ? or &
if &compatible
  set nocompatible
endif
set backspace=indent,eol,start
set shortmess=atI
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
set background=dark

set encoding=utf-8
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936

set expandtab
set autoindent
set fileformat=unix

set tabstop=4
set softtabstop=4
set shiftwidth=4

set laststatus=2
set statusline=%<%f\                    " Filename
set statusline+=%w%h%m%r                " Options
set statusline+=\ [%{&ff}/%Y]           " filetype
set statusline+=\ [%{getcwd()}]         " current dir
set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info

nnoremap ; :

" Stupid shift key fixes
" cmap W w
" cmap WQ wq
" cmap Wq wq
" cmap wQ wq
" cmap Q q
" cmap Tabe tabe

