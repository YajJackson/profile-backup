set background=light        " for the light version
let g:one_allow_italics = 1  " I love italic for comments
colorscheme one
set termguicolors

" vim-airline
let g:airline_theme = 'one'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⎇'
