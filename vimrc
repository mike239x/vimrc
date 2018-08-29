" based on http://marcgg.com/blog/2016/03/01/vimrc-example/
" with some additional plugins takes from the top pages of https://vimawesome.com/

" pathogen startup
execute pathogen#infect()

filetype on
syntax on
"colorscheme dracula 
"colorscheme molokai 
colorscheme jellybeans 
"colorscheme vividchalk 
set colorcolumn=90
set number
" let mapleader=" "
map <leader>s :source ~/.vimrc<CR>
"something useful
set hidden
set history=100
"indentation
filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
"highlight found words
set hlsearch
"showcase matching paranthesis
set showmatch

"command-t plugin config
"set wildignore+=*.log,*.sql,*.cache
" to get this plugin to work one needs a ruby compatible vim
" which for example can be installed via 
" $ sudo apt-get install vim-nox;
" one also needs ruby for that (I think it will be autoinstalled with vim-nox)
" after that one should go to the plugin dir and run
" $ rake make
" B
" to compile the entire thing

"lightline plugin config
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

"NERDcommenter plugin config
filetype plugin on

"NERDtree plugin config
" hit right key to open a node
let NERDTreeMapActivateNode='<right>'
" display hidden files
let NERDTreeShowHidden=1
" <leader>n shows/hides the tree
nmap <leader>n :NERDTreeToggle<CR>
" locate the focused file in the tree with <leader>j
nmap <leader>j :NERDTreeFind<CR>
" always open the tree when booting Vim, but don’t focus it
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
" do not display some useless files in the tree
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']

"surround (allows to use 's' motion) - no config here

"CtrlP - TODO

"window-swap: 
"let g:windowswap_map_keys = 0 "prevent default bindings
"nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
"nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
"nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>

"targets - no config here

"vim-markdown - no config here (the only button is <leader>e)

"YouCompleteMe - TODO

"my own stuff:
" $ sudo apt install vim-gtk
" adds +xterm_clipboard so that one can use + and * registers
" exit insert mode on shift-enter
:inoremap <S-CR> <Esc>
" allow hidden buffers
:set hidden
" Use :bn, :bp, :b #, :b name, and ctrl-6 to switch between buffers. 
" I like ctrl-6 myself (alone it switches to the previously used buffer, 
" or #ctrl-6 switches to buffer number #).
" Use :ls to list buffers, or a plugin like MiniBufExpl or BufExplorer.
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <leader>l :nohl<CR><C-l>
" new slipts appear to the right/down
set splitbelow
set splitright
" press ctrl-d to get into console (press it again to get back into vim)
nnoremap <leader>d :sh<CR>
" ]f, [f to go to the next/previous line with { on it.
" TODO: make it register as a jump
" TODO: make 3]f jump 3 tiimes (currently doesn't work)
nnoremap <silent> ]f <CR>:exe search('{', "w")<CR>^
nnoremap <silent> [f :exe search('{', "bw")<CR>^
" for new buffers and new files with .md choose markdown highlighting
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" save code folds on exit
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
