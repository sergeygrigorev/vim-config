" .ideavimrc is a configuration file for IdeaVim plugin. It uses
"   the same commands as the original .vimrc configuration.
" You can find a list of commands here: https://jb.gg/h38q75
" Find more examples here: https://jb.gg/share-ideavimrc

mapclear

function! LoadSource(path)
    exec 'source ' . g:PATH_TO_CONFIG . a:path
endfunction

call LoadSource('helpers.vim')

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
nnoremap <silent> <Esc> :noh<CR>

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

function! ExecuteIfBlanks2(count, direction)
    let l:initial_pos = line('.')
    let l:initial_col = col('.')
    let l:target_pos = a:count ? l:initial_pos : l:initial_pos + 2 * a:direction
    let l:add_line_command = a:direction > 0 ? 'o' : 'O'

    let l:next_non_blank = NextNonMatchingLineIdx('^\s*$')
    let l:count_to_add = max([(a:count ? a:count : 3) - abs(l:next_non_blank - l:initial_pos) + 1, 0])

    let l:pos = l:initial_pos
    if l:count_to_add > 0
        execute 'normal! ' . l:count_to_add . l:add_line_command
        let l:pos += a:direction > 0 ? l:count_to_add : -1
    endif

    let l:offset = l:target_pos - l:pos
    if l:offset > 0
        execute 'normal!' . abs(l:offset) . 'j'
    elseif l:offset < 0
        execute 'normal!' . abs(l:offset) . 'k'
    endif

    if a:count
        let l:current_col = col('.')
        let l:col_offset = l:current_col - l:initial_col
        if l:col_offset > 0
            execute 'normal!' . abs(l:col_offset) . 'h'
        elseif l:col_offset < 0
            execute 'normal!' . abs(l:col_offset) . 'l'
        endif
    endif
endfunction

function! EnsureBlankLinesCount(count, direction)
    execute 'normal! mk'

    echo 'start'
    let l:current_line = line('.')
    echo l:current_line
    let l:next_non_empty_line = NextNonMatchingLineIdx(l:current_line, a:direction, '^\s*$')
    echo l:current_line . ' / ' . l:next_non_empty_line
    let l:empty_lines_count = abs(l:current_line - l:next_non_empty_line) - 1
    let l:desired_count = a:count ? a:count : 1
    let l:delta = l:empty_lines_count - l:desired_count
    echo l:current_line . ' / ' . l:next_non_empty_line . ' / ' . l:empty_lines_count . ' / ' . l:desired_count . ' / ' . l:delta
    if l:delta > 0
        execute 'normal! ' . DirMove(a:direction) . (l:delta == 1 ? 'dd' : ('d' . (l:delta - 1) . DirMove(a:direction)))
    elseif l:delta < 0
        execute 'normal! ' . (-l:delta) . DirAppend(a:direction)
    endif

    execute 'normal! `k'
endfunction

function! StartNewParagraph(direction)
    execute 'normal! mk'
    execute 'normal! `k'
endfunction

nnoremap ' `
nnoremap ` '

nnoremap <leader>o mko<Esc>`k
nnoremap <leader>O mkO<Esc>`k

"nnoremap <expr> <leader>o '<Esc>:call EnsureBlankLinesCount(' . v:count . ', 1)<CR>'
"nnoremap <expr> <leader>O '<Esc>:call EnsureBlankLinesCount(' . v:count . ', -1)<CR>'

" remaps for:
" - add blank line
" - ensure only 1 blank line exists
" - remove all blank lines
" - start paragraph
" directions are shown by o, O or u
