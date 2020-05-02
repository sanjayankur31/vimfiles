set nocompatible
call plug#begin('~/.vim/plugged')

filetype off
Plug 'sanjayankur31/hoc.vim'
Plug 'sjbach/lusty'
Plug 'sanjayankur31/nmodl.vim'
Plug 'scrooloose/syntastic'
Plug 'bling/vim-airline'
Plug 'lifepillar/vim-solarized8'
" Git
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
" Fugitive + Github
Plug 'tpope/vim-rhubarb'
" Fugitive + Pagure
Plug 'FrostyX/fugitive-pagure-vim'
Plug 'tpope/vim-unimpaired'
Plug 'gregsexton/gitv'
Plug 'mhinz/vim-signify'
Plug 'mantiz/vim-plugin-dirsettings'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf.vim'
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
Plug 'mtth/scratch.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'Valloric/YouCompleteMe'
Plug 'KeitaNakamura/tex-conceal.vim'
Plug 'sanjayankur31/sli.vim'
Plug 'szw/vim-dict'
Plug 'sanjayankur31/vim-extra-ultisnips'
Plug 'tpope/vim-repeat'
" http://www.dotnetsurfers.com/blog/2016/02/08/using-vim-as-a-javascript-ide/
" https://oli.me.uk/2013/06/29/equipping-vim-for-javascript/
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
" Requires the server to be installed. Install in the pelican virtual-env:
" pip install https://github.com/gu-fan/instant-rst.py/archive/master.zip --upgrade
" Upstream needs to merge a PR, so use this until that is done
" pip install https://github.com/tlinhart/instant-rst.py/archive/master.zip --upgrade
" Requires python3-gevent on Fedora
Plug 'gu-fan/InstantRst'
" sideways
Plug 'AndrewRadev/sideways.vim'
" ack for ag
Plug 'mileszs/ack.vim'
" Open browser since netrw's gx no longer works for URLs
" https://github.com/vim/vim/issues/4738
Plug 'tyru/open-browser.vim'
" Taskjuggler
Plug 'sigmike/vim-taskjuggler'
" man pages using vim plugin when available
Plug 'jez/vim-superman'
" Media wiki syntax highlight
Plug 'chikamichi/mediawiki.vim'
" For ledger
Plug 'ledger/vim-ledger'
Plug 'mildred/vim-ledger-mode'
" For ruby on rails
Plug 'tpope/vim-rails'
" fix whitespaces
Plug 'ntpeters/vim-better-whitespace'
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

" split vertically to right
set splitright

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

" for searching
" https://stackoverflow.com/questions/2287440/how-to-do-case-insensitive-search-in-vim
set ignorecase
set smartcase

"Line length above which to break a line
autocmd FileType python,cpp,c,text,rst,markdown,sh,sli setl textwidth=79

" latex stuff
set grepprg="grep\ -nH\ $*"
let g:tex_flavor='latex'
" indentation for tex files
autocmd BufRead,BufNewFile *.sty setl filetype=tex
autocmd FileType tex setl sw=2
autocmd FileType tex setl tabstop=2
autocmd FileType tex setl softtabstop=2
autocmd FileType tex setl softtabstop=2
autocmd FileType tex IndentLinesDisable
autocmd FileType tex let g:ycm_auto_trigger=0
"Spell check
autocmd FileType tex,markdown,rst,mail,markdown setl spell spelllang=en_gb
autocmd FileType tex,markdown,rst,mail,markdown setl linebreak
let g:tex_conceal="abdgm"
let g:tex_conceal="abdgm"
let g:tex_fold_enabled=1

