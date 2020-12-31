let g:vimwiki_list = [
  \{
  \   'path': '~/my_vimwiki',
  \   'syntax': 'markdown',
  \   'ext' : '.md',
  \   'diary_rel_path': '.',
  \},
\]
let g:vimwiki_dir_link = 'index'
let g:vimwiki_conceallevel = 0
noremap glt :VimwikiToggleListItem<CR>

