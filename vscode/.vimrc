
" ===================================================
"                Misc settings
" ===================================================

set tabstop=2           " Show existing tab with 2 spaces width
set shiftwidth=2        " when indenting with '>', use 2spaces width
"set backspace=2			    " make backspace work like most other programs
"set backspace=indent,start	
"set backspace=indent,eol,start		" will not erease text beyond end of line

set noswapfile          " Disable swapfiles
set autoread            " Autoread external changes
set number              " Enable numbered lines
set nolinebreak         " Don't break lines at word
set nowrap              " Don't wrap lines
set showmatch           " Highlight matching brace
set hlsearch            " Highlight all search results
set smartcase           " Enable smart case search
set ignorecase          " Always case insensitive
set incsearch           " Searches for string incrementally
set smartindent					" Vim tries to be smart with indentation 
set undolevels=1000     " Number of undos
set ruler               " Show row and column ruler information
set cursorline					" Highlights selected row (where the ruler is)
set syntax=enable				" Will enable syntax highlighting

" Status line configs
set laststatus=2				" Always diplay status line

noremap ö l
noremap l k
noremap k j
noremap j h