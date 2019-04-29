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
set colorcolumn=120
set textwidth=120
set number relativenumber
map <leader>s :source ~/.vimrc<CR>
" hide buffers instead of closing them
set hidden
"something useful
set history=100
" do not save dos files as unix files:
set nobinary
"indentation
filetype indent on
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
"highlight found words
set hlsearch
"showcase matching paranthesis
set showmatch
set encoding=utf-8

"lightline plugin config
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
      \ },
      \ 'inactive': {
      \   'left' : [ [ 'relativepath' ] ]
      \ },
      \ 'colorscheme': 'wombat'
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

"CtrlP :
" search all the files
let g:ctrlp_max_files = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|bake|build)$',
  \ 'file': '\v\.(so|a|d|o)$',
  \ }

"window-swap - no config here

"targets - no config here

"vim-markdown - no config here (the only button is <leader>e)


" My own stuff:

" use system clipboard
set clipboard=unnamed
" $ sudo apt install vim-gtk
" adds +xterm_clipboard so that one can use + and * registers
" Use :bn, :bp, :b #, :b name, and ctrl-6 to switch between buffers. 
" I like ctrl-6 myself (alone it switches to the previously used buffer, 
" or #ctrl-6 switches to buffer number #).
" Use :ls to list buffers, or a plugin like MiniBufExpl or BufExplorer.
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <leader>l :nohl<CR><C-l>
" new splits appear to the right/down
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
" TODO check if this even works
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" save code folds on exit
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent! loadview
" easier way to go up a line (equivalent to - and to k^)
nnoremap <leader><CR> -
" an alternative to backspace
" (go back a symbol, jumping up a line if reched the line start)
nnoremap <C-@> <BACKSPACE>
" A command for saving a file:
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command! -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
inoremap <C-S> <Esc>:Update<CR>
" highlight the current line
set cursorline
" <leader>tn - Toggle Numbers - toggle between relative/absolute numbers
nnoremap <silent> <leader>tn :set relativenumber!<CR>
" set up folding
set foldmethod=syntax
set foldlevel=1
" drop the ctrl-p in the insert mode (pastes some garbage)
inoremap <C-p> <Nop>
" <F3> will source current file
nnoremap <F3> :source %<CR>
" <S-Y> copies till the end of the line, similar to <S-C> and <S-D>
nnoremap <S-Y> y$
nnoremap gb gT
inoremap <leader>. ->

" make all text bold:
"highlight MyGroup cterm=bold
"match MyGroup /./
