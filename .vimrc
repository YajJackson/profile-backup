" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim
execute pathogen#infect()

"ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Keybindings
" jk exit insert mode
inoremap jk <Esc>
nnoremap B ^
nnoremap E $

" Line configuration
" Set up line numbers
set relativenumber
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

filetype plugin indent on "Format line indentation
set tabstop=4
set shiftwidth=4
set expandtab
set cursorline
set wildmenu
set incsearch
set showcmd

" Statusline
set laststatus=2
set statusline+=%f\ %y
hi statusline ctermfg=8     ctermbg=2     cterm=NONE

" Plugs
" Color scheme
call plug#begin('~/.vim/plugged')
Plug 'nightsense/carbonized'
call plug#end()

" Helps show whitespace
set listchars=tab:>·,trail:~,extends:>,precedes:<
set list

" Place temp files
set backupdir=/tmp/
set directory=/tmp/swp
highlight SignColumn ctermbg=NONE

" Ale settings
"let g:ale_sign_error = '●' " Less aggressive than the default '>>'
"let g:ale_sign_warning = '.'
"let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

" Disable parentheses matching depends on system. This way we should address all cases (?)
set noshowmatch
" NoMatchParen " This doesnt work as it belongs to a plugin, which is only loaded _after_ all files are.
" Trying disable MatchParen after loading all plugins
"
function! g:FuckThatMatchParen ()
    if exists(":NoMatchParen")
        :NoMatchParen
    endif
endfunction

augroup plugin_initialize
    autocmd!
    autocmd VimEnter * call FuckThatMatchParen()
augroup END
