">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"               Last Edit: 18.04.2014
"               ---------------------
"               vundle configuration
"               comes first to provide
"               all packages
"<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
set nocompatible
filetype on

" Plugins:
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
let bundlepath='~/.vim/bundle'
call vundle#begin(bundlepath)

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'morhetz/gruvbox'
Plugin 'chriskempson/base16-vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/goyo.vim'
Plugin 'tpope/vim-surround'
Plugin 'pangloss/vim-javascript'
Plugin 'groenewege/vim-less'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Plugin: NERDTree
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR> " open NERDTREE with CTRL-N
let NERDTreeIgnore=['\.pyc$', '__pycache__']

" Plugin: Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_mode_map={ 'mode': 'passive' }

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_loc_list_height=3
let g:syntastic_python_python_exec='/usr/local/bin/pytest3'
let g:syntastic_javascript_checkers = ['jscs']

" Plugin: YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" Plugin: SimpylFold
let g:SimpylFold_fold_docstring=0
let g:SimpylFold_docstring_preview=1

" Plugin: CtrlP
nnoremap <Leader>m :CtrlPBufTag<CR>
map <C-t> :CtrlPBufTag<CR>
let g:ctrlp_extensions = ['buffertag']

" Plugin: Airline
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1
"set encoding=utf-8


">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"               General options
"<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
set backspace=indent,eol,start  " backspace over everything in insert mode
set laststatus=2  " The value of this option influences when the last window will have a status line
set ignorecase
set smartcase  " will automatically switch to a case-sensitive search if you use capital letters
au FocusLost * silent! wa  " Autosave on focus lost


" Filetypes:
" Python
au BufNewFile,BufRead *.py
                        \ set expandtab |           " enter spaces when tab is pressed
                        \ set textwidth=79 |        " break lines when line length increases
                        \ set tabstop=4 |           " use 4 spaces to represent tab
                        \ set softtabstop=4 |
                        \ set shiftwidth=4 |        " number of spaces to use for auto indent
                        \ set autoindent |          " copy indent from current line when starting a new line
                        \ set fileformat=unix

" Web (doesn't seem to work)
au BufNewFile,BufRead *.js,*.html,*.css,*.json
                        \ set tabstop=2 |
                        \ set softtabstop=2 |
                        \ set shiftwidth=2


"> open matching header and source files
nmap <C-V> :AV<CR>
"> switch between tabs
nmap <F11> :tabprevious<CR>
nmap <F12> :tabnext<CR>
nnoremap <Leader>f :Autoformat<CR>
nnoremap <Leader>g :GitGutterToggle<CR>
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

" Appearance
colorscheme gruvbox
set background=dark
set nu
let python_highlight_all=1
syntax on
set nohlsearch
set incsearch

" Enable folding
set foldmethod=syntax
set foldlevel=99
set wrap linebreak nolist

" Indentation behaviour
set expandtab
set shiftwidth=2
set softtabstop=2

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
"  augroup END

" Functions
function! WC()
  let filename = expand("%")
  let cmd = "detex " . filename . " | wc -w | tr -d [:space:]"
  let result = system(cmd)
  echo result . " words"
endfunction

command WC call WC()
