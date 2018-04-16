" this vimrc is based on Olafs Vandans' version in early 2017
"
" Put this at the top of your .vimrc to use Vundle.
"
" Start Vundle Setup {{{
" first thing is entering vim mode, not plain vi
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim' "Vundle itself

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

Plugin 'tpope/vim-sleuth' "from Tim Pope's sleuth

Plugin 'Shougo/neocomplete.vim' "Shougo's Tab-autocomplete
" Omni completion provides smart autocompletion for programs
set omnifunc=syntaxcomplete#Complete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_insert_char_pre = 1
let mapleader = ","
nmap <leader>a :NeoCompleteToggle<CR>
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"let g:neocomplete#enable_auto_select = 1

" vim-airline for status/tabline
" previously tried lightline, buftabline
Plugin 'vim-airline/vim-airline'
" enable smart tabline
let g:airline#extensions#tabline#enabled = 1

" PaperColor vim colorscheme
Plugin 'NLKNguyen/papercolor-theme'

Plugin 'luochen1990/rainbow' "Rainbow Parentheses
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
"There is an example for advanced configuration (which luochen1990's using)
"add it to your vimrc and edit it as you wish (just keep the format).
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}

" for various syntax highlighting
Plugin 'pangloss/vim-javascript' "for javascript highlight
" dockerfile
Plugin 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
" nginx
Plugin 'chr4/nginx.vim'

"file browser
Bundle 'scrooloose/nerdtree'

"show git status in file browser, complement the above
Bundle 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeMapOpenSplit = "s"
let g:NERDTreeMapOpenVSplit = "v"
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"for accelerated smooth scroll (mapping to <C-D>/<C-U>, <C-F>/<C-B>)
Bundle 'yonchu/accelerated-smooth-scroll'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
" Brief help (newer version)
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}} end of Vundle Setup


" set font
set gfn=Monospace\ 12

set nocursorcolumn
set nocursorline
set mouse=a
syntax sync minlines=256

"shading language like glsl, for graphics are detected by vim for syntax coloring
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl
au BufNewFile,BufRead *.cl setf opencl

set winaltkeys=no
set ai!
set vb!
set switchbuf=useopen,usetab,newtab
set hidden
set ignorecase
set hlsearch
set incsearch
set smartcase

"The best way to get filetype-specific indentation is to use filetype plugin indent on
"show existing tab with 4 spaces width
" must enable smarttab for tab to be converted to 4 space
set smarttab
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" Expand TABs to spaces.

set noswapfile
set pastetoggle=<F2>
set clipboard=unnamedplus
set exrc
set secure
set virtualedit=block
set vb t_vb=
set modeline
set ffs=unix,dos,mac

let c='a'
while c <= 'z'
	  exec "set <A-".c.">=\e".c
	    exec "imap \e".c." <A-".c.">"
	      let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50 "set the wait time for keypress

"Key mappings
imap jj <esc>
"map oo o<Esc>
imap <C-j> <esc>
imap <S-CR> <esc>
map <Space> i <esc>
" map <Tab> i	<esc>

imap <M-h> <left>
imap <M-j> <down>
imap <M-k> <up>
imap <M-l> <right>
map <M-h> 5h
map <M-j> 5j
map <M-k> 5k
map <M-l> 5l

map gk <C-w><Up>
map gj <C-w><Down>
map gh <C-w><Left>
map gl <C-w><Right>
map <C-l> :bn<cr>
map <C-h> :bp<cr>
map <C-p> :b#<CR>
vnoremap <M-c> "*y<CR>
vnoremap <M-v> "*p<CR>

nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk
nnoremap grh :vertical resize -5<cr>
nnoremap grk :resize +5<cr>
nnoremap grj :resize -5<cr>
nnoremap grl :vertical resize +5<cr>
nnoremap Q :bp\|bd #<cr>

"Specific commands
map <leader>n <esc>:cn<cr>
map <leader>p <esc>"0p<cr>
map <leader>m <esc>:wa<cr>:make -s<cr>
map <leader>r <esc>:wa<cr>:make r -s<cr><cr>
map <leader>j <esc>:w<cr>:bn!<cr>
map <leader>k <esc>:w<cr>:bp!<cr>
map <leader>l <esc>:w<cr>:ls<cr>
map <leader>h <esc>:w<cr>:FSHere<cr>
map <leader>h <esc>:w<cr>:FSHere<cr>
vmap <leader>c "+y
nmap <leader>v "+p
map <leader>w :update<Esc>
map <leader>q :q
map <leader>/ <esc>:nohlsearch<cr>

map <leader><cr> :NERDTreeToggle<CR>


"folding settings
set foldmethod=manual   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "

"Shell
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  let isfirst = 1
  let words = []
  for word in split(a:cmdline)
    if isfirst
      let isfirst = 0  " don't change first word (shell command)
    else
      if word[0] =~ '\v[%#<]'
        let word = expand(word)
      endif
      let word = shellescape(word, 1)
    endif
    call add(words, word)
  endfor
  let expanded_cmdline = join(words)
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile wrap
  "call setline(1, 'You entered:  ' . a:cmdline)
  call setline(1, expanded_cmdline)
  call append(line('$'), substitute(getline(1), '.', '=', 'g'))
  silent execute '$read !'. expanded_cmdline
  1
endfunction


" COLOR
" force 256 colors on the terminal
set t_Co=256
set background=light
colorscheme PaperColor
