set nocompatible
set ttyfast

:execute pathogen#infect()
let mapleader = "\<Space>"
filetype plugin indent on
:let g:netrw_dirhistmax = 0

"------ Theme ------
syntax on
if &t_Co >= 256
    set t_Co=256
    colorscheme Tomorrow-Night
	hi Normal ctermbg=none ctermfg=none
    "colorscheme oceanblack256
    "colorscheme twilight256
endif

if has("gui_running")
	colorscheme strange
	"colorscheme Tomorrow
	set guifont=Input:h12
	set linespace=2
	"colorscheme oceanblack
endif

"------ Essentials  ------
set synmaxcol=9999
set termencoding=utf-8 " terminal encoding
set encoding=utf8 " encoding
set fileencodings=utf8,cp1251 " possible file encodings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set nu " line numbers
set autoindent
set copyindent " copy the previous indentation on autoindenting
set shiftwidth=4  " number of spaces to use for autoindenting
set hidden " switch between buffers without saving them
set laststatus=2 " always display status line
set history=1000 " remember more commands and search history
set undolevels=1000 " same for undo
set ignorecase " ignore case when searching
set incsearch " instant search
set backspace=indent,eol,start
set scrolloff=2 " leave two lines when scrolling
set virtualedit=onemore
"set nowrap

"------ NERDTree  ------
map <C-n> :NERDTreeToggle<CR>

"------ pdv phpDoc  ------
"let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
"nnoremap <C-p> :call pdv#DocumentCurrentLine()<CR>
noremap <C-p> :call PhpDoc()<CR>

"------ PHP-Indenting-for-VIm ------
let g:PHP_outdentphpescape = 1

"------ splitjoin.vim ------
noremap <silent> <C-k> :SplitjoinJoin<CR>
noremap <silent> <C-j> :SplitjoinSplit<CR>

"------ vim-airline ------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"------ unite.vim ------
nnoremap <C-b> :Unite -buffer-name=buffers -winheight=10 buffer<cr>

"------ binds ------
" easy cmd
nnoremap ; :

" just because
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
nnoremap <Left>  <NOP>
nnoremap <Right> <NOP>
nnoremap <Up>    <NOP>
nnoremap <Down>  <NOP>

" buffer navigation
noremap <silent> <Leader>h :bprev<CR>
noremap <silent> <Leader>l :bnext<CR>

" resizing
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

" toggle paste mode
map <leader>pp :setlocal paste!<cr>

" hotsave
nnoremap <Leader>w :w<CR>

"------ functions ------
" delete trailing white space on save
func! DeleteTrailingWS()
	exe "normal mz"
	%s/\s\+$//ge
	exe "normal `z"
endfun
"autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite * :call DeleteTrailingWS()
