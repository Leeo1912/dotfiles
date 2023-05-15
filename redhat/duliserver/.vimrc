" .vimrc for redhat
" Author:Liliangcheng  
" Link: https://github.com/Leeo1912/dotfiles

" default leader key is /, we use space.
let mapleader=" "
let g:mapleader=" "


"========Adaptation to different file formats========
set nocompatible "if you want to use real VIM,you must set it!!!,or you will use vi!!!
"vim will recognize the type of input file and adapt to the indentation format
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on "Combined writing of the first three lines


"========Show line numbers and present format========


" highlight Visual cterm=bold ctermbg=LightBlue ctermfg=NONE
" hi Visual guifg=none guibg=LightBlue gui=none
" hi Visual cterm=none ctermbg=LightBlue ctermfg=none guibg=DarkGray
" hi Visual term=reverse cterm=reverse ctermbg=black guibg=grey60

set number 
set relativenumber
set nowrap " do not wrap lines,default is wrap
set linebreak "do not break a full word
set scrolloff=7 "The position of the cursor from the upper and lower edges of the screen is always maintained at 'scrolloff' units
set sidescrolloff=15
set autochdir " auto switch work dir as current dir when open another file
"set cursorcolumn " same as set cuc  
set cursorline " same as set cul
set ruler "Display the current cursor position

set laststatus=2 " show status line, defaulte is 1(hidden)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ Ln\ %l/%L,\ Col\ %c%) " what shows on status line
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
" set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]

"------ghr

"set textwidth=0 " do not automatically broke long lines.
"set backupcopy=yes " overwrite as backup??
" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb= 
set matchtime=2 " time to jump to corresponding branket
"set magic
"set updatetime=1000 "default=4000, 4 secs. 
"set smartindent " smartindent doesn't support verilog
"set autoindent " use autoindent for verilog(After pressing the Enter key, the indentation of the next line will automatically keep the same as the indentation of the previous line.)
" set cmdheight=1

"---------


"========tab and space========
set shiftwidth=4 "<< and >> width: 4
set tabstop=4 " tab width: 4
set softtabstop=4 " Tab is equal to how many spaces (backspace width: 4)
set expandtab " change tab to space automatically	F


"========code folding in vim=========
" set foldclose=all "disable all fold, seems useless
set foldmethod=syntax 
set foldcolumn=0 
setlocal foldlevel=1 
" set fen " fold enable, = set foldenable
set nofen " do not fold anything, = set nofoldenable
" autocmd FileType * exe "normal zR"
" use space to turn on/off fold
nnoremap <leader>f @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR> 




"========Where to generate the new tab page========
set showtabline=2
set splitbelow "Use 'new' to create a new horizontal buffer, and the new window will appear below the current window; if this option is not set, it will appear above by default
set splitright "same as above(use'vnew')



"========search========
" set shortmess+=I " Disable the default Vim startup message.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.	
set showmode    " Show mode of vim in status line.
" set hlsearch "high light search, annoying
" set autowrite		" Automatically save before commands like :next and :make
" set hidden " Hide buffers when they are abandoned

" set list "Show hidden newlines and tabs
set smartcase " Do smart case matching
set ignorecase " Do case insensitive matching. same as set ic
set incsearch " Incremental search
set nohls " do not use highlight search as it is annoying



"========set the themes and colors of vim========
"set background=dark
"syntax highlighting settings
"syntax enable
syntax on
"entering [:colorscheme <ctrl-d>] will show all themes
try
	colorscheme vim-monokai-tasty
catch
	colorscheme darkblue
endtry "If there is no vim-monokai-tasty in the environment where .vimrc is located, file errors can be avoided
"colorscheme torte
"colorscheme slate
"colorscheme murphy
"colorscheme ron
"colorscheme pablo
"colorscheme elflord
"colorscheme molokai
"colorscheme default
highlight clear LineNr
highlight clear SignColumn
" highlight Visual cterm=bold ctermbg=LightBlue ctermfg=NONE
" hi Visual guifg=none guibg=LightBlue gui=none
" hi Visual cterm=none ctermbg=LightBlue ctermfg=none guibg=DarkGray
" hi Visual term=reverse cterm=reverse ctermbg=black guibg=grey60



"========set cilpboard of vim and system========
"use [vim --version | grep "clipboard"] to Check if the vim version supports "clipboard"
"If "-clipboard" appears, it means that vim does not support,"+clipboard" means it supports
set clipboard=unnamedplus
set clipboard=unnamed



