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
add = exp.split(' ')
print(add)
if add[1] == "+":
    sum = int(add[0], 16) + int(add[2], 16)
elif  add[1] == "-":
    sum = int(add[0], 16) - int(add[2], 16)
ret = vim.eval("l:exp").strip() + " = " + hex(sum)
vim.command("let exp = '%s'"% ret)
EOF
let @x = exp
normal gv"xp
endfunction



