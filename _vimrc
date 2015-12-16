filetype off

set number
set nocompatible
set formatoptions=q

syntax on
set tabstop=4
set cindent
set backspace=start,eol,indent
set shiftwidth=4
set autoindent
set expandtab
set cursorline

set incsearch
set wildmenu wildmode=list:full
set whichwrap=b,s,[,],,~
" set laststatus=3
" set statusline=%F%r%h%=

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

NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
Neobundle 'tomtom/tcomment_vim'

NeoBundleLazy 'OmniSharp/omnisharp-vim',{
\   'autoload':{'filetypes':['cs','csi','csx']},
\   'build':{
\       'windows':'msbuild server/OmniSharp.sln',
\       'mac':'xbuild server/OmniSharp.sln',
\       'unix':'xbuild server/OmniSharp.sln'
\   },
\}
NeobundleLazy 'OrangeT/vim-csharp',{'autoload' : {'filetypes':['cs','csi','csx']}}
Neobundle 'tpope/vim-dispatch'

NeoBundle 'thinca/vim-quickrun'
NeoBundle 'grep.vim'

NeoBundle 't9md/vim-quickhl'
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

" neocomplete setting
let g:acp_enableAtStartup = 0
" 起動時に有効にする
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#min_syntax_length = 3
let g:neocomplete#sources#syntax#min_keyword_length = 4 
let g:neocomplete#auto_completion_start_length = 4


let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#sources#dictionary#dictionaries = {'default' : ''}
let g:neocomplete#lock_iminsert = 1

if! exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

set imdisable

inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><BS> neocomplete#smart_close_popup()"\<C-h>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete_omni_patterns')
    let g:neocomplete_omni_patterns = {}
endif
let g:neocomplete_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete_force_omni_patterns.cs = '[^.]\.\%(\u\{2,}\)\?'