"========Undo, Swap, and Backup Settings======== 
set updatetime=1000 "default=4000, 4 secs. 


" setlocal noswapfile 
" set nobackup " do not backup files when overwrite
set swapfile
" swpdir// is different from swpdir
" // means file names contain Absolute PATH
set directory=~/.vim/swpdir//
set backup
set backupdir=~/.vim/backupdir//
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir//


"========NERDTree======== 

" fix nerdtree icon bugs
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8


" NerdTree config

" let g:NERDTreeDirArrows      = 1
" let g:NERDTreeDirExpandable  = 1
" let g:NERDTreeDirCollapsible = 1
" let g:NERDTreeGlyphReadOnly  = "RO"


" autocmd VimEnter * NERDTree
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" :NERDTree to open
" ? to turn on the quick help
" map <F3> :NERDTreeMirror<CR>
" map <F3> :NERDTreeToggle<CR>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>m :NERDTree<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>


"========setting autocmd and Tips========
"use [:help autocmd-events] to find event description
" <1> cursorline only exists in the currently focused window
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
 
 "<2> Remove extra spaces at the end of each line
autocmd BufWritePre * :%s/\s\+$//e



iabbrev always_ff always_ff @ (posedge clk) begin
iabbrev always_comb always_comb begin

autocmd BufNewFile *.c,*.cpp,*.sh,*.py,*.sv,*.v exec ":call SetTitle()"                                                                                        
"Define the function SetTitle to automatically insert file headers
func SetTitle()
    call setline(1, "//***************************************************************")
    call setline(2, "// Description: ")
    call setline(3, "// File Name: ".expand("%"))
    call setline(4, "// Author: LLC")
    call setline(5, "// Email: ")
    call setline(6, "// Created Time: ".strftime("%c"))
    call setline(7, "// Revision history:")
    call setline(8, "//***************************************************************")
    call setline(9, "")
endfunc
"Automatically move the cursor to the end of the file
autocmd BufNewfile * normal G 


" autocmd BufWritePost $MYVIMRC source $MYVIMRC"
" As .lib file looks so ugly cuz vim's stupid highlighting strategy
" we use autocmd to turn off syntax highlighting feature when open .lib files
" and turn on it back when close .lib files
" This autocmd works as expected
" Recommanded: elflord, pablo
autocmd BufRead *.lib exec ":colorscheme pablo"
" This autocmd Kai Bai Le, why? 
" BufRead failed, BufReadPost failed, BufEnter OK
autocmd BufEnter *.lib exec ":syntax off"
" Double Insurance!!! As I don't understand these fxxking code at all
autocmd BufLeave *.lib exec ":syntax on"
autocmd VimLeave * exec ":syntax on"




"========Key Mapping(no recursive!)&ues [:help key-notation] to find special key========


" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" in normal mode
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>
inoremap  jj     <Esc>

nnoremap H ^
nnoremap L $
"nnoremap <enter> o
"nnoremap <leader><enter> O

"Moving Cursor in Labels and Windows
nnoremap <C-h> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

nnoremap <C-D> <C-D>zz
nnoremap <C-U> <C-U>zz
nnoremap <C-F> <C-F>zz
nnoremap <C-B> <C-B>zz

" Keep cursor in the middle all the time
" nnoremap <M-k> kzz
" nnoremap <M-j> jzz
" nnoremap <M-p> pzz
" nnoremap <M-P> Pzz
" nnoremap <M-G> Gzz
" nnoremap x xzz
" inoremap <ESC> <ESC>zz
" nnoremap <ENTER> <ENTER>zz
" inoremap <ENTER> <ENTER><ESC>zzi
" nnoremap o o<ESC>zza
" nnoremap o o<ESC>k
" nnoremap O O<ESC>zza
" nnoremap O O<ESC>j
" nnoremap a a<ESC>zza

" <C-J> has been used to switch between panes.
"nnoremap J <C-E> 
" <C-K> has been used to switch between panes.
"nnoremap K <C-Y> 
" <C-H> has been used to switch between panes.
"nnoremap H zh 
" <C-L> has been used to switch between panes.
"nnoremap L zl 

" carefully use ZZ, ZZ may cause unanticipated exits.
nnoremap ZZ :echoe "Use :wq"<CR>
nnoremap QQ :q<CR> 
nnoremap QA :qa<CR>
"nnoremap q: :echoe "q: not found, use ESC and :q to quit"<CR>
