set nocompatible               " be iMproved
filetype off                   " required!
filetype plugin on

set noshowmode

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set noai
set spell
set rtp+=~/.vim/bundle/vundle/
set tw=80
call vundle#rc()

set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\

"set guifont=Monaco\ for\ Powerline:h16

" Vundle> Utilities
Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'jdevera/vim-protobuf-syntax'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/powerline-fonts'
Bundle 'mileszs/ack.vim'
Bundle 'tsaleh/vim-align'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'sjl/splice.vim'
Bundle 'kana/vim-textobj-user'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'kien/ctrlp.vim'
Bundle 'airblade/vim-rooter'
Bundle 'ervandew/supertab'
Bundle 'vim-scripts/sudo.vim'
" Bundle 'derekwyatt/vim-scala'
if has('mac')
  Bundle 'rafaelfranca/rtf_pygmentize'
endif
Bundle 'int3/vim-extradite'
Bundle 'dharanasoft/rtf-highlight'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
" Bundle 'kchmck/vim-coffee-script'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'tpope/vim-markdown'
if has('ruby')
"Bundle 'vim-scripts/rubycomplete.vim'
end
Bundle 'tangledhelix/vim-octopress'
"Bundle 'Rip-Rip/clang_complete'
"Bundle 'itszero/javacomplete'
Bundle 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'jnwhiteh/vim-golang'
Bundle 'Blackrush/vim-gocode.git'
" Vundle> lang-independent or multi-lang supported utilities
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/vim-space'
" Bundle 'scrooloose/syntastic'
" Vundle> Color scheme
Bundle 'altercation/vim-colors-solarized'
colorscheme solarized
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
filetype plugin indent on     " required!

" Save the current file using th sudo command
noremap <Leader>W :w !sudo tee % > /dev/null

" * User Interface

" have syntax highlighting in terminals which can display colours:
set t_Co=256
if has('syntax') && (&t_Co > 2)
  syntax on
endif

" have fifty lines of command-line (etc) history:
set history=50
" remember all of these between sessions, but only 10 search terms; also
" remember info for 10 files, but never any on removable disks, don't remember
" marks in files, don't rehighlight old search patterns, and only save up to
" 100 lines of registers; including @10 in there should restrict input buffer
" but it causes an error for me:
set viminfo=/10,'10,f0,h,\"100

" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full

" use "[RO]" for "[readonly]" to save space in the message line:
set shortmess+=r

" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd

" when using list, keep tabs at their full width and display `arrows':
set listchars-=eol:$ " and no EOL pls
execute 'set listchars+=tab:' . nr2char(187) . nr2char(183)
set listchars+=trail:·
" (Character 187 is a right double-chevron, and 183 a mid-dot.)

" have the mouse enabled all the time:
set mouse=a
" make vim works with mouse dragging
set ttymouse=xterm2

" don't have files trying to override this .vimrc:
set nomodeline

" * Text Formatting -- General

" don't make it look like there are line breaks where there aren't:
set nowrap

" use indents of 2 spaces, and have them copied down lines:
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set autoindent

" get rid of the default style of C comments, and define a style with two stars
" at the start of `middle' rows which (looks nicer and) avoids asterisks used
" for bullet lists being treated like C comments; then define a bullet list
" style for single stars (like already is for hyphens):
set comments-=s1:/*,mb:*,ex:*/
set comments+=s:/*,mb:**,ex:*/
set comments+=fb:*

" treat lines starting with a quote mark as comments (for `Vim' files, such as
" this very one!), and colons as well so that reformatting usenet messages from
" `Tin' users works OK:
set comments+=b:\"
set comments+=n::

" * Text Formatting -- Specific File Formats

" enable filetype detection:
filetype on

" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang set cindent

" for actual C (not C++) programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType c set formatoptions+=ro

" for HTML, generally format text, but if a long line has been created leave it
" alone when editing:
autocmd FileType html set formatoptions+=tl

