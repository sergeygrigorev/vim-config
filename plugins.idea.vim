echo 'Loading plugins.idea.vim'

" --- Enable IdeaVim plugins https://jb.gg/ideavim-plugins

" Highlight copied text
Plug 'machakann/vim-highlightedyank'

" Commentary plugin
Plug 'tpope/vim-commentary'

" Surround plugin
Plug 'tpope/vim-surround'

" Work with function args using cdvy
" Plug 'vim-scripts/argtextobj.vim'

" Exchange regions
" Plug 'tommcdo/vim-exchange'

" Multiple cursors support
Plug 'terryma/vim-multiple-cursors'

" NerdTree
" Plug 'preservim/nerdtree'

" QuickScope
set quickscope

" VimDial
set dial
nmap <C-a> :DialIncrement<CR>
nmap <C-x> :DialDecrement<CR>
let g:dial_include = 'basic,numbers,dates,java,javascript,markdown,python'
" This should work but doesn't
" let g:dial_custom_definitions = [
"     ['normalizedCaseWords', ['one', 'two', 'three']],
"     ['words', ['un', 'deux', 'trois']],
"     ['normalizedCasePattern', ['alpha', 'beta', 'gamma']],
"     ['pattern', ['start', 'middle', 'end']]
" ]
