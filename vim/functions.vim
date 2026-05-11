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
    let l:current_line = line('.')
    let l:next_non_empty_line = NextNonMatchingLineIdx(l:current_line, a:direction, '^\s*$')
    let l:empty_lines_count = abs(l:current_line - l:next_non_empty_line) - 1
    let l:desired_count = a:count ? a:count : 1
    let l:delta = l:empty_lines_count - l:desired_count
    if l:delta > 0
        execute 'normal! ' . DirMove(a:direction) . (l:delta == 1 ? 'dd' : ('d' . (l:delta - 1) . DirMove(a:direction)))
    elseif l:delta < 0
        execute 'normal! ' . (-l:delta) . DirAppend(a:direction)
    endif
    execute 'normal! `k'
endfunction

function! StartNewParagraph(spacing, direction)
    let l:initial_line = line('.')
    let l:spacing = a:spacing ? a:spacing : 1
    let l:initial_line_is_blank = LineMatches(l:initial_line, '^\s*$')
    let l:next_non_blank_line = NextNonMatchingLineIdx(l:initial_line, a:direction, '^\s*$')
    let l:prev_non_blank_line = l:initial_line_is_blank ? NextNonMatchingLineIdx(l:initial_line, -a:direction, '^\s*$') : l:initial_line
    let l:min_non_blank_line = min([l:prev_non_blank_line, l:next_non_blank_line])
    let l:max_non_blank_line = max([l:prev_non_blank_line, l:next_non_blank_line])
    let l:actual_blank_lines_count = l:max_non_blank_line - l:min_non_blank_line - 1
    let l:desired_blank_lines_count = l:spacing * 2 + 1
    let l:difference = abs(l:desired_blank_lines_count - l:actual_blank_lines_count)
    if l:desired_blank_lines_count > l:actual_blank_lines_count
        call MoveBetweenLines(l:initial_line, l:min_non_blank_line)
        execute 'normal! ' . l:difference . 'o'
    elseif l:desired_blank_lines_count < l:actual_blank_lines_count
        call MoveBetweenLines(l:initial_line, l:min_non_blank_line + 1)
        execute 'normal! ' . l:difference . 'dd'
    endif
    call MoveBetweenLines(line('.'), l:min_non_blank_line + l:spacing + 1)
endfunction
