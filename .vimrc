" .vimrc by Rodionov M.
" =======================

set nocompatible    " be iMproved, required
filetype off        " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Bundle 'vim-sensible'
Bundle 'vundle'
Bundle 'bufexplorer.zip'

Bundle 'the-nerd-tree'
let NERDTreeChDirMode=2 "now you current Vim folder folows by NERD root folder
let NERDTreeIgnore = ['\.pyc$']
nmap <C-n> :NERDTreeToggle<cr>
vmap <C-n> <esc>:NERDTreeToggle<cr>i
imap <C-n> <esc>:NERDTreeToggle<cr>i

Bundle 'uarun/vim-protobuf'
Bundle 'vim-trailing-whitespace'
Bundle 'nginx-vim-syntax'
" DELETE ME: au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/*,nginx.conf*,*.nginx* setlocal filetype=nginx

Bundle 'vim-python-pep8-indent'

Bundle 'vim-template'
let g:username = 'Maxim Rodionov'

Bundle 'python-syntax'
let g:python_version_2 = 1
let g:python_highlight_all = 1

Bundle 'pyflakes.vim'
Bundle 'syntastic'
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_pylint_args = '--rcfile=.pylintrc'
let g:syntastic_python_pylint3_args = '--rcfile=.pylintrc'
let g:syntastic_css_checkers = ['csslint', 'prettycss']
let g:syntastic_warning_symbol = "!"

function! PY_toogle_py_syntax()
    if g:python_version_2 == 1
        let g:syntastic_python_pylint_exe = 'pylint3'
        let g:syntastic_python_checkers = ['pylint']
        let g:python_version_2 = 0
    else
        let g:syntastic_python_pylint_exe = 'pylint'
        let g:syntastic_python_checkers = ['flake8'] "'flake8''pylint'
        let g:python_version_2 = 1
    endif
endfunction

command TogglePy call PY_toogle_py_syntax()


Bundle 'vim-css-color'


Bundle 'vim-stylus'
autocmd BufNewFile,BufRead *.styl set filetype=stylus


" indent and syntax highlight
Bundle "vim-javascript"
let g:javascript_conceal = 1

Bundle 'html5.vim'

Bundle 'xml.vim'
let xml_tag_completion_map = ">>"
let xml_use_html = 1

Bundle 'matchtag'
Bundle 'django.vim'


Bundle 'YouCompleteMe'
" popup menu
set completeopt=menuone,menu,longest
highlight Pmenu ctermbg=239 gui=bold
highlight PmenuSel ctermfg=239

" The next line maps Jedi's jump to definition/declaration feature to the
" <leader>g shortcut
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>


Bundle 'ctrlp.vim'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(pyc)$',
  \ }

Bundle 'tagbar'
nnoremap <silent> <F9> :TagbarToggle<CR>
let g:tagbar_sort = 0


" autocomplete for javascript
Bundle 'tern_for_vim'

Bundle 'vim-fugitive'
" command to automaticlly pass git grep to quickfix window, inspired by:
" [1] http://stackoverflow.com/questions/21931116/getting-git-grep-to-work-effectively-in-vim
" [2] http://vim.wikia.com/wiki/Avoiding_the_%22Hit_ENTER_to_continue%22_prompts
command -nargs=+ Gg execute ':silent! Ggrep' <q-args> | execute ':redraw!' | cw

" my custom plugin to involve local vimrc scripts
Bundle 'vim-init'

Bundle 'vim-commentary'
Bundle 'vim-coffee-script'
autocmd BufNewFile,BufRead *.coffee set filetype=coffee




" Track the engine.
Bundle 'ultisnips'
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']


" https://github.com/jiangmiao/auto-pairs
Bundle 'auto-pairs'


call vundle#end()            " required
filetype plugin indent on    " required
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" =======================
" Common settings
" =======================
set noswapfile " do not create .swp files
set nocompatible
set laststatus=2
set statusline=[line=%04l,%04v]\ [total=%L]\ %=%.60F
set tabstop=4 shiftwidth=4 "expandtab
set expandtab
set cinoptions=:0,g0,(s,N-s
" :0 - Do not indent case in switch statement
" g0 - Do not indent C++ scope declaration(public, private, protected)
" (s - Indent lines after unclosed parentheses with one tab(4 spaces)
" N-s -Do not indent namespace

set ai "for tabs after press <Enter>
set nowrap
set list
syntax on
set backspace=indent,eol,start " hack to able backspace worked in insert mode

" speedup vim http://pastebin.com/V0ATpgyr
set nocursorcolumn
set nocursorline
set synmaxcol=200
syntax sync minlines=500
set ttyfast
set ttyscroll=3
set lazyredraw

" =======================
" Color settings
" =======================
set t_Co=256
set listchars=tab:\→\ ,trail:·,nbsp:· "View special characters
set fileformats=unix " show ^M symbols, prevent adding ^M symbols
hi SpecialKey ctermfg=Gray "Highlight special characters
" Error highlighting
hi SpellBad cterm=bold ctermfg=white ctermbg=red

" Add hilighting for some file extantions
au BufNewFile,BufRead *.xdc  set filetype=java "XDC TI build system based on java script
au BufNewFile,BufRead *.xs   set filetype=java  "XDC TI build system based on java script
au BufNewFile,BufRead *.bld  set filetype=java "SDC TI build system based on java script
au BufNewFile,BufRead *.conf set filetype=sh  "Linux configs
au BufNewFile,BufRead *.jst set syntax=jst  "java script templates file
au BufNewFile,BufRead *.mustache set syntax=mustache
au BufNewFile,BufRead *.html setlocal filetype=htmldjango ts=4 sts=4 sw=4
au BufNewFile,BufRead .jshintrc,.csslintrc setlocal filetype=json
" to improve js hightlighting
" http://stackoverflow.com/questions/6671199/gvim-long-multiline-string-highlighting
au BufNewFile,BufRead *.html syntax sync fromstart

" =======================
" Keys mapping
" =======================
set pastetoggle=<F2>

" For movement beetwing windows by jklh
map <C-j> <c-w>j
map <C-k> <c-w>k
map <C-l> <c-w>l
map <C-h> <c-w>h

" select function body
nmap vf vi}


" =======================
" My own scripts includes
" =======================
source ~/.vim/replace_all.vim

