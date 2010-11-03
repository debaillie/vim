" =============================================================
" Key Mappings
" =============================================================
" Leader is the comma
" 
" General mappings
" ,,     mode switching (mapped to esc)
" ,b     switch to alternate buffer
" ,ev    'e'dit 'v'imrc file
" ,sv    's'ource 'v'imrc file
" ,s     turn on spelling underlines for comments
" ,y     copy to the clipboard
" ,p     paste from the clipboard
" ,t     load current buffer's todos to the quickfix list
" ,T     load working directory's subfiles' todos to the quickfix list
" -,+    close or open folds respectively
" SPACE  clear search term
" 
" Window management
" ,h ,j ,l ,k        go to left, down, up, and right window respectively
" ,mh ,mj ,ml ,mk    'm'ove current window left, down, up, and right respectively
" ,ch ,mj ,ml ,mk    'c'lose window to the left, down, up, and right respectively
" ,o                 make the current window the 'o'nly one
"
" Building options
" ,ma    execute 'm'ake 'a'll
" ,mc    execute 'm'ake 'c'lean
" ,mi    execute 'm'ake 'i'nstall
"
" Insert mode movement
" c-h c-j c-k c-l    move left, down, up, and right but remain in insert mode
" c-d c-u            pan down and up respectively but remain in insert mode
" c-w c-b c-e        move forward one word, backward one word, or to the end of the word without leaving insert mode
" c-I c-A            move to beginning of text or end of text while remaining in insert mode
"
" Tab mappings
"  In insert mode, autocompletion of words
"  In normal or visual mode, block indenting
" =============================================================
let mapleader=","  

" General mappings
imap <leader><leader> <esc>
cmap <leader><leader> <c-c>
vmap <leader><leader> <esc>
nmap <leader>b :b#<CR>
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>
nmap <leader>s :setlocal spell! spelllang=en_us<CR>
nmap <leader>y "+y
nmap <leader>p "+p
nmap <leader>t :let @/ = "\\\\ctodo"<CR>:vimgrep /\\ctodo/j %<CR>
nmap <leader>T :let @/ = "\\\\ctodo"<CR>:vimgrep /\\ctodo/j ./**/*<CR>
map - :set fen<CR>
map + :set nofen<CR>
nmap <space> :let @/ = ""<CR>

" Window management
noremap <silent> <leader>h :wincmd h<cr>
noremap <silent> <leader>j :wincmd j<cr>
noremap <silent> <leader>k :wincmd k<cr>
noremap <silent> <leader>l :wincmd l<cr>
noremap <silent> <leader>cj :wincmd j<cr>:close<cr>
noremap <silent> <leader>ck :wincmd k<cr>:close<cr>
noremap <silent> <leader>ch :wincmd h<cr>:close<cr>
noremap <silent> <leader>cl :wincmd l<cr>:close<cr>
noremap <silent> <leader>cc :close<cr>
noremap <silent> <leader>ml <C-W>L
noremap <silent> <leader>mk <C-W>K
noremap <silent> <leader>mh <C-W>H
noremap <silent> <leader>mj <C-W>J
noremap <silent> <leader>o <c-w>o

" Building options
nmap <leader>ma :make all<CR>
nmap <leader>mc :make clean<CR>
nmap <leader>mi :make install<CR>

" Insert mode movement
imap <c-h> <c-o>h
imap <c-j> <c-o>j
imap <c-k> <c-o>k
imap <c-l> <c-o>l
imap <c-d> <c-o><c-d>
imap <c-u> <c-o><c-u>
imap <c-w> <c-o>w
imap <c-b> <c-o>b
imap <c-e> <c-o>e
imap <c-i> I
imap <c-a> A

" Mappings for VI
" - Backspace
nmap <BS> x
" - Keypad
map! Op 0
map! Oq 1
map! Or 2
map! Os 3
map! Ot 4
map! Ou 5
map! Ov 6
map! Ow 7
map! Ox 8
map! Oy 9
map! Ol +
map! OS -
map! OQ /
map! On .

" Tab mappings
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
if !exists("blocktab")
   let blocktab = 1
   vmap <unique> <TAB> >gv
   vmap <unique> <S-TAB> <gv
   nmap <unique> <TAB> V>gv<esc>
   nmap <unique> <S-TAB> V<gv<esc>
endif

" =============================================================
" Options
" =============================================================
filetype on
filetype plugin on
filetype indent on
set nocompatible     "Don't make compatible with vi
set lazyredraw       "Don't update the display while executing macros 
set showmode         "At least let yourself know what mode you're in
set wildmenu         "Enable enhanced command-line completion 
set wildmode=longest,list,full

" =============================================================
" Tab settings 
" =============================================================
set et
set smarttab
set smartindent
set autoindent
au BufEnter * set sw=3
au BufEnter * set ts=3
au BufEnter *.\(rb\|erb\|js\|html\|rjs\) set sw=2
au BufEnter *.\(rb\|erb\|js\|html\|rjs\) set ts=2
au FileType make setlocal noexpandtab "Allow tabs in make files

" =============================================================
" GUI Options
" =============================================================
syntax on                           "Turn on Syntax Highlighting
set mousehide
set mouse=a
set hlsearch                        "Highlight searches
set background=light
set ruler
set scrolloff=3                     "Scrolloff
set vb                              "Set visual bell (no beeping)
set guifont=DejaVu\ Sans\ Mono\ 10  "Set to a readable font
set guioptions=ac                   "Turn off the toolbar
set synmaxcol=2048                  "Syntax coloring lines that are too long is slow
set ch=2                            "Make command line two lines high
set laststatus=2                    "Display status line even if there is only one window
set nu                              "Add number lines

"Save Marks - cursor positioning and restores in center of window
set viminfo='10,\"500,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"z.")|else|exe "norm $"|endif|endif

"Cursor modification (| on insert, block on non-insert)
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

if &term =~ "xterm"
   let &t_SI = "\<Esc>]12;black\x7"
   let &t_EI = "\<Esc>]12;grey\x7"
endif

" Set the status line the way I like it
set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]

" =============================================================
" Line wrapping settings"
" =============================================================
set showbreak=>>
set linebreak
set textwidth=0
set backspace=indent,eol,start
set nowrapscan
set nowrapscan

" =============================================================
" Miscellaneous
" =============================================================
set spellfile=~/.vim/dict.add          "Set spellfile
set cinkeys=0{,0},0),:,!,o,O,e       "Prevent #if's from going to the beginning of the line
set autowrite                          "Allows for make command in : mode
set hidden                             "Allow hidden unwritten modified buffers
set cpoptions=ces$
"set ve=all                             "Allow the cursor to go into 'invalid' places

" =============================================================
" Functions
" =============================================================
"Tab completion function
if !exists("tabcompletionloaded")
   let tabcompletionloaded = 1
   function InsertTabWrapper()
      let col = col('.') - 1
      if !col || getline('.')[col - 1] !~ '\k'
         return "\<tab>"
      else
         return "\<c-p>"
      endif
   endfunction
   function ScopeMenu()
      let col = col('.') -1
   endfunction
endif

" =============================================================
" Folding
" =============================================================
set foldmethod=marker 
set foldopen=search,undo,hor,block,insert,jump,mark,percent,quickfix,tag 
set foldclose=all
set nofen

