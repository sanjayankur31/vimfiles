" disable polyglot for python for the time being
" https://github.com/sheerun/vim-polyglot/issues/209
" Need to be done at top of vimrc
let g:polyglot_disabled = ['python']
let g:python_highlight_all = 1
"
" https://github.com/ledger/vim-ledger/issues/143#issuecomment-1562279948
let g:ledger_is_hledger=v:false

set nocompatible
call plug#begin('~/.vim/plugged')

filetype off
Plug 'sanjayankur31/hoc.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'sjbach/lusty'
Plug 'alkino/vim-mod-syntax'
Plug 'dense-analysis/ale'
Plug 'bling/vim-airline'
Plug 'lifepillar/vim-solarized8'
Plug 'tpope/vim-unimpaired'
Plug 'mhinz/vim-signify'
Plug 'mantiz/vim-plugin-dirsettings'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'ludovicchabant/vim-gutentags'
Plug 'liuchengxu/vista.vim'
Plug 'preservim/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'lervag/vimtex'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-python/python-syntax'
Plug 'Konfekt/FastFold'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'rhysd/vim-grammarous'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'mtth/scratch.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'Valloric/YouCompleteMe'
"does not work with vimtex v2
"Plug 'KeitaNakamura/tex-conceal.vim'
Plug 'sanjayankur31/sli.vim'
Plug 'szw/vim-dict'
Plug 'sanjayankur31/vim-extra-ultisnips'
Plug 'tpope/vim-repeat'

" http://www.dotnetsurfers.com/blog/2016/02/08/using-vim-as-a-javascript-ide/
" https://oli.me.uk/2013/06/29/equipping-vim-for-javascript/
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
" Not required because Polyglot already includes vim-jsx-pretty
" Plug 'yuezk/vim-js'
" Plug 'maxmellon/vim-jsx-pretty'

" sideways
Plug 'AndrewRadev/sideways.vim'
" ack for ag
Plug 'mileszs/ack.vim'
" Open browser since netrw's gx no longer works for URLs
" https://github.com/vim/vim/issues/4738
Plug 'tyru/open-browser.vim'
" Taskjuggler
Plug 'sigmike/vim-taskjuggler'
" Media wiki syntax highlight
Plug 'chikamichi/mediawiki.vim'
" For ledger
Plug 'ledger/vim-ledger'
Plug 'mildred/vim-ledger-mode'
" For ruby on rails
Plug 'tpope/vim-rails'
" fix whitespaces
Plug 'ntpeters/vim-better-whitespace'
" editorconfig
Plug 'editorconfig/editorconfig-vim'
" Run at end so it doesn't override other plugins
Plug 'sheerun/vim-polyglot'
" Sentence chopper
Plug 'Konfekt/vim-sentence-chopper'
" Unicode marker
Plug 'Konfekt/vim-unicode-homoglyphs'
" DrawIt for ascii drawings
Plug 'vim-scripts/DrawIt'
Plug 'vim-scripts/TaskList.vim'
" To automatically change directory
Plug 'airblade/vim-rooter'
" Highlight CSS colours: useful for css editing
Plug 'ap/vim-css-color'
" Virtualenv
Plug 'jmcantrell/vim-virtualenv'
" better netrw
Plug 'tpope/vim-vinegar'
" snakemake syntax
Plug 'snakemake/snakemake', { 'rtp': 'misc/vim' }
" for writing: highlights overused words
Plug 'dbmrq/vim-ditto'
" corrects common typos
Plug 'preservim/vim-litecorrect'
" Git
Plug 'tpope/vim-fugitive'
" Fugitive + Github
Plug 'tpope/vim-rhubarb'
" Fugitive + Pagure
Plug 'FrostyX/fugitive-pagure-vim'
" Sync spelling files
Plug 'micarmst/vim-spellsync'
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
set scrolloff=2

" enable increamental search
set incsearch

" Permit unsaved buffers
set hidden

" Enable conceal
set conceallevel=2
set concealcursor=c

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

" Line length above which to break a line
" Don't break for text writing: TeX, md, rst, sh
autocmd FileType python,cpp,c,sli setl textwidth=79

