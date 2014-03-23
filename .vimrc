execute pathogen#infect()

set tags=tags;/
set tabstop=4
set shiftwidth=4
set expandtab 

autocmd FileType php set omnifunc=phpcomplete#CompletePHP colorcolumn=80
autocmd FileType python set colorcolumn=80
autocmd FileType cpp set omnifunc=omni#cpp#complete#Main
autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab
autocmd BufRead,BufNewFile *.yml setl sw=2 sts=2 et

function! moee:SaveSession()
    mksession! ~/.vim/session
    echohl MoreMsg
    echo 'Session saved'
    echohl None
endfunction

function! moee:LoadSession()
    source ~/.vim/session
    echohl MoreMsg
    echo 'Session loaded'
    echohl None
endfunction

let mapleader = "\<Space>"
nnoremap <Leader>s :exec moee:SaveSession()<CR>
nnoremap <Leader>l :exec moee:LoadSession()<CR>

if filereadable(".vim.custom")
    so .vim.custom
endif
