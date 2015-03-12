filetype off

set number
set nocompatible

syntax on
set tabstop=4
set cindent
set backspace=start,eol,indent
set shiftwidth=4
set autoindent
set expandtab

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#begin(expand('~/.vim/bundle/'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc',{
\	'build' : {
\		'windows' : 'tools\\update-dll-mingw',
\		'mac' : 'make -f make_mac.mak'
\	},
\}
NeoBundle 'Shougo/vimshell'
NeoBundle 'itchyny/lightline.vim'
set laststatus = 2

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'scrooloose/nerdtree'

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
Neobundle 'tomtom/tcomment_vim'

NeoBundle 'thinca/vim-quickrun'
NeoBundle 'grep.vim'

call neobundle#end()

NeoBundleCheck

filetype plugin indent on
filetype indent on

" syntax check
let g:syntastic_javascript_checker = "jshint"
let g:syntastic_check_on_open = 0
let g:syntastic_check_in_save = 1

" quickrun setting
let g:quickrun_config = {
\ "_" :{
\		"outputter/buffer/split" : ":botright",
\		"outputter/buffer/close_on_empty" : 1
\	},
\}

let g:neocomplete#enable_at_startup = 1
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

