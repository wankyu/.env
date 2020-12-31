function IndentBlock ()
  norm ci{& {"}]}=i}
endfunction

function UnindentBlock ()
  norm da{"_da{p=i{]}<<%
endfunction

au FileType scss nnoremap g> :call IndentBlock()<CR>
au FileType scss nnoremap g< :call UnindentBlock()<CR>
