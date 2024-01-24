" include log.vim, make some changes
runtime! syntax/log.vim
syntax match gccBuild /\[.*\] \(Building\|Built\).*$/
syntax match gccLink /\[.*\] Linking.*$/
syntax match gccError /.*\(Error\|error\):.*$/
syntax match gccWarning /.*\(Warning\|warning\):.*/
"syntax match gccGcc /\(gcc\|g++\|cc\|cxx\|CC\|CXX\) /


"highlight link gccOptions Statement
highlight link gccBuild Number
highlight link gccLink Type
highlight link gccError Error
highlight link gccWarning PreProc
