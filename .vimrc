execute pathogen#infect()

set tags=tags;/
set tabstop=4 shiftwidth=4 expandtab 

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
    let sessionfile = expand("~/.vim/session")
    if filereadable(sessionfile)
        source ~/.vim/session
        echohl MoreMsg
        echo 'Session loaded'
        echohl None
    endif
endfunction

let mapleader = "\<Space>"
nnoremap <Leader>s :exec moee:SaveSession()<CR>
nnoremap <Leader>l :exec moee:LoadSession()<CR><CR>
nnoremap <Leader>mf :Mru 
nnoremap <Leader>mr :Mru<CR> 
nnoremap <Leader>t :tabe %:p:h<CR>
nnoremap <Leader>g :TlistToggle<CR>
nnoremap <Leader>e :Ex<CR>
nnoremap <Leader>q :q<CR>

nnoremap <Leader>1 1gt<CR>                                                      
nnoremap <Leader>2 2gt<CR>                                                      
nnoremap <Leader>3 3gt<CR>                                                      
nnoremap <Leader>4 4gt<CR>                                                      
nnoremap <Leader>5 5gt<CR>                                                      
nnoremap <Leader>6 6gt<CR>                                                      
nnoremap <Leader>7 7gt<CR>

if filereadable(".vim.custom")
    so .vim.custom
endif