" vimtex
let g:vimtex_compiler_latexmk = {
            \ 'backend' : 'jobs',
            \ 'background' : 1,
            \ 'build_dir' : '',
            \ 'callback' : 1,
            \ 'continuous' : 0,
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
let g:vimtex_complete_bib = {
            \ 'recursive': 0,
            \ 'simple': 1,
            \}
" Do not open the quickfix window automatically for warnings.
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_fold_enabled = 1

let g:vimtex_toc_config = {
            \ 'mode': 1,
            \ 'fold_enable': 0,
            \ 'split_pos': 'vert botright',
            \ 'split_width': 60
            \}

let g:vimtex_view_method = "zathura"
let g:vimtex_view_general_viewer = "zathura"

" Folding in C,CPP files
autocmd FileType c,cpp setl foldenable foldmethod=syntax

" This is for vertical indenting
set list
set listchars=tab:\|\ ,trail:-,eol:$
" Folding
" set foldenable

" Different file comment templates
" Python
autocmd BufNewFile *.py 0r ~/.vim/file-templates/py.vim
" Fedora review
autocmd BufNewFile *.fedreview 0r ~/.vim/file-templates/fedreview.vim
" GNUPlot
autocmd BufNewFile,BufRead *.plt,.gnuplot setf gnuplot
autocmd BufNewFile *.plt,.gnuplot 0r ~/.vim/file-templates/gnuplot.vim
" Shell scripts
autocmd BufNewFile *.sh 0r ~/.vim/file-templates/sh.vim

" Jquery and javascript syntax
autocmd BufRead,BufNewFile jquery.*.js setl ft=javascript syntax=jquery

" Save and automatically load folds
" You need to make a ~/.vim/views folder and chmod it to 755
" mkdir -p ~/.vim/view
" chmod 755 ~/.vim/view
autocmd BufWinLeave *.* silent! mkview
autocmd BufWinEnter *.* silent! loadview

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
nnoremap <Leader>rbs :!rm ./%:r*.src.rpm; rpmbuild -bs %<CR>
nnoremap <Leader>rba :!rpmbuild -ba %<CR>
nnoremap <Leader>rls :!rpmlint %<CR>
nnoremap <Leader>rla :!rpmlint % ./%:r*.src.rpm<CR>
nnoremap <Leader>mlrx :tabedit /var/lib/mock/fedora-rawhide-x86_64/result<CR>
nnoremap <Leader>mlri :tabedit /var/lib/mock/fedora-rawhide-i386/result<CR>
" ChangeLog for specs
let spec_chglog_format = "%a %b %d %Y Ankur Sinha <ankursinha AT fedoraproject DOT org>"
" iab clog <c-r>=strftime("%a %b %d 20%y")<CR> Ankur Sinha <ankursinha AT fedoraproject DOT org>


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
autocmd BufEnter /* call LoadCscope()

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
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
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
let g:syntastic_perl_checkers = ['perlcritic']
let g:syntastic_ignore_files = ['texlive.spec']

let g:table_mode_corner_corner="+"
let g:table_mode_header_fillchar="="

" True color
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" must follow the above settings
" solarized
set background=dark
colorscheme solarized8_flat
" Because it must use the terminal's pallette
let g:solarized_use16=1

" sli
autocmd BufRead,BufNewFile *.sli set filetype=sli
autocmd FileType sli setl foldenable foldmethod=syntax

command! GetIndexList :read !grep -nro '\\index{[a-zA-Z!-]\+}' * | sed 's/\\index{\(.*\)}/\1/' | cut -d ":" -f 3 |  sort | uniq | tr '!' ':' | tr '\n' ',' | sed 's/,/, /g'

" Some neuron stuff
autocmd BufRead,BufNewFile *.hoc,*.oc set filetype=hoc
autocmd BufRead,BufNewFile *.mod set filetype=nmodl

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
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_key_list_select_completion = ['<C-n>']
let g:ycm_key_list_previous_completion = ['<C-p>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:UltiSnipsUsePythonVersion = 3
" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" disable polyglot for python for the time being
" https://github.com/sheerun/vim-polyglot/issues/209
let g:polyglot_disabled = ['python', 'latex']
let g:python_highlight_all = 1

" Permit per project vimrc customisations
set exrc
set secure


let g:LustyJugglerSuppressRubyWarning = 1

" Update post date for rst blog source files
function! UpdatePostDate()
    %s/^:date: .*$/\=strftime(":date: %Y-%m-%d %H:%M:%S")/
endfunction

" Some easytag configs
let g:easytags_syntax_keyword = 'always'
let g:easytags_dynamic_files = 2
let g:easytags_events = ['BufWritePost']
let g:easytags_async = 1

" Underline bad spellings, undercurl doesn't show on my config
" https://vi.stackexchange.com/questions/15015/how-do-i-turn-off-undercurls-in-vim-guis
" https://stackoverflow.com/questions/6008921/how-do-i-change-the-highlight-style-in-vim-spellcheck
hi clear SpellBad
hi SpellBad cterm=underline gui=underline

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

" set thesaurus to moby's
" don't track the file though, remember to download it
" wget https://www.gutenberg.org/files/3202/files/mthesaur.txt
set thesaurus+=~/.vim/mthesaur.txt

" Disable the complete window
" set completeopt-=preview
"

" InstantRst
let g:instant_rst_slow = 1

" ignore these file types completely
" LaTeX temporary files
set wildignore+=*.aux,*.bbl,*.bcf,*.blg,*.fls,*.idx,*.ilg,*.ind,*.log,*.out,*.run.xml,*synctex.gz,*.fdb_latexmk,*.nav,*.snm,*.toc,*.vrb,*.cut,*.lo,*.brf

" set relative numbers for use with numbertoggle
set number relativenumber

" Use silver searcher instead of ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Open browser plugin
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
let g:openbrowser_default_search = "ddg"
let g:openbrowser_search_engines = {
            \ 'ddg': 'http://duckduckgo.com/?q={query}',
            \ 'github': 'http://github.com/search?q={query}',
            \ }

" Activate vim man page viewer
runtime ftplugin/man.vim
" Use this for shift K
set keywordprg=:Man
" Make it cleaner
autocmd FileType man setlocal nomod nolist noexpandtab tabstop=8 softtabstop=8 shiftwidth=8

" Fedora antora rebuild
augroup fedora_docs
    autocmd!
    autocmd BufWritePost *adoc !./build.sh
augroup END


" Do not list quickfix and location list buffer in the buffer list, otherwise
" :bnext goes to quickfix
" https://stackoverflow.com/questions/28613190/exclude-quickfix-buffer-from-bnext-bprevious
augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END

" For ledger
let g:ledger_maxwidth = 80
autocmd BufRead,BufNewFile *.ledger set filetype=ledger
au FileType ledger noremap { ?^\d<CR>
au FileType ledger noremap } /^\d<CR>
let g:ledger_extra_options = '--pedantic --explicit --check-payees'
if exists('g:ycm_filetype_blacklist')
    call extend(g:ycm_filetype_blacklist, { 'ledger': 1 })
endif
let g:ledger_bin = 'ledger'


" Add syntax for Cref and cref from cleverref
" Tweaked from /usr/share/vim/vim82/syntax/tex.vim
syn region texRefZone     matchgroup=texStatement start="\\v\=cref{"       end="}\|%stopzone\>"    contains=@texRefGroup

" A function to load the right signature when I'm using neomutt
function! LoadSignature(signature)
    " Only work for mail files
    let this_file_type = &filetype
    if this_file_type != "mail"
        echo "This is not a mail file! Not running!"
        return 1
    endif

    " Get the current signature's line
    " Go to last line
    let saved_cursor_position = getpos('.')
    " Set cursor to file end and search backwards
    call cursor(99999999999999999999,0)
    let l:sigstart = search('-- ', 'b')
    " Confirm that the line was found
    if sigstart == 0
        echo "No signatures detected."
        return 1
    endif

    " Check if signature file exists
    let l:sigdir = escape(expand('$HOME'), '\') . "/Sync/99_private/neomuttdir/"
    let l:sigfile = sigdir . a:signature . ".sig"
    if filereadable(sigfile)
        " delete the current lines after the "-- " line
        let l:delstart = sigstart + 1
        execute delstart . ",$d"
        " Read the new signature
        execute sigstart . "read " . sigfile
        " Return cursor to wherever it was
        call setpos('.', saved_cursor_position)
    else
        echo "File " . sigfile . " not found!"
        echo "Available signature files:\n" . globpath(sigdir, '*.sig')
    endif
endfunction

" For docker related files
autocmd FileType yaml.docker-compose setl expandtab

" Remap CTRL-P for FZF
nnoremap <C-P> :Files <CR>
nnoremap <C-N> :GFiles <CR>

" Defaults for vim-better-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=0
