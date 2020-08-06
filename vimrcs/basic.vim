
call plug#begin('~/.vim_mengqi/plugged')

Plug 'vim-scripts/peaksea',
Plug 'altercation/vim-colors-solarized',
Plug 'itchyny/lightline.vim',
Plug 'lilydjwg/fcitx.vim',

Plug 'milkypostman/vim-togglelist',
Plug 'scrooloose/nerdtree',
Plug 'jistr/vim-nerdtree-tabs',
Plug 'ludovicchabant/vim-gutentags',
Plug 'majutsushi/tagbar',
Plug 'skywind3000/asyncrun.vim',

Plug 'vim-scripts/a.vim',
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'mileszs/ack.vim',
Plug 'terryma/vim-multiple-cursors',
Plug 'tpope/vim-commentary',
Plug 'mvolkmann/vim-tag-comment',
Plug 'easymotion/vim-easymotion',
Plug 'junegunn/vim-easy-align',
Plug 'maxbrunsfeld/vim-yankstack',

Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips',
Plug 'honza/vim-snippets',
Plug 'dense-analysis/ale',
" Plug 'ycm-core/YouCompleteMe',
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

Plug 'tpope/vim-fugitive',
Plug 'airblade/vim-gitgutter'

call plug#end()

let mapleader = ","

set mouse=a             " General
set backspace=indent,eol,start
set t_BE=               " Disable "bracketed paste mode" by clearing 't_BE'

set history=500         " Sets how many lines of history VIM has to remember
set shell=/bin/bash

filetype plugin on      " Enable filetype plugins
filetype indent on

set wildmenu            " Turn on the Wild menu
set lazyredraw          " Don't redraw while executing macros (good performance config)
set ruler               " Always show current position
set cmdheight=2         " Height of the command bar
set magic               " For regular expressions turn magic on
set so=3                " Set 3 lines to the cursor - when moving vertically using j/k

set number              " Show line numbers
set linebreak           " Break lines at word (requires Wrap lines)
set showbreak=+++       " Wrap-broken line prefix
set textwidth=500       " Line wrap (number of cols)
set whichwrap+=<,>,h,l
set showmatch           " Highlight matching brace
set mat=2               " How many tenths of a second to blink when matching brackets
set foldcolumn=1        " Add a bit extra margin to the left

set noerrorbells        " No annoying sound on errors
set novisualbell
set t_vb=
set tm=500

set nobackup            " Turn backup off, since most stuff is in SVN, git et.c anyway...
set nowb
set noswapfile
set autoread            " Set to auto read when a file is changed from the outside

set encoding=utf8       " Set utf8 as standard encoding and en_US as the standard language
set ffs=unix,dos,mac    " Use Unix as the standard file type

set hlsearch            " Highlight all search results
set incsearch           " Searches for strings incrementally
set smartcase           " Enable smart-case search
set ignorecase          " Always case-insensitive
set autoindent          " Auto-indent new lines
set smartindent         " Enable smart-indent
set expandtab           " Use spaces instead of tabs
set smarttab            " Enable smart-tabs
set shiftwidth=4        " Number of auto-indent spaces
set softtabstop=4       " Number of spaces per Tab
set tabstop=4
" set clipboard=unnamed

" map <leader>w :wjk<cr>

" enable Alt key
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Parenthesis/bracket
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $4 <esc>`>a`<esc>`<i`<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 ``<esc>i
inoremap $q ''<esc>i
inoremap $e ""<esc>i

" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

syntax enable           " Enable syntax highlighting
if $COLORTERM == 'gnome-terminal' " Enable 256 colors palette in Gnome Terminal
    set t_Co=256
endif
try
    colorscheme peaksea
    " colorscheme solarized
catch
endtry

set background=dark
set cursorline
highlight CursorLine cterm=NONE ctermbg=8 ctermfg=NONE
highlight FoldColumn ctermbg=Black ctermfg=Black
set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey
set signcolumn=number

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
