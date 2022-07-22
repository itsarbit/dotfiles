set nocompatible               " be iMproved
filetype off                   " required!
filetype plugin on

set noshowmode

set splitright
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set noai
set spell
set colorcolumn=80
set tw=79

set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set nofoldenable



call plug#begin('~/.vim/plugged')
""" python
" Plug 'klen/python-mode'
Plug 'davidhalter/jedi-vim'
autocmd FileType python call jedi#configure_call_signatures()
" Plug 'python-mode/python-mode'
let g:pymode_rope=0
" let g:pymode_python = 'python3'
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction
Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

Plug 'rhysd/vim-grammarous'
let g:grammarous#default_comments_only_filetypes = {
            \ '*' : 1, 'help' : 0, 'markdown' : 0,
            \ }
Plug 'zxqfl/tabnine-vim'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
autocmd FileType bzl,bazel AutoFormatBuffer buildifier
Plug 'google/vim-glaive'
Plug 'bazelbuild/vim-bazel'
Plug 'majutsushi/tagbar'
Plug 'jdevera/vim-protobuf-syntax'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='solarized'
Plug 'Lokaltog/powerline-fonts'
Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
Plug 'tsaleh/vim-align'
""" GIT
Plug 'tpope/vim-fugitive'
Plug 'int3/vim-extradite'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'

""" Java
Plug 'udalov/kotlin-vim'


Plug 'scrooloose/nerdtree'
Plug 'sjl/splice.vim'
Plug 'kana/vim-textobj-user'
Plug 'michaeljsmith/vim-indent-object'
" Plug 'nelstrom/vim-textobj-rubyblock'
" Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:45%'
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
let g:fzf_colors =
\ { "fg":      ["fg", "Normal"],
  \ "bg":      ["bg", "Normal"],
  \ "hl":      ["fg", "IncSearch"],
  \ "fg+":     ["fg", "CursorLine", "CursorColumn", "Normal"],
  \ "bg+":     ["bg", "CursorLine", "CursorColumn"],
  \ "hl+":     ["fg", "IncSearch"],
  \ "info":    ["fg", "IncSearch"],
  \ "border":  ["fg", "Ignore"],
  \ "prompt":  ["fg", "Comment"],
  \ "pointer": ["fg", "IncSearch"],
  \ "marker":  ["fg", "IncSearch"],
  \ "spinner": ["fg", "IncSearch"],
  \ "header":  ["fg", "WildMenu"] }
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'Ignore'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'EndOfBuffer'] }
Plug 'airblade/vim-rooter'
Plug 'ervandew/supertab'
Plug 'vim-scripts/sudo.vim'
" Force saving files that require root permission
" Plug 'derekwyatt/vim-scala'
if has('mac')
  Plug 'rafaelfranca/rtf_pygmentize'
  Plug 'dharanasoft/rtf-highlight'
endif
" Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
if has('ruby')
  Plug 'vim-scripts/rubycomplete.vim'
  Plug 'ecomba/vim-ruby-refactoring'
  Plug 'tpope/vim-endwise'
end
" Plug 'Rip-Rip/clang_complete'
" Plug 'LaTeX-Box-Team/LaTeX-Box'
" Vundle> lang-independent or multi-lang supported utilities
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'jstemmer/gotags'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
" Plug 'scrooloose/vim-space'
Plug 'vim-syntastic/syntastic'
Plug 'dense-analysis/ale'
" Vundle> Color scheme
Plug 'altercation/vim-colors-solarized'
"
call plug#end()

" Save the current file using th sudo command
noremap <Leader>W :w !sudo tee % > /dev/null

" * User Interface

" have syntax highlighting in terminals which can display colours:
set t_Co=256
if has('syntax') && (&t_Co > 2)
  syntax on
endif

" have fifty lines of command-line (etc) history:
set history=100
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

" use indents of 4 spaces, and have them copied down lines:
set tabstop=4
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
noremap Y "*y


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

" git viewer buffer
map <leader>gg :Extradite!<cr>
let g:extradite_width = 40

nmap <F9> :NERDTreeToggle<cr>
nmap <F8> :TagbarToggle<cr>

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
" set noeol
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
set clipboard=unnamed

" enable thrift syntax
au BufRead,BufNewFile *.thrift set filetype=thrift
au! Syntax thrift source ~/.vim/syntax/thrift.vim

" plugins
"
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
    \}
let g:SuperTabDefaultCompletionType = "context"


au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
" au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

set foldlevelstart=20
au BufNewFile,BufRead *.hql set filetype=hive expandtab
au BufNewFile,BufRead *.q set filetype=hive expandtab

""" Git setup
" Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_override_sign_column_highlight = 1
highlight SignColumn guibg=bg
highlight SignColumn ctermbg=bg
" Update sign column every 2 second
" set updatetime=2000
" Jump between hunks
nmap <Leader>gn <Plug>(GitGutterNextHunk)
nmap <Leader>gp <Plug>(GitGutterPrevHunk)
" Hunk-add and hunk-revert for chunk staging
nmap <Leader>ga <Plug>(GitGutterStageHunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)
" Open vimagit pane
nnoremap <leader>gs :Magit<CR>       " git status
" Show commits for every source line
nnoremap <Leader>gb :Git blame<CR>  " git blame
" Add the entire file to the staging area
nnoremap <Leader>gaf :Gw<CR>      " git add file


let g:ale_sign_column_always=1
let g:ale_sign_error='??'
let g:ale_sign_warning='--'
highlight clear ALEErrorSign
highlight clear ALEWarningSign

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'


noremap <leader>f :Files<cr>
nnoremap <C-p> :Files<CR>
nmap <leader>fg :GFiles<CR>
nmap <leader>fgs :GFiles?<CR>
nmap <leader>fg :Commits<CR>
nmap <leader>fgc :BCommits<CR>

nmap <leader>bb :Bazel build
nmap <leader>bt :Bazel test
nmap <leader>bba :Bazel build //aircell/...<cr>
nmap <leader>bta :Bazel test //aircell/...<cr>
nmap <leader>bbap :Bazel build //aircell/provision/...<cr>
nmap <leader>btap :Bazel test //aircell/provision/...<cr>
