""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File: markdown.vim
" Author: Miles Glapa-Grossklag
" Description: A small collection of un-intrusive Markdown commands.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Links                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Find next/previous link
command -buffer NextLink norm /\[.*\]\(.*\)<CR>
command -buffer PrevLink norm ?\[.*\]\(.*\)<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Checkboxes                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let s:bullet_point = '\v^\s*[-*+]\ '
let s:checkbox_empty = s:bullet_point . '\[\ \]'
let s:checkbox_full = s:bullet_point . '\[[xX]\]'


" Turn a bullet point into a checkbox
function s:MDCheckboxMake()
    let l:pos = getpos('.')

    if getline('.') =~ s:bullet_point
        s/\v^(\s*[-*+])\ /\1\ \[\ \]\ /
    else
        " TODO: Change this to a command somehow
        norm I- [ ]
    endif

    call setpos('.', l:pos)
endfunction


" Fill the checkbox on the current line.
function s:MDCheckboxFill()
    let l:pos = getpos('.')

    if getline('.') =~ s:checkbox_empty
        s/\v^(\s*[-*+])\ \[\ \]/\1\ \[X\]/
    else
        echoerr "Not an empty checkbox"
    endif

    call setpos('.', l:pos)
endfunction


" Empty the checkbox on the current line
function s:MDCheckboxEmpty()
    let l:pos = getpos('.')

    if getline('.') =~ s:checkbox_full
        s/\v^(\s*[-*+])\ \[[xX]\]/\1\ \[\ \]/
    else
        echoerr "Not a full checkbox"
    endif

    call setpos('.', l:pos)
endfunction


" Toggle a markdown checkbox on the current line.
function s:MDCheckboxToggle()
    let l:line = getline('.')
    if l:line =~ s:checkbox_empty
        call <SID>MDCheckboxFill()
    elseif l:line =~ s:checkbox_full
        call <SID>MDCheckboxEmpty()
    else
        echoerr "Not a checkbox"
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               <Plug> Mappings                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

noremap <buffer> <silent> <Plug>MDCheckboxMake     :silent call <SID>MDCheckboxMake()<CR>
noremap <buffer> <silent> <Plug>MDCheckboxFill     :silent call <SID>MDCheckboxFill()<CR>
noremap <buffer> <silent> <Plug>MDCheckboxEmpty    :silent call <SID>MDCheckboxEmpty()<CR>
noremap <buffer> <silent> <Plug>MDCheckboxToggle   :silent call <SID>MDCheckboxToggle()<CR>