" latex stuff
set grepprg="rg\ -nH\ $*"
let g:tex_flavor='latex'
" indentation for tex files
autocmd BufRead,BufNewFile *.sty,*.eps_tex,*.pdf_tex setl filetype=tex
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
let g:vimtex_include_search_enabled = 0
let g:vimtex_syntax_custom_cmds = [
            \{
                \ 'name': 'href',
                \ 'argspell': 0
            \},
            \{
                \ 'name': 'fullcite',
                \ 'argspell': 0
            \},
            \{
                \ 'name': 'textcite',
                \ 'argspell': 0
            \},
            \{
                \ 'name': 'url',
                \ 'argspell': 0
            \},
            \{
                \ 'name': 'ac',
                \ 'argspell': 0,
                \ 'conceal': 1
            \},
            \]
let g:vimtex_syntax_custom_cmds_with_concealed_delims = [
            \{
                \ 'name': 'enquote',
                \ 'nargs': 1,
                \ 'argspell': 1,
                \ 'cchar_open': '"',
                \ 'cchar_close': '"',
            \},
            \{
                \ 'name': 'ref',
                \ 'nargs': 1,
                \ 'argspell': 0,
                \ 'cchar_open': '[',
                \ 'cchar_close': ']',
            \},
            \{
                \ 'name': 'cref',
                \ 'nargs': 1,
                \ 'argspell': 0,
                \ 'cchar_open': '[',
                \ 'cchar_close': ']',
            \},
            \{
                \ 'name': 'footref',
                \ 'nargs': 1,
                \ 'argspell': 0,
                \ 'cchar_open': '[',
                \ 'cchar_close': ']',
            \},
            \]

" Folding in C,CPP files
autocmd FileType c,cpp setl foldenable foldmethod=syntax
" Folding in javascript
" tab width (docs seem to use 2 spaces, so lets follow that)
autocmd FileType js,javascript,typescriptreact setl foldenable foldmethod=syntax tabstop=2 shiftwidth=2 et

" This is for vertical indenting
set list
set listchars=tab:\|\ ,trail:-,eol:$
" Folding
" set foldenable

" Different file comment templates
" Python
autocmd BufNewFile *.py 0r ~/.vim/file-templates/py.vim
" GNUPlot
autocmd BufNewFile,BufRead *.plt,.gnuplot setf gnuplot
autocmd BufNewFile *.plt,.gnuplot 0r ~/.vim/file-templates/gnuplot.vim
" Shell scripts
autocmd BufNewFile *.sh 0r ~/.vim/file-templates/sh.vim
" Tex
autocmd BufNewFile *.tex 0r ~/.vim/file-templates/tex.vim

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
"   call system("a2ps " . a:fname)
"   call delete(a:fname)
"   return v:shell_error
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
nnoremap <Leader>rbs :!git clean -dfx ; spectool -g %<CR>
nnoremap <Leader>mlrx :tabedit /var/lib/mock/fedora-rawhide-x86_64/result<CR>
nnoremap <Leader>mlri :tabedit /var/lib/mock/fedora-rawhide-i386/result<CR>
" ChangeLog for specs
autocmd BufNewFile,BufRead *.spec set ft=spec
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
"let g:ycm_server_python_interpreter = 'python3'
"let g:ycm_python_binary_path = 'python3'
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
let g:ycm_update_diagnostics_in_insert_mode = 0

nmap <leader>ygw <Plug>(YCMFindSymbolInWorkspace)
nmap <leader>ygh <Plug>(YCMFindSymbolInDocument)
nmap <leader>ygd :YcmCompleter GoToDeclaration<CR>
nmap <leader>ygf :YcmCompleter GoToDefinition<CR>
nmap <leader>yge :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <leader>ygk :YcmCompleter GetDoc<CR>

" Vim airline show buffers
let g:airline_symbols_ascii = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '>'
let g:airline#extensions#tabline#left_alt_sep = '>'
let g:airline#extensions#virtualenv#enabled = 1
"let g:airline_theme='wombat'


" Ignore some extensions
set wildignore=*.o,*~,*.pyc,*.aux

