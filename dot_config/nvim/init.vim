call plug#begin()
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'sirtaj/vim-openscad'
" Plug 'jakwings/vim-terra'
Plug 'rust-lang/rust.vim'
Plug 'itchyny/lightline.vim'
" Plug 'dense-analysis/ale'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/tokyonight.nvim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

colorscheme tokyonight-night

let mapleader = " "

let g:ale_linters = {'rust': ['analyzer']}

highlight Pmenu ctermbg=Blue ctermfg=LightGrey
"highlight CocErrorFloat ctermfg=0

" Required for operations modifying multiple buffers like rename.
set hidden
let g:LanguageClient_loggingFile =  expand('~/.local/share/nvim/LanguageClient.log') 
let g:LanguageClient_autoStart = 1
" \ 'rust': ['/home/adam/.cargo/bin/rustup', 'run', 'stable', '/home/adam/.cargo/bin/rls'],
let g:LanguageClient_serverCommands = {
    \ 'rust' : ['/usr/bin/rust-analyzer'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)

let g:rooter_patterns = ['=src']

nmap <leader>gf :GFiles<CR>
nmap <leader>f :Files<CR>
nmap <leader>b :Buffers<CR>
nmap <leader><leader> :b#<CR>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

autocmd BufReadPost,BufNewFile *.tera set syntax=html
autocmd BufReadPost,BufNewFile *.tera EmmetInstall
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

set number
set tabstop=4 shiftwidth=4 expandtab
autocmd BufWritePost ~/.Xresources !xrdb ~/.Xresources
