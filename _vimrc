set nocompatible
set winminheight=0
set autoindent
set smartindent
set helplang=En
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set ruler
set shiftwidth=4
set tabstop=4
set expandtab
set statusline=%F%m%r%h%w\ [%{&ff}:%Y]\ [ASCII\/HEX:\ %03.3b\ %02.2B]\ [%04l,%04v][%p%%]\[LEN=%L]
set window=67
set number
set nowrap
set diffopt=vertical,filler,iwhite
set foldenable
set foldmethod=indent
set foldlevel=1
set foldcolumn=4
set hidden
set listchars=tab:»·,trail:·
set list
let Tlist_Show_One_File=1
let treeExplVertical=1
let treeExplWinSize=40
let miniBufExplSplitBelow=1
let miniBufExplVSplit = 1
let miniBufExplMinSize = 30
let miniBufExplMaxSize = 100
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplCloseOnSelect = 1
let g:miniBufExplUseSingleClick = 1
let g:snips_author = "Jake Edstrom <jacob.edstrom@nerdery.com>"
let NERDTreeShowHidden = 1
let NERDTreeChDirMode = 2
let NERDTreeIgnore = [ '\~$', '^\.$', '^\.\.$', '^\.git$' ]
let g:pdv_cfg_Author = "Jake Edstrom <jacob.edstrom@nerdery.com>"
let g:pdv_cfg_Uses = 0
"let g:UltiSnipsUsePythonVersion = 2
"let g:UltiSnipsSnippetDirectories = [ "UltiSnips/UltiSnips" ]
let g:UltiSnipsEditSplit = 'vertical'
let g:js_indent_log = 0
let mapleader=","
syntax enable
filetype plugin indent on
inoremap jk <ESC>
nnoremap j gj
nnoremap k gk

"=====================
" custom functions
"=====================

function! MyCommentLine()
  call setline(".", substitute(getline("."), '^\(\s*\)\(\S\)', '\1\/\/ \2', ''))
endfunction

function! MyUncommentLine()
  call setline(".", substitute(getline("."), '^\(\s*\)\/\/ \?\(\S\)', '\1\2', ''))
endfunction

"=====================
" end custom functions
"=====================

nmap <silent> <Leader>b :TMiniBufExplorer<cr>
map <silent> <right> :TMiniBufExplorer<cr>
nmap <silent> <Leader>vs :source $MYVIMRC<cr>
nmap <silent> <Leader>ve :e $MYVIMRC<cr>
nmap <silent> <Leader>bd :bd<cr>
nmap <silent> <Leader>rt :retab<cr>
nmap <silent> <Leader>bl :buffers<cr>
map <C-L> <Nop>
map! <C-L> <Nop>
nmap <F1> <silent> <nop>
imap <F1> <silent> <nop>
nmap <silent> <F2> :w<cr>
imap <silent> <F2> <ESC>:w<cr>i
nmap <silent> <M-F2> :noautocmd w<cr>
nmap <silent> <F3> :set fileformat=unix<cr>
nmap <silent> <F4> :q<cr>
nmap <silent> <F5> <C-W>100+<cr>
nmap <silent> <M-F5> <C-W>=
nnoremap <silent> <F6> :TlistToggle<cr>
noremap <silent> <F7> :set nolist<cr>
nnoremap <silent> <M-F7> :set list<cr>
nnoremap <silent> <F9> :NERDTreeToggle<cr>
nnoremap <M-F9> :NERDTree 
map <silent> <left> :NERDTreeToggle<cr>
nmap <silent> <F10> :set nowrap<cr>
nmap <silent> <M-F10> :set wrap<cr>
nmap <silent> <F11> :noh<cr>
nmap <silent> <M-F11> :set hls<cr>
nmap <silent> <F12> :call MyCommentLine()<cr>
vmap <silent> <F12> :call MyCommentLine()<cr>
nmap <silent> <M-F12> :call MyUncommentLine()<cr>
vmap <silent> <M-F12> :call MyUncommentLine()<cr>
imap <silent> <C-P> <?php  ?><ESC>2hi
nmap <silent> <C-left> :wincmd h<cr>
nmap <silent> <C-right> :wincmd l<cr>
nmap <silent> <C-up> :wincmd k<cr>
nmap <silent> <C-down> :wincmd j<cr>
nmap <silent> <M-left> :bp<cr>
nmap <silent> <M-right> :bn<cr>
map <silent> <M-up> :bp<cr>
map <silent> <M-down> :bn<cr>
noremap <S-space> <C-b>
noremap <space> <C-f>

"set runtimepath+=~/vimfiles/UltiSnips

au BufWritePre * silent! %s/\s\+$/
if has('win32')
  vmap <C-C> "*y
  nmap <C-C> "*y
  nmap <C-V> "*p
  "iunmap <C-V>
  nmap <silent> <C-A> mZggVG"*y'Z
  vmap <C-X> "*d
  map <C-Z> <C-L>
  nmap <C-Z> <C-L>
  imap <C-Z> <C-L>
  set directory=.,$TEMP
  set nobackup
  "set backupdir=C:\Documents\ and\ Settings\jedstr001\My\ Documents\Vim\ backup
  "au BufWritePre * let &backupext = '-' . strftime('%Y%m%d-%H%M%S') . '~'
else
  set shell=/bin/tcsh
endif
if has('gui_running')
  colorscheme slate_jake
  set columns=200 lines=90
  set guifont=Consolas:h10:cANSI,Bitstream_Vera_Sans_Mono:h10:cANSI,Courier:h10:cANSI
  "set guioptions=egmrLt
  set guioptions=erL
  set cursorline
  nmap <silent> <F8> :set cursorcolumn<cr>
  nmap <silent> <M-F8> :set nocursorcolumn<cr>
else
  set background=dark
endif
