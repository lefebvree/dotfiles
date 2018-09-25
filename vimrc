
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Set 10 lines to the cursor
set so=10

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
set wildignore+=.git\*,.hg\*,.svn\*
else
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" Enable syntax highlighting
syntax enable

" Set extra options when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions-=e
  set t_Co=256
  set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


" Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Exit insert mode when pressing up / down arrows
inoremap <silent> <Up> <ESC><Up>
inoremap <silent> <Down> <ESC><Down>

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Make VIM remember position in file after reopen
" if has("autocmd")
"   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:Powerline_symbols = 'fancy'
let g:onedark_terminal_italics = 1
let g:onedark_termcolors=16

let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ 'separator': { 'left': '', 'right': '' },
	\ 'subseparator': { 'left': '', 'right': '' }
	\}

"colorscheme onedark
set background=dark

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

hi VertSplit ctermbg=NONE guibg=NONE ctermfg=DarkGrey

set relativenumber
set number
set mouse=a

" Disable scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Comments in italic
"highlight Comment gui=italic
"highlight Comment cterm=italic

" NERD
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd vimenter * NERDTree

" Focus editor window
autocmd VimEnter * wincmd p

" toggle w/ ctrl-n
map <C-n> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable = '›'
let g:NERDTreeDirArrowCollapsible= '»'

let g:NERDTreeWinPos = "right"

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

try
  set undodir=~/.vim_runtime/temp_dirs/undodir
  set undofile
catch
endtry

" Grammalecte
let g:grammalecte_cli_py='/usr/share/grammalecte-fr/cli.py'

" Goyo toggle
nmap yo :Goyo<CR>

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

nmap ; :Files<CR>
nmap ,, :Buffers<CR>

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'

Plug 'valloric/youcompleteme'

Plug 'sheerun/vim-polyglot'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'bronson/vim-trailing-whitespace'

Plug 'jiangmiao/auto-pairs'

Plug 'itchyny/lightline.vim'

Plug 'airblade/vim-gitgutter'

Plug 'dpelle/vim-Grammalecte'

Plug 'junegunn/goyo.vim'

Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'

Plug 'mhinz/vim-startify'

call plug#end()

