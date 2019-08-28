set nu rnu

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

au BufRead,BufNewFile *.pipelinejob set syntax=groovy
au BufRead,BufNewFile *.jenkinsfile set syntax=groovy

