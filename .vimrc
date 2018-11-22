filetype off                  " required
" set the runtime path to include Vundle and initialize
set so=20
set number 
syntax on
syntax enable

set autoindent
set cursorline
set showmatch
set smartcase
set ignorecase
set hlsearch

" set indent
set sw=4
set ts=4

filetype indent on

" show \tab
set list lcs=tab:\|\  
map <C-t> :NERDTreeToggle<CR>

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" color schemes
Plug 'iCyMind/NeoSolarized'
Plug 'crusoexia/vim-monokai'
Plug 'KeitaNakamura/neodark.vim'
Plug 'drewtempelmeyer/palenight.vim'


Plug 'junegunn/vim-easy-align'
Plug 'skywind3000/quickmenu.vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'tpope/vim-fireplace', {'for': 'clojure'}

Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
Plug 'w0rp/ale'

let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
set tags=./.tags;,.tags

let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

if !isdirectory(s:vim_tags)
	silent! call mkdir(s:vim_tags,'p')
endif

Plug 'skywind3000/asyncrun.vim'
let g:asyncrun_open = 6
let g:asyncrun_bell = 1
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
nnoremap <silent> <F9> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
nnoremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>

" Plug 'nathanaelkane/vim-indent-guides'
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red	ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
Plug 'Yggdroot/indentLine'
let g:indentLine_setColors = 0
let g:indentLine_char = '¦'



" Initialize plugin system
cal plug#end()


" set color schemes
set background=dark
colorscheme neodark
set termguicolors
