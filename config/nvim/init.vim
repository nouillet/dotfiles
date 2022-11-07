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
set shiftwidth=2
set showmatch
set smarttab
set tabstop=2
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
autocmd BufNewFile,BufRead *.eyaml set filetype=yaml
autocmd BufNewFile,BufRead *.template set filetype=jinja
autocmd BufNewFile,BufRead *.view set filetype=jinja
autocmd BufNewFile,BufRead *.profile set filetype=yaml
autocmd BufNewFile,BufRead *.pkr.hcl set filetype=terraform
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
nnoremap <silent> <Leader>w :bd<CR>
nnoremap <silent> <Leader>W :bd!<CR>
nnoremap <silent> <Leader>b <cmd>Telescope buffers<cr>
nnoremap <silent> <Leader>fg <cmd>Telescope live_grep<cr>
nnoremap <silent> <Leader>gc <cmd>Telescope git_commits<cr>
nnoremap <silent> <Leader>gf <cmd>Telescope git_files<CR>
nnoremap <silent> <Leader>gb <cmd>Git blame<CR>
nnoremap <C-f> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').lsp_references()<cr>

" GoTo code navigation.
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
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
" source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/gruvbox.vim
" source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/lsp.vim
" source ~/.config/nvim/plugins/nvim-lint.vim
source ~/.config/nvim/plugins/nvim-jdtls.vim
source ~/.config/nvim/plugins/markdown-preview.vim
source ~/.config/nvim/plugins/nvim-telescope.vim
" source ~/.config/nvim/plugins/nvim-treesitter.vim
source ~/.config/nvim/plugins/vim-context.vim
source ~/.config/nvim/plugins/vim-fugitive.vim
source ~/.config/nvim/plugins/vim-gitbranch.vim
source ~/.config/nvim/plugins/vim-gitgutter.vim
source ~/.config/nvim/plugins/vim-puppet.vim
source ~/.config/nvim/plugins/vim-jinja2-syntax.vim
source ~/.config/nvim/plugins/vim-terraform.vim

call plug#end()

lua require('nouillet')

"-------------------------------------------------------------------------------
"
" File Mappings
"
"-------------------------------------------------------------------------------
let g:coc_filetype_map = {
  \ 'yaml.ansible': 'ansible',
  \ }
"-------------------------------------------------------------------------------
"
" Stuff that must be called at the end
"
"-------------------------------------------------------------------------------

colorscheme gruvbox
highlight LineNr guifg=white
