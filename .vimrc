execute pathogen#infect()

set tags=tags;/
set tabstop=4
set shiftwidth=4
set expandtab 

autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType cpp set omnifunc=omni#cpp#complete#Main
autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab

if filereadable(".vim.custom")
    so .vim.custom
endif
