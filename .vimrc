function! LoadSource(path)
    exec 'source ' . g:PATH_TO_CONFIG . a:path
endfunction

call LoadSource('helpers.vim')
call LoadSource('functions.vim')

call LoadSource('options.vim')
call LoadSource('mappings.vim')
call LoadSource('mappings.vanilla.vim')
