set number

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

set autoindent

set wrap
set linebreak

set nobackup
set noswapfile
set encoding=utf-8

call plug#begin('~/.vim/plugged')

Plug 'mhartington/oceanic-next'

call plug#end()

set termguicolors

syntax enable
colorscheme OceanicNext

