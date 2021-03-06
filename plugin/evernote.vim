"=============================================================================
" File: gist.vim
" Author: Trae Robrock <trobrock@gmail.com>, Aaron McGeever
" <aaron@outright.com.
" Last Change: 16-Jan-2011.
" Version: 0.1
" WebPage: http://github.com/trobrock/evernote-vim
" License: MIT
"
if !exists('g:evernote_vim_username')
  let g:evernote_vim_username = ''
endif

if !exists('g:evernote_vim_password')
  let g:evernote_vim_password = ''
endif

function! s:ListNotebooks()
  exec 'silent split evernote:notebooks'
  ruby $evernote.listNotebooks
  setlocal buftype=nofile bufhidden=hide noswapfile
  setlocal nomodified
endfunction

ruby << EOF
    require "evernote-vim/controller.rb"

    $evernote = EvernoteVim::Controller.new
EOF

map <Leader>ev :call <SID>ListNotebooks()<CR>