" for sh
let g:sh_fold_enabled = 1

" some pelican helpers
command! GetCategoryList :read !grep -o -h '^:category:.*' content/*rst  | sed 's/:category: //' | tr ',' '\n' | sed 's/^[[:space:]]*//' | sort | uniq | sed '/^[[:space:]]*$/ d' | tr '\n' ',' | sed 's/,/, /g' | sed 's/,[[:space:]]*$//'
command! GetTagList :read !grep -o -h '^:tags:.*' content/*rst  | sed 's/:tags: //' | tr ',' '\n' | sed 's/^[[:space:]]*//' | sort | uniq | sed '/^[[:space:]]*$/ d' | tr '\n' ',' | sed 's/,/, /g' | sed 's/,[[:space:]]*$//'

" Ale
nmap <leader>an :ALENextWrap<CR>
nmap <leader>ap :ALEPreviousWrap<CR>

let g:airline#extensions#ale#enabled = 1
" Not when text saved, it's disruptive
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" Not when opening files: sometimes we just want to read them
let g:ale_lint_on_enter = 0
" Only when I save
let g:ale_lint_on_save = 1
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescriptreact': ['eslint'],
\}
let g:ale_virtualtext_cursor = 0
" in bytes
let g:ale_maximum_file_size = 10000
" python virtualenv support
let g:ale_python_auto_virtualenv = 1

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

" Modelines for files
set modelines=4
set nomodeline
" Allow toggling so that these aren't run automatically, which is a security issue
" https://security.stackexchange.com/questions/36001/vim-modeline-vulnerabilities etc.
" From https://www.gilesorr.com/blog/vim-tips-22-modelines.html
nnoremap <leader>ml :setlocal invmodeline <bar> doautocmd BufRead<cr>
" From https://vim.fandom.com/wiki/Modeline_magic
" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction

" NERDCommenter
" Do not add spaces after comment delimiters by default
let g:NERDSpaceDelims = 0
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Align comments to left
let NERDDefaultAlign="left"

let g:indentLine_setColors = 0
" Do not conceal in insert mode
let g:indentLine_concealcursor = 'c'

" Lustyjuggler
let g:LustyJugglerDefaultMappings = 0
nnoremap <Leader>ljb :LustyJuggler<CR>
nnoremap <Leader>ljbe :LustyBufferExplorer<CR>


" For buffers
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <Leader>bc :bp\|bd #<CR>
nnoremap <leader>bl :ls<cr>:b<space>


let g:ycm_use_ultisnips_completer = 1
" make YCM compatible with UltiSnips (using supertab)
" https://stackoverflow.com/a/22253548/375067
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

let g:UltiSnipsUsePythonVersion = 3
let g:ultisnips_python_style = "sphinx"


" Permit per project vimrc customisations
set exrc
set secure


let g:LustyJugglerSuppressRubyWarning = 1

" Update post date for rst blog source files
function! UpdatePostDate()
    %s/^:modified: .*$/\=strftime(":modified: %Y-%m-%d %H:%M:%S")/
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
let g:signify_priority = 1

" Enable spelling for git commit temporary files
autocmd FileType gitcommit setlocal spell

" set thesaurus to moby's
" don't track the file though, remember to download it
" wget https://www.gutenberg.org/files/3202/files/mthesaur.txt
set thesaurus+=~/.vim/mthesaur.txt

" Disable the complete window
set completeopt+=popup,preview
"

" InstantRst
let g:instant_rst_slow = 1

" ignore these file types completely
" LaTeX temporary files
autocmd FileType tex set wildignore+=*.log,*.aux,*.bbl,*.bcf,*.blg,*.fls,*.idx,*.ilg,*.ind,*.out,*.run.xml,*synctex.gz,*.fdb_latexmk,*.nav,*.snm,*.toc,*.vrb,*.cut,*.lo,*.brf

" ctrl c does not work:
" https://github.com/jeffkreeftmeijer/vim-numbertoggle/issues/30
" use ctrl [, which is equivalent to esc
set number relativenumber

" Use silver searcher instead of ack
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

