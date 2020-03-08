set history=1000

" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab

" Text Formatting
set smartindent                                              " be smart about it
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set shiftround                                               " use multiple of shiftwidth when indenting with '<' and '>'
set tabstop=2                                                " actual tabs occupy 8 characters
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set backspace=2                                              " Fix broken backspace in some setups
set expandtab                                                " expand tabs to spaces
set autoread                                                 " autoread file changes from disk
set autoindent                                               " autoindent

set foldmethod=indent   " folds based on indentation
set foldnestmax=10      " limit nesting of folds
"set nofoldenable        " open files unfoleded
set foldlevel=1         " fold level

set colorcolumn=100
setlocal textwidth=120

set mouse=a  " enable all mouse scroll

set number              " show line numbers

set showcmd             " show command in bottom bar

set cursorline          " highlight current line

filetype indent on      " load filetype-specific indent files

set wildmenu            " visual autocomplete for command menu

set wildmode=list:longest

set lazyredraw          " redraw only when we need to.
set title
set showmatch           " highlight matching [{()}]
set ruler
set incsearch           " search as characters are entered

set hlsearch            " highlight matches
set backspace=indent,eol,start

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let mapleader = ','
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Set font for GUI (e.g. GVim)
if has("gui_running")
    set guifont=Anonymous_Pro\ 13
endif

set ignorecase
set smartcase
set fileformat=unix
"set columns=80
"olorscheme ron

filetype plugin on
filetype indent on
:highlight ExtraWhitespace ctermbg=red guibg=red
" The following alternative may be less obtrusive.
:highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
" Try the following if your GUI uses a dark background.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

highlight Comment gui=italic
highlight Comment cterm=italic

set showcmd
set ofu=syntaxcomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType phtml set omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete
set incsearch

" tab navigation like firefox
 :nmap <C-S-tab> :tabprevious<CR>
 :nmap <C-tab> :tabnext<CR>
 :map <C-S-tab> :tabprevious<CR>
 :map <C-tab> :tabnext<CR>
 :imap <C-S-tab> <Esc>:tabprevious<CR>i
 :imap <C-tab> <Esc>:tabnext<CR>i
 :nmap <C-t> :tabnew<CR>
 :imap <C-t> <Esc>:tabnew<CR>

 map <F2> :mksession! ~/vim_session <cr> " Quick write session with F2
 map <F3> :source ~/vim_session <cr>     " And load session with F3

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" syntax checking plugin
Plugin 'scrooloose/syntastic'
" Lean & mean status/tabline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" best Git wrapper of all time
Plugin 'tpope/vim-fugitive'
" git highlighter
Plugin 'airblade/vim-gitgutter'
" indent guides
Plugin 'nathanaelkane/vim-indent-guides'
" autocomplete
Plugin 'shougo/neocomplete.vim'
Plugin 'shougo/neosnippet-snippets'
" less syntax
Plugin 'groenewege/vim-less'
" Comment plugin
Plugin 'scrooloose/nerdcommenter'
" file system
Plugin 'scrooloose/nerdtree'
" shows whitespace
Plugin 'ntpeters/vim-better-whitespace'
" automatic closing of quotes, parenthesis, brackets, etc
Plugin 'Raimondi/delimitMate'

" color schemes
"Plugin 'altercation/vim-colors-solarized'
Plugin 'crusoexia/vim-monokai'

" JSX
Plugin 'chemzqm/vim-jsx-improve'


call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
" Don't show seperators

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
    let g:airline_symbols.space = "\ua0"
let g:airline_theme = 'dark'

let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_spell=1
let g:airline#extensions#syntastic#enabled = 1

" unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.maxlinenr = '☰'
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.spell = 'Ꞩ'
  let g:airline_symbols.notexists = '∄'
  let g:airline_symbols.whitespace = 'Ξ'

function! AirlineInit()
    let g:airline_section_a = airline#section#create(['mode', ' ','branch'])
    let g:airline_section_b = airline#section#create_left(['ffenc', 'hunks','%f'])
    let g:airline_section_c = airline#section#create(['filetype'])
    let g:airline_section_x = airline#section#create(['%P'])
    let g:airline_section_y = airline#section#create(['%B'])
    let g:airline_section_z = airline#section#create_right(['%l', '%c'])
endfunction
autocmd VimEnter * call AirlineInit()


set modifiable
set statusline=%{fugitive#statusline()}

let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 1

set laststatus=2
set encoding=utf-8
if !has('gui_running')
    set t_Co=256
endif
let g:Powerline_symbols = 'fancy'

syntax enable
set background=dark
"let g:solarized_visibility = 'high'
"let g:solarized_contrast = 'high'
"let g:solarized_termcolors=256
colorscheme monokai

autocmd BufNewFile,BufRead *.tt setf tt2

"let g:indent_guides_auto_colors = 1
let g:indent_guides_enable_on_vim_startup = 1
set ts=2 sw=2 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=red   ctermbg=237
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=240


" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return (pumvisible() ? "\<C-y>" : "\<CR>" ) . "\<Space>"
  " For no inserting <CR> key.
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Neocomplete Plugin mappins
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>""


" NerdTree
" autocmd vimenter * NERDTree

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
