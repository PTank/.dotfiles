"--------------------------------------------------------------------------------
"     File Name           :     .vimrc
"     Created By          :     p-tank
"     Creation Date       :     [2014-07-23 21:03]
"     Last Modified       :     [2015-01-31 11:36]
"     Description         :      
"--------------------------------------------------------------------------------
" 1 - Basic set

set number
set mouse=a
set t_Co=256
set omnifunc=syntaxcomplete#Complete
" 2 - configure plugin with vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'nanotech/jellybeans.vim'
Plugin 'PTank/leek.vim'
Plugin 'shanzi/autoHEADER'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'helino/vim-nasm'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:airline#extensions#tabline#enabled = 1
" 3 - Color
colorscheme jellybeans

" 4 - Shortcut
nmap	<C-n> :bn<CR>			" next buffer
nmap	<C-p> :bp<CR>			" previous buffer
nmap	<F2> :TagbarToggle <CR>		" print Tagbar
map	<C-t> :NERDTreeToggle<CR>	" NERDtree
map	<C-h> :AutoHeader<CR>		" AutoHeader