" Open browser plugin
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
let g:openbrowser_default_search = "ddg"
let g:openbrowser_search_engines = {
            \ 'ddg': 'https://duckduckgo.com/?q={query}',
            \ 'github': 'https://github.com/search?q={query}',
            \ 'askfedora': 'https://ask.fedoraproject.org/search?q={query}',
            \ 'fedorapackages': 'https://packages.fedoraproject.org/search?query={query}',
            \ 'koji': 'https://koji.fedoraproject.org/koji/search?match=glob&type=package&terms={query}',
            \ 'bodhi': 'https://bodhi.fedoraproject.org/updates/?packages={query}',
            \ 'rhbzall': 'https://bugzilla.redhat.com/buglist.cgi?classification=Fedora&component={query}&product=Fedora',
            \ 'rhbzopen': 'https://bugzilla.redhat.com/buglist.cgi?bug_status=__open__&classification=Fedora&component={query}&product=Fedora&query_format=advanced',
            \ }

" Activate vim man page viewer
runtime ftplugin/man.vim
" Use this for shift K
set keywordprg=:Man
" Make it cleaner
autocmd FileType man setlocal nomod nolist noexpandtab tabstop=8 softtabstop=8 shiftwidth=8 nonu noma noswapfile colorcolumn=0
autocmd FileType man IndentLinesDisable


" Do not list quickfix and location list buffer in the buffer list, otherwise
" :bnext goes to quickfix
" https://stackoverflow.com/questions/28613190/exclude-quickfix-buffer-from-bnext-bprevious
augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END

" For ledger
let g:ledger_maxwidth = 120
let g:ledger_align_at = 117
autocmd BufRead,BufNewFile *.ledger set filetype=ledger
au FileType ledger noremap { ?^\d<CR>
au FileType ledger noremap } /^\d<CR>
let g:ledger_extra_options = '--pedantic --strict'
if exists('g:ycm_filetype_blacklist')
    call extend(g:ycm_filetype_blacklist, { 'ledger': 1 })
endif
let g:ledger_bin = 'ledger'
let g:ledger_date_format = '%m-%d'
au FileType ledger nnoremap <Leader>= :call ledger#align_commodity()<CR>
au FileType ledger vnoremap <Leader>= :call ledger#align_commodity()<CR>


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

" Folding with Java
autocmd FileType java setl foldenable foldmethod=syntax

" for editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Octave syntax
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END

" Set neuroml files to xml
autocmd BufRead,BufNewFile *.nml setl filetype=xml
" Set schema for xmllint
autocmd BufRead,BufNewFile *.xml,*.nml call SetXmllintSchema()

" set schema locations
let g:NeuroMLSchemaDir = expand("~/Documents/02_Code/00_mine/NeuroML/software/NeuroML2/Schemas/NeuroML2/")
let g:LEMSSchemaDir = expand("~/Documents/02_Code/00_mine/NeuroML/software/LEMS/Schemas/LEMS/")

" A function to load the right schema file for NeuroML and LEMS files
function! SetXmllintSchema ()
    " Only work for XML files
    let this_file_type = &filetype
    if this_file_type != "xml"
        return 1
    endif
    " Go to last line
    let saved_cursor_position = getpos('.')

    " NeuroML check
    " Set cursor to file start
    call cursor(0, 1)
    " Is it a NeuroML file
    let l:neuroml = search('xmlns.*neuroml2')
    if neuroml != 0
        call cursor(neuroml, 1)
        let l:schemaloc = search('schemaLocation.*.xsd')
        let l:schemaline = getline(schemaloc)
        let l:xsdfile = matchstr(schemaline, '\C/NeuroML_.*.xsd')
        let l:xsdfull = g:NeuroMLSchemaDir . xsdfile
        if filereadable(xsdfull) == 0
            echoerr $"Readable XSD file not found at {xsdfull}"
            return 1
        endif
        echom $"Using schema: {xsdfull}"
        let g:ale_xml_xmllint_options = "--schema ". xsdfull
    endif
    " LEMS
    " Set cursor to file start
    call cursor(0, 1)
    " Is it a NeuroML file
    let l:lems = search('xmlns.*/lems/')
    if lems != 0
        call cursor(lems, 1)
        let l:schemaloc = search('schemaLocation.*.xsd')
        let l:schemaline = getline(schemaloc)
        let l:xsdfile = matchstr(schemaline, '\C/LEMS_.*.xsd')
        let l:xsdfull = g:LEMSSchemaDir . xsdfile
        if filereadable(xsdfull) == 0
            echoerr $"Readable XSD file not found at {xsdfull}"
            return 1
        endif
        echom $"Using schema: {xsdfull}"
        let g:ale_xml_xmllint_options = "--schema ". xsdfull
    endif

    " Return cursor to the saved position
    call setpos('.', saved_cursor_position)
