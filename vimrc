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

"CtrlP - no config here

"window-swap - no config here

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
" easier way to go up a line (equivalent to - and to k^)
nnoremap <leader><CR> -
" an alternative to backspace
" (go back a symbol, jumping up a line if reched the line start)
nnoremap <C-@> <BACKSPACE>
