" Turn on syntax highlighting
syntax on

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

" Enable filetype plugins
filetype on
filetype plugin indent on

" latex stuff
let g:tex_flavor='latex'
" indentation for tex files
au FileType tex set sw=2
"Spell check
au FileType tex setlocal spell spelllang=en_gb
" Vim-latex rules: 
" to enable \ll to run automatically for pdfs
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='dvi,pdf'

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
set pdev=cups-pdf
set printoptions=paper:A4,syntax:y,wrap:y,number:y


"Folding 
set foldcolumn=5


" Colourscheme from learning vim and vi
colorscheme default
function SetTimeOfDayColours()
    let currentHour = strftime("%H")
    if currentHour < 6 + 0
        let colorScheme = "candy"
    elseif currentHour < 12 + 0
        let colorScheme = "distinguished"
    elseif currentHour < 18 + 0
        let colorScheme = "jellybeans"
    else
        let colorScheme = "jellybeans"
    endif

    if g:colors_name !~ colorScheme 
        "echo "Setting color scheme to " . colorScheme
        execute "colorscheme " . colorScheme
    endif
endfunction

" I need to find a good set of schemes before using this
" call SetTimeOfDayColours()
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
let g:jedi#show_call_signatures = "0"

" Vim airline show buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '>'
let g:airline#extensions#tabline#left_alt_sep = '>'
"let g:airline_theme='wombat'

" pathogen
execute pathogen#infect()
execute pathogen#helptags()

" pymode
let g:pymode_lint_on_write = 0
let g:pymode_rope = 1

" Ignore some extensions
set wildignore=*.o,*~,*.pyc,*.aux