endfunction

" OSB omt and MEP files are yaml files
autocmd BufRead,BufNewFile *.omt,*.mep setl filetype=yaml

" For vista
" Otherwise the vista list is outdated
let g:vista_update_on_text_changed = 0
let g:vista_default_executive = 'ctags'

" For C/CPP to run make from vim
" Reference: https://vim.fandom.com/wiki/Automatically_open_the_quickfix_window_on_:make
" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" For rooter (currently using defaults)
let g:rooter_pattern = ['.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile']

" Set default font for GVim, since it does not pick up the value from the
" terminal
" Reference: https://stackoverflow.com/questions/16882696/settings-default-font-in-gvim
if has("gui_running")
  set guifont=Anka/Coder\ Condensed\\,\ Semi-Condensed\ 16
endif

" Add new line without entering insert mode
" https://stackoverflow.com/questions/16134457/insert-a-newline-without-entering-in-insert-mode-vim
nmap oo o<Esc>k
nmap OO O<Esc>j

" https://github.com/preservim/tagbar/wiki#typescript
let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }

" https://vim.fandom.com/wiki/Vim_as_XML_Editor
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax
au FileType xsd setlocal foldmethod=syntax
" for YAML
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab foldmethod=indent

" use rg for gutentags
if executable('rg')
  let g:gutentags_file_list_command = 'rg --files'
endif

" set mouse
set ttymouse=xterm2
set mouse=a

" vista options
let g:vista#renderer#enable_icon = 0


" to close netrw buffers:
" https://github.com/tpope/vim-vinegar/issues/13#issuecomment-47133890
autocmd FileType netrw setl bufhidden=delete
let g:netrw_fastbrowse = 0

" scroll popup
" https://vi.stackexchange.com/a/40085/6918
function! ScrollPopup(nlines)
    let winids = popup_list()
    if len(winids) == 0
        return
    endif

    " Ignore hidden popups
    let prop = popup_getpos(winids[0])
    if prop.visible != 1
        return
    endif

    let firstline = prop.firstline + a:nlines
    let buf_lastline = str2nr(trim(win_execute(winids[0], "echo line('$')")))
    if firstline < 1
        let firstline = 1
    elseif prop.lastline + a:nlines > buf_lastline
        let firstline = buf_lastline + prop.firstline - prop.lastline
    endif

    call popup_setoptions(winids[0], {'firstline': firstline})
endfunction
nnoremap <C-j> :call ScrollPopup(3)<CR>
nnoremap <C-k> :call ScrollPopup(-3)<CR>

" word count for LaTeX docs using detex
" modified from comment in https://tex.stackexchange.com/a/590/11281
command! -range=% WC <line1>,<line2>w ! sed '/detex: ignore/ d' | detex | wc
" neomuttrc files
autocmd BufRead,BufNewFile *.neomuttrc setl filetype=neomuttrc

function! UpdateLedgerAmount (newVal)
    " select current transaction
    :normal Vip\=
    :normal Vip
    :execute "'<,'>s/£\\(\\d\\|\\.\\)\\+/£" . a:newVal . '/g'
    :normal \=
endfunction

" ensure that jdt.ls knows where to find java17 for YCM because I set my
" default java to 11 for some tools to work
" let g:ycm_java_binary_path = "/usr/lib/jvm/java-17-openjdk-17.0.12.0.7-2.fc40.x86_64/bin/java"
"

" ignore markdown in javadocs
let g:java_ignore_markdown = 1
