" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " vim-one theme
    Plug 'rakr/vim-one'
    " Nord theme
    Plug 'arcticicestudio/nord-vim'
    " Startify
    Plug 'mhinz/vim-startify'
    " Language support
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Show colors in files
    Plug 'norcalli/nvim-colorizer.lua'
    " Status line
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Interactive scratchpad in files
    Plug 'metakirby5/codi.vim'
    " React defintion helper
    Plug 'YajJackson/vim-react-goto-definition'
    " TSX syntax highlighting
    Plug 'peitalin/vim-jsx-typescript'

call plug#end()

