" pathogen
execute pathogen#infect()
execute pathogen#helptags()

"dirsettings
call dirsettings#Install()

" Turn on syntax highlighting
syntax on

" Enable filetype plugins
filetype on
filetype plugin indent on

" Always display status line
set laststatus=2

" Permit unsaved buffers
set hidden

" Buffer mappings
map <leader>bn :bn<cr>
map <leader>bp :bp<cr>
map <leader>bd :bd<cr>
map <leader>bt :TlistToggle<cr>

" Abbreviations
ab inout input
ab sop System.out.println(
ab pvsm public static void main (String [] args)
ab sforge http://downloads.sourceforge.net/%{name}/%{name}-%{version}.tar.gz

" ChangeLog for specs
let spec_chglog_format = "%a %b %d %Y Ankur Sinha <ankursinha AT fedoraproject DOT org>"
iab clog <c-r>=strftime("%a %b %d 20%y")<cr> Ankur Sinha <ankursinha AT fedoraproject DOT org>

" Automatically write a file when leaving a modified buffer
set autowrite

" Start a dialog when a command fails (here when quit command fails)
set confirm

" Show me line numbers
set nu

" Number of spaces a tab stands for
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" I have a ftplugin for python files

set syn=auto
set showmatch

"Show info in the window title
set title 

"Line length above which to break a line
au FileType txt,c,cpp,otl set textwidth=79
au FileType spec set textwidth=79

" latex stuff
let g:tex_flavor='latex'
" indentation for tex files
au BufRead,BufNewFile *.sty set filetype=tex
au FileType tex set sw=2
"Spell check
au FileType tex setlocal spell spelllang=en_gb
" Vim-latex rules: 
" to enable \ll to run automatically for pdfs
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='dvi,pdf'
let g:Tex_UseMakefile = 1
let g:Tex_EchoBibFields = 0

" Folding in C,CPP files
au FileType c,cpp setl foldenable foldmethod=syntax 

" This is for vertical indenting
set list
set listchars=tab:\|\ ,trail:-,eol:$
" Folding
" set foldenable

" Different file comment templates
autocmd BufNewFile *.php 0r ~/.vim/php.vim
autocmd BufNewFile *.html 0r ~/.vim/html.vim
autocmd BufNewFile *.sh 0r ~/.vim/sh.vim
autocmd BufNewFile *.py 0r ~/.vim/py.vim
autocmd BufNewFile *.pl 0r ~/.vim/pl.vim
autocmd BufNewFile *.fedreview 0r ~/.vim/fedreview.vim
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
" GNUPlot 
au BufNewFile,BufRead *.plt,.gnuplot setf gnuplot

" Save and automatically load folds
" You need to make a ~/.vim/views folder and chmod it to 755
" mkdir -p ~/.vim/view
" chmod 755 ~/.vim/view
au BufWinLeave *.* silent! mkview
au BufWinEnter *.* silent! loadview

" printing
"set printexpr=PrintFile(v:fname_in)
"function PrintFile(fname)
"	call system("a2ps " . a:fname)
"	call delete(a:fname)
"	return v:shell_error
"endfunc
"let &printexpr="(v:cmdarg=='' ? ".
"    \"system('lpr' . (&printdevice == '' ? '' : ' -P' . &printdevice)".
"    \". ' ' . v:fname_in) . delete(v:fname_in) + v:shell_error".
"    \" : system('mv '.v:fname_in.' '.v:cmdarg) + v:shell_error)"
set pdev=cups-pdf
set printoptions=paper:A4,syntax:y,wrap:y,number:y


"Folding 
set foldcolumn=5

" Colourscheme from learning vim and vi
"colorscheme default
"function SetTimeOfDayColours()
"    let currentHour = strftime("%H")
"    if currentHour < 6 + 0
"        let colorScheme = "candy"
"    elseif currentHour < 12 + 0
"        let colorScheme = "distinguished"
"    elseif currentHour < 18 + 0
"        let colorScheme = "jellybeans"
"    else
"        let colorScheme = "jellybeans"
"    endif
"
"    if g:colors_name !~ colorScheme 
"        "echo "Setting color scheme to " . colorScheme
"        execute "colorscheme " . colorScheme
"    endif
"endfunction
"
"" I need to find a good set of schemes before using this
"call SetTimeOfDayColours()
"

" Vim filetype detection
" Language: TaskJuggler
" Maintainer: Max Meyer <dev@fedux.org>
autocmd BufNewFile,BufRead *.tj3,*.taskjuggler,*.tji,*.tjp set ft=tjp
autocmd FileType tjp nmap <Leader>tm :make %<CR>



" For rpmbuilding
nmap <Leader>rbs :!rm ../SRPMS/%:r*.src.rpm; rpmbuild -bs %<CR>
nmap <Leader>rba :!rpmbuild -ba %<CR>
nmap <Leader>rls :!rpmlint %<CR>
nmap <Leader>rla :!rpmlint % ../SRPMS/%:r*.src.rpm<CR>
nmap <Leader>mlrx :tabedit /var/lib/mock/fedora-rawhide-x86_64/result<CR>
nmap <Leader>mlri :tabedit /var/lib/mock/fedora-rawhide-i386/result<CR>
nmap <Leader>mlsx :tabedit /var/lib/mock/fedora-18-x86_64/result<CR>
nmap <Leader>mlsi :tabedit /var/lib/mock/fedora-18-i386/result<CR>

" For buffers
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bc :bp\|bd #<CR>
nnoremap <Leader>bl :ls<CR>

" More for ctags, cscope
" Autoload cscope on start
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()

" Only updates and resets an existing, single cscope connection
" Will do nothing if a cscope connection doesn't already exist
function! RefreshCscope ()
    let db = findfile("cscope.out", ".;")
    if (!empty(db))
        let path = strpart(db, 0, match(db, "/cscope.out$"))
        if (!empty(path))
            exe ":!cscope -bR -s" . path
        else
            exe ":!cscope -bR"
        endif
        set nocscopeverbose
        exe ":cs reset"
        set cscopeverbose
    endif
endfunction
map <C-\>r :call RefreshCscope ()<CR><CR>
" New tab versions of the normal cscope mappings
map <C-\>G :tab split<CR>:exec("cscope find g ".expand("<cword>"))<CR>
map <C-\>S :tab split<CR>:exec("cscope find s ".expand("<cword>"))<CR>
map <C-\>C :tab split<CR>:exec("cscope find c ".expand("<cword>"))<CR>

map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Disable jedi features
let g:jedi#show_call_signatures = "1"

" Vim airline show buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '>'
let g:airline#extensions#tabline#left_alt_sep = '>'
"let g:airline_theme='wombat'


" pymode
let g:pymode_lint_on_write = 1
let g:pymode_rope = 1
let g:pymode_lint_checkers = ['pep8', 'pep257']
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" Ignore some extensions
set wildignore=*.o,*~,*.pyc,*.aux

" for sh
let g:sh_fold_enabled = 1

" some pelican helpers
command! GetCategoryList :read !grep -o -h '^:category:.*' content/*rst  | sed 's/:category: //' | tr ',' '\n' | sed 's/^[[:space:]]*//' | sort | uniq | sed '/^[[:space:]]*$/ d' | tr '\n' ',' | sed 's/,/, /g' | sed 's/,[[:space:]]*$//'
command! GetTagList :read !grep -o -h '^:tags:.*' content/*rst  | sed 's/:tags: //' | tr ',' '\n' | sed 's/^[[:space:]]*//' | sort | uniq | sed '/^[[:space:]]*$/ d' | tr '\n' ',' | sed 's/,/, /g' | sed 's/,[[:space:]]*$//'

" TW
" default task report type
let g:task_report_name     = 'next'
" custom reports have to be listed explicitly to make them available
let g:task_report_command  = []
" whether the field under the cursor is highlighted
let g:task_highlight_field = 1
" can not make change to task data when set to 1
"let g:task_readonly        = 0
" vim built-in term for task undo in gvim
let g:task_gui_term        = 1
" allows user to override task configurations. Seperated by space. Defaults to ''
let g:task_rc_override     = 'rc.defaultwidth=999'
" default fields to ask when adding a new task
let g:task_default_prompt  = ['project', 'priority', 'tags', 'scheduled', 'due', 'description']
" whether the info window is splited vertically
let g:task_info_vsplit     = 0
" info window size
let g:task_info_size       = 20
" info window position
let g:task_info_position   = 'belowright'
" directory to store log files defaults to taskwarrior data.location
let g:task_log_directory   = '~/.task'
" max number of historical entries
let g:task_log_max         = 20
" forward arrow shown on statusline
let g:task_left_arrow      = ' <<'
" backward arrow ...
let g:task_left_arrow      = '>> '

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_cpp_auto_refresh_includes = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_no_default_include_dirs = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_no_include_search = 1
"let g:syntastic_cpp_checkers = ['gcc', 'clang_check', 'cppcheck']
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_aggregate_errors = 1
let g:syntastic_cpp_config_file = '.syntastic_cpp_config'
let g:syntastic_mode_map = {
            \ "mode": "passive",
            \ "passive_filetypes": ["cpp", "c"],
            \ "active_filetypes": []
            \ }

let g:table_mode_corner_corner="+"
let g:table_mode_header_fillchar="="


" solarized
set background=dark
colorscheme solarized

" indent plugin
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

" sli
au BufRead,BufNewFile *.sli set filetype=sli
au FileType sli setl foldenable foldmethod=syntax 

command! GetIndexList :read !grep -nro '\\index{[a-zA-Z!-]\+}' * | sed 's/\\index{\(.*\)}/\1/' | cut -d ":" -f 3 |  sort | uniq | tr '!' ':' | tr '\n' ',' | sed 's/,/, /g'
