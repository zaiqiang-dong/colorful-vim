function! stools#stest()
py3 << EOF
print("test")
EOF
endfunction

function! stools#cal_hex_line()
normal gv"xy
let exp = @x
py3 << EOF
import vim
exp = vim.eval("l:exp")
exp = exp.replace(' ', '')
add = exp.split('+')
print(add)
sum = int(add[0], 16) + int(add[1], 16)
ret = vim.eval("l:exp").strip() + " = " + hex(sum)
vim.command("let exp = '%s'"% ret)
EOF
let @x = exp
normal gv"xp
endfunction



