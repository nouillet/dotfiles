"-------------------------------------------------------------------------------
"
" General settings
"
"-------------------------------------------------------------------------------
set autochdir
set background=dark
set cindent
set expandtab
set hidden
set hlsearch
set list
set listchars=tab:>-
set nocompatible
set number
set scrolloff=8
set sidescrolloff=8
set signcolumn=yes
set shiftwidth=4
set showmatch
set smarttab
set tabstop=4
set termguicolors
set updatetime=100
set wildmenu
set wildmode=list:longest


" File settings
filetype on
filetype indent off
filetype plugin on
syntax on

autocmd BufNewFile,BufRead Jenkinsfile set filetype=groovy
autocmd BufNewFile,BufRead *.template set filetype=jinja
autocmd BufNewFile,BufRead *.profile set filetype=yaml
au BufRead,BufNewFile */Ansible/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */Ansible/hosts set filetype=ansible_hosts

"-------------------------------------------------------------------------------
"
" Key Mappings
"
"-------------------------------------------------------------------------------

let mapleader = "\<space>"
nmap <leader>Q :bufdo bdelete<cr>
map gf :edit <cfile><cr>
vmap <Tab> >gv
vmap <S-Tab> <gv
inoremap <S-Tab> <C-D>
nnoremap H gT
nnoremap L gt

" ????
autocmd BufEnter * silent! lcd %:p:h

"-------------------------------------------------------------------------------
"
" Plugins
"
"-------------------------------------------------------------------------------

call plug#begin('$HOME/.vim/plugged')

source ~/.config/vim/plugins/airline.vim
source ~/.config/vim/plugins/ayu-vim.vim
source ~/.config/vim/plugins/fzf.vim
source ~/.config/vim/plugins/polyglot.vim
source ~/.config/vim/plugins/vim-fugitive.vim
source ~/.config/vim/plugins/vim-gitbranch.vim
source ~/.config/vim/plugins/vim-gitgutter.vim
source ~/.config/vim/plugins/vim-jijna2-syntax.vim

call plug#end()

" TODO Why can't it be in the source config?
colorscheme ayu
highlight LineNr guifg=white

