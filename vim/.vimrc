function! LoadSource(path)
    exec 'source ' . g:PATH_TO_CONFIG . a:path
endfunction

call LoadSource('helpers.vim')
call LoadSource('functions.vim')

call LoadSource('options/common.vim')

call LoadSource('mapping/common.vim')
call LoadSource('mapping/vanilla.vim')
