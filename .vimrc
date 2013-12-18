scripte utf-8   " |scriptencoding| Specify the character encoding used in the script
set all&        " Reset option to its default value

if has("win32") && has("gui_running") " gvim
    if exists("$VIMRUNTIME")
        source $VIMRUNTIME/vimrc_example.vim
        source $VIMRUNTIME/mswin.vim
    endif
    behave mswin

    set diffexpr=MyDiff()
    function MyDiff()
      let opt = '-a --binary '
      if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
      if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
      let arg1 = v:fname_in
      if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
      let arg2 = v:fname_new
      if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
      let arg3 = v:fname_out
      if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
      let eq = ''
      if $VIMRUNTIME =~ ' '
        if &sh =~ '\<cmd'
          let cmd = '""' . $VIMRUNTIME . '\diff"'
          let eq = '"'
        else
          let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
        endif
      else
        let cmd = $VIMRUNTIME . '\diff'
      endif
      silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
    endfunction
endif

" ------------------------------------
"set nocompatible
filetype off

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My bundles here:
" extended % matching for HTML, LaTeX, and many other languages
Bundle 'matchit.zip'
" Functions and mappings to close open HTML/XML tags (with C-_)
Bundle 'closetag.vim'
" plug-in which provides support for expanding abbreviations similar to emmet
Bundle 'https://github.com/vim-scripts/Emmet.vim.git'
Bundle 'https://github.com/vim-scripts/Colour-Sampler-Pack.git'

filetype plugin indent on

" ------------------------------------

if has("win32") && has("gui_running")
    set enc=korea
else
    set enc=utf-8
endif
                " |encoding| Encoding used internally
let &tenc=&enc  " |termencoding| Encoding used for the terminal
let &fenc=&enc  " |fileencoding| File encoding for multi-byte text
set fencs=utf-8,cp949,cp932,euc-jp,shift-jis,big5,ucs-2le,latin1
                " |fileencodings| Automatically detected character encodings
                " When Vim reads a file and 'fileencodings' starts with "ucs-bom", a check for the presence of the BOM is done and 'bomb' set accordingly.

if has("gui_running")
                " |guioptions| GUI: Which components and options are used
    set go-=m   " Menu bar is present.
    set go-=T   " Include Toolbar.
    set go-=l   " Left-hand scrollbar is always present.
    set go-=L   " Left-hand scrollbar is present when there is a vertically split window.
    set go-=r   " Right-hand scrollbar is always present.
    set go-=R   " Right-hand scrollbar is present when there is a vertically split window.
    set go-=b   " Bottom (horizontal) scrollbar is present.
    set go+=c   " Use console dialogs instead of popup dialogs for simple choices.

    set mouse="" " Enable the use of the mouse.
    set mousem=popup " Sets the model to use for the mouse.

    " Set window size
    if has("win32")
        au GUIEnter * simalt ~x
    endif
endif

syntax on       " Turns syntax highlighting on
set t_Co=256    " Number of colors
colo desert256  " |colorscheme| Load color scheme
set gfn=Bitstream\ Vera\ Sans\ Mono:h9:cHANGEUL " |guifont|

" Check :help option-list
set nocp        " |compatible| Vim behave in a more useful way
set lpl         " |loadplugins| Load plugin scripts when starting up
set ff=mac      " |fileformat| File format used for file I/O
set ffs=unix,dos,mac
                " |fileformats| Automatically detected values for 'fileformat'
set nobk        " |backup| Keep backup file after overwriting a file
"set bex=.bkup  " |backupext| Extension used for the backup file
set noeol       " |endofline| Write <EOL> for last line in file
set hi=50       " |history| Number of command-lines that are remembered

set tw=80       " |textwidth| Maximum width of text that is being inserted
set wmh=0       " |winminheight| Minimum number of lines for any window
set lsp=0       " |linespace| Number of pixel lines to use between characters
set ru          " |ruler| Show cursor line and column in the status line
set sc          " |showcmd| Show (partial) command in status line
set ls=2        " |laststatus| Tells when last window has status lines
set nu          " |number| Print the line number in front of each line
set nuw=4       " |numberwidth| Number of columns used for the line number

set et          " |expandtab| Use spaces when <Tab> is inserted
set ts=4        " |tabstop| Number of spaces that <Tab> in file uses
set sw=4        " |shiftwidth| Number of spaces to use for (auto)indent step
"set sts=4       " |softtabstop| Number of spaces that <Tab> uses while editing
set sta         " |smarttab| Use 'shiftwidth' when inserting <Tab>
set ai          " |autoindent| Take indent for new line from previous line
set ci          " |copyindent| Make 'autoindent' use existing indent structure
set nosi        " |smartindent| Smart autoindenting for C programs
set fo=croq     " |formatoptions| How automatic formatting is to be done

set nf+=alpha   " |nrformats| Number formats recognized for CTRL-A command

set nowrap      " |wrap| Long lines wrap and continue on the next line
set lbr         " |linebreak| Wrap long lines at a blank
set ss=5        " |sidescroll| Minimum number of columns to scroll horizontal

set magic       " |magic| Special characters in search patterns
set sm          " |showmatch| Briefly jump to matching bracket if insert one
set ws          " |wrapscan| Searches wrap around the end of the file
set is          " |incsearch| Highlight match while typing search pattern
set hls         " |hlsearch| Highlight matches with last search pattern
set ic          " |ignorecase| Ignore case in search patterns
set scs         " |smartcase| No ignore case when pattern has uppercase
set inf         " |infercase| Adjust case of match for keyword completion

set bs=indent,eol,start
                " |backspace| how backspace works at start of line
