" Vimrc
" DZ

set nocompatible
filetype off "required for neobundle
let $GIT_SSL_NO_VERIFY = 'true' " required for bad ssl certs
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set runtimepath+=/usr/local/bin
let s:darwin = has('mac')

call plug#begin('~/.vim/installed')

" Core stuff
Plug 'vim-scripts/L9'
Plug 'qpkorr/vim-bufkill'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'Raimondi/delimitMate'
Plug 'vim-scripts/matchit.zip'
Plug 'sjl/gundo.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'tpope/vim-eunuch'
Plug 'jaxbot/semantic-highlight.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Dkendal/fzy-vim'

" lol
Plug 'junegunn/vim-emoji'

" Journal
Plug 'junegunn/vim-journal'

" Javascript
Plug 'othree/yajs.vim'

" HTML/CSS
Plug 'kchmck/vim-coffee-script'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-haml'
Plug 'tudorprodan/html_annoyance.vim'

" Ruby/Rails
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'

"VCL
Plug 'smerrill/vcl-vim-plugin'

call plug#end()

filetype plugin indent on
filetype on

syntax enable
syntax on
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
color ir_black
set shm=atI "disable intro screen
set mouse=a
set virtualedit=onemore
set history=1000
set nofoldenable " disable code folding
set display=lastline,uhex
set switchbuf=useopen

set hls!

set backup
set backupdir=$HOME/.vimbackup//
set directory=$HOME/.vimswap//
" Create directories if they don't exist
silent execute '!mkdir -p $HOME/.vimbackup'
silent execute '!mkdir -p $HOME/.vimswap'

"typos sucks
command! -bang -nargs=* W w<bang> <args>
command! -bang -nargs=* Q q<bang> <args>
command! -bang -nargs=* Wq wq<bang> <args>
command! -bang -nargs=* WQ wq<bang> <args>

set showmode " display the current mode
set showcmd
set wildmode=longest,list,full
set wildmenu
set completeopt=menu

set wildignore+=*.o,*.fasl,CVS,*.pyc,._*,.DS_Store,*~,*.gif,*.jpg,*.png,*.pdf,*.psd,*.svn,.svn,.git,.hg

set ruler
set number
set nuw=4
set vb "set visual bell
set backspace=indent,eol,start
set laststatus=2
set showmatch

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set bs=2

" leader keys shoudln't itmeout
set ttimeout
set notimeout
set ttimeoutlen=0

"change softwrap to sane setting
set wrap linebreak textwidth=0

"set mapleader
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" allow buffers to be fully squashed
set winminheight=0
set hidden

