syntax case ignore
syntax match gdbBuild /\[.*\] \(Building\|Built\).*$/
syntax match gdbLink /\[.*\] Linking.*$/
syntax match gdbError /\(Error\|Warning\|error\|warn\):/


highlight link gdbBuild Statement
highlight link gdbLink Type
highlight link gdbError Error
