language messages en

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=c:/Programme_dg/Vim/vimfiles/bundle/vundle/
" pass a path where Vundle should install bundles
let path='c:/Programme_dg/Vim/vimfiles/bundle'
call vundle#rc(path)


" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" scripts on GitHub repos
Bundle 'bling/vim-bufferline'

" Command line plugins
Bundle 'oplatek/Conque-Shell'

" Various editing plugins
Bundle 'kana/vim-textobj-user'
Bundle 'tpope/vim-repeat'

" Comment plugin
Bundle 'tpope/vim-commentary'

" Colorschemes
Bundle 'altercation/vim-colors-solarized'
Bundle 'endel/vim-github-colorscheme'
Bundle 'vim-scripts/confluencewiki.vim'

" Ruby plugins
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'thoughtbot/vim-rspec'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rake'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-cucumber'

" Python plugins
Bundle 'sontek/rope-vim'
Bundle 'klen/python-mode'
Bundle 'jcrocholl/pep8'

" File system plugins
Bundle 'scrooloose/nerdtree'

" Chef plugins
Bundle 'dougireton/vim-chef'

" Markdown plugins
Bundle 'tpope/vim-markdown'

" Wiki
Bundle 'vimwiki'

" Syntax check on buffer save
Bundle 'scrooloose/syntastic'

" Source Control plugins
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
Bundle 'gregsexton/gitv'
Bundle 'mhinz/vim-signify'

" Startup/Auswahl plugins
Bundle 'mhinz/vim-startify'


if has('autocmd')
  filetype plugin indent on	  " Turn on Filetype detection, plugins, and
                              " indent
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable			" Turn on syntax highlighting
endif
" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin


" ----------------------------------------------------------------------------
"  moving around, searching and patterns
" ----------------------------------------------------------------------------
set relativenumber
nnoremap / /\v
vnoremap / /\v
set incsearch			    " Highlight pattern matches as you type
set ignorecase			  " ignore case when using a search pattern
set smartcase			    " override 'ignorecase' when pattern has upper case character


" ----------------------------------------------------------------------------
"  tags
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  displaying text
" ----------------------------------------------------------------------------
set number
set lines=999 columns=999
set guifont=Consolas:h10:cANSI

" ----------------------------------------------------------------------------
"  syntax, highlighting and spelling
" ----------------------------------------------------------------------------

set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

" ignore colorscheme doesn't exist error if solarized isn't installed
silent! colorscheme solarized

if exists('+colorcolumn')
  set colorcolumn=80    " display a line in column 80 to show you
                        " where to line break.
endif

" ----------------------------------------------------------------------------
"  multiple windows
" ----------------------------------------------------------------------------
set laststatus=2  	  " Show a status line, even if there's only one
                      " Vim window

set hidden		    	  " allow switching away from current buffer w/o writing

set switchbuf=usetab  " Jump to the 1st open window which contains
                      " specified buffer, even if the buffer is in
                      " another tab.
                      " TODO: Add 'split' if you want to split the
                      " current window for a quickfix error window.