nnoremap ' `
nnoremap ` '

" clear the annoying search highlights
nnoremap \\ :noh<return>

" Remap control-g to esc
map <C-g> <esc>
noremap <C-g> <esc>
cnoremap <C-g> <C-C><esc>

"scrolling offset
set scrolloff=5
set shortmess=atI

"turn off middleclicking
noremap <MiddleMouse> <LeftMouse>
noremap <2-MiddleMouse> <LeftMouse>
noremap <3-MiddleMouse> <LeftMouse>
noremap <4-MiddleMouse> <LeftMouse>

"Set to auto read when a file is changed from the outside
set autoread

" sudo write
map w! w !sudo tee % >/dev/null

" if i indent in visual mode, i want to remain in visual mode
vnoremap < <gv
vnoremap > >gv

"map control/command arrows for moving between windows
map <C-up> <C-W><up>
map <C-down> <C-W><down>
map <C-left> <C-W><left>
map <C-right> <C-W><right>
nnoremap <Leader><up> <C-W><up>
nnoremap <Leader><down> <C-W><down>
nnoremap <Leader><left> <C-W><left>
nnoremap <Leader><right> <C-W><right>
nnoremap <Leader>k <C-W><up>
nnoremap <Leader>j <C-W><down>
nnoremap <Leader>h <C-W><left>
nnoremap <Leader>l <C-W><right>

"map window manipulation to match emacs
nnoremap <Leader>1 :only<cr>
nnoremap <Leader>0 :close<cr>
nnoremap <Leader>2 :sp<cr>
nnoremap <Leader>3 :vsp<cr>

" In terminal mode, make escape key exit
tnoremap <Esc> <C-\><C-n>
let g:terminal_scrollback_buffer_size = 100000

command! SmartHomeKey call SmartHomeKey()
function! SmartHomeKey()
  let l:lnum	=	line('.')
  let l:ccol	=	col('.')
  execute 'normal! ^'
  let l:fcol	=	col('.')
  execute 'normal! 0'
  let l:hcol	=	col('.')
  if l:ccol != l:fcol
    call cursor(l:lnum, l:fcol)
  else
    call cursor(l:lnum, l:hcol)
  endif
endfun

" map CTRL-E to end-of-line (insert mode)
map <C-e> <esc>$<right><esc>
imap <C-e> <esc>$i<right>
" map CTRL-A to beginning-of-line (insert mode)
map <C-a> <esc>:SmartHomeKey<CR><esc>
imap <C-a> <esc>:SmartHomeKey<CR>i

ab teh the
ab fro for

set incsearch
set ignorecase
set wrapscan
set smartcase

"No scrollbars
set guioptions-=L
set guioptions-=l
set guioptions-=R
set guioptions-=r

"easily equalize windows with plus
nmap + <c-w>=

"tab key in normal mode autoindents
nmap <tab> ==
"if we rebind tab though, we need to also rebind <C-i> to something else
"so we can still use the jumplist
nnoremap <C-p> <C-i>

"fast file switching
map <C-q> <esc>:b#<esc>
nmap <C-q> <esc>:b#<cr>
noremap <C-q> <esc>:b#<cr>
noremap! <C-q> <esc>:b#<cr>

map <Leader>t :NERDTreeToggle<cr>
map <Leader>m :NERDTreeToggle<cr>
" open nerdtree focused on the existing file
map <Leader>n :NERDTreeFind<cr>

"NERDTree options
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeWinSize=51
let NERDTreeQuitOnOpen=1

" explorer options
let g:netrw_liststyle=3

" filebeagle
let g:filebeagle_suppress_keymaps = 1
let g:filebeagle_check_gitignore = 1
map <silent> <Leader>o  <Plug>FileBeagleOpenCurrentBufferDir
map <silent> <Leader>O  <Plug>FileBeagleOpenCurrentWorkingDir
map <silent> -          <Plug>FileBeagleOpenCurrentBufferDir

" Fugitive options
" if a fugitive buffer is hidden, just go ahead and delete it
autocmd BufReadPost fugitive://* set bufhidden=delete

"vim indent guide options
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 1

"yankring options
let g:yankring_enabled = 1
let g:yankring_max_history = 1000
let g:yankring_max_display = 100
let g:yankring_ignore_duplicate = 1

"Gundo options
nnoremap <leader>u :GundoToggle<CR>

"bufkill options
let g:BufKillActionWhenBufferDisplayedInAnotherWindow = "kill"
let g:BufKillActionWhenModifiedFileToBeKilled = "fail"
let g:BufKillCreateMappings = 0
noremap <C-k> :BD<CR>
noremap! <C-k> <esc>:BD<cr>
noremap <Leader>k :BD<CR>

" strip whitespace
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

"ensure no tabs
autocmd BufWritePre * :set expandtab

"fzf options
let $FZF_DEFAULT_OPTS = '--exact --cycle --reverse --inline-info'
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()
let g:fzf_layout = { 'window': 'enew', 'down': '~40%' }
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let $FZF_DEFAULT_COMMAND='ag -l -g ""'
autocmd VimEnter * command! Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'})
" fzf keybindings
nnoremap <silent> <leader>e :GitFiles<CR>
nnoremap <silent> <leader>/ :BLines<CR>
nnoremap <silent> <leader>E :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>r :History<CR>
nnoremap <silent> <leader>f :Ag<CR>

function! s:gitgrep_to_qf(line)
  let parts = split(a:line, ':')
  return {'filename': parts[0], 'lnum': parts[1], 'col': 0,
        \ 'text': join(parts[2:], ':')}
endfunction

function! s:gitgrep_handler(lines)
  if len(a:lines) < 2
    return
  endif

  let cmd = get(get(g:, 'fzf_action', s:default_action), a:lines[0], 'e')
  let list = map(a:lines[1:], 's:gitgrep_to_qf(v:val)')

  let first = list[0]
  execute cmd s:escape(first.filename)
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction

command! -nargs=* G call fzf#run({
  \ 'source':  printf('git grep --line-number "%s"',
  \                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\-')),
  \ 'sink*':    function('<sid>gitgrep_handler'),
  \ 'options': '--expect=ctrl-t,ctrl-v,ctrl-x --ansi --delimiter : --nth 4..,.. --prompt "GitGrep> " '.
  \            '--multi --bind ctrl-s:select-all,ctrl-d:deselect-all '.
  \            '--color hl:68,hl+:110',
  \ 'down':    '50%'
  \ })


" LANGUAGE OPTIONS
"
"syntax color options for various languages

"syntax coloring for apache log files
autocmd BufRead,BufNewFile *access.log* set filetype=httplog
autocmd BufRead,BufNewFile *.tumblr.html setfiletype=tumblr

" these are all html really
autocmd BufRead,BufNewFile *.ss set filetype=html
autocmd BufRead,BufNewFile *.fbml set filetype=html
autocmd BufRead,BufNewFile *.lbi set filetype=html
autocmd BufRead,BufNewFile *.dtpl set filetype=html

"Google Go
autocmd BufRead,BufNewFile *.go set filetype=go

"LOLCODE
autocmd BufRead,BufNewFile *.lol set filetype=lolcodtpl

"I edit actionscript files, not atlas files, whatever the hell they are
autocmd BufRead,BufNewFile *.as set filetype=actionscript

"Json is still javascript
au BufNewFile,BufRead  *.json set filetype=javascript


"language specific options
"
"PHP
let php_sql_query=1
let php_baselib=1
let php_htmlInStrings=1
let PHP_BracesAtCodeLevel = 0
let PHP_removeCRwhenUnix = 1
let php_noShortTags = 1

"Python
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
let g:pyflakes_user_quickfix = 0
autocmd BufRead,BufNewFile *.py set autoindent
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class

"Ruby
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

"HTML
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
"matchtagalways
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'eruby': 1
    \}

"CSS
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS

"Javascript
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" Use Node.js for JavaScript interpretation
let javascript_enable_domhtmlcss=1
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:tagbar_type_coffee = {
  \ 'kinds' : [
  \   'f:functions',
  \   'o:object'
  \ ],
  \ 'kind2scope' : {
  \  'f' : 'object',
  \   'o' : 'object'
  \},
  \ 'sro' : ".",
  \ 'ctagsbin' : 'coffeetags',
  \ 'ctagsargs' : '--include-vars '
  \}

" Markdown
let g:tagbar_type_markdown = {
  \ 'ctagstype' : 'markdown',
  \ 'kinds' : [
    \ 'h:Heading_L1',
    \ 'i:Heading_L2',
    \ 'k:Heading_L3'
  \ ]
\ }
