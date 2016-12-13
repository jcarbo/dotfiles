set nocompatible

" allow backspacing over everything in insert mode
set bs=indent,eol,start

" line has previous line's indent
set autoindent

" set size of history
set history=50

" show position of cursor in bottom bar
set ruler

" show partially completed commands
set showcmd

" use filetype's indentation
" filetype plugin indent on

" set tabs to put two spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Ctrl-P toggles paste mode
set pastetoggle=<C-P>

function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
hi PmenuSel ctermfg=7 ctermbg=4 guibg=#555555 guifg=#ffffff

" make searches case-insensitive
set ignorecase

" highlight matches in search
set hlsearch

" show the bet match so far
set incsearch

syntax enable
highlight Search     ctermfg=White  ctermbg=Magenta cterm=NONE
highlight Statement  ctermfg=Green cterm=NONE
