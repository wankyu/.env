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

if has("win32") && has("gui_running")
    set enc=korea
endif

set guifont=Bitstream\ Vera\ Sans\ Mono:h9:cHANGEUL " |guifont|

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

" gVim 을 사용중일 경우 클립보드를 unnamed 레지스터로 매핑
" xterm_clipboard 기능이 있을 때에도 매핑 가능
if has("gui_running") || has("xterm_clipboard")
	set cb=unnamed
endif

