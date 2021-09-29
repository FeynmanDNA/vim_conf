"==========================================
" Author:  FeynmanDNA
" Version: 1.6
" Last_modify: 2019-May-27
" Main_Source: Olafs Vandans' vimrc in early 2017
" Other_Source: github.com/wklken/vim-for-server
" Other_Source: github.com/yangyangwithgnu/use_vim_as_ide
" Other_Source: medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
"==========================================

" Notice in Vundle Config, filetype is first turned off
" then at the end of the Config, filetype is turn back on again
" All plugins must be declared between the call vundle#rc() line
" and the filetype plugin indent on directive.
"
" Put this at the top of your .vimrc to use Vundle.

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

" this plugin is designed to automatically adjust the tab vs space
"Plugin 'tpope/vim-sleuth' "from Tim Pope's sleuth

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

" to show the git status in airline, also tons of git features in vim
Plugin 'tpope/vim-fugitive'

" PaperColor vim colorscheme
Plugin 'NLKNguyen/papercolor-theme'
" yangyangwithgnu colorschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'

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
" Plugin 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
" nginx (this only detect nginx.conf. other nginxconfs are in the syntax/)
" Plugin 'chr4/nginx.vim'

"file browser
Bundle 'scrooloose/nerdtree'
" 使用 NERDTree 插件查看工程文件。设置快捷键
map <leader><cr> :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=25
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
" let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"show git status in file browser, complement the above
Bundle 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeMapOpenSplit = "s"
let g:NERDTreeMapOpenVSplit = "v"
let g:NERDTreeGitStatusIndicatorMapCustom = {
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
" Bundle 'yonchu/accelerated-smooth-scroll'
" disabled in Jul2018, due to C-D, C-U freezes when fired frequently

" " use fzf for file browsing, need to install fzf first
" set rtp+=~/.fzf
" Plugin 'junegunn/fzf.vim'
" " from junegunn's fzfvim github readme:
" " Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
" command! -bang -nargs=* Rg
  " \ call fzf#vim#grep(
  " \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  " \   <bang>0 ? fzf#vim#with_preview('up:60%')
  " \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  " \   <bang>0)
" " Likewise, Files command with preview window
" command! -bang -nargs=? -complete=dir Files
  " \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" for undo review
Plugin 'mbbill/undotree'
" 调用 undo 树
nnoremap <F5> :UndotreeToggle<cr>

" orgasmic commenting
Plugin 'scrooloose/nerdcommenter'
" 注释的时候自动加个空格, 强迫症必配
let g:NERDSpaceDelims=1
" default key mappings:
"<leader>cc   加注释
"<leader>cu   解开注释
"<leader>c<space>  加上/解开注释, 智能判断
"<leader>cy   先复制, 再注解(p可以进行黏贴)

" Auto Pairs Insert or delete brackets, parens, quotes in pair.
" Plugin 'jiangmiao/auto-pairs'


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


syntax enable
syntax on

" display line numebrs
set number

" set binary to preserve EOL
set binary

" reload the file when changed on disk (need to refresh the buffer)
set autoread
" change the terminal's title to the filename
set title
" when exit, save a screenshot on the terminal
set t_ti= t_te=
" enable vim's native autocomplete for cmd
set wildmenu
" display incomplete commands
set showcmd

" display trailing whitespace and tab visually
set list
set listchars=tab:>-,trail:¶,extends:>,precedes:<

" set font
set guifont=Monospace\ 11

set nocursorcolumn
set nocursorline
set mouse=a
syntax sync minlines=256

"folding settings
set foldmethod=manual   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "

" COLOR
" force 256 colors on the terminal
set t_Co=256
set background=dark
" free as in freedom to choose color :)
"colorscheme PaperColor
"colorscheme solarized
colorscheme molokai
"colorscheme phd

" disable the blinking matching parentheses
let loaded_matchparen = 1

set winaltkeys=no
set ai!
set vb!
set switchbuf=useopen,usetab,newtab
set exrc
set secure
set virtualedit=block
set vb t_vb=
set modeline

" 允许不保存buffer而切换buffer
" A buffer becomes hidden when it is abandoned
set hidden

" highlight search
set hlsearch
" do incremental searching, search as you type
set incsearch
" 禁止在搜索到文件两端时重新搜索
" set nowrapscan
" search ignore case
set ignorecase
" no ignorecase if Uppercase char present
" 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set smartcase

"The best way to get filetype-specific indentation is to use filetype plugin indent on
"show existing tab with 4 spaces width
" must enable smarttab for tab to be converted to 4 space
"set smarttab
" use softtabstop=4, so no need for smarttab
" 4 space = tab
set softtabstop=4
" On pressing tab, insert 4 spaces
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" Expand TABs to spaces.
set expandtab

" do not save a swap tmp backup
set noswapfile

" when in insert mode, press <F2> to go to
" paste mode, where you can paste mass data
" that won't be autoindented
set pastetoggle=<F2>

" share the clipboard
set clipboard^=unnamed,unnamedplus

" encoding
set encoding=utf-8
set ffs=unix,dos,mac

set timeout ttimeoutlen=50 "set the wait time for keypress

" for gvim
" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" ============================ specific file type ===========================
" sw = shiftwidth, sts = softtabstop, et = expandtab,
" setl = setlocal, au = autocmd, ai = autoindent

autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNew *.md,*.mkd,*.markdown set filetype=markdown.mkd

autocmd FileType javascript,html,css,php,yaml set ts=2 sw=2 sts=2 expandtab ai
autocmd FileType javascript,css,php set textwidth=0
autocmd FileType html,htm,xml,tpl,yaml set textwidth=0

autocmd FileType make set noexpandtab

"shading language like glsl, for graphics are detected by vim for syntax coloring
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl
au BufNewFile,BufRead *.cl setf opencl

" for nginx files, this is from Evan Miller's vimscript(script_id=1886)
" the nginx.vim is in ~/.vim/syntax/
au BufRead,BufNewFile *.nginx set ft=nginx
au BufRead,BufNewFile */etc/nginx/* set ft=nginx
au BufRead,BufNewFile */usr/local/nginx/conf/* set ft=nginx
au BufRead,BufNewFile nginx.conf set ft=nginx
au BufRead,BufNewFile */Nginx/* set ft=nginx

" ============================ key map ============================
"Key mappings
" imap jj <esc>
"map oo o<Esc>
" imap <C-j> <esc>
" imap <S-CR> <esc>
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
