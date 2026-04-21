" .ideavimrc is a configuration file for IdeaVim plugin. It uses
"   the same commands as the original .vimrc configuration.
" You can find a list of commands here: https://jb.gg/h38q75
" Find more examples here: https://jb.gg/share-ideavimrc

mapclear

function! LoadSource(path)
    exec 'source ' . g:PATH_TO_CONFIG . a:path
endfunction

call LoadSource('helpers.vim')
call LoadSource('functions.vim')

let mapleader = " "
nmap <S-Space> <leader>

set rnu

"" -- Suggested options --
" Show a few lines of context around the cursor. Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5

" Do incremental searching.
set incsearch

" Highlight search results
set hlsearch
" Both remove highlights and carets
nmap <silent> <Esc> :noh<CR><Action>(EditorEscape)

" Use smart case insensitive searching. If the search pattern contains
" mixed case, the search becomes case-sensitive; otherwise, it is case-insensitive.
set ignorecase
set smartcase

" Don't use Ex mode, use Q for formatting.
map Q gq

" --- Enable IdeaVim plugins https://jb.gg/ideavim-plugins

" Highlight copied text
Plug 'machakann/vim-highlightedyank'
" Commentary plugin
Plug 'tpope/vim-commentary'
" Surround plugin
Plug 'tpope/vim-surround'

"" -- Map IDE actions to IdeaVim -- https://jb.gg/abva4t
"" Map \r to the Reformat Code action
"map \r <Action>(ReformatCode)

"" Map <leader>d to start debug
"map <leader>d <Action>(Debug)

"" Map \b to toggle the breakpoint on the current line
"map \b <Action>(ToggleLineBreakpoint)
set ideajoin
set clipboard+=ideaput
set ideamarks

map <Home> 0^
imap <Home> <Esc>0^i
map <PageUp> <C-u>zz
map <PageDown> <C-d>zz
imap <PageUp> <Esc><C-u>zzi
imap <PageDown> <Esc><C-d>zzi

nmap Y y$

vmap * "ky/<C-r>k

nmap <leader>sv :source ~/.ideavimrc<CR>

nmap <leader>mdc ^idata <Esc>$daBxa(

"nmap <Left> h
"nmap <Down> j
"nmap <Up> k
"nmap <Right> l

nmap <leader>st <Action>(FileStructurePopup)
nmap <leader>rf <Action>(RecentFiles)
nmap <leader>q :wq<CR>

vmap <expr> <leader>p '"_d"' . v:register . 'P'
vmap <leader>d \"_d
vmap <leader>c \"*y
nmap <leader>v \"*p

nnoremap ' `
nnoremap ` '

nnoremap <expr> <leader>o '<Esc>mk' . (v:count ? v:count : 1) . 'o<Esc>`k'
nnoremap <expr> <leader>O '<Esc>mk' . (v:count ? v:count : 1) . 'O<Esc>`k'

nnoremap <expr> <leader>ipo '<Esc>:call StartNewParagraph(' . v:count . ', 1)<CR>A'
nnoremap <expr> <leader>ipO '<Esc>:call StartNewParagraph(' . v:count . ', -1)<CR>A'

"nnoremap <expr> <leader>o '<Esc>:call EnsureBlankLinesCount(' . v:count . ', 1)<CR>'
"nnoremap <expr> <leader>O '<Esc>:call EnsureBlankLinesCount(' . v:count . ', -1)<CR>'

" remaps for:
" - add blank line
" - ensure only 1 blank line exists
" - remove all blank lines
" - start paragraph
" directions are shown by o, O or u

" meaning of first letter after leader key:
" * a
" * b
" * c - change to blackhole / yank to clipboard
" * d - delete to blackhole
" * e
" * f - find
" * g - goto
" * h
" * i - insert
" * j
" * k
" * l
" * m - macro
" * n
" * o - create new line
" * p
" * q
" * r
" * s
" * t
" * u
" * v - paste from clipboard
" * w - tabs, windows, buffers
" * x
" * y
" * z - configuration
