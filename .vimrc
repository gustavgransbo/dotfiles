" ------------ VimPlug ---------------------------
call plug#begin('~/.vim/plugged')

" codedark colorscheme
Plug 'tomasiser/vim-code-dark'

Plug 'mg979/vim-visual-multi'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-commentary'

call plug#end()

" ------------- Color ----------------------------
set t_Co=256
colorscheme codedark

"------------- Settings --------------------------

" Highlight matching ([{
set showmatch

" Add system clipboard to default register
set clipboard=unnamed

" Search highlighting
set hlsearch incsearch

" Show commands as they are being typed
set showcmd

" Use hybrid line numbers
set number relativenumber

" Block cursor in normal mode, line in insert mode
" Source: https://stackoverflow.com/a/42118416
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
if has("autocmd")
  augroup myCmds
  au!
  autocmd VimEnter * silent !echo -ne "\e[2 q"
  augroup END
endif

" When opening a file: Go to last known cursor position if known
" Source: https://askubuntu.com/a/202077
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" ------------ Sane defaults from Vim Wiki -------
" Section adapted from http://vim.wikia.com/wiki/Example_vimrc

" Basic features
set nocompatible
filetype indent plugin on
syntax on

"Better command-line completion
set wildmenu

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

