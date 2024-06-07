" have syntax highlighting in terminals which can display colours:
if has('syntax') && (&t_Co > 2)
  syntax on
endif

"have tabs show as arrows
execute 'set listchars+=tab:' . nr2char(187) . nr2char(183)

"searching
set incsearch
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/yaml.vim

let treeExplVertical=1
let treeExplWinSize=30
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nnoremap <F7> :WinFullScreen<CR> 
nnoremap <F2> :NERDTree<CR> 

set shiftwidth=4
set expandtab
set tabstop=4
set autoindent
set nu

set showmode showcmd ruler

au FileType ruby setl shiftwidth=2 tabstop=2 nowrap
au FileType scala setl shiftwidth=2 tabstop=2 nowrap
au FileType xml setl shiftwidth=2 tabstop=2 nowrap
au FileType yaml setl shiftwidth=2 tabstop=2 nowrap
au FileType sbt.scala setl shiftwidth=2 tabstop=2 nowrap
au FileType yaml setl shiftwidth=2 tabstop=2 nowrap
au FileType javascript setl shiftwidth=2 tabstop=2 nowrap
au FileType js setl shiftwidth=2 tabstop=2 nowrap
autocmd FileType make setlocal noexpandtab

"set nu

"fix typos
abbreviate teh the

colorscheme blackdust_trans
