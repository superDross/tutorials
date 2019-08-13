let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <expr> <Plug>_ deoplete#mapping#_dummy_complete()
cnoremap <silent> <Plug>(ale_show_completion_menu) <Nop>
inoremap <silent> <Plug>(ale_show_completion_menu) 
imap <S-Tab> <Plug>SuperTabBackward
inoremap <C-Tab> 	
inoremap <Right> <Nop>
inoremap <Left> <Nop>
inoremap <Down> <Nop>
inoremap <Up> <Nop>
nnoremap  :tabprevious
nnoremap <NL> :tabprevious
nnoremap  :tabnext
nnoremap  :tabnext
nnoremap  :vs
nnoremap  :sp
nnoremap   za
inoremap ç :call JumpToDef()
xmap S <Plug>VSurround
map \rwp <Plug>RestoreWinPosn
map \swp <Plug>SaveWinPosn
vmap \rv <Plug>RunViewV
vmap \rh <Plug>RunViewH
nnoremap \t :bo new|terminal ++curwin ++rows=15
nnoremap \a :Ack! 
nnoremap \f :FZF
nnoremap \s :exec 'source $VIMRC'
noremap \0 :tablast
noremap \9 9gt
noremap \8 8gt
noremap \7 7gt
noremap \6 6gt
noremap \5 5gt
noremap \4 4gt
noremap \3 3gt
noremap \2 2gt
noremap \1 1gt
nnoremap <silent> \ T
nnoremap <silent> \k :ALEPrevious
nnoremap <silent> \j :ALENext
nnoremap <silent> \o : NERDTreeFind
nmap cS <Plug>CSurround
nmap cs <Plug>Csurround
nmap ds <Plug>Dsurround
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
vmap <silent> gL <Plug>VLionLeft
nmap <silent> gL <Plug>LionLeft
vmap <silent> gl <Plug>VLionRight
nmap <silent> gl <Plug>LionRight
xmap gS <Plug>VgSurround
onoremap il' :normal! F(vi(
onoremap in' :normal! f(vi(
onoremap il" :normal! F(vi(
onoremap in" :normal! f(vi(
onoremap il{ :normal! F(vi(
onoremap in{ :normal! f(vi(
onoremap il[ :normal! F(vi(
onoremap in[ :normal! f(vi(
onoremap il( :normal! F(vi(
onoremap in( :normal! f(vi(
nmap ySS <Plug>YSsurround
nmap ySs <Plug>YSsurround
nmap yss <Plug>Yssurround
nmap yS <Plug>YSurround
nmap ys <Plug>Ysurround
nnoremap <SNR>74_: :=v:count ? v:count : ''
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())
nnoremap <silent> <Plug>LionRepeat .
nnoremap <silent> <Plug>SurroundRepeat .
nmap <silent> <Plug>RestoreWinPosn :call RestoreWinPosn()
nmap <silent> <Plug>SaveWinPosn :call SaveWinPosn()
nnoremap <silent> <Plug>(ale_hover) :ALEHover
nnoremap <silent> <Plug>(ale_find_references) :ALEFindReferences
nnoremap <silent> <Plug>(ale_go_to_definition_in_tab) :ALEGoToDefinitionInTab
nnoremap <silent> <Plug>(ale_go_to_definition) :ALEGoToDefinition
nnoremap <silent> <Plug>(ale_fix) :ALEFix
nnoremap <silent> <Plug>(ale_detail) :ALEDetail
nnoremap <silent> <Plug>(ale_lint) :ALELint
nnoremap <silent> <Plug>(ale_reset_buffer) :ALEResetBuffer
nnoremap <silent> <Plug>(ale_disable_buffer) :ALEDisableBuffer
nnoremap <silent> <Plug>(ale_enable_buffer) :ALEEnableBuffer
nnoremap <silent> <Plug>(ale_toggle_buffer) :ALEToggleBuffer
nnoremap <silent> <Plug>(ale_reset) :ALEReset
nnoremap <silent> <Plug>(ale_disable) :ALEDisable
nnoremap <silent> <Plug>(ale_enable) :ALEEnable
nnoremap <silent> <Plug>(ale_toggle) :ALEToggle
nnoremap <silent> <Plug>(ale_last) :ALELast
nnoremap <silent> <Plug>(ale_first) :ALEFirst
nnoremap <silent> <Plug>(ale_next_wrap) :ALENextWrap
nnoremap <silent> <Plug>(ale_next) :ALENext
nnoremap <silent> <Plug>(ale_previous_wrap) :ALEPreviousWrap
nnoremap <silent> <Plug>(ale_previous) :ALEPrevious
onoremap <silent> <Plug>(ale_show_completion_menu) <Nop>
vnoremap <silent> <Plug>(ale_show_completion_menu) <Nop>
nnoremap <silent> <Plug>(ale_show_completion_menu) :call ale#completion#RestoreCompletionOptions()
nnoremap <Right> <Nop>
nnoremap <Left> <Nop>
nnoremap <Down> <Nop>
nnoremap <Up> <Nop>
noremap <F9> :set hlsearch! hlsearch?
nnoremap <F8> :TagbarToggle
nnoremap <F6> :call VimCheat() 
noremap <F5> :call KeyCheat() 
nnoremap <F4> :NERDTreeToggle
nnoremap <F3> :ALEFix
imap  class Something():def __init__(self, x):self.x = x
imap S <Plug>ISurround
imap s <Plug>Isurround
imap 	 <Plug>SuperTabForward
cnoremap <expr>  traces#check_b() ? "\\=traces#get_pfile()\" : "\\\"
cnoremap <expr>  traces#check_b() ? "\\=traces#get_cfile()\" : "\\\"
cnoremap <expr>  traces#check_b() ? "\\=traces#get_cWORD()\" : "\\\"
cnoremap <expr>  traces#check_b() ? "\\=traces#get_cword()\" : "\\\"
cnoremap <expr>  traces#check_b() ? "\\=traces#get_pfile()\" : "\\\"
cnoremap <expr>  traces#check_b() ? "\\=traces#get_cfile()\" : "\\\"
cnoremap <expr>  traces#check_b() ? "\\=traces#get_cWORD()\" : "\\\"
cnoremap <expr>  traces#check_b() ? "\\=traces#get_cword()\" : "\\\"
cnoremap <expr>  traces#check_b() ? traces#get_pfile() : "\\"
cnoremap <expr>  traces#check_b() ? traces#get_cfile() : "\\"
cnoremap <expr>  traces#check_b() ? traces#get_cWORD() : "\\"
cnoremap <expr>  traces#check_b() ? traces#get_cword() : "\\"
imap  <Plug>Isurround
nnoremap ç :call JumpToDef()
cnoreabbr Ack Ack!
iabbr pudb import pudb;pudb.set_trace()
iabbr pudb_remote from pudb.remote import set_trace; set_trace(term_size=(160, 40),host='0.0.0.0', port=6900)
let &cpo=s:cpo_save
unlet s:cpo_save
set background=dark
set backspace=indent,eol,start
set completeopt=menu
set dictionary=/usr/share/dict/words
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set laststatus=2
set mouse=c
set pastetoggle=<F2>
set printoptions=paper:a4
set ruler
set runtimepath=~/.vim,~/.vim/bundle/Vundle.vim,~/.vim/bundle/vim-gutentags,~/.vim/bundle/tagbar,~/.vim/bundle/deoplete.nvim,~/.vim/bundle/nvim-yarp,~/.vim/bundle/vim-hug-neovim-rpc,~/.vim/bundle/supertab,~/.vim/bundle/ale,~/.vim/bundle/vim-flake8,~/.vim/bundle/shellcheck,~/.vim/bundle/lintr,~/.vim/bundle/Vim-R-plugin,~/.vim/bundle/vim-javascript,~/.vim/bundle/vim-jsx,~/.vim/bundle/vim-polyglot,~/.vim/bundle/nvim-nim,~/.vim/bundle/nerdtree,~/.vim/bundle/vim-nerdtree-tabs,~/.vim/bundle/nerdtree-git-plugin,~/.vim/bundle/indentLine,~/.vim/bundle/vim-fugitive,~/.vim/bundle/vim-mercenary,~/.vim/bundle/vim-markdown-preview,~/.vim/bundle/RunView,~/.vim/bundle/traces.vim,~/.vim/bundle/vim-colorschemes,~/.vim/bundle/vim-colors-paramount,~/.vim/bundle/vim-colors-japanesque,~/.vim/bundle/vim-two-firewatch,~/.vim/bundle/vim-firewatch,~/.vim/bundle/vim-vice,~/.vim/bundle/vim-colors-off,~/.vim/bundle/vim-colors-github,~/.vim/bundle/gruvbox,~/.vim/bundle/vim-surround,~/.vim/bundle/vim-lion,~/.vim/bundle/csv.vim,~/.vim/bundle/emmet-vim,~/.vim/bundle/lightline.vim,~/.vim/bundle/fzf,~/.vim/bundle/ack.vim,~/.vim/bundle/taboo.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim81,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after,~/.vim/bundle/Vundle.vim,~/.vim/bundle/Vundle.vim/after,~/.vim/bundle/vim-gutentags/after,~/.vim/bundle/tagbar/after,~/.vim/bundle/deoplete.nvim/after,~/.vim/bundle/nvim-yarp/after,~/.vim/bundle/vim-hug-neovim-rpc/after,~/.vim/bundle/supertab/after,~/.vim/bundle/ale/after,~/.vim/bundle/vim-flake8/after,~/.vim/bundle/shellcheck/after,~/.vim/bundle/lintr/after,~/.vim/bundle/Vim-R-plugin/after,~/.vim/bundle/vim-javascript/after,~/.vim/bundle/vim-jsx/after,~/.vim/bundle/vim-polyglot/after,~/.vim/bundle/nvim-nim/after,~/.vim/bundle/nerdtree/after,~/.vim/bundle/vim-nerdtree-tabs/after,~/.vim/bundle/nerdtree-git-plugin/after,~/.vim/bundle/indentLine/after,~/.vim/bundle/vim-fugitive/after,~/.vim/bundle/vim-mercenary/after,~/.vim/bundle/vim-markdown-preview/after,~/.vim/bundle/RunView/after,~/.vim/bundle/traces.vim/after,~/.vim/bundle/vim-colorschemes/after,~/.vim/bundle/vim-colors-paramount/after,~/.vim/bundle/vim-colors-japanesque/after,~/.vim/bundle/vim-two-firewatch/after,~/.vim/bundle/vim-firewatch/after,~/.vim/bundle/vim-vice/after,~/.vim/bundle/vim-colors-off/after,~/.vim/bundle/vim-colors-github/after,~/.vim/bundle/gruvbox/after,~/.vim/bundle/vim-surround/after,~/.vim/bundle/vim-lion/after,~/.vim/bundle/csv.vim/after,~/.vim/bundle/emmet-vim/after,~/.vim/bundle/lightline.vim/after,~/.vim/bundle/fzf/after,~/.vim/bundle/ack.vim/after,~/.vim/bundle/taboo.vim/after
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,terminal,tabpages,globals
set shiftwidth=2
set noshowmode
set softtabstop=2
set statusline=%{gutentags#statusline()}
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set tabline=%!TabooTabline()
set tabstop=2
set undodir=~/.vim/vimundo/
set undofile
set undolevels=10000000
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
let NERDTreeMapPreviewSplit = "gi"
let NERDTreeShowHidden = "0"
let SuperTabDefaultCompletionType = "<C-X><C-O>"
let NERDTreeMapCloseChildren = "X"
let NERDTreeMapToggleZoom = "A"
let SuperTabLongestHighlight =  0 
let NERDTreeMapCloseDir = "x"
let SuperTabMappingTabLiteral = "<c-tab>"
let NERDTreeMapRefresh = "r"
let SuperTabRetainCompletionDuration = "insert"
let SuperTabUndoBreak =  0 
let NERDTreeBookmarksFile = "/home/davidr/.NERDTreeBookmarks"
let NERDTreeMapToggleHidden = "I"
let NERDTreeWinSize = "31"
let SuperTabCrMapping =  0 
let SuperTabCompleteCase = "inherit"
let Taboo_tabs = "2	actions\n5	reducer\n"
let NERDTreeNotificationThreshold = "100"
let NERDTreeMapActivateNode = "o"
let NERDTreeMinimalUI = "0"
let NERDTreeWinPos = "left"
let NERDTreeDirArrowExpandable = "▸"
let NERDTreeMapMenu = "m"
let NERDTreeStatusline = "%{exists('b:NERDTree')?b:NERDTree.root.path.str():''}"
let NERDTreeMapOpenInTabSilent = "T"
let NERDTreeMapHelp = "?"
let NERDTreeSortHiddenFirst = "1"
let NERDTreeMapJumpParent = "p"
let NERDTreeMapToggleFilters = "f"
let SuperTabMappingForward = "<tab>"
let NERDTreeMapJumpLastChild = "J"
let SuperTabContextDefaultCompletionType = "<c-p>"
let NERDTreeCascadeOpenSingleChildDir = "1"
let NERDTreeMapJumpPrevSibling = "<C-k>"
let NERDTreeShowBookmarks = "0"
let NERDTreeRemoveDirCmd = "rm -rf "
let NERDTreeMouseMode = "1"
let NERDTreeChDirMode = "0"
let NERDTreeCreatePrefix = "silent"
let NERDTreeShowGitStatus =  1 
let NERDTreeAutoCenterThreshold = "3"
let NERDTreeShowFiles = "1"
let NERDTreeCaseSensitiveSort = "0"
let SimpylFold_docstring_preview =  1 
let NERDTreeMapPrevHunk = "[c"
let NERDTreeHijackNetrw =  0 
let NERDTreeCascadeSingleChildDir = "1"
let NERDTreeShowLineNumbers = "0"
let NERDTreeBookmarksSort = "1"
let NERDTreeHighlightCursorline = "1"
let NERDTreeMapOpenInTab = "t"
let NERDTreeRespectWildIgnore = "0"
let NERDTreeMapNextHunk = "]c"
let NERDTreeMapCWD = "CD"
let NERDTreeNaturalSort = "0"
let NERDTreeMapPreviewVSplit = "gs"
let NERDTreeMapToggleBookmarks = "B"
let NERDTreeMapUpdir = "u"
let NERDTreeMapJumpRoot = "P"
let NERDTreeGlyphReadOnly = "RO"
let NERDTreeMapChdir = "cd"
let NERDTreeMarkBookmarks = "1"
let NERDTreeAutoDeleteBuffer =  0 
let NERDTreeMapRefreshRoot = "R"
let SuperTabMappingBackward = "<s-tab>"
let NERDTreeUpdateOnWrite =  1 
let NERDTreeAutoCenter = "1"
let NERDTreeMapPreview = "go"
let NERDTreeMapOpenVSplit = "s"
let SuperTabLongestEnhanced =  0 
let NERDTreeMapDeleteBookmark = "D"
let NERDTreeMapJumpNextSibling = "<C-j>"
let NERDTreeUpdateOnCursorHold =  1 
let SuperTabClosePreviewOnPopupClose =  0 
let NERDTreeCopyCmd = "cp -r "
let NERDTreeMapToggleFiles = "F"
let NERDTreeMapQuit = "q"
let NERDTreeMapChangeRoot = "C"
let NERDTreeSortDirs = "1"
let NERDTreeMapOpenSplit = "i"
let NERDTreeMapOpenExpl = "e"
let NERDTreeMapJumpFirstChild = "K"
let NERDTreeDirArrowCollapsible = "▾"
let NERDTreeMapOpenRecursively = "O"
let NERDTreeDirArrows =  1 
let NERDTreeMapUpdirKeepOpen = "U"
let NERDTreeQuitOnOpen = "0"
let NERDTreeShowIgnoredStatus =  0 
silent only
silent tabonly
cd ~/projects/ReduxSimpleStarter/blog
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 src/index.js
badd +0 src/components/App.js
badd +0 src/reducers/index.js
badd +0 src/components/PostList.js
badd +0 src/actions/index.js
badd +0 src/apis/jsonPlaceholder.js
badd +0 ~/projects/ReduxSimpleStarter/README.md
argglobal
silent! argdel *
set stal=2
tabnew
tabnew
tabnew
tabnew
tabnew
tabnew
tabnext -6
edit src/index.js
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 42 + 30) / 60)
exe '2resize ' . ((&lines * 14 + 30) / 60)
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <Plug>(emmet-anchorize-summary) =emmet#util#closePopup()=emmet#anchorizeURL(1)
inoremap <buffer> <Plug>(emmet-anchorize-url) =emmet#util#closePopup()=emmet#anchorizeURL(0)
inoremap <buffer> <Plug>(emmet-remove-tag) =emmet#util#closePopup()=emmet#removeTag()
inoremap <buffer> <Plug>(emmet-split-join-tag) :call emmet#splitJoinTag()
inoremap <buffer> <Plug>(emmet-toggle-comment) =emmet#util#closePopup()=emmet#toggleComment()
inoremap <buffer> <Plug>(emmet-image-size) =emmet#util#closePopup()=emmet#imageSize()
inoremap <buffer> <Plug>(emmet-move-prev-item) :call emmet#moveNextPrevItem(1)
inoremap <buffer> <Plug>(emmet-move-next-item) :call emmet#moveNextPrevItem(0)
inoremap <buffer> <Plug>(emmet-move-prev) :call emmet#moveNextPrev(1)
inoremap <buffer> <Plug>(emmet-move-next) :call emmet#moveNextPrev(0)
inoremap <buffer> <Plug>(emmet-balance-tag-outword) :call emmet#balanceTag(-1)
inoremap <buffer> <Plug>(emmet-balance-tag-inward) :call emmet#balanceTag(1)
inoremap <buffer> <Plug>(emmet-update-tag) =emmet#util#closePopup()=emmet#updateTag()
inoremap <buffer> <Plug>(emmet-expand-word) =emmet#util#closePopup()=emmet#expandAbbr(1,"")
inoremap <buffer> <Plug>(emmet-expand-abbr) =emmet#util#closePopup()=emmet#expandAbbr(0,"")
vmap <buffer> ,c <Plug>(emmet-code-pretty)
vmap <buffer> ,m <Plug>(emmet-merge-lines)
nmap <buffer> ,A <Plug>(emmet-anchorize-summary)
nmap <buffer> ,a <Plug>(emmet-anchorize-url)
nmap <buffer> ,k <Plug>(emmet-remove-tag)
nmap <buffer> ,j <Plug>(emmet-split-join-tag)
nmap <buffer> ,/ <Plug>(emmet-toggle-comment)
nmap <buffer> ,i <Plug>(emmet-image-size)
nmap <buffer> ,N <Plug>(emmet-move-prev)
nmap <buffer> ,n <Plug>(emmet-move-next)
vmap <buffer> ,D <Plug>(emmet-balance-tag-outword)
nmap <buffer> ,D <Plug>(emmet-balance-tag-outword)
vmap <buffer> ,d <Plug>(emmet-balance-tag-inward)
nmap <buffer> ,d <Plug>(emmet-balance-tag-inward)
nmap <buffer> ,u <Plug>(emmet-update-tag)
nmap <buffer> ,; <Plug>(emmet-expand-word)
vmap <buffer> ,, <Plug>(emmet-expand-abbr)
nmap <buffer> ,, <Plug>(emmet-expand-abbr)
vnoremap <buffer> <Plug>(emmet-code-pretty) :call emmet#codePretty()
vnoremap <buffer> <Plug>(emmet-merge-lines) :call emmet#mergeLines()
nnoremap <buffer> <Plug>(emmet-anchorize-summary) :call emmet#anchorizeURL(1)
nnoremap <buffer> <Plug>(emmet-anchorize-url) :call emmet#anchorizeURL(0)
nnoremap <buffer> <Plug>(emmet-remove-tag) :call emmet#removeTag()
nnoremap <buffer> <Plug>(emmet-split-join-tag) :call emmet#splitJoinTag()
nnoremap <buffer> <Plug>(emmet-toggle-comment) :call emmet#toggleComment()
nnoremap <buffer> <Plug>(emmet-image-size) :call emmet#imageSize()
nnoremap <buffer> <Plug>(emmet-move-prev-item) :call emmet#moveNextPrevItem(1)
nnoremap <buffer> <Plug>(emmet-move-next-item) :call emmet#moveNextPrevItem(0)
nnoremap <buffer> <Plug>(emmet-move-prev) :call emmet#moveNextPrev(1)
nnoremap <buffer> <Plug>(emmet-move-next) :call emmet#moveNextPrev(0)
vnoremap <buffer> <Plug>(emmet-balance-tag-outword) :call emmet#balanceTag(-2)
nnoremap <buffer> <Plug>(emmet-balance-tag-outword) :call emmet#balanceTag(-1)
vnoremap <buffer> <Plug>(emmet-balance-tag-inward) :call emmet#balanceTag(2)
nnoremap <buffer> <Plug>(emmet-balance-tag-inward) :call emmet#balanceTag(1)
nnoremap <buffer> <Plug>(emmet-update-tag) :call emmet#updateTag()
nnoremap <buffer> <Plug>(emmet-expand-word) :call emmet#expandAbbr(1,"")
vnoremap <buffer> <Plug>(emmet-expand-abbr) :call emmet#expandAbbr(2,"")
nnoremap <buffer> <Plug>(emmet-expand-abbr) :call emmet#expandAbbr(3,"")
nnoremap <buffer> <F12> :exec extension_command|exec 'resize 40'
imap <buffer> ,A <Plug>(emmet-anchorize-summary)
imap <buffer> ,a <Plug>(emmet-anchorize-url)
imap <buffer> ,k <Plug>(emmet-remove-tag)
imap <buffer> ,j <Plug>(emmet-split-join-tag)
imap <buffer> ,/ <Plug>(emmet-toggle-comment)
imap <buffer> ,i <Plug>(emmet-image-size)
imap <buffer> ,N <Plug>(emmet-move-prev)
imap <buffer> ,n <Plug>(emmet-move-next)
imap <buffer> ,D <Plug>(emmet-balance-tag-outword)
imap <buffer> ,d <Plug>(emmet-balance-tag-inward)
imap <buffer> ,u <Plug>(emmet-update-tag)
imap <buffer> ,; <Plug>(emmet-expand-word)
imap <buffer> ,, <Plug>(emmet-expand-abbr)
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
set breakindent
setlocal breakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=//%s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'javascript.jsx'
setlocal filetype=javascript.jsx
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
set foldlevel=99
setlocal foldlevel=99
setlocal foldmarker={{{,}}}
set foldmethod=indent
setlocal foldmethod=syntax
setlocal foldminlines=1
set foldnestmax=2
setlocal foldnestmax=2
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetJsxIndent()
setlocal indentkeys=0{,0},0),0],0,,!^F,o,O,e,*<Return>,<>>,<<>,/
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,$
setlocal keywordprg=
set linebreak
setlocal linebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=javascriptcomplete#CompleteJS
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%{lightline#link()}%#LightlineLeft_active_0#%(\ %{lightline#mode()}\ %)%{(&paste)?\"|\":\"\"}%(\ %{&paste?\"PASTE\":\"\"}\ %)%#LightlineLeft_active_0_1#%#LightlineLeft_active_1#%(\ %{fugitive#head()}\ %)%{fugitive#head()!=#\"\"&&((&readonly)||1||(&modified||!&modifiable))?\"|\":\"\"}%(\ %R\ %)%{(&readonly)&&(1||(&modified||!&modifiable))?\"|\":\"\"}%(\ %F\ %)%{(&modified||!&modifiable)?\"|\":\"\"}%(\ %M\ %)%#LightlineLeft_active_1_2#%#LightlineMiddle_active#%=%#LightlineRight_active_2_3#%#LightlineRight_active_2#%(\ %{&ft!=#\"\"?&ft:\"no\ ft\"}\ %)%#LightlineRight_active_1_2#%#LightlineRight_active_1#%(\ %3p%%\ %)%#LightlineRight_active_0_1#%#LightlineRight_active_0#%(\ %3l:%-2v\ %)
setlocal suffixesadd=.js,.jsx
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'javascript.jsx'
setlocal syntax=javascript.jsx
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
let s:l = 10 - ((9 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
10
normal! 0
wincmd w
argglobal
terminal ++curwin ++cols=119 ++rows=14 
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
set breakindent
setlocal breakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=terminal
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != ''
setlocal filetype=
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
set foldlevel=99
setlocal foldlevel=99
setlocal foldmarker={{{,}}}
set foldmethod=indent
setlocal foldmethod=indent
setlocal foldminlines=1
set foldnestmax=2
setlocal foldnestmax=2
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
set linebreak
setlocal linebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal nomodifiable
setlocal nrformats=bin,octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%{lightline#link()}%#LightlineLeft_inactive_0#%(\ %t\ %)%#LightlineLeft_inactive_0_1#%#LightlineMiddle_inactive#%=%#LightlineRight_inactive_1_2#%#LightlineRight_inactive_1#%(\ %3p%%\ %)%#LightlineRight_inactive_0_1#%#LightlineRight_inactive_0#%(\ %3l:%-2v\ %)
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
let s:l = 1 - ((0 * winheight(0) + 7) / 14)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
exe '1resize ' . ((&lines * 42 + 30) / 60)
exe '2resize ' . ((&lines * 14 + 30) / 60)
tabnext
edit src/actions/index.js
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <Plug>(emmet-anchorize-summary) =emmet#util#closePopup()=emmet#anchorizeURL(1)
inoremap <buffer> <Plug>(emmet-anchorize-url) =emmet#util#closePopup()=emmet#anchorizeURL(0)
inoremap <buffer> <Plug>(emmet-remove-tag) =emmet#util#closePopup()=emmet#removeTag()
inoremap <buffer> <Plug>(emmet-split-join-tag) :call emmet#splitJoinTag()
inoremap <buffer> <Plug>(emmet-toggle-comment) =emmet#util#closePopup()=emmet#toggleComment()
inoremap <buffer> <Plug>(emmet-image-size) =emmet#util#closePopup()=emmet#imageSize()
inoremap <buffer> <Plug>(emmet-move-prev-item) :call emmet#moveNextPrevItem(1)
inoremap <buffer> <Plug>(emmet-move-next-item) :call emmet#moveNextPrevItem(0)
inoremap <buffer> <Plug>(emmet-move-prev) :call emmet#moveNextPrev(1)
inoremap <buffer> <Plug>(emmet-move-next) :call emmet#moveNextPrev(0)
inoremap <buffer> <Plug>(emmet-balance-tag-outword) :call emmet#balanceTag(-1)
inoremap <buffer> <Plug>(emmet-balance-tag-inward) :call emmet#balanceTag(1)
inoremap <buffer> <Plug>(emmet-update-tag) =emmet#util#closePopup()=emmet#updateTag()
inoremap <buffer> <Plug>(emmet-expand-word) =emmet#util#closePopup()=emmet#expandAbbr(1,"")
inoremap <buffer> <Plug>(emmet-expand-abbr) =emmet#util#closePopup()=emmet#expandAbbr(0,"")
vmap <buffer> ,c <Plug>(emmet-code-pretty)
vmap <buffer> ,m <Plug>(emmet-merge-lines)
nmap <buffer> ,A <Plug>(emmet-anchorize-summary)
nmap <buffer> ,a <Plug>(emmet-anchorize-url)
nmap <buffer> ,k <Plug>(emmet-remove-tag)
nmap <buffer> ,j <Plug>(emmet-split-join-tag)
nmap <buffer> ,/ <Plug>(emmet-toggle-comment)
nmap <buffer> ,i <Plug>(emmet-image-size)
nmap <buffer> ,N <Plug>(emmet-move-prev)
nmap <buffer> ,n <Plug>(emmet-move-next)
vmap <buffer> ,D <Plug>(emmet-balance-tag-outword)
nmap <buffer> ,D <Plug>(emmet-balance-tag-outword)
vmap <buffer> ,d <Plug>(emmet-balance-tag-inward)
nmap <buffer> ,d <Plug>(emmet-balance-tag-inward)
nmap <buffer> ,u <Plug>(emmet-update-tag)
nmap <buffer> ,; <Plug>(emmet-expand-word)
vmap <buffer> ,, <Plug>(emmet-expand-abbr)
nmap <buffer> ,, <Plug>(emmet-expand-abbr)
vnoremap <buffer> <Plug>(emmet-code-pretty) :call emmet#codePretty()
vnoremap <buffer> <Plug>(emmet-merge-lines) :call emmet#mergeLines()
nnoremap <buffer> <Plug>(emmet-anchorize-summary) :call emmet#anchorizeURL(1)
nnoremap <buffer> <Plug>(emmet-anchorize-url) :call emmet#anchorizeURL(0)
nnoremap <buffer> <Plug>(emmet-remove-tag) :call emmet#removeTag()
nnoremap <buffer> <Plug>(emmet-split-join-tag) :call emmet#splitJoinTag()
nnoremap <buffer> <Plug>(emmet-toggle-comment) :call emmet#toggleComment()
nnoremap <buffer> <Plug>(emmet-image-size) :call emmet#imageSize()
nnoremap <buffer> <Plug>(emmet-move-prev-item) :call emmet#moveNextPrevItem(1)
nnoremap <buffer> <Plug>(emmet-move-next-item) :call emmet#moveNextPrevItem(0)
nnoremap <buffer> <Plug>(emmet-move-prev) :call emmet#moveNextPrev(1)
nnoremap <buffer> <Plug>(emmet-move-next) :call emmet#moveNextPrev(0)
vnoremap <buffer> <Plug>(emmet-balance-tag-outword) :call emmet#balanceTag(-2)
nnoremap <buffer> <Plug>(emmet-balance-tag-outword) :call emmet#balanceTag(-1)
vnoremap <buffer> <Plug>(emmet-balance-tag-inward) :call emmet#balanceTag(2)
nnoremap <buffer> <Plug>(emmet-balance-tag-inward) :call emmet#balanceTag(1)
nnoremap <buffer> <Plug>(emmet-update-tag) :call emmet#updateTag()
nnoremap <buffer> <Plug>(emmet-expand-word) :call emmet#expandAbbr(1,"")
vnoremap <buffer> <Plug>(emmet-expand-abbr) :call emmet#expandAbbr(2,"")
nnoremap <buffer> <Plug>(emmet-expand-abbr) :call emmet#expandAbbr(3,"")
imap <buffer> ,A <Plug>(emmet-anchorize-summary)
imap <buffer> ,a <Plug>(emmet-anchorize-url)
imap <buffer> ,k <Plug>(emmet-remove-tag)
imap <buffer> ,j <Plug>(emmet-split-join-tag)
imap <buffer> ,/ <Plug>(emmet-toggle-comment)
imap <buffer> ,i <Plug>(emmet-image-size)
imap <buffer> ,N <Plug>(emmet-move-prev)
imap <buffer> ,n <Plug>(emmet-move-next)
imap <buffer> ,D <Plug>(emmet-balance-tag-outword)
imap <buffer> ,d <Plug>(emmet-balance-tag-inward)
imap <buffer> ,u <Plug>(emmet-update-tag)
imap <buffer> ,; <Plug>(emmet-expand-word)
imap <buffer> ,, <Plug>(emmet-expand-abbr)
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
set breakindent
setlocal breakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=//%s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'javascript.jsx'
setlocal filetype=javascript.jsx
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
set foldlevel=99
setlocal foldlevel=99
setlocal foldmarker={{{,}}}
set foldmethod=indent
setlocal foldmethod=syntax
setlocal foldminlines=1
set foldnestmax=2
setlocal foldnestmax=2
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetJsxIndent()
setlocal indentkeys=0{,0},0),0],0,,!^F,o,O,e,*<Return>,<>>,<<>,/
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,$
setlocal keywordprg=
set linebreak
setlocal linebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=javascriptcomplete#CompleteJS
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%{lightline#link()}%#LightlineLeft_active_0#%(\ %{lightline#mode()}\ %)%{(&paste)?\"|\":\"\"}%(\ %{&paste?\"PASTE\":\"\"}\ %)%#LightlineLeft_active_0_1#%#LightlineLeft_active_1#%(\ %{fugitive#head()}\ %)%{fugitive#head()!=#\"\"&&((&readonly)||1||(&modified||!&modifiable))?\"|\":\"\"}%(\ %R\ %)%{(&readonly)&&(1||(&modified||!&modifiable))?\"|\":\"\"}%(\ %F\ %)%{(&modified||!&modifiable)?\"|\":\"\"}%(\ %M\ %)%#LightlineLeft_active_1_2#%#LightlineMiddle_active#%=%#LightlineRight_active_2_3#%#LightlineRight_active_2#%(\ %{&ft!=#\"\"?&ft:\"no\ ft\"}\ %)%#LightlineRight_active_1_2#%#LightlineRight_active_1#%(\ %3p%%\ %)%#LightlineRight_active_0_1#%#LightlineRight_active_0#%(\ %3l:%-2v\ %)
setlocal suffixesadd=.js,.jsx
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'javascript.jsx'
setlocal syntax=javascript.jsx
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tags=~/projects/ReduxSimpleStarter/tags,./tags,./TAGS,tags,TAGS
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
27
normal! zo
let s:l = 26 - ((25 * winheight(0) + 28) / 57)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
26
normal! 023|
tabnext
edit src/apis/jsonPlaceholder.js
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <Plug>(emmet-anchorize-summary) =emmet#util#closePopup()=emmet#anchorizeURL(1)
inoremap <buffer> <Plug>(emmet-anchorize-url) =emmet#util#closePopup()=emmet#anchorizeURL(0)
inoremap <buffer> <Plug>(emmet-remove-tag) =emmet#util#closePopup()=emmet#removeTag()
inoremap <buffer> <Plug>(emmet-split-join-tag) :call emmet#splitJoinTag()
inoremap <buffer> <Plug>(emmet-toggle-comment) =emmet#util#closePopup()=emmet#toggleComment()
inoremap <buffer> <Plug>(emmet-image-size) =emmet#util#closePopup()=emmet#imageSize()
inoremap <buffer> <Plug>(emmet-move-prev-item) :call emmet#moveNextPrevItem(1)
inoremap <buffer> <Plug>(emmet-move-next-item) :call emmet#moveNextPrevItem(0)
inoremap <buffer> <Plug>(emmet-move-prev) :call emmet#moveNextPrev(1)
inoremap <buffer> <Plug>(emmet-move-next) :call emmet#moveNextPrev(0)
inoremap <buffer> <Plug>(emmet-balance-tag-outword) :call emmet#balanceTag(-1)
inoremap <buffer> <Plug>(emmet-balance-tag-inward) :call emmet#balanceTag(1)
inoremap <buffer> <Plug>(emmet-update-tag) =emmet#util#closePopup()=emmet#updateTag()
inoremap <buffer> <Plug>(emmet-expand-word) =emmet#util#closePopup()=emmet#expandAbbr(1,"")
inoremap <buffer> <Plug>(emmet-expand-abbr) =emmet#util#closePopup()=emmet#expandAbbr(0,"")
vmap <buffer> ,c <Plug>(emmet-code-pretty)
vmap <buffer> ,m <Plug>(emmet-merge-lines)
nmap <buffer> ,A <Plug>(emmet-anchorize-summary)
nmap <buffer> ,a <Plug>(emmet-anchorize-url)
nmap <buffer> ,k <Plug>(emmet-remove-tag)
nmap <buffer> ,j <Plug>(emmet-split-join-tag)
nmap <buffer> ,/ <Plug>(emmet-toggle-comment)
nmap <buffer> ,i <Plug>(emmet-image-size)
nmap <buffer> ,N <Plug>(emmet-move-prev)
nmap <buffer> ,n <Plug>(emmet-move-next)
vmap <buffer> ,D <Plug>(emmet-balance-tag-outword)
nmap <buffer> ,D <Plug>(emmet-balance-tag-outword)
vmap <buffer> ,d <Plug>(emmet-balance-tag-inward)
nmap <buffer> ,d <Plug>(emmet-balance-tag-inward)
nmap <buffer> ,u <Plug>(emmet-update-tag)
nmap <buffer> ,; <Plug>(emmet-expand-word)
vmap <buffer> ,, <Plug>(emmet-expand-abbr)
nmap <buffer> ,, <Plug>(emmet-expand-abbr)
vnoremap <buffer> <Plug>(emmet-code-pretty) :call emmet#codePretty()
vnoremap <buffer> <Plug>(emmet-merge-lines) :call emmet#mergeLines()
nnoremap <buffer> <Plug>(emmet-anchorize-summary) :call emmet#anchorizeURL(1)
nnoremap <buffer> <Plug>(emmet-anchorize-url) :call emmet#anchorizeURL(0)
nnoremap <buffer> <Plug>(emmet-remove-tag) :call emmet#removeTag()
nnoremap <buffer> <Plug>(emmet-split-join-tag) :call emmet#splitJoinTag()
nnoremap <buffer> <Plug>(emmet-toggle-comment) :call emmet#toggleComment()
nnoremap <buffer> <Plug>(emmet-image-size) :call emmet#imageSize()
nnoremap <buffer> <Plug>(emmet-move-prev-item) :call emmet#moveNextPrevItem(1)
nnoremap <buffer> <Plug>(emmet-move-next-item) :call emmet#moveNextPrevItem(0)
nnoremap <buffer> <Plug>(emmet-move-prev) :call emmet#moveNextPrev(1)
nnoremap <buffer> <Plug>(emmet-move-next) :call emmet#moveNextPrev(0)
vnoremap <buffer> <Plug>(emmet-balance-tag-outword) :call emmet#balanceTag(-2)
nnoremap <buffer> <Plug>(emmet-balance-tag-outword) :call emmet#balanceTag(-1)
vnoremap <buffer> <Plug>(emmet-balance-tag-inward) :call emmet#balanceTag(2)
nnoremap <buffer> <Plug>(emmet-balance-tag-inward) :call emmet#balanceTag(1)
nnoremap <buffer> <Plug>(emmet-update-tag) :call emmet#updateTag()
nnoremap <buffer> <Plug>(emmet-expand-word) :call emmet#expandAbbr(1,"")
vnoremap <buffer> <Plug>(emmet-expand-abbr) :call emmet#expandAbbr(2,"")
nnoremap <buffer> <Plug>(emmet-expand-abbr) :call emmet#expandAbbr(3,"")
imap <buffer> ,A <Plug>(emmet-anchorize-summary)
imap <buffer> ,a <Plug>(emmet-anchorize-url)
imap <buffer> ,k <Plug>(emmet-remove-tag)
imap <buffer> ,j <Plug>(emmet-split-join-tag)
imap <buffer> ,/ <Plug>(emmet-toggle-comment)
imap <buffer> ,i <Plug>(emmet-image-size)
imap <buffer> ,N <Plug>(emmet-move-prev)
imap <buffer> ,n <Plug>(emmet-move-next)
imap <buffer> ,D <Plug>(emmet-balance-tag-outword)
imap <buffer> ,d <Plug>(emmet-balance-tag-inward)
imap <buffer> ,u <Plug>(emmet-update-tag)
imap <buffer> ,; <Plug>(emmet-expand-word)
imap <buffer> ,, <Plug>(emmet-expand-abbr)
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
set breakindent
setlocal breakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=//%s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'javascript.jsx'
setlocal filetype=javascript.jsx
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
set foldlevel=99
setlocal foldlevel=99
setlocal foldmarker={{{,}}}
set foldmethod=indent
setlocal foldmethod=syntax
setlocal foldminlines=1
set foldnestmax=2
setlocal foldnestmax=2
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetJsxIndent()
setlocal indentkeys=0{,0},0),0],0,,!^F,o,O,e,*<Return>,<>>,<<>,/
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,$
setlocal keywordprg=
set linebreak
setlocal linebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=javascriptcomplete#CompleteJS
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%{lightline#link()}%#LightlineLeft_active_0#%(\ %{lightline#mode()}\ %)%{(&paste)?\"|\":\"\"}%(\ %{&paste?\"PASTE\":\"\"}\ %)%#LightlineLeft_active_0_1#%#LightlineLeft_active_1#%(\ %{fugitive#head()}\ %)%{fugitive#head()!=#\"\"&&((&readonly)||1||(&modified||!&modifiable))?\"|\":\"\"}%(\ %R\ %)%{(&readonly)&&(1||(&modified||!&modifiable))?\"|\":\"\"}%(\ %F\ %)%{(&modified||!&modifiable)?\"|\":\"\"}%(\ %M\ %)%#LightlineLeft_active_1_2#%#LightlineMiddle_active#%=%#LightlineRight_active_2_3#%#LightlineRight_active_2#%(\ %{&ft!=#\"\"?&ft:\"no\ ft\"}\ %)%#LightlineRight_active_1_2#%#LightlineRight_active_1#%(\ %3p%%\ %)%#LightlineRight_active_0_1#%#LightlineRight_active_0#%(\ %3l:%-2v\ %)
setlocal suffixesadd=.js,.jsx
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'javascript.jsx'
setlocal syntax=javascript.jsx
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tags=~/projects/ReduxSimpleStarter/tags,./tags,./TAGS,tags,TAGS
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
3
normal! zo
let s:l = 5 - ((4 * winheight(0) + 28) / 57)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
5
normal! 02|
tabnext
edit src/components/PostList.js
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <Plug>(emmet-anchorize-summary) =emmet#util#closePopup()=emmet#anchorizeURL(1)
inoremap <buffer> <Plug>(emmet-anchorize-url) =emmet#util#closePopup()=emmet#anchorizeURL(0)
inoremap <buffer> <Plug>(emmet-remove-tag) =emmet#util#closePopup()=emmet#removeTag()
inoremap <buffer> <Plug>(emmet-split-join-tag) :call emmet#splitJoinTag()
inoremap <buffer> <Plug>(emmet-toggle-comment) =emmet#util#closePopup()=emmet#toggleComment()
inoremap <buffer> <Plug>(emmet-image-size) =emmet#util#closePopup()=emmet#imageSize()
inoremap <buffer> <Plug>(emmet-move-prev-item) :call emmet#moveNextPrevItem(1)
inoremap <buffer> <Plug>(emmet-move-next-item) :call emmet#moveNextPrevItem(0)
inoremap <buffer> <Plug>(emmet-move-prev) :call emmet#moveNextPrev(1)
inoremap <buffer> <Plug>(emmet-move-next) :call emmet#moveNextPrev(0)
inoremap <buffer> <Plug>(emmet-balance-tag-outword) :call emmet#balanceTag(-1)
inoremap <buffer> <Plug>(emmet-balance-tag-inward) :call emmet#balanceTag(1)
inoremap <buffer> <Plug>(emmet-update-tag) =emmet#util#closePopup()=emmet#updateTag()
inoremap <buffer> <Plug>(emmet-expand-word) =emmet#util#closePopup()=emmet#expandAbbr(1,"")
inoremap <buffer> <Plug>(emmet-expand-abbr) =emmet#util#closePopup()=emmet#expandAbbr(0,"")
vmap <buffer> ,c <Plug>(emmet-code-pretty)
vmap <buffer> ,m <Plug>(emmet-merge-lines)
nmap <buffer> ,A <Plug>(emmet-anchorize-summary)
nmap <buffer> ,a <Plug>(emmet-anchorize-url)
nmap <buffer> ,k <Plug>(emmet-remove-tag)
nmap <buffer> ,j <Plug>(emmet-split-join-tag)
nmap <buffer> ,/ <Plug>(emmet-toggle-comment)
nmap <buffer> ,i <Plug>(emmet-image-size)
nmap <buffer> ,N <Plug>(emmet-move-prev)
nmap <buffer> ,n <Plug>(emmet-move-next)
vmap <buffer> ,D <Plug>(emmet-balance-tag-outword)
nmap <buffer> ,D <Plug>(emmet-balance-tag-outword)
vmap <buffer> ,d <Plug>(emmet-balance-tag-inward)
nmap <buffer> ,d <Plug>(emmet-balance-tag-inward)
nmap <buffer> ,u <Plug>(emmet-update-tag)
nmap <buffer> ,; <Plug>(emmet-expand-word)
vmap <buffer> ,, <Plug>(emmet-expand-abbr)
nmap <buffer> ,, <Plug>(emmet-expand-abbr)
vnoremap <buffer> <Plug>(emmet-code-pretty) :call emmet#codePretty()
vnoremap <buffer> <Plug>(emmet-merge-lines) :call emmet#mergeLines()
nnoremap <buffer> <Plug>(emmet-anchorize-summary) :call emmet#anchorizeURL(1)
nnoremap <buffer> <Plug>(emmet-anchorize-url) :call emmet#anchorizeURL(0)
nnoremap <buffer> <Plug>(emmet-remove-tag) :call emmet#removeTag()
nnoremap <buffer> <Plug>(emmet-split-join-tag) :call emmet#splitJoinTag()
nnoremap <buffer> <Plug>(emmet-toggle-comment) :call emmet#toggleComment()
nnoremap <buffer> <Plug>(emmet-image-size) :call emmet#imageSize()
nnoremap <buffer> <Plug>(emmet-move-prev-item) :call emmet#moveNextPrevItem(1)
nnoremap <buffer> <Plug>(emmet-move-next-item) :call emmet#moveNextPrevItem(0)
nnoremap <buffer> <Plug>(emmet-move-prev) :call emmet#moveNextPrev(1)
nnoremap <buffer> <Plug>(emmet-move-next) :call emmet#moveNextPrev(0)
vnoremap <buffer> <Plug>(emmet-balance-tag-outword) :call emmet#balanceTag(-2)
nnoremap <buffer> <Plug>(emmet-balance-tag-outword) :call emmet#balanceTag(-1)
vnoremap <buffer> <Plug>(emmet-balance-tag-inward) :call emmet#balanceTag(2)
nnoremap <buffer> <Plug>(emmet-balance-tag-inward) :call emmet#balanceTag(1)
nnoremap <buffer> <Plug>(emmet-update-tag) :call emmet#updateTag()
nnoremap <buffer> <Plug>(emmet-expand-word) :call emmet#expandAbbr(1,"")
vnoremap <buffer> <Plug>(emmet-expand-abbr) :call emmet#expandAbbr(2,"")
nnoremap <buffer> <Plug>(emmet-expand-abbr) :call emmet#expandAbbr(3,"")
imap <buffer> ,A <Plug>(emmet-anchorize-summary)
imap <buffer> ,a <Plug>(emmet-anchorize-url)
imap <buffer> ,k <Plug>(emmet-remove-tag)
imap <buffer> ,j <Plug>(emmet-split-join-tag)
imap <buffer> ,/ <Plug>(emmet-toggle-comment)
imap <buffer> ,i <Plug>(emmet-image-size)
imap <buffer> ,N <Plug>(emmet-move-prev)
imap <buffer> ,n <Plug>(emmet-move-next)
imap <buffer> ,D <Plug>(emmet-balance-tag-outword)
imap <buffer> ,d <Plug>(emmet-balance-tag-inward)
imap <buffer> ,u <Plug>(emmet-update-tag)
imap <buffer> ,; <Plug>(emmet-expand-word)
imap <buffer> ,, <Plug>(emmet-expand-abbr)
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
set breakindent
setlocal breakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=//%s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'javascript.jsx'
setlocal filetype=javascript.jsx
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
set foldlevel=99
setlocal foldlevel=99
setlocal foldmarker={{{,}}}
set foldmethod=indent
setlocal foldmethod=syntax
setlocal foldminlines=1
set foldnestmax=2
setlocal foldnestmax=2
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetJsxIndent()
setlocal indentkeys=0{,0},0),0],0,,!^F,o,O,e,*<Return>,<>>,<<>,/
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,$
setlocal keywordprg=
set linebreak
setlocal linebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=javascriptcomplete#CompleteJS
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%{lightline#link()}%#LightlineLeft_active_0#%(\ %{lightline#mode()}\ %)%{(&paste)?\"|\":\"\"}%(\ %{&paste?\"PASTE\":\"\"}\ %)%#LightlineLeft_active_0_1#%#LightlineLeft_active_1#%(\ %{fugitive#head()}\ %)%{fugitive#head()!=#\"\"&&((&readonly)||1||(&modified||!&modifiable))?\"|\":\"\"}%(\ %R\ %)%{(&readonly)&&(1||(&modified||!&modifiable))?\"|\":\"\"}%(\ %F\ %)%{(&modified||!&modifiable)?\"|\":\"\"}%(\ %M\ %)%#LightlineLeft_active_1_2#%#LightlineMiddle_active#%=%#LightlineRight_active_2_3#%#LightlineRight_active_2#%(\ %{&ft!=#\"\"?&ft:\"no\ ft\"}\ %)%#LightlineRight_active_1_2#%#LightlineRight_active_1#%(\ %3p%%\ %)%#LightlineRight_active_0_1#%#LightlineRight_active_0#%(\ %3l:%-2v\ %)
setlocal suffixesadd=.js,.jsx
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'javascript.jsx'
setlocal syntax=javascript.jsx
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tags=~/projects/ReduxSimpleStarter/tags,./tags,./TAGS,tags,TAGS
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
6
normal! zo
let s:l = 16 - ((15 * winheight(0) + 28) / 57)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
16
normal! 0
tabnext
edit src/reducers/index.js
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <Plug>(emmet-anchorize-summary) =emmet#util#closePopup()=emmet#anchorizeURL(1)
inoremap <buffer> <Plug>(emmet-anchorize-url) =emmet#util#closePopup()=emmet#anchorizeURL(0)
inoremap <buffer> <Plug>(emmet-remove-tag) =emmet#util#closePopup()=emmet#removeTag()
inoremap <buffer> <Plug>(emmet-split-join-tag) :call emmet#splitJoinTag()
inoremap <buffer> <Plug>(emmet-toggle-comment) =emmet#util#closePopup()=emmet#toggleComment()
inoremap <buffer> <Plug>(emmet-image-size) =emmet#util#closePopup()=emmet#imageSize()
inoremap <buffer> <Plug>(emmet-move-prev-item) :call emmet#moveNextPrevItem(1)
inoremap <buffer> <Plug>(emmet-move-next-item) :call emmet#moveNextPrevItem(0)
inoremap <buffer> <Plug>(emmet-move-prev) :call emmet#moveNextPrev(1)
inoremap <buffer> <Plug>(emmet-move-next) :call emmet#moveNextPrev(0)
inoremap <buffer> <Plug>(emmet-balance-tag-outword) :call emmet#balanceTag(-1)
inoremap <buffer> <Plug>(emmet-balance-tag-inward) :call emmet#balanceTag(1)
inoremap <buffer> <Plug>(emmet-update-tag) =emmet#util#closePopup()=emmet#updateTag()
inoremap <buffer> <Plug>(emmet-expand-word) =emmet#util#closePopup()=emmet#expandAbbr(1,"")
inoremap <buffer> <Plug>(emmet-expand-abbr) =emmet#util#closePopup()=emmet#expandAbbr(0,"")
vmap <buffer> ,c <Plug>(emmet-code-pretty)
vmap <buffer> ,m <Plug>(emmet-merge-lines)
nmap <buffer> ,A <Plug>(emmet-anchorize-summary)
nmap <buffer> ,a <Plug>(emmet-anchorize-url)
nmap <buffer> ,k <Plug>(emmet-remove-tag)
nmap <buffer> ,j <Plug>(emmet-split-join-tag)
nmap <buffer> ,/ <Plug>(emmet-toggle-comment)
nmap <buffer> ,i <Plug>(emmet-image-size)
nmap <buffer> ,N <Plug>(emmet-move-prev)
nmap <buffer> ,n <Plug>(emmet-move-next)
vmap <buffer> ,D <Plug>(emmet-balance-tag-outword)
nmap <buffer> ,D <Plug>(emmet-balance-tag-outword)
vmap <buffer> ,d <Plug>(emmet-balance-tag-inward)
nmap <buffer> ,d <Plug>(emmet-balance-tag-inward)
nmap <buffer> ,u <Plug>(emmet-update-tag)
nmap <buffer> ,; <Plug>(emmet-expand-word)
vmap <buffer> ,, <Plug>(emmet-expand-abbr)
nmap <buffer> ,, <Plug>(emmet-expand-abbr)
vnoremap <buffer> <Plug>(emmet-code-pretty) :call emmet#codePretty()
vnoremap <buffer> <Plug>(emmet-merge-lines) :call emmet#mergeLines()
nnoremap <buffer> <Plug>(emmet-anchorize-summary) :call emmet#anchorizeURL(1)
nnoremap <buffer> <Plug>(emmet-anchorize-url) :call emmet#anchorizeURL(0)
nnoremap <buffer> <Plug>(emmet-remove-tag) :call emmet#removeTag()
nnoremap <buffer> <Plug>(emmet-split-join-tag) :call emmet#splitJoinTag()
nnoremap <buffer> <Plug>(emmet-toggle-comment) :call emmet#toggleComment()
nnoremap <buffer> <Plug>(emmet-image-size) :call emmet#imageSize()
nnoremap <buffer> <Plug>(emmet-move-prev-item) :call emmet#moveNextPrevItem(1)
nnoremap <buffer> <Plug>(emmet-move-next-item) :call emmet#moveNextPrevItem(0)
nnoremap <buffer> <Plug>(emmet-move-prev) :call emmet#moveNextPrev(1)
nnoremap <buffer> <Plug>(emmet-move-next) :call emmet#moveNextPrev(0)
vnoremap <buffer> <Plug>(emmet-balance-tag-outword) :call emmet#balanceTag(-2)
nnoremap <buffer> <Plug>(emmet-balance-tag-outword) :call emmet#balanceTag(-1)
vnoremap <buffer> <Plug>(emmet-balance-tag-inward) :call emmet#balanceTag(2)
nnoremap <buffer> <Plug>(emmet-balance-tag-inward) :call emmet#balanceTag(1)
nnoremap <buffer> <Plug>(emmet-update-tag) :call emmet#updateTag()
nnoremap <buffer> <Plug>(emmet-expand-word) :call emmet#expandAbbr(1,"")
vnoremap <buffer> <Plug>(emmet-expand-abbr) :call emmet#expandAbbr(2,"")
nnoremap <buffer> <Plug>(emmet-expand-abbr) :call emmet#expandAbbr(3,"")
imap <buffer> ,A <Plug>(emmet-anchorize-summary)
imap <buffer> ,a <Plug>(emmet-anchorize-url)
imap <buffer> ,k <Plug>(emmet-remove-tag)
imap <buffer> ,j <Plug>(emmet-split-join-tag)
imap <buffer> ,/ <Plug>(emmet-toggle-comment)
imap <buffer> ,i <Plug>(emmet-image-size)
imap <buffer> ,N <Plug>(emmet-move-prev)
imap <buffer> ,n <Plug>(emmet-move-next)
imap <buffer> ,D <Plug>(emmet-balance-tag-outword)
imap <buffer> ,d <Plug>(emmet-balance-tag-inward)
imap <buffer> ,u <Plug>(emmet-update-tag)
imap <buffer> ,; <Plug>(emmet-expand-word)
imap <buffer> ,, <Plug>(emmet-expand-abbr)
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
set breakindent
setlocal breakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=//%s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'javascript.jsx'
setlocal filetype=javascript.jsx
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
set foldlevel=99
setlocal foldlevel=99
setlocal foldmarker={{{,}}}
set foldmethod=indent
setlocal foldmethod=syntax
setlocal foldminlines=1
set foldnestmax=2
setlocal foldnestmax=2
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetJsxIndent()
setlocal indentkeys=0{,0},0),0],0,,!^F,o,O,e,*<Return>,<>>,<<>,/
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,$
setlocal keywordprg=
set linebreak
setlocal linebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=javascriptcomplete#CompleteJS
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%{lightline#link()}%#LightlineLeft_active_0#%(\ %{lightline#mode()}\ %)%{(&paste)?\"|\":\"\"}%(\ %{&paste?\"PASTE\":\"\"}\ %)%#LightlineLeft_active_0_1#%#LightlineLeft_active_1#%(\ %{fugitive#head()}\ %)%{fugitive#head()!=#\"\"&&((&readonly)||1||(&modified||!&modifiable))?\"|\":\"\"}%(\ %R\ %)%{(&readonly)&&(1||(&modified||!&modifiable))?\"|\":\"\"}%(\ %F\ %)%{(&modified||!&modifiable)?\"|\":\"\"}%(\ %M\ %)%#LightlineLeft_active_1_2#%#LightlineMiddle_active#%=%#LightlineRight_active_2_3#%#LightlineRight_active_2#%(\ %{&ft!=#\"\"?&ft:\"no\ ft\"}\ %)%#LightlineRight_active_1_2#%#LightlineRight_active_1#%(\ %3p%%\ %)%#LightlineRight_active_0_1#%#LightlineRight_active_0#%(\ %3l:%-2v\ %)
setlocal suffixesadd=.js,.jsx
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'javascript.jsx'
setlocal syntax=javascript.jsx
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tags=~/projects/ReduxSimpleStarter/tags,./tags,./TAGS,tags,TAGS
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
3
normal! zo
let s:l = 4 - ((3 * winheight(0) + 28) / 57)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
4
normal! 0
tabnext
edit src/components/App.js
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 31 + 59) / 119)
exe 'vert 2resize ' . ((&columns * 87 + 59) / 119)
argglobal
enew
file NERD_tree_3
let s:cpo_save=&cpo
set cpo&vim
nnoremap <buffer> <silent> <NL> :call nerdtree#ui_glue#invokeKeyMap("<C-j>")
nnoremap <buffer> <silent>  :call nerdtree#ui_glue#invokeKeyMap("<C-k>")
nnoremap <buffer> <silent>  :call nerdtree#ui_glue#invokeKeyMap(g:NERDTreeMapActivateNode)
nnoremap <buffer> <silent> ? :call nerdtree#ui_glue#invokeKeyMap("?")
nnoremap <buffer> <silent> A :call nerdtree#ui_glue#invokeKeyMap("A")
nnoremap <buffer> <silent> B :call nerdtree#ui_glue#invokeKeyMap("B")
nnoremap <buffer> <silent> C :call nerdtree#ui_glue#invokeKeyMap("C")
nnoremap <buffer> <silent> CD :call nerdtree#ui_glue#invokeKeyMap("CD")
nnoremap <buffer> <silent> D :call nerdtree#ui_glue#invokeKeyMap("D")
nnoremap <buffer> <silent> F :call nerdtree#ui_glue#invokeKeyMap("F")
nnoremap <buffer> <silent> I :call nerdtree#ui_glue#invokeKeyMap("I")
nnoremap <buffer> <silent> J :call nerdtree#ui_glue#invokeKeyMap("J")
nnoremap <buffer> <silent> K :call nerdtree#ui_glue#invokeKeyMap("K")
nnoremap <buffer> <silent> O :call nerdtree#ui_glue#invokeKeyMap("O")
nnoremap <buffer> <silent> P :call nerdtree#ui_glue#invokeKeyMap("P")
nnoremap <buffer> <silent> R :call nerdtree#ui_glue#invokeKeyMap("R")
nnoremap <buffer> <silent> T :call nerdtree#ui_glue#invokeKeyMap("T")
nnoremap <buffer> <silent> U :call nerdtree#ui_glue#invokeKeyMap("U")
nnoremap <buffer> <silent> X :call nerdtree#ui_glue#invokeKeyMap("X")
nnoremap <buffer> <silent> [c :call nerdtree#ui_glue#invokeKeyMap("[c")
nnoremap <buffer> <silent> ]c :call nerdtree#ui_glue#invokeKeyMap("]c")
nnoremap <buffer> <silent> cd :call nerdtree#ui_glue#invokeKeyMap("cd")
nnoremap <buffer> <silent> e :call nerdtree#ui_glue#invokeKeyMap("e")
nnoremap <buffer> <silent> f :call nerdtree#ui_glue#invokeKeyMap("f")
nnoremap <buffer> <silent> go :call nerdtree#ui_glue#invokeKeyMap("go")
nnoremap <buffer> <silent> gs :call nerdtree#ui_glue#invokeKeyMap("gs")
nnoremap <buffer> <silent> gi :call nerdtree#ui_glue#invokeKeyMap("gi")
nnoremap <buffer> <silent> i :call nerdtree#ui_glue#invokeKeyMap("i")
nnoremap <buffer> <silent> m :call nerdtree#ui_glue#invokeKeyMap("m")
nnoremap <buffer> <silent> o :call nerdtree#ui_glue#invokeKeyMap("o")
nnoremap <buffer> <silent> p :call nerdtree#ui_glue#invokeKeyMap("p")
nnoremap <buffer> <silent> q :call nerdtree#ui_glue#invokeKeyMap("q")
nnoremap <buffer> <silent> r :call nerdtree#ui_glue#invokeKeyMap("r")
nnoremap <buffer> <silent> s :call nerdtree#ui_glue#invokeKeyMap("s")
nnoremap <buffer> <silent> t :call nerdtree#ui_glue#invokeKeyMap("t")
nnoremap <buffer> <silent> u :call nerdtree#ui_glue#invokeKeyMap("u")
nnoremap <buffer> <silent> x :call nerdtree#ui_glue#invokeKeyMap("x")
nnoremap <buffer> <silent> <MiddleMouse> :call nerdtree#ui_glue#invokeKeyMap("<MiddleMouse>")
nnoremap <buffer> <silent> <2-LeftMouse> :call nerdtree#ui_glue#invokeKeyMap("<2-LeftMouse>")
nnoremap <buffer> <silent> <LeftRelease> <LeftRelease>:call nerdtree#ui_glue#invokeKeyMap("<LeftRelease>")
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
set breakindent
setlocal breakindent
setlocal breakindentopt=
setlocal bufhidden=hide
setlocal nobuflisted
setlocal buftype=nofile
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal cursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'nerdtree'
setlocal filetype=nerdtree
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
set foldlevel=99
setlocal foldlevel=99
setlocal foldmarker={{{,}}}
set foldmethod=indent
setlocal foldmethod=manual
setlocal foldminlines=1
set foldnestmax=2
setlocal foldnestmax=2
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
set linebreak
setlocal linebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal nomodifiable
setlocal nrformats=bin,octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal readonly
set relativenumber
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%{lightline#link()}%#LightlineLeft_inactive_0#%(\ %t\ %)%#LightlineLeft_inactive_0_1#%#LightlineMiddle_inactive#%=%#LightlineRight_inactive_1_2#%#LightlineRight_inactive_1#%(\ %3p%%\ %)%#LightlineRight_inactive_0_1#%#LightlineRight_inactive_0#%(\ %3l:%-2v\ %)
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'nerdtree'
setlocal syntax=nerdtree
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tags=~/projects/ReduxSimpleStarter/tags,./tags,./TAGS,tags,TAGS
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal nowinfixheight
setlocal winfixwidth
setlocal nowrap
setlocal wrapmargin=0
wincmd w
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <Plug>(emmet-anchorize-summary) =emmet#util#closePopup()=emmet#anchorizeURL(1)
inoremap <buffer> <Plug>(emmet-anchorize-url) =emmet#util#closePopup()=emmet#anchorizeURL(0)
inoremap <buffer> <Plug>(emmet-remove-tag) =emmet#util#closePopup()=emmet#removeTag()
inoremap <buffer> <Plug>(emmet-split-join-tag) :call emmet#splitJoinTag()
inoremap <buffer> <Plug>(emmet-toggle-comment) =emmet#util#closePopup()=emmet#toggleComment()
inoremap <buffer> <Plug>(emmet-image-size) =emmet#util#closePopup()=emmet#imageSize()
inoremap <buffer> <Plug>(emmet-move-prev-item) :call emmet#moveNextPrevItem(1)
inoremap <buffer> <Plug>(emmet-move-next-item) :call emmet#moveNextPrevItem(0)
inoremap <buffer> <Plug>(emmet-move-prev) :call emmet#moveNextPrev(1)
inoremap <buffer> <Plug>(emmet-move-next) :call emmet#moveNextPrev(0)
inoremap <buffer> <Plug>(emmet-balance-tag-outword) :call emmet#balanceTag(-1)
inoremap <buffer> <Plug>(emmet-balance-tag-inward) :call emmet#balanceTag(1)
inoremap <buffer> <Plug>(emmet-update-tag) =emmet#util#closePopup()=emmet#updateTag()
inoremap <buffer> <Plug>(emmet-expand-word) =emmet#util#closePopup()=emmet#expandAbbr(1,"")
inoremap <buffer> <Plug>(emmet-expand-abbr) =emmet#util#closePopup()=emmet#expandAbbr(0,"")
vmap <buffer> ,c <Plug>(emmet-code-pretty)
vmap <buffer> ,m <Plug>(emmet-merge-lines)
nmap <buffer> ,A <Plug>(emmet-anchorize-summary)
nmap <buffer> ,a <Plug>(emmet-anchorize-url)
nmap <buffer> ,k <Plug>(emmet-remove-tag)
nmap <buffer> ,j <Plug>(emmet-split-join-tag)
nmap <buffer> ,/ <Plug>(emmet-toggle-comment)
nmap <buffer> ,i <Plug>(emmet-image-size)
nmap <buffer> ,N <Plug>(emmet-move-prev)
nmap <buffer> ,n <Plug>(emmet-move-next)
vmap <buffer> ,D <Plug>(emmet-balance-tag-outword)
nmap <buffer> ,D <Plug>(emmet-balance-tag-outword)
vmap <buffer> ,d <Plug>(emmet-balance-tag-inward)
nmap <buffer> ,d <Plug>(emmet-balance-tag-inward)
nmap <buffer> ,u <Plug>(emmet-update-tag)
nmap <buffer> ,; <Plug>(emmet-expand-word)
vmap <buffer> ,, <Plug>(emmet-expand-abbr)
nmap <buffer> ,, <Plug>(emmet-expand-abbr)
vnoremap <buffer> <Plug>(emmet-code-pretty) :call emmet#codePretty()
vnoremap <buffer> <Plug>(emmet-merge-lines) :call emmet#mergeLines()
nnoremap <buffer> <Plug>(emmet-anchorize-summary) :call emmet#anchorizeURL(1)
nnoremap <buffer> <Plug>(emmet-anchorize-url) :call emmet#anchorizeURL(0)
nnoremap <buffer> <Plug>(emmet-remove-tag) :call emmet#removeTag()
nnoremap <buffer> <Plug>(emmet-split-join-tag) :call emmet#splitJoinTag()
nnoremap <buffer> <Plug>(emmet-toggle-comment) :call emmet#toggleComment()
nnoremap <buffer> <Plug>(emmet-image-size) :call emmet#imageSize()
nnoremap <buffer> <Plug>(emmet-move-prev-item) :call emmet#moveNextPrevItem(1)
nnoremap <buffer> <Plug>(emmet-move-next-item) :call emmet#moveNextPrevItem(0)
nnoremap <buffer> <Plug>(emmet-move-prev) :call emmet#moveNextPrev(1)
nnoremap <buffer> <Plug>(emmet-move-next) :call emmet#moveNextPrev(0)
vnoremap <buffer> <Plug>(emmet-balance-tag-outword) :call emmet#balanceTag(-2)
nnoremap <buffer> <Plug>(emmet-balance-tag-outword) :call emmet#balanceTag(-1)
vnoremap <buffer> <Plug>(emmet-balance-tag-inward) :call emmet#balanceTag(2)
nnoremap <buffer> <Plug>(emmet-balance-tag-inward) :call emmet#balanceTag(1)
nnoremap <buffer> <Plug>(emmet-update-tag) :call emmet#updateTag()
nnoremap <buffer> <Plug>(emmet-expand-word) :call emmet#expandAbbr(1,"")
vnoremap <buffer> <Plug>(emmet-expand-abbr) :call emmet#expandAbbr(2,"")
nnoremap <buffer> <Plug>(emmet-expand-abbr) :call emmet#expandAbbr(3,"")
imap <buffer> ,A <Plug>(emmet-anchorize-summary)
imap <buffer> ,a <Plug>(emmet-anchorize-url)
imap <buffer> ,k <Plug>(emmet-remove-tag)
imap <buffer> ,j <Plug>(emmet-split-join-tag)
imap <buffer> ,/ <Plug>(emmet-toggle-comment)
imap <buffer> ,i <Plug>(emmet-image-size)
imap <buffer> ,N <Plug>(emmet-move-prev)
imap <buffer> ,n <Plug>(emmet-move-next)
imap <buffer> ,D <Plug>(emmet-balance-tag-outword)
imap <buffer> ,d <Plug>(emmet-balance-tag-inward)
imap <buffer> ,u <Plug>(emmet-update-tag)
imap <buffer> ,; <Plug>(emmet-expand-word)
imap <buffer> ,, <Plug>(emmet-expand-abbr)
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
set breakindent
setlocal breakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=//%s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'javascript.jsx'
setlocal filetype=javascript.jsx
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
set foldlevel=99
setlocal foldlevel=99
setlocal foldmarker={{{,}}}
set foldmethod=indent
setlocal foldmethod=syntax
setlocal foldminlines=1
set foldnestmax=2
setlocal foldnestmax=2
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetJsxIndent()
setlocal indentkeys=0{,0},0),0],0,,!^F,o,O,e,*<Return>,<>>,<<>,/
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,$
setlocal keywordprg=
set linebreak
setlocal linebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=javascriptcomplete#CompleteJS
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%{lightline#link()}%#LightlineLeft_active_0#%(\ %{lightline#mode()}\ %)%{(&paste)?\"|\":\"\"}%(\ %{&paste?\"PASTE\":\"\"}\ %)%#LightlineLeft_active_0_1#%#LightlineLeft_active_1#%(\ %{fugitive#head()}\ %)%{fugitive#head()!=#\"\"&&((&readonly)||1||(&modified||!&modifiable))?\"|\":\"\"}%(\ %R\ %)%{(&readonly)&&(1||(&modified||!&modifiable))?\"|\":\"\"}%(\ %F\ %)%{(&modified||!&modifiable)?\"|\":\"\"}%(\ %M\ %)%#LightlineLeft_active_1_2#%#LightlineMiddle_active#%=%#LightlineRight_active_2_3#%#LightlineRight_active_2#%(\ %{&ft!=#\"\"?&ft:\"no\ ft\"}\ %)%#LightlineRight_active_1_2#%#LightlineRight_active_1#%(\ %3p%%\ %)%#LightlineRight_active_0_1#%#LightlineRight_active_0#%(\ %3l:%-2v\ %)
setlocal suffixesadd=.js,.jsx
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'javascript.jsx'
setlocal syntax=javascript.jsx
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tags=~/projects/ReduxSimpleStarter/tags,./tags,./TAGS,tags,TAGS
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
5
normal! zo
let s:l = 9 - ((8 * winheight(0) + 28) / 57)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
9
normal! 03|
wincmd w
exe 'vert 1resize ' . ((&columns * 31 + 59) / 119)
exe 'vert 2resize ' . ((&columns * 87 + 59) / 119)
tabnext
edit ~/projects/ReduxSimpleStarter/README.md
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
map <buffer>  :call Vim_Markdown_Preview()
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
set breakindent
setlocal breakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=fb:*,fb:-,fb:+,n:>
setlocal commentstring=>\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'markdown'
setlocal filetype=markdown
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
set foldlevel=99
setlocal foldlevel=99
setlocal foldmarker={{{,}}}
set foldmethod=indent
setlocal foldmethod=indent
setlocal foldminlines=1
set foldnestmax=2
setlocal foldnestmax=2
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcqln
setlocal formatlistpat=^\\s*\\d\\+\\.\\s\\+\\|^[-*+]\\s\\+\\|^\\[^\\ze[^\\]]\\+\\]:
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,$
setlocal keywordprg=
set linebreak
setlocal linebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:],<:>
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=htmlcomplete#CompleteTags
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%{lightline#link()}%#LightlineLeft_active_0#%(\ %{lightline#mode()}\ %)%{(&paste)?\"|\":\"\"}%(\ %{&paste?\"PASTE\":\"\"}\ %)%#LightlineLeft_active_0_1#%#LightlineLeft_active_1#%(\ %{fugitive#head()}\ %)%{fugitive#head()!=#\"\"&&((&readonly)||1||(&modified||!&modifiable))?\"|\":\"\"}%(\ %R\ %)%{(&readonly)&&(1||(&modified||!&modifiable))?\"|\":\"\"}%(\ %F\ %)%{(&modified||!&modifiable)?\"|\":\"\"}%(\ %M\ %)%#LightlineLeft_active_1_2#%#LightlineMiddle_active#%=%#LightlineRight_active_2_3#%#LightlineRight_active_2#%(\ %{&ft!=#\"\"?&ft:\"no\ ft\"}\ %)%#LightlineRight_active_1_2#%#LightlineRight_active_1#%(\ %3p%%\ %)%#LightlineRight_active_0_1#%#LightlineRight_active_0#%(\ %3l:%-2v\ %)
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'markdown'
setlocal syntax=markdown
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tags=~/projects/ReduxSimpleStarter/tags,./tags,./TAGS,tags,TAGS
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
let s:l = 254 - ((7 * winheight(0) + 28) / 57)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
254
normal! 063|
tabnext 2
set stal=1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
set winminheight=1 winminwidth=1
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
