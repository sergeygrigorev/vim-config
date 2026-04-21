function! MoveBetweenLines(from, to)
    let l:steps = abs(a:from - a:to)
    if l:steps != 0
        let l:cmd = DirMove(a:to - a:from)
        execute 'normal! ' . l:steps . l:cmd
    endif
endfunction

function! DirMove(direction)
    return a:direction > 0 ? 'j' : 'k'
endfunction

function! DirAppend(direction)
    return a:direction > 0 ? 'o' : 'O'
endfunction

function! LineMatches(line, regex)
    return getline(a:line) =~ a:regex
endfunction

function! NextMatchingLineIdx(start, direction, regex)
    let l:curr = a:start + a:direction
    while l:curr >= line('1') && l:curr <= line('$')
        if LineMatches(l:curr, a:regex)
            break
        else
            let l:curr += a:direction
        endif
    endwhile
    return l:curr
endfunction

function! NextNonMatchingLineIdx(start, direction, regex)
    let l:curr = a:start + a:direction
    while l:curr >= line('1') && l:curr <= line('$')
        if !LineMatches(l:curr, a:regex)
            break
        else
            let l:curr += a:direction
        endif
    endwhile
    return l:curr
endfunction
