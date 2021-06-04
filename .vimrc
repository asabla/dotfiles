" ====================================================================
"					Start Vundle plugin loading
set nocompatible 
filetype off

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" ====================================================================

" ====================================================================
" Ctrl+P plugin, fuzzy search and stuff
"ctrlpvim/ctrlp.vim
" ====================================================================
Plugin 'ctrlpvim/ctrlp.vim'


" ====================================================================
" Nerdtree, make it easier to navigate between files
" ====================================================================
Plugin 'scrooloose/nerdtree'
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Exit vim if nerdtree is the only window left active

" Maps to toggle nerdtree with Ctrl+N
"map <C-n> :NERDTreeToggle<CR>
nmap <C-M><C-M> :NERDTreeToggle<CR>

" Opens nerdtree automatically if no file was selected
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" ====================================================================


" ====================================================================
" Nginx syntax
" ref: https://vimawesome.com/plugin/nginx-vim
" ====================================================================
Plugin 'nginx.vim'


" ====================================================================
" vim fugitive (git) plugin
" ref: https://github.com/tpope/vim-fugitive
Plugin 'tpope/vim-fugitive'


" ====================================================================
" Airline + airline theme
" ref: https://github.com/vim-airline/vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Smarter tab line, 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buf_label_first = 1
let airline#extensions#tabline#current_first = 1

" Some symbol fixes
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols fix
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''


" ====================================================================
" Vim language server stuff
" ref: https://github.com/neoclide/coc.nvim
Plugin 'https://github.com/neoclide/coc.nvim'

" Coc settings
" use tab for autocomplete
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<Tab>" : 
	\ coc#refresh()

" use ctrl+space for autocomplete
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif



" Function for previewing documentation
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')


" ====================================================================
" Polyglot syntax highlighting
" ref: https://github.com/sheerun/vim-polyglot 
Plugin 'sheerun/vim-polyglot'




" ====================================================================
"                End Vundle plugin loading
call vundle#end()
filetype plugin indent on
" ====================================================================


" Recommended plugins by vim community/irc channel
" Ref: https://www.vi-improved.org/plugins/


" ===================================================
"              Status functions
" ===================================================

" Get current git status (head, behind, infront etc)
function! GitBranchStatus()
	return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! GitBranchStatusline()
	let l:branchname = GitBranchStatus()
	return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction


" ===================================================
"                Misc settings
" ===================================================

set tabstop=2           " Show existing tab with 2 spaces width
set shiftwidth=2        " when indenting with '>', use 2spaces width
"set backspace=2			    " make backspace work like most other programs
set backspace=indent,start	
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



" Omnisharp settings
let g:OmniSharp_server_type = 'roselyn'
let g:Omnisharp_prefer_global_sln = 1

" -------------- Hotkeys mapping ----------------------------
" Change hjkl into jklö (j=left, k=down, l=up, ö=right)
"map j <Left>
"map k <Down>
"map l <Up>
"map ö <Right>


" Change Ctrl+W h=left, j=down, k=up, l=right	into:	Ctrl+W j=left,
" k=down, l=up, ö=right
nmap <C-J> <C-W>j<C-W>_
nmap <C-K> <C-W>k<C-W>_
nmap <C-L> <C-W>l<C-W>_
nmap <C-Ö> <C-W>ö<C-W>_

noremap ö l
noremap l k
noremap k j
noremap j h

" Change active tab with Ctrl+t jklö (directional)
map <C-t><Up> :tabr<cr>
map <C-t><Down> :tabl<cr>
map <C-t><Left> :tabp<cr>
map <C-t><Right> :tabr<cr>

map <C-t><l> :tabr<cr>
map <C-t><k> :tabl<cr>
map <C-t><j> :tabp<cr>
map <C-t><ö> :tabr<cr>

" Toggle linenumber with double ctrl+n in normal mode
nmap <C-N><C-N> :set invnumber<CR>

" Toggle line row/highlight with double ctrl+L in normal mode
nmap <C-L><C-L> :set cursorline!<CR>

" Toggle relative row number with double ctrl+o in normal mode
"nmap <C-K><C-K> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>
nmap <F3> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

" Write changes and Quit vim with double ctrl+q
nmap <C-Q><C-Q> :wq!<CR>


" -------------- Visual settings ----------------------------

"  Disable bell
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Background color for line numbers
"highlight LineNr ctermfg=gray ctermbg=8
set nuw=4

" fn for toggle relative number only when it's active
function! RelativeNumberToggle()
	if(&rnu == 1)
		set nu!
		set rnu
	else
		set nornu
		set nu
	endif
endfunction

" Set relative number toggle when switching between buffers
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * :call RelativeNumberToggle()
	autocmd BufLeave,FocusLost,InsertEnter * :call RelativeNumberToggle()
augroup END

" Enable some better highlighting of code
" Colorscheme can be installed by running:
" curl -O https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim
syntax enable
set background=dark
colorscheme gruvbox
