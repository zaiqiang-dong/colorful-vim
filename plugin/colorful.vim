autocmd  FileType c,cc,cpp  : call colorful#setC()
autocmd  InsertLeave *.c,*.cc,*.cpp,*.h,*.hpp nested : call colorful#setC()
