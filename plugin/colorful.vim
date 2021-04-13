autocmd  FileType c,cc,cpp  : call colorful#setC()
autocmd  CursorMovedI  *.c,*.cc,*.cpp,*.h,*.hpp nested : call colorful#setC()