set statusline=
set statusline+=b%-1.3n\ >                    " buffer number
set statusline+=\ %{fugitive#statusline()}:
set statusline+=\ %F
set statusline+=\ %M
set statusline+=%R
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%=
set statusline+=\ %Y
set statusline+=\ <\ %{&fenc}
set statusline+=\ <\ %{&ff}
set statusline+=\ <\ %p%%
set statusline+=\ %l:
set statusline+=%02.3c   	" cursor line/total lines

set helpheight=30         " Set window height when opening Vim help windows

" ----------------------------------------------------------------------------
"  multiple tab pages
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  terminal
" ----------------------------------------------------------------------------
set ttyfast			      " this is the 21st century, people

" ----------------------------------------------------------------------------
"  using the mouse
" ----------------------------------------------------------------------------
if has('mouse')
  set mouse=a
endif

" ----------------------------------------------------------------------------
"  GUI				      " Set these options in .gvimrc
" See help for 'setting-guifont' for tips on how to set guifont on Mac vs Windows
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  printing
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  messages and info
" ----------------------------------------------------------------------------
set showcmd			    " In the status bar, show incomplete commands
                    " as they are typed
set noshowmode      " don't display the current mode (Insert, Visual, Replace)
                    " in the status line. This info is already shown in the
                    " Airline status bar.
set ruler			      " Always display the current cursor position in
                    " the Status Bar
set confirm         " Ask to save buffer instead of failing when executing
                    " commands which close buffers
" ----------------------------------------------------------------------------
"  selecting text
" ----------------------------------------------------------------------------
set clipboard=unnamed	" Yank to the system clipboard by default

" ----------------------------------------------------------------------------
"  editing text
" ----------------------------------------------------------------------------
set backspace=indent,eol,start  "backspace over everything
set showmatch  			      " when inserting a bracket, briefly jump to its
                          " match
" ----------------------------------------------------------------------------
"  tabs and indenting
" ----------------------------------------------------------------------------
set tabstop=4             " tab = 2 spaces
set shiftwidth=4       " autoindent indents 2 spaces
set smarttab              " <TAB> in front of line inserts 'shiftwidth' blanks
set softtabstop=4
set shiftround            " round to 'shiftwidth' for "<<" and ">>"
set expandtab

if has('autocmd')
  autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
  autocmd FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2
  autocmd FileType ruby.chef setlocal expandtab shiftwidth=2 softtabstop=2
endif

" ----------------------------------------------------------------------------
"  folding
" ----------------------------------------------------------------------------
if has('folding')
  set nofoldenable 		         " When opening files, all folds open by default
  set foldtext=NeatFoldText()  " Use a custom foldtext function
endif

" ----------------------------------------------------------------------------
"  diff mode
" ----------------------------------------------------------------------------
set diffopt+=vertical       " start diff mode with vertical splits by default

" ----------------------------------------------------------------------------
"  mapping
" ----------------------------------------------------------------------------
let mapleader = ","
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
nnoremap <leader><space> :noh<cr>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
" au FocusLost * :wa
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>c <C-w>c
nnoremap <leader>v V`]
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
inoremap jj <ESC>
nnoremap <leader><space> :noh<cr>
map <leader>ru :SyntasticCheck rubocop<CR>

" ----------------------------------------------------------------------------
"  reading and writing files
" ----------------------------------------------------------------------------
set autoread			          " Automatically re-read files changed outside
                            " of Vim
" ----------------------------------------------------------------------------
"  the swap file
" ----------------------------------------------------------------------------
"Put vim files in the temp directory instead of the current directory
set dir=%TMP%
set backupdir=%TMP%
set undodir=%TMP%
if exists('+undofile')
  set undofile
endif

" ----------------------------------------------------------------------------
"  command line editing
" ----------------------------------------------------------------------------
set history=200    " Save more commands in history
                   " See Practical Vim, by Drew Neil, pg 68
set wildmode=list:longest,full
" File tab completion ignores these file patterns
set wildignore+=*.exe,*.swp,.DS_Store
set wildmenu
" Add guard around 'wildignorecase' to prevent terminal vim error
if exists('&wildignorecase')
  set wildignorecase
endif

" ----------------------------------------------------------------------------
"  executing external commands
" ----------------------------------------------------------------------------
let g:ConqueTerm_SessionSupport = 1
let g:pyflakes_use_quickfix = 1
let g:pep8_map='<leader>8'
let g:pymode_lint_on_write = 0
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pylint']
map <leader>9 :PymodeLint<CR>
map <leader>7 :PymodeLintAuto<CR>

" ----------------------------------------------------------------------------
"  running make and jumping to errors
" ----------------------------------------------------------------------------
if executable('grep')
  set grepprg=grep\ --line-number\ -rIH\ --exclude-dir=tmp\ --exclude-dir=.git\ --exclude=tags\ $*\ /dev/null
endif

" ----------------------------------------------------------------------------
"  language specific
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  multi-byte characters
" ----------------------------------------------------------------------------
set encoding=utf-8

" ----------------------------------------------------------------------------
"  various
" ----------------------------------------------------------------------------
set gdefault              " For :substitute, use the /g flag by default

" ----------------------------------------------------------------------------
" Autocmds
" ----------------------------------------------------------------------------
" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
" From https://github.com/thoughtbot/dotfiles/blob/master/vimrc
autocmd BufReadPost *
  \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" ----------------------------------------------------------------------------
" Allow overriding these settings
" ----------------------------------------------------------------------------
