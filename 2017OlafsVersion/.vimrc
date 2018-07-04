syntax on
filetype plugin indent on

set gfn=Monospace\ 14
set nocursorcolumn
set nocursorline
set mouse=a
syntax sync minlines=256

au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl
au BufNewFile,BufRead *.cl setf opencl

let mapleader = ","

set omnifunc=syntaxcomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_insert_char_pre = 1
nmap <leader>a :NeoCompleteToggle<CR>
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"let g:neocomplete#enable_auto_select = 1

let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/.ycm_extra_conf.py"

" let g:gtfo#terminals = { 'unix' : 'sakura -h' }

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:CommandTAcceptSelectionMap = '<C-t>'
let g:CommandTAcceptSelectionTabMap = '<CR>'

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

let g:ctrlp_map = '<cr>'
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_prompt_mappings = { 'ToggleType(1)': ['<c-i>', '<c-up>'], 'ToggleType(-1)': ['<c-u>', '<c-down>'] }

" netrw
let g:netrw_liststyle = 3

let g:gdb_dbus_server_path = '~/.vim/dbus_gdb/gdb_dbus_server.py'

set winaltkeys=no
set ai!
set vb!
set switchbuf=useopen,usetab,newtab
set hidden
set ignorecase
set hlsearch
set incsearch
set smartcase
set smarttab
set tabstop=4
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
set timeout ttimeoutlen=50

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

map <leader>d :ConqueGdb a.out
map <leader><cr> :NERDTreeToggle<CR>
let g:ConqueTerm_FastMode = 1


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

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" default the statusline to green when entering Vim
hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15



set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'ervandew/supertab'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sleuth'
Plugin 'Shougo/neocomplete.vim'
Plugin 'justinmk/vim-gtfo' 
Plugin 'bling/vim-airline'
Plugin 'trapd00r/neverland-vim-theme'
" Plugin 'vim-scripts/Conque-GDB'
" Plugin 'Valloric/YouCompleteMe'
Bundle 'noah/vim256-color'
Bundle 'scrooloose/nerdtree'
Bundle 'Xuyuanp/nerdtree-git-plugin'
Bundle 'ctrlpvim/ctrlp.vim'
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
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" COLOR
set t_Co=256
colorscheme sourcerer

