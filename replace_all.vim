" File contains different usefull vim functions(and others)

function! PY_routines_init()
python << EOF
import vim

def python_input(message = 'input'):
    message = message.replace('\'','\'\'')
    vim.command('call inputsave()')
    vim.command("let user_input = input('" + message + ": ')")
    vim.command('call inputrestore()')
    return vim.eval('user_input')

EOF
endfunction
call PY_routines_init()


function! PY_replace_selected()
python << EOF
import vim
import re
pos1 = vim.eval('getpos("\'<")')[1:3]
pos2 = vim.eval('getpos("\'>")')[1:3]
row1, col1 = int(pos1[0]), int(pos1[1])-1
row2, col2 = int(pos2[0]), int(pos2[1])
cur_line = vim.current.line
selected = cur_line[col1:col2]
try:
    replace_to = python_input('Replace "%s" to' % selected)
    vim.current.line = cur_line[0:col1] + replace_to + cur_line[col2:]
    vim.current.window.cursor = (row1, col1)
except TypeError:
    pass
EOF
endfunction
"vmap ,t :call PY_replace_selected()<CR>


function! PY_replace_all_selected()
python << EOF
import vim
pos1 = vim.eval('getpos("\'<")')[1:3]
pos2 = vim.eval('getpos("\'>")')[1:3]
row1, col1 = int(pos1[0]), int(pos1[1])-1
row2, col2 = int(pos2[0]), int(pos2[1])
cur_line = vim.current.line
selected = cur_line[col1:col2]
try:
    replace_to = python_input('Replace ALL! entry of "%s" to' % selected)
    cb = vim.current.buffer
    cnt, ln = 0, None
    for num, line in enumerate(cb):
        found = line.count(selected)
        if found:
            ln = num+1
            cnt += found
        cb[num] = line.replace(selected, replace_to)
    vim.current.window.cursor = (row1, col1)
    print '          %s times, last line %s' % (cnt, ln or '-')
except TypeError:
    pass
EOF
endfunction

vmap ,t :call PY_replace_all_selected()<CR>
