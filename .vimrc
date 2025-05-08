" setup Plug
call plug#begin('~/.vim/plugged')

Plug 'gmarik/vundle'
Plug 'vim-ruby/vim-ruby'
Plug 'ervandew/supertab'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
" Plug 'ctrlp.vim'
" Plug 'ZoomWin'
" Plug 'matchit.zip'
" Plug 'tComment'
Plug 'tristen/vim-sparkup'
Plug 'plasticboy/vim-markdown'
Plug 'kballard/vim-swift'
Plug 'mustache/vim-mustache-handlebars'
Plug 'slim-template/vim-slim'
Plug 'fatih/vim-go'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'puppetlabs/puppet-syntax-vim'
Plug 'jiangmiao/simple-javascript-indenter'
Plug 'mxw/vim-jsx'
Plug 'burnettk/vim-angular'
Plug 'othree/html5.vim'
Plug 'flazz/vim-colorschemes'
Plug 'elixir-lang/vim-elixir'
Plug 'briancollins/vim-jst'
Plug 'jszakmeister/vim-togglecursor'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'rking/ag.vim'
Plug 'Chun-Yang/vim-action-ag'
Plug 'jparise/vim-graphql'
Plug 'w0rp/ale'
Plug 'jlanzarotta/bufexplorer'
Plug 'janko/vim-test'
Plug 'benmills/vimux'
Plug 'tpope/vim-endwise'

call plug#end()

" vim options
filetype plugin indent on
syntax on
cabbr te tabedit
" colorscheme xoria256
" colorscheme solarized
" set background=dark
set expandtab
set nocompatible
set laststatus=2
set tabstop=2
set shiftwidth=2
set showtabline=2
set number
set wrap
set backspace=0
set t_Co=256
set colorcolumn=120 " red line and over is error
set textwidth=0
set hlsearch

" turn off vim-markdown folding
let g:vim_markdown_folding_disabled=1

" enforce purity
noremap  <Up> <Nop>
noremap  <Down> <Nop>
noremap  <Left> <Nop>
noremap  <Right> <Nop>

" ag-vim shortcut
map <Leader>f gagiw

" set nonumber
highlight Normal ctermbg=None

" nickh customization
nnoremap <CR> :noh<CR>
map <Leader>l :TestNearest<CR>
map <Leader>f :TestFile<CR>
set hidden

let g:go_version_warning = 0
let g:VimuxHeight = "25"
let g:VimuxOrientation = "h"
let test#strategy = "vimux"
