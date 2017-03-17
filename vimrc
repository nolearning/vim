set nocompatible             
filetype off
let iCanHazVundle=1
let runOnWin=0
if has('win32')
    let vimDir=expand('~/vimfiles')
    let runOnWin=1
else
    let vimDir=expand('~/.vim')
endif
let bundleDir = expand(vimDir.'/bundle')
let vundleDir=expand(bundleDir.'/vundle')
let vundle_readme=expand(vundleDir.'/README.md')

if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    execute "silent !mkdir " . bundleDir
    execute  "silent !git clone https://github.com/gmarik/vundle " . vundleDir
    let iCanHazVundle=0
endif

if runOnWin==1
    set rtp+=~/vimfiles/bundle/vundle/
    let path='~/vimfiles/bundle'
    call vundle#rc(path)
else
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
endif
Bundle 'gmarik/vundle'
filetype plugin indent on

" File Navigation
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'

" File Search tool
Bundle 'kien/ctrlp.vim'

"easymotion
Bundle "easymotion/vim-easymotion"

"Status Line
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'

"Ouline
Bundle 'majutsushi/tagbar'

" Commenter
Bundle 'scrooloose/nerdcommenter'

" Syntax chcker
Bundle 'vim-syntastic/syntastic'

" Code Formatter
Bundle 'Chiel92/vim-autoformat'

" Auto Complete
Bundle 'jiangmiao/auto-pairs'
Bundle 'tpope/vim-surround'
Bundle 'Valloric/YouCompleteMe'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

"Git
Bundle 'tpope/vim-fugitive'

" Web
Bundle 'pangloss/vim-javascript'
Bundle 'mattn/emmet-vim'
Bundle 'elzr/vim-json'
Bundle 'css_color.vim'

" Python
Bundle 'hdima/python-syntax'
Bundle 'tmhedberg/SimpylFold'

"Swift
Bundle 'kballard/vim-swift'

"rust
Bundle 'rust-lang/rust.vim'

"markdown
Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'

"XML
Bundle 'xml.vim'

Bundle 'ervandew/supertab'

" Color
Bundle 'altercation/vim-colors-solarized'
Bundle 'molokai'
Bundle 'desert256.vim'
Bundle 'Impact'
Bundle 'vibrantink'
Bundle 'vividchalk.vim'
Bundle 'jnurmine/Zenburn'

" Plugin
Bundle 'pbrisbin/vim-mkdir'
Bundle 'L9'
Bundle 'mru.vim'
Bundle 'DoxygenToolkit.vim'

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

"Easymotion setting
let g:Easymotion_smartcase = 1

map <Leader><Leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>l <Plug>(easymotion-lineforward)
map <Leader><Leader>. <Plug>(easymotion-repeat)
"nmap s <Plug>(easymotion-overwin-f2)

"Statusline setting
" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup
"airline setting
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_theme='lucius'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

set showtabline=2
set noshowmode

"tagbar
nmap <F8> :TagbarToggle<CR>

"completioin
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

"syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" let g:syntastic_<filetype>_checkers = ['<checker-name']
" let g:syntastic_python_checkers = ['flake8']
" let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_javascript_checkers = ['eslint']

"snippets trigger configuration
let g:UltiSnipsExpandTrigger="<c-j>"
let g:ultiSnipsJumpForwardTrigger="<c-j>"
let g:ultiSnipsJumpBackwardTrigger="<c-k>"

"vim-autoformat setting
map <leader>f :Autoformat<CR>
autocmd FileType vim,tex let b:autoformat_autoindent=0
"formatprograms setting
"let g:formatter_yapf_style = 'pep8'

" NERDTree options  
" Auto change the root directory  
let g:NERDTreeChDirMode=2  
let g:NERDTreeWinSize = 23 

map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR>

"NERD_commenter
let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs=1

"DoxygenToolkit
let g:DoxygenToolkit_authorName="nolearning - wang.zhenbin@gmail.com"
let g:DoxygenToolkit_briefTag_funcName="yes"
map <leader>da :DoxAuthor<CR>
map <leader>df :Dox<CR>
map <leader>db :DoxBlock<CR>
map <leader>dc a /*  */<LEFT><LEFT>

"Web Setting
let g:user_emmet_mode = 'a'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"json
au BufRead,BufNewFile *.json set filetype=json
map <leader>j <ESC>:%!json_xs -f json -t json-pretty<RETURN>


if runOnWin==1
    set backupdir=~\\vimfiles\\.backup\\\\
    set undodir=~\\vimfiles\\.undo\\\\
    set directory=~\\vimfiles\\.swp\\\\
else
    set backupdir=~/.vim/.backup//  
    set undodir=~/.vim/.undo//
    set directory=~/.vim/.swp//
endif

if !isdirectory(&backupdir)
    silent execute '!mkdir ' . &backupdir . ' ' . &undodir . ' ' . &directory
endif

set number
syntax on
set tabstop=2
set shiftwidth=2
set softtabstop=2
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
set backup
set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,utf-16,cp936,gb18030,big5,euc-jp,euc-kr,latin1
if runOnWin==1
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
endif
set linespace=2

"set lines=50 columns=128

autocmd! bufwritepost .vimrc source ~/.vimrc

set background=dark
colorscheme solarized
set relativenumber
set foldenable
set foldmethod=syntax
set foldcolumn=0
"let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_style_pythonic = 1
setlocal foldlevel=1
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
