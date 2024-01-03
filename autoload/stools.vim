function! stools#stest()
py3 << EOF
print("test")
EOF
endfunction

function! stools#get_visual_selection()
       let l=getline("'<")
       let [line1,col1] = getpos("'<")[1:2]
       let [line2,col2] = getpos("'>")[1:2]
       echo l[col1 - 1: col2 - 1]
endfunction

function! stools#cal_hex_line()
py3 << EOF
print("hex line")
EOF
call stools#get_visual_selection()
endfunction



