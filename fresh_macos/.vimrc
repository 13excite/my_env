set backspace=indent,eol,start
set autoindent
set nowrap
set et

if version >= 714

        au BufNewFile,BufRead * let b:mtrailingws=matchadd('ErrorMsg', '\s\+$', -1)

        au BufNewFile,BufRead * let b:mtabbeforesp=matchadd('ErrorMsg', '\v(\t+)\ze( +)', -1)
        au BufNewFile,BufRead * let b:mtabaftersp=matchadd('ErrorMsg', '\v( +)\zs(\t+)', -1)


        au BufWinEnter * let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
        au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
augroup yaml
        autocmd!
        autocmd BufRead,BufNewFile *.yaml* match none
        autocmd BufRead,BufNewFile *.yaml* set shiftwidth=2
        autocmd BufRead,BufNewFile *.yaml* set tabstop=2
        autocmd BufRead,BufNewFile *.yaml* set smarttab
        autocmd BufRead,BufNewFile *.yaml* set expandtab
        autocmd BufRead,BufNewFile *.yaml* set autoindent
        autocmd BufRead,BufNewFile *.yaml* set smartindent
        autocmd BufNewFile,BufRead *.yaml* let b:mtrailingws=matchadd('ErrorMsg', '\s\+$', -1) 
        autocmd BufNewFile,BufRead *.yaml* let b:mtrailingws=matchadd('ErrorMsg', '\t\+', -1) 
augroup END
augroup yml
        autocmd!
        autocmd BufRead,BufNewFile *.yml* match none
        autocmd BufRead,BufNewFile *.yml* set shiftwidth=2
        autocmd BufRead,BufNewFile *.yml* set tabstop=2
        autocmd BufRead,BufNewFile *.yml* set smarttab
        autocmd BufRead,BufNewFile *.yml* set expandtab
        autocmd BufRead,BufNewFile *.yml* set autoindent
        autocmd BufRead,BufNewFile *.yml* set smartindent
        autocmd BufNewFile,BufRead *.yml* let b:mtrailingws=matchadd('ErrorMsg', '\s\+$', -1) 
        autocmd BufNewFile,BufRead *.yml* let b:mtrailingws=matchadd('ErrorMsg', '\t\+', -1) 
augroup END
augroup py
        autocmd!
        autocmd BufRead,BufNewFile *.py* match none
        autocmd BufRead,BufNewFile *.py* set shiftwidth=4
        autocmd BufRead,BufNewFile *.py* set tabstop=4
        autocmd BufRead,BufNewFile *.py* set smarttab
        autocmd BufRead,BufNewFile *.py* set expandtab
        autocmd BufRead,BufNewFile *.py* set autoindent
        autocmd BufRead,BufNewFile *.py* set smartindent
        autocmd BufNewFile,BufRead *.py* let b:mtrailingws=matchadd('ErrorMsg', '\s\+$', -1)
augroup END

filetype plugin indent on


syntax on
