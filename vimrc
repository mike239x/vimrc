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
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

"NERDtree plugin config
let NERDTreeMapActivateNode='<space>'
nmap <leader>tt :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
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

"Tagbar
nmap <silent> <leader>tb :Tagbar<CR>
nmap <silent> <leader>o :TagbarOpenAutoClose<CR>

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
set foldlevel=3
" drop the ctrl-p in the insert mode (pastes some garbage)
inoremap <C-p> <Nop>
" <F3> will source current file
nnoremap <F3> :source %<CR>
" <S-Y> copies till the end of the line, similar to <S-C> and <S-D>
nnoremap <S-Y> y$
nnoremap gb gT
inoremap <leader>. ->
nnoremap yp yyp

" jump between folds
nnoremap <silent> <leader>zj :call NextClosedFold('j')<cr>
nnoremap <silent> <leader>zk :call NextClosedFold('k')<cr>
function! NextClosedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" make all text bold:
"highlight MyGroup cterm=bold
"match MyGroup /./

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"syntax match keyword "\<lambda\>" conceal cchar=λ
"syntax match keyword ">=" conceal cchar=≥
"syntax match keyword "<=" conceal cchar=≤
"" TODO add space after ⇒  somehow...
"syntax match keyword "=>" conceal cchar=⇒
"syntax match keyword "==" conceal cchar=＝
"syntax match keyword "!=" conceal cchar=≠
"set conceallevel=1

" ignore case when searching by default, 
" toggle with `set ic!`
set ignorecase

" code formatting for C++
au FileType cpp setlocal formatexpr= formatprg=clang-format-7\ -style=file
