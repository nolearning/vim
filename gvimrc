set guifont=Monaco:h12

colorscheme molokai

set relativenumber
set cursorline

set foldenable
set foldmethod=syntax
set foldcolumn=0
setlocal foldlevel=1
nnorempa <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

