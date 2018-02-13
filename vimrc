set nocompatible
call plug#begin('~/.vim/plugged')

filetype off
Plug 'sanjayankur31/hoc.vim'
Plug 'sjbach/lusty'
Plug 'sanjayankur31/nmodl.vim'
Plug 'scrooloose/syntastic'
Plug 'bling/vim-airline'
Plug 'sanjayankur31/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'mhinz/vim-signify'
Plug 'mantiz/vim-plugin-dirsettings'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'dhruvasagar/vim-table-mode'
Plug 'farseer90718/vim-taskwarrior'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-python/python-syntax'
Plug 'lervag/vimtex'
Plug 'Konfekt/FastFold'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ivalkeen/nerdtree-execute'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'rhysd/vim-grammarous'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mtth/scratch.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Autobuild YCM after update
function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !~/bin/updateYCM.sh
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

Plug 'KeitaNakamura/tex-conceal.vim'
Plug 'sanjayankur31/sli.vim'
Plug 'szw/vim-dict'
Plug 'sanjayankur31/vim-extra-ultisnips'
call plug#end()

" dirsettings
call dirsettings#Install()

"Syntax
syntax on

" vim-plug does this already, not required
" Enable filetype plugins
" filetype on
" filetype plugin indent on

" Always display status line
set laststatus=2

" set some context
set scrolloff=1

" enable increamental search
set incsearch

" Permit unsaved buffers
set hidden

" Enable conceal
set conceallevel=2
set concealcursor=nc

