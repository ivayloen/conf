" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
filetype off

" set rtp+=~/.vim/bundle/Vundle.vim
" set plugins
call vundle#rc()
Bundle 'gmarik/vundle'
"Bundle 'vim-scripts/SuperTab-continued.'
Bundle 'vim-scripts/xoria256.vim'
Bundle 'vim-scripts/The-NERD-Commenter'
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'vim-scripts/Syntastic'
Bundle 'vim-scripts/ctrlp.vim'
Bundle 'vim-scripts/closetag.vim'
Bundle 'taketwo/vim-ros'

" encodings and shell and colors
set t_Co=256
scriptencoding utf-8
set termencoding=utf-8
set encoding=utf-8
set shell=/bin/zsh
silent execute '!mkdir -p $HOME/.vim/tmp/{backup,swap,view,undo}'
set backupdir=$HOME/.vim/tmp/backup/
set backup
set directory=$HOME/.vim/tmp/swap/
set viewdir=$HOME/.vim/tmp/view/
set undodir=$HOME/.vim/tmp/undo/

set autochdir
" set colorcolumn=80

" store undo files, undo edits after deleting a buffer
set undofile
set viminfo='50,n$HOME/.vim/tmp/viminfo
set shell=/bin/zsh
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
let g:Powerline_symbols = "fancy"
colorscheme xoria256 
"set background=light
"colorscheme zenburn
"let g:solarized_termcolors=256
"colorscheme visualstudio
" Enable syntax highlighting
syntax on

"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
"set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
set smartindent
set smarttab

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set relativenumber

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
"set shiftwidth=2
"set tabstop=2

" auto change directory
"set autochdir
" set the tab name to show
set showtabline=1

"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default

map Y y$

let mapleader= ","

map <C-n> :NERDTreeToggle<CR>
map <C-s> <esc>:w<CR> 
imap <C-s> <esc>:w<CR>

map <C-t> <esc>:tabnew<CR>
map <C-x> <C-w>c
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
noremap <C-L> :nohl<CR><C-L>
inoremap ` <Esc>
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>
"nmap <silent> <C-k> :wincmd k<CR>
"nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" block arrows and page up down
        nnoremap <UP>           <NOP>
        nnoremap <DOWN>         <NOP>
        nnoremap <LEFT>         <NOP>
        nnoremap <RIGHT>        <NOP>
        inoremap <UP>           <NOP>
        inoremap <DOWN>         <NOP>
        inoremap <LEFT>         <NOP>
        inoremap <RIGHT>        <NOP>
        vnoremap <UP>           <NOP>
        vnoremap <DOWN>         <NOP>
        vnoremap <LEFT>         <NOP>
        vnoremap <RIGHT>        <NOP>
        nnoremap <PageUp>       <NOP>
        nnoremap <PageDown>     <NOP>
        inoremap <PageUp>       <NOP>
        inoremap <PageDown>     <NOP>
        vnoremap <PageUp>       <NOP>
        vnoremap <PageDown>     <NOP>
"------------------------------------------------------------