" for both CSS and HTML, use genuine tab characters for indentation, to make
" files a few bytes smaller:
"autocmd FileType html,css set noexpandtab tabstop=2

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8

" * Search & Replace

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

" show the `best match so far' as search strings are typed:
set incsearch

" Highlight matches
set hlsearch

" assume the /g flag on :s substitutions to replace all matches in a line:
set gdefault

" * Keystrokes -- Moving Around

" have the h and l cursor keys wrap between lines (like <Space> and <BkSpc> do
" by default), and ~ covert case over line breaks; also have the cursor keys
" wrap in insert mode:
set whichwrap=h,l,~,[,]

" use <F6> to cycle through split windows (and <Shift>+<F6> to cycle backwards,
" where possible):
nnoremap <F6> <C-W>w
nnoremap <S-F6> <C-W>W

" use <Ctrl>+N/<Ctrl>+P to cycle through files:
nnoremap <C-N> :next<CR>
nnoremap <C-P> :prev<CR>
" [<Ctrl>+N by default is like j, and <Ctrl>+P like k.]

" have % bounce between angled brackets, as well as t'other kinds:
set matchpairs+=<:>

" have <F1> prompt for a help topic, rather than displaying the introduction
" page, and have it do this from any mode:
nnoremap <F1> :help<Space>
vmap <F1> <C-C><F1>
omap <F1> <C-C><F1>
map! <F1> <C-C><F1>

" * Keystrokes -- Formatting

" use , as leader
let mapleader=","
let maplocalleader="\\"

" have Q reformat the current paragraph (or selected text if there is any):
nnoremap Q gqap
vnoremap Q gq

" have the usual indentation keystrokes still work in visual mode:
vnoremap <C-T> >
vnoremap <C-D> <LT>
vmap <Tab> <C-T>
vmap <S-Tab> <C-D>

" have Y behave analogously to D and C rather than to dd and cc (which is
" already done by yy):
noremap Y y$

" * Keystrokes -- Toggles

" Keystrokes to toggle options are defined here.  They are all set to normal
" mode keystrokes beginning \st but some function keys (which won't work in all
" terminals) are also mapped.

" have \stp ("toggle paste") toggle paste on/off and report the change, and
" where possible also have <F4> do this both in normal and insert mode:
nnoremap \stp :set invpaste paste?<CR>
nmap <F4> \stp
imap <F4> <C-O>\stp
set pastetoggle=<F4>

" have \tf ("toggle format") toggle the automatic insertion of line breaks
" during typing and report the change:
nnoremap \stf :if &fo =~ 't' <Bar> set fo-=t <Bar> else <Bar> set fo+=t <Bar>
  \ endif <Bar> set fo?<CR>
nmap <F3> \stf
imap <F3> <C-O>\stf

" have \tl ("toggle list") toggle list on/off and report the change:
nnoremap \stl :set invlist list?<CR>
nmap <F2> \stl

" have \th ("toggle highlight") toggle highlighting of search matches, and
" report the change:
nnoremap \sth :set invhls hls?<CR>

" * Keystrokes -- Insert Mode

" allow <BkSpc> to delete line breaks, beyond the start of the current
" insertion, and over indentations:
set backspace=eol,start,indent

" have <Tab> (and <Shift>+<Tab> where it works) change the level of
" indentation:
inoremap <Tab> <C-T>
inoremap <S-Tab> <C-D>
" [<Ctrl>+V <Tab> still inserts an actual tab character.]

syn match tab display "\t"
hi link tab Error

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.*/

set nocp
filetype plugin on

""nerdtree variables
let NERDTreeWinPos = "left"
let NERDChristmasTree = 1

" Zero's customization goes here.
set guifont=Monaco\ for\ Powerline:h18.00"
" disable ASCII control seq timeout to workaround mintty bug
set notimeout
if !has("gui_running")
  set term=xterm-256color
end