" Abbreviations
ab inout input
ab sop System.out.println(
ab pvsm public static void main (String [] args)
ab sforge http://downloads.sourceforge.net/%{name}/%{name}-%{version}.tar.gz

" Automatically write a file when leaving a modified buffer
set autowrite

" Start a dialog when a command fails (here when quit command fails)
set confirm

" Show me line numbers
set nu

" Highlight current line
set cursorline

" Number of spaces a tab stands for
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set syn=auto
set showmatch

"Show info in the window title
set title

"Line length above which to break a line
au FileType python,cpp,c,text,rst,markdown,sh,sli setl textwidth=79

" latex stuff
set grepprg="grep\ -nH\ $*"
let g:tex_flavor='latex'
" indentation for tex files
au BufRead,BufNewFile *.sty setl filetype=tex
au FileType tex setl sw=2
au FileType tex setl tabstop=2
au FileType tex setl softtabstop=2
au FileType tex setl softtabstop=2
au FileType tex IndentLinesDisable
au FileType tex let g:ycm_auto_trigger=0
"Spell check
au FileType tex,markdown,rst,mail,markdown setl spell spelllang=en_gb
let g:tex_conceal="abdgm"
let g:tex_conceal="abdgm"
let g:tex_fold_enabled=1

" vimtex
let g:vimtex_compiler_latexmk = {
            \ 'backend' : 'jobs',
            \ 'background' : 1,
            \ 'build_dir' : '',
            \ 'callback' : 1,
            \ 'continuous' : 1,
            \ 'executable' : 'latexmk',
            \ 'options' : [
            \   '-pdf',
            \   '-verbose',
            \   '-recorder',
            \   '-pdflatex="pdflatex"',
            \   '--shell-escape',
            \   '-use-make',
            \   '-bibtex',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=nonstopmode',
            \ ],
            \}

if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme
let g:vimtex_complete_recursive_bib = 1
" Do not open the quickfix window automatically for warnings.
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_fold_enabled = 1


" Folding in C,CPP files
au FileType c,cpp setl foldenable foldmethod=syntax

" This is for vertical indenting
set list
set listchars=tab:\|\ ,trail:-,eol:$
" Folding
" set foldenable

" Different file comment templates
autocmd BufNewFile *.py 0r ~/.vim/py.vim
autocmd BufNewFile *.fedreview 0r ~/.vim/fedreview.vim
au BufRead,BufNewFile jquery.*.js setl ft=javascript syntax=jquery
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

" Vim filetype detection
" Language: TaskJuggler
" Maintainer: Max Meyer <dev@fedux.org>
autocmd BufNewFile,BufRead *.tj3,*.taskjuggler,*.tji,*.tjp set ft=tjp
autocmd FileType tjp nmap <Leader>tm :make %<CR>

" For rpmbuilding
nnoremap <Leader>rbs :!rm ../SRPMS/%:r*.src.rpm; rpmbuild -bs %<CR>
nnoremap <Leader>rba :!rpmbuild -ba %<CR>
nnoremap <Leader>rls :!rpmlint %<CR>
nnoremap <Leader>rla :!rpmlint % ../SRPMS/%:r*.src.rpm<CR>
nnoremap <Leader>mlrx :tabedit /var/lib/mock/fedora-rawhide-x86_64/result<CR>
nnoremap <Leader>mlri :tabedit /var/lib/mock/fedora-rawhide-i386/result<CR>
" ChangeLog for specs
let spec_chglog_format = "%a %b %d %Y Ankur Sinha <ankursinha AT fedoraproject DOT org>"
iab clog <c-r>=strftime("%a %b %d 20%y")<CR> Ankur Sinha <ankursinha AT fedoraproject DOT org>


" New tab versions of the normal cscope mappings
set tags=./tags;
noremap <C-\>G :tab split<CR>:exec("cscope find g ".expand("<cword>"))<CR>
noremap <C-\>S :tab split<CR>:exec("cscope find s ".expand("<cword>"))<CR>
noremap <C-\>C :tab split<CR>:exec("cscope find c ".expand("<cword>"))<CR>
noremap <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" http://vim.wikia.com/wiki/Autoloading_Cscope_Database
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

" ycm
let g:ycm_server_python_interpreter = 'python3'
let g:ycm_python_binary_path = 'python3'
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'

" Vim airline show buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '>'
let g:airline#extensions#tabline#left_alt_sep = '>'
"let g:airline_theme='wombat'


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
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_no_default_include_dirs = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_no_include_search = 1
let g:syntastic_cpp_checkers = ['gcc', 'clang_check', 'cppcheck']
let g:syntastic_aggregate_errors = 1
let g:syntastic_cpp_config_file = '.syntastic_cpp_config'
let g:syntastic_mode_map = {
            \ "mode": "passive",
            \ "passive_filetypes": ["cpp", "c"],
            \ "active_filetypes": ["tex", "python", "sh", "spec", "rst"]
            \ }
let g:syntastic_tex_checkers = ['chktex']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_exec = "flake8-3"
let g:syntastic_rst_checkers = ['rstcheck']
let g:syntastic_rst_rstcheck_exec = "rstcheck"


let g:table_mode_corner_corner="+"
let g:table_mode_header_fillchar="="


" solarized
set background=dark
colorscheme solarized

" sli
au BufRead,BufNewFile *.sli set filetype=sli
au FileType sli setl foldenable foldmethod=syntax

command! GetIndexList :read !grep -nro '\\index{[a-zA-Z!-]\+}' * | sed 's/\\index{\(.*\)}/\1/' | cut -d ":" -f 3 |  sort | uniq | tr '!' ':' | tr '\n' ',' | sed 's/,/, /g'

" Some neuron stuff
au BufRead,BufNewFile *.hoc,*.oc set filetype=hoc
au BufRead,BufNewFile *.mod set filetype=nmodl

" Modelines for files
set modeline
set modelines=4

" NERDCommenter
"" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Ignore temporary files
let NERDTreeIgnore = ['\.pyc$', '\.aux$', '\.bbl$', '\.blg', '\.brf$', '\.out$', '\.fls$']

let g:indentLine_setColors = 0

" Lustyjuggler
let g:LustyJugglerDefaultMappings = 0
nnoremap <Leader>ljb :LustyJuggler<CR>

" For buffers
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <Leader>bc :bp\|bd #<CR>


" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:UltiSnipsUsePythonVersion = 3
" better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" disable polyglot for python for the time being
" https://github.com/sheerun/vim-polyglot/issues/209
let g:polyglot_disabled = ['python', 'latex']
let g:python_highlight_all = 1

" Permit per project vimrc customisations
set exrc
set secure


let g:LustyJugglerSuppressRubyWarning = 1

" A function to trim all trailing whitespace
function! TrimTrailingWhiteSpace()
    %s/\s\+$//e
endfunction
function! UpdatePostDate()
    %s/^:date: .*$/\=strftime(":date: %Y-%m-%d %H:%M:%S")/
endfunction

" Some easytag configs
let g:easytags_syntax_keyword = 'always'
let g:easytags_dynamic_files = 2
let g:easytags_events = ['BufWritePost']
let g:easytags_async = 1

" Underline bad spellings, undercurl doesn't show on my config
hi clear SpellBad
hi SpellBad cterm=underline

" Use matchit
runtime! macros/matchit.vim

" Delete comment character when joining commented lines
set formatoptions+=j

" Update binary spell file automatically
" https://vi.stackexchange.com/questions/5050/how-to-share-vim-spellchecking-additions-between-multiple-machines
for d in glob('~/.vim/spell/*.add', 1, 1)
    if filereadable(d) && (!filereadable(d . '.spl') || getftime(d) > getftime(d . '.spl'))
        exec 'mkspell! ' . fnameescape(d)
    endif
endfor

" vim-signify
let g:signify_vcs_list = ['git']

" Enable spelling for git commit temporary files
autocmd FileType gitcommit setlocal spell
