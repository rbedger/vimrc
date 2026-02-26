set nu rnu

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

au BufRead,BufNewFile *.pipelinejob set syntax=groovy
au BufRead,BufNewFile *.jenkinsfile set syntax=groovy

if has('gui_running')
    set guifont=Fira_Code_Retina:h10:cANSI:qDRAFT
endif

augroup AutoLcd
      autocmd!
        autocmd BufEnter * lcd %:p:h
augroup END

" ==========================
" Smart quote pairing
" ==========================
augroup SmartQuotes
  autocmd!
  " Apply to every buffer
  autocmd BufEnter * call SetupQuotePairs()
augroup END

" Function to set buffer-local mappings
function! SetupQuotePairs() abort
  " Remove any old mappings (buffer-local)
  silent! iunmap <buffer> "
  silent! iunmap <buffer> '

  " Insert double quote pair intelligently
  inoremap <buffer> <expr> " SmartQuote('"')

  " Insert single quote pair intelligently
  inoremap <buffer> <expr> ' SmartQuote("'")
endfunction

" The logic for smart pairing
function! SmartQuote(char) abort
  let col_next = col('.') - 1
  let line = getline('.')
  " If at start of line or next char is whitespace, insert pair
  if col_next == len(line) || line[col_next] =~ '\s'
    " Insert pair and move cursor back
    return a:char . a:char . "\<Left>"
  else
    " Otherwise just insert single char
    return a:char
  endif
endfunction
