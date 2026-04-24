echo 'Loading mappings.vim'

" Disabled because Plug '...' directives seem to not recreate mappings
" mapclear

let mapleader = " "
nmap <S-Space> <leader>

nnoremap <leader>q :wq<CR>

nnoremap Y y$

nnoremap ' `
nnoremap ` '

noremap <Home> 0^
inoremap <Home> <Esc>0^i
noremap <PageUp> <C-u>zz
noremap <PageDown> <C-d>zz
inoremap <PageUp> <Esc><C-u>zzi
inoremap <PageDown> <Esc><C-d>zzi

vnoremap * "ky/<C-r>k

vnoremap <expr> <leader>p '"_d"' . v:register . 'P'
vnoremap <leader>d \"_d

nnoremap <expr> <leader>o '<Esc>mk' . (v:count ? v:count : 1) . 'o<Esc>`k'
nnoremap <expr> <leader>O '<Esc>mk' . (v:count ? v:count : 1) . 'O<Esc>`k'

nnoremap <expr> <leader>ipo '<Esc>:call StartNewParagraph(' . v:count . ', 1)<CR>A'
nnoremap <expr> <leader>ipO '<Esc>:call StartNewParagraph(' . v:count . ', -1)<CR>A'

nmap <leader>mdc ^idata <Esc>$daBxa(

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