syntax enable
set bg=dark
set t_Co=256
"let g:solarized_termcolors = 16
colors solarized

" Handle multiple buffers better
set hidden
set wildmenu

" Show line numbers
set nu
" highlight current line
set cursorline
" Show cursor pos.
set ruler

" Show 3 lines of context around the cursor
set scrolloff=3

" Set terminal's title
set title

" use visual bell
set visualbell

" no backup, pls.
set nobackup
set nowritebackup

" Keep swap files in one location
set directory=$HOME/.vim/tmp//,.

" Show the status line all the time
set laststatus=2

" Tab mappings.
map <leader>tN :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

nmap <F9> :NERDTreeToggle<cr>

set exrc   "enable per-directory .vimrc
set secure "disable unsafe commands in local .vimrc

" auto filetype settings
autocmd FileType ruby setlocal foldmethod=syntax
autocmd FileType css  setlocal foldmethod=indent
autocmd FileType markdown setlocal formatoptions+=t
autocmd FileType octopress setlocal formatoptions+=t
autocmd FileType tex setlocal formatoptions+=t

autocmd BufRead,BufNewFile *.markdown set filetype=octopress

autocmd FileType markdown  set spell
autocmd FileType octopress set spell
autocmd FileType tex set spell


set completeopt=longest,menuone,preview

set list
set modelines=0
set noeol
set numberwidth=5
set noswapfile

set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,
               \*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc

" some cool triggers :P
au FocusLost    * :silent! wall

au FocusLost    * :set number
au FocusGained  * :set relativenumber

au InsertEnter * :set number
au InsertLeave * :set relativenumber

" cursorline settings
augroup cline
    au!
    au WinLeave * set nocursorline
    au WinEnter * set cursorline
    au InsertEnter * set nocursorline
    au InsertLeave * set cursorline
augroup END

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" normally don't automatically format `text' as it is typed, IE only do this
" with comments, at 79 characters:
set formatoptions-=t
set textwidth=79

" remove toolbar in GUI version
if has("gui_running")
    set guioptions=egmrt
endif

" my key mappings

" clear search matching
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" use ctrl-q to reflow text
map <C-q> {gq}

" clear all trailing spaces
noremap <leader>z :%s/\s\+$//<cr>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" enable system clipboard integration
if has("gui_running")
  set clipboard=unnamed
endif

" enable thrift syntax
au BufRead,BufNewFile *.thrift set filetype=thrift
au! Syntax thrift source ~/.vim/syntax/thrift.vim

" plugins
"
" > powerline
"let g:Powerline_theme="skwp"
"let g:Powerline_colorscheme="skwp"
let g:Powerline_symbols = 'fancy'
" show me trailer whitespace is found in current buffer
call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')
" > ack
nnoremap <leader>a :Ack!<space>
nmap <F9> :NERDTreeToggle<cr>
" > CtrlP
let g:ctrlp_open_multiple_files = 't'
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
" > rubycomplete
"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
"autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
"autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
"autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"highlight Pmenu ctermbg=238 gui=bold
" > supertab
let g:SuperTabDefaultCompletionType = "context"
" > javacomplete
autocmd FileType java set omnifunc=javacomplete#Complete
" > rtf-pygmentize
let g:rtfp_theme = 'tango'
let g:rtfp_font  = 'Monaco'
" > latex
let g:tex_flavor = 'latex'
if has("mac")
  let g:LatexBox_viewer = 'open -a Skim'
endif
let g:LatexBox_latexmk_options = "-pv"
autocmd FileType tex call SuperTabSetDefaultCompletionType("<c-x><c-o>")
map <silent> <Leader>ls :silent !/Applications/Skim.app/Contents/SharedSupport/displayline
  \ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>" "%:p" <CR>
">> golang
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
autocmd FileType go autocmd BufWritePre <buffer> Fmt
"autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
let g:SuperTabDefaultCompletionType = "context"