set sol         " |startofline| Commands move cursor to first blank in line
set sel=exclusive
                " |selection| What type of selection to use

"set fdc=6      " |foldcolumn| Width of the column used to indicate folds
"set fdm=indent " |foldmethod| Folding type
"set fdl=99     " |foldlevel| Close folds with a level higher than this
set fen         " |foldenable| Set to display all folds open

set lcs=tab:>-,trail:-,precedes:<,extends:>,nbsp:.
                " |listchars| Characters for displaying in list mode
set mps+=<:>    " |matchpairs| Pairs of characters that "%" can match

set noto ttimeout " 키 입력 대기시간을 무제한으로, 그러나 key codes 에 대해서는 예외
set tm=3000 ttm=100 " 키 입력 대기시간 설정 (milliseconds) (ttm 을 음수로 설정하면 tm 을 따라감)

set wmnu        " |wildmenu| Use menu for command line completion

set lz          " |lazyredraw| Don't redraw while executing macros

set nospell spelllang=en " Spell Checking 기능 (영어)

let html_use_css = 1            " the ':%TOhtml' command generates html without <font> tags

map <F8> zo
map <F9> zf
map \n :set nu!<CR>
map \w :set wrap!<cr>
map \l :set list!<cr>
map \p :call TogglePaste()<CR>
map \s :call ToggleSpell()<CR>
map \t :call ToggleTab()<CR>

" 가운데 마우스 버튼으로 붙여넣기 하는 것을 무효화한다.
map <MiddleMouse> <Nop>
map! <MiddleMouse> <Nop>

imap <C-v> <C-r>"

" Using <Tab> to indent/unindent while in visual mode
vmap <Tab> >gv
vmap <S-Tab> <gv

" 각종 toggle 기능
fu! TogglePaste()
    let &paste = 1 - &paste
endf
fu! ToggleSpell()
    let &l:spell = 1 - &l:spell
endf
fu! ToggleTab()
    set et!
    let &tw = &tw == 0 ? 80 : 0
endf

" 상용구 설정
iab xdate <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
iab xtime <C-R>=strftime("%H:%M:%S")<CR>
iab #d <div class=""></div>
iab #i <img src="../img/" width="" height="" title="" alt="">

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 홈 디렉토리가 존재할 때에만 사용할 수 있는 기능들
if exists("$HOME")
    " 홈 디렉토리를 구한다.
    " 특정 시스템에서는 홈 디렉토리 경로 끝에 / 또는 \ 문자가
    " 붙어 있기 때문에, 그것들을 제거한다.
	let s:home_dir = $HOME
	let s:temp = strpart(s:home_dir,strlen(s:home_dir)-1,1)
	if s:temp == "/" || s:temp == "\\"
		let s:home_dir = strpart(s:home_dir,0,strlen(s:home_dir)-1)
	endif

    " 경로 설정
    if has("win32")
        let s:dir_tmp = s:home_dir."/_vim/tmp"
        let s:dir_backup = s:home_dir."/_vim/backup"
    else
        let s:dir_tmp = s:home_dir."/.vim/tmp"
        let s:dir_backup = s:home_dir."/.vim/backup"
    endif

    " 임시 디렉토리 설정
    if isdirectory(s:dir_tmp)
        set swf
        let &dir = s:dir_tmp
    else
        set noswf
        set dir=.
    endif

    " 백업 디렉토리 설정
    if isdirectory(s:dir_backup)
        set bk
        let &bdir = s:dir_backup
        set bex=.bak
    else
        set nobk
    endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 편집 기능 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 마지막 편집 위치 복원 기능
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "norm g`\"" |
\ endif

" gVim 을 사용중일 경우 클립보드를 unnamed 레지스터로 매핑
" xterm_clipboard 기능이 있을 때에도 매핑 가능
if has("gui_running") || has("xterm_clipboard")
	set cb=unnamed
endif

" SHIFT 키로 선택 영역을 만드는 것을 허용
" 영역 상태에서 Ctrl+F,B 로 이동하면 영역이 해제되어 버려서 해제
"set km=startsel,stopsel

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 모양 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 추적 수준을 최대로
"set report=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" filetype 기능 & Syntax Highlighting 기능
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 파일의 종류를 자동으로 인식
filet plugin indent on

" 몇몇 커스텀 확장자들에게 파일 형식 설정
"au BufRead,BufNewFile *.dic setl ft=php

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indent 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 내장된 indent 파일이 없어서 C indent 를 사용하는 경우
au FileType javascript,jsp setl cin

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 편리한 기능
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 파일 탐색기 설정
let g:explVertical=1
let g:explSplitRight=1
let g:explStartRight=1
let g:explWinSize=20

" http://stackoverflow.com/questions/4792561/how-to-do-search-replace-with-ack-
" Define a command to make it easier to use
command! -nargs=+ QFDo call QFDo(<q-args>)

" Function that does the work
function! QFDo(command)
    " Create a dictionary so that we can
    " get the list of buffers rather than the
    " list of lines in buffers (easy way
    " to get unique entries)
    let buffer_numbers = {}
    " For each entry, use the buffer number as 
    " a dictionary key (won't get repeats)
    for fixlist_entry in getqflist()
        let buffer_numbers[fixlist_entry['bufnr']] = 1
    endfor
    " Make it into a list as it seems cleaner
    let buffer_number_list = keys(buffer_numbers)

    " For each buffer
    for num in buffer_number_list
        " Select the buffer
        exe 'buffer' num
        " Run the command that's passed as an argument
        exe a:command
        " Save if necessary
        update
    endfor
endfunction
