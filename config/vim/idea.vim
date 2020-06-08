"
" ██    ██ ██ ███    ███     ██ ███████      █████  ██     ██ ███████ ███████  ██████  ███    ███ ███████ 
" ██    ██ ██ ████  ████     ██ ██          ██   ██ ██     ██ ██      ██      ██    ██ ████  ████ ██      
" ██    ██ ██ ██ ████ ██     ██ ███████     ███████ ██  █  ██ █████   ███████ ██    ██ ██ ████ ██ █████
"  ██  ██  ██ ██  ██  ██     ██      ██     ██   ██ ██ ███ ██ ██           ██ ██    ██ ██  ██  ██ ██
"   ████   ██ ██      ██     ██ ███████     ██   ██  ███ ███  ███████ ███████  ██████  ██      ██ ███████ 
"
set nu
set rnu
let mapleader = ","
nnoremap ; :
nmap <leader><leader>s :action KJumpAction<cr>
nmap <leader><leader>w :action KJumpAction.Word0<cr>
nmap <leader><leader>j :action KJumpAction.Line<cr>
set clipboard+=unnamed
set surround
set ideajoin
