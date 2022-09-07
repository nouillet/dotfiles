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
set relativenumber
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
autocmd BufNewFile,BufRead *.view set filetype=jinja
autocmd BufNewFile,BufRead *.profile set filetype=yaml
au BufRead,BufNewFile */Ansible/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */Ansible/hosts set filetype=ansible_hosts

"-------------------------------------------------------------------------------
"
" Key Mappings
"
"-------------------------------------------------------------------------------

let mapleader = " "
nmap <leader>Q :bufdo bdelete<cr>
nmap <leader>b <c-^><cr>
map gf :edit <cfile><cr>
inoremap <S-Tab> <C-D>
nnoremap H gT
nnoremap L gt
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>w :bw<CR>
nnoremap <silent> <Leader>F :GFiles<CR>
nnoremap <silent> <Leader>f :Ag<CR>
nnoremap <silent> <Leader>B :Buffers<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>G :Git blame<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR> 
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" ????
autocmd BufEnter * silent! lcd %:p:h

"-------------------------------------------------------------------------------
"
" Plugins
"
"-------------------------------------------------------------------------------

call plug#begin('$HOME/.vim/plugged')

source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/ansible.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/gruvbox.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/lsp.vim
source ~/.config/nvim/plugins/nvim-lint.vim
source ~/.config/nvim/plugins/nvim-jdtls.vim
source ~/.config/nvim/plugins/vim-context.vim
source ~/.config/nvim/plugins/vim-fugitive.vim
source ~/.config/nvim/plugins/vim-gitbranch.vim
source ~/.config/nvim/plugins/vim-gitgutter.vim
source ~/.config/nvim/plugins/vim-jijna2-syntax.vim
source ~/.config/nvim/plugins/vimbegood.vim

call plug#end()

lua require('nouillet')

"-------------------------------------------------------------------------------
"
" Stuff that must be called at the end
"
"-------------------------------------------------------------------------------

colorscheme gruvbox
highlight LineNr guifg=white
