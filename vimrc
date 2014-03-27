set nocompatible             
filetype off
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
filetype plugin indent on

" Syntax
Bundle 'asciidoc.vim'
Bundle 'confluencewiki.vim'
"Bundle 'html5.vim'
Bundle 'mattn/emmet-vim'
Bundle 'JavaScript-syntax'
Bundle 'moin.vim'
Bundle 'python.vim--Vasiliev'
Bundle 'xml.vim'

" Color
Bundle 'molokai'
Bundle 'desert256.vim'
Bundle 'Impact'
Bundle 'matrix.vim'
Bundle 'vibrantink'
Bundle 'vividchalk.vim'

" Ftplugin
Bundle 'python_fold'

" Indent
Bundle 'IndentAnything'
Bundle 'Javascript-Indentation'
Bundle 'mako.vim--Torborg'
Bundle 'gg/python.vim'

" Plugin
Bundle 'The-NERD-tree'
Bundle 'AutoClose--Alves'
Bundle 'auto_mkdir'
Bundle 'cecutil'
Bundle 'FencView.vim'
Bundle 'jsbeautify'
Bundle 'L9'
Bundle 'Mark'
Bundle 'matrix.vim'
Bundle 'mru.vim'
Bundle 'The-NERD-Commenter'
Bundle 'restart.vim'
Bundle 'css_color.vim'
Bundle 'hallettj/jslint.vim'
Bundle 'DoxygenToolkit.vim'
Bundle 'tczengming/autoload_cscope.vim'  
Bundle 'CmdlineComplete'  
Bundle 'xptemplate'  
Bundle 'Rip-Rip/clang_complete'  
Bundle 'genutils'  
Bundle 'lookupfile' 

Bundle 'javacomplete'  
Bundle 'SuperTab'

"javascript
Bundle 'elzr/vim-json'

"markdown
Bundle 'plasticboy/vim-markdown'

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

" Buffer
nnoremap <C-RETURN> :bnext<CR>
nnoremap <C-S-RETURN> :bprevious<CR>

" Tab
nnoremap <C-TAB> :tabnext<CR>
nnoremap <C-S-TAB> :tabprev<CR>

"change leader
let mapleader=","

" NERDTree options  
" Auto change the root directory  
let NERDTreeChDirMode=2  
let g:NERDTreeWinSize = 23 

map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR>

"NERD_commenter
let NERDSpaceDelims=1
let NERDCompactSexyComs=1


"DoxygenToolkit
let g:DoxygenToolkit_authorName="nolearning - wang.zhenbin@gmail.com"
let g:DoxygenToolkit_briefTag_funcName="yes"
map <leader>da :DoxAuthor<CR>
map <leader>df :Dox<CR>
map <leader>db :DoxBlock<CR>
map <leader>dc a /*  */<LEFT><LEFT>

"javacomplete
setlocal omnifunc=javacomplete#Complete
autocmd FileType java inoremap <buffer> . .<C-X><C-O><C-P>


"c, c++, objc complete
let g:clang_snippets=1
let g:clang_use_library=1
let g:clang_close_preview=1
let g:clang_complete_macros=1
let g:clang_user_options='-stdlib=libc++ -std=c++11 -IIncludePath'
let s:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
if isdirectory(s:clang_library_path)
    let g:clang_library_path=s:clang_library_path
endif

"xcode
let filetype_m='objc'
"update the :make command to tell Xcode to build  
set makeprg=osascript\ -e\ \"tell\ application\ \\\"Xcode\\\"\"\ -e\ \"build\"\ -e\ \"end\ tell\"  
     
function! XcodeClean()  
    silent execute ':!osascript -e "tell application \"Xcode\"" -e "Clean" -e "end tell"'  
endfunction  
command! -complete=command XcodeClean call XcodeClean()  
     
function! XcodeDebug()  
    silent execute '!osascript -e "tell application \"Xcode\"" -e "Debug" -e "end tell"'  
endfunction  
command! -complete=command XcodeDebug call XcodeDebug()  
     
" Command-K cleans the project  
:noremap <D-K>  :XcodeClean  
" Command-Return Starts the program in the debugger  
:noremap <D-RETURN> :XcodeDebug 

"json
au BufRead,BufNewFile *.json set filetype=json
map <leader>j <ESC>:%!json_xs -f json -t json-pretty<RETURN>

set backupdir=~/.vim/backup  
set directory=~/.vim/backup

set number
syntax on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set showmatch

set ignorecase smartcase
set nowrapscan
set ruler
set incsearch
set hlsearch
set magic

set scrolloff=3
set autoindent
set smartindent
set showmode
set showcmd
set hidden

set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set undofile
set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,utf-16,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set linespace=2

"set lines=50 columns=128

autocmd! bufwritepost .vimrc source ~/.vimrc

