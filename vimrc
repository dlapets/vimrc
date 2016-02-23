set nocompatible
filetype off " vundle needs this

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'fatih/vim-go.git'
Plugin 'fholgado/minibufexpl.vim.git'
Plugin 'kien/ctrlp.vim.git'
Plugin 'majutsushi/tagbar.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'scrooloose/syntastic.git'
"Plugin 'Shougo/neocomplete.vim.git'
Plugin 'SirVer/ultisnips.git'
Plugin 'tobyS/vmustache.git'
Plugin 'tpope/vim-fugitive.git'

call vundle#end()            " required
filetype plugin indent on    " required

set mouse=a
set ttymouse=xterm2

syntax on
set number
set relativenumber
set ruler
set enc=utf-8
 
set hlsearch
set incsearch
set smartcase

set backspace=2 " make backspace work like most other apps
set ts=4
set sw=4

set expandtab
set smarttab
set smartindent

set scrolloff=4 " show 4 lines around where you are

set undolevels=100

set hidden
set nobackup
set directory=~/.vim/directory

set lazyredraw

nmap <F5> :GoTest<CR>
nmap <F6> :set relativenumber!<CR>
nmap <F7> :Gblame<CR>
nmap <F8> :TagbarToggle<CR>
map <F9> :NERDTreeToggle<CR>

augroup filetype
    " raml
    autocmd BufNewFile,BufRead *.raml set filetype=yaml
augroup END

augroup indent
    autocmd FileType json setlocal ts=2 sw=2
    autocmd FileType yaml setlocal ts=2 sw=2
augroup END

if has("gui_running")
	colorscheme desert
	set guifont=terminus
	set go-=T
else
	colorscheme elflord
endif

let mapleader=","
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

let g:tagbar_ctags_bin = '/usr/local/opt/ctags/bin/ctags'

" go related settings from welle
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>s <Plug>(go-implements)

"make quickfix window not huge
au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
    exe max([min([line("$")+1, a:maxheight]), a:minheight]) . "wincmd _"
endfunction
