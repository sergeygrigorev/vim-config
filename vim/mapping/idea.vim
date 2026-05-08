echo 'Loading mapping/idea.vim'

"" -- Map IDE actions to IdeaVim -- https://jb.gg/abva4t
"" Map \r to the Reformat Code action
"map \r <Action>(ReformatCode)

"" Map <leader>d to start debug
"map <leader>d <Action>(Debug)

"" Map \b to toggle the breakpoint on the current line
"map \b <Action>(ToggleLineBreakpoint)

" Both remove highlights and carets
" Can't use nnoremap because of <Action> limitations
nmap <silent> <Esc> :noh<CR><Action>(EditorEscape)

nmap <leader>sv :source ~/.ideavimrc<CR>

vmap <leader>c <Action>($Copy)<Esc>
nmap <leader>v l<Action>($Paste)
vmap <leader>v <Action>($Paste)

nmap <leader>st <Action>(FileStructurePopup)
nmap <leader>rf <Action>(RecentFiles)
