echo 'Loading mappings.idea.vim'

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

nmap <leader>st <Action>(FileStructurePopup)
nmap <leader>rf <Action>(RecentFiles)
