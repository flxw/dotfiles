">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"               Last Edit: 22.01.2014
"               ---------------------
"               vundle configuration
"               comes first to provide
"               all packages
"<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
"
"Bundle 'AutomaticLaTexPlugin'
Bundle 'Lokaltog/vim-powerline'
Bundle 'digitaltoad/vim-jade'
Bundle 'dag/vim-fish'

" ...
filetype plugin indent on     " required! 

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
" Set the colorscheme and numbers depending on the environment
" On the login console, use colorscheme desert,
" and solarized anywhere else

">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"               General options
"<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
if $TERM == "linux"
	colorscheme desert
else
"	set background=light
"    colorscheme solarized
"    let g:hybrid_use_Xresources = 1
"    colorscheme hybrid-light
    colorscheme smyck
endif

" always enable syntax highlighting
syntax on

" highlight search hits
set hlsearch

" always enable linenumbers
set nu

" folds
set foldenable
"set foldcolumn=1

" expand tabs to 4 spaces, also use 4 spaces as intendation level
set tabstop=4
set shiftwidth=4
set expandtab

">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"             key mappings
"<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
"> open matching header and source files
nmap <C-V> :AV<CR>
"> switch between tabs
nmap <F11> :tabprevious<CR>
nmap <F12> :tabnext<CR>


">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"               plugin configuration
"<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
">>>> powerline
set laststatus=2
let g:Powerline_symbols='fancy'
"let g:Powerline_theme="skwp"
"let g:Powerline_colorscheme="skwp"

">>>> ATP
let b:atp_TexCompiler = "pdflatex"
let b:atp_BibCompiler = "bibtex"
let g:atp_Compiler    = "python"
let g:atp_Python      = "python2"

let b:atp_updatetime_insert   = 0
let b:atp_updatetime_normal   = 0
"let b:atp_updatetime_normal   = 5000
let g:atp_HighlightErrors 	  = 1
" bibtex
let g:atp_bibsearch = "python"
" viewer
let b:atp_Viewer        = "xpdf"
let g:atp_ReloadViewers = [ "xpdf" ]
let b:atp_OpenViewer    = 1
" completion
let g:atp_local_completion = 1
" codefolding
"let g:atp_folding = 1
"let g:atp_fold_environments = 1

">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"         functions making life easier
"<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
function LastMod()
    if line("$") > 20
        let lastModifiedLine = 20
    else
        let lastModifiedLine = line("$")
    endif

    execute "1," . lastModifiedLine . "g/Last Edit: /s/Last Edit: .*/Last Edit: " . strftime("%d.%m.%Y")
endfunction

">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"            file specific settings
"<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
" Update 'Last Edit' label on write
autocmd BufWritePre,FileWritePre * mark s|call LastMod()|'s

" For all text files set 'textwidth'
autocmd FileType text     setlocal textwidth=80
autocmd FileType plaintex setlocal textwidth=80
autocmd FileType tex      setlocal textwidth=80
autocmd FileType python   setlocal textwidth=80

" disable tab expansion for Makefiles
autocmd FileType make setlocal noexpandtab

" set various options for Python source editing
autocmd FileType python setlocal softtabstop=4 smarttab

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

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
