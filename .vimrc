set nocompatible

"powerline
set rtp+=$HOME/anaconda3/lib/python3.5/site-packages/powerline/bindings/vim
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup
"set laststatus=2
"set t_Co=256

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256



"  python3 from powerline.vim import setup as powerline_setup
"  python3 powerline_setup()
"  python3 del powerline_setup



" Always show statusline
" set laststatus=2
"
" " Use 256 colours (Use this setting only if your terminal supports 256
" colours)
" set t_Co=256
"


" Use 256 colours (Use this setting only if your terminal supports 256
"colours)
set t_Co=256

"set runtime path to include vundle
call plug#begin()

Plug 'rhysd/vim-clang-format'
"vim Colors Solarized
Plug 'altercation/vim-colors-solarized'

"move aside, tabularize
Plug 'junegunn/vim-easy-align'

"Configure vim plugins
Plug 'tpope/vim-fugitive'
"maybe we can make YCM use jedi?"
"Youcompleteme substring search code completion
"Disabling YCM for now because we can't get it working atm
Plug 'Valloric/YouCompleteMe'
"Syntastic to allow for syntax checking
Plug 'scrooloose/syntastic'
"Nerdtree for traversing directories
Plug 'scrooloose/nerdtree'
"git plugin to show status of files in nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'
"vim dispatch to allow for compilation within vim
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'

Plug 'svermeulen/vim-easyclip'
Plug 'ConradIrwin/vim-bracketed-paste'
"keep track of ruby environments
"Tpope is life
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-rbenv'
Plug 'vim-ruby/vim-ruby'
"Sensible vim standards
Plug 'tpope/vim-sensible'
"ACK
Plug 'mileszs/ack.vim'

"ctrlp is like my entire workflow
Plug 'kien/ctrlp.vim'
"ag allows ctrlp to be much faster
Plug 'rking/ag.vim'

"Git undo is like a beautiful tree, Use this if it breaks
Plug 'sjl/gundo.vim'

"vim-easymotion makes vim like vimium! Are we recursing yet?
Plug 'easymotion/vim-easymotion'
"edkolev/tmuxline.vim is a thing to integrate tmux and airline
Plug 'edkolev/tmuxline.vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"tabular to make indentation nicer, we're gonna be coding python, after all
Plug 'godlygeek/tabular'

"stop asking me dumb stuff about swp files
Plug 'chrisbra/Recover.vim'

"javascript syntax highlighting
Plug 'pangloss/vim-javascript'

"Begin all the nonsense of me trying to get react
Plug 'mxw/vim-jsx'

Plug 'hdima/python-syntax'

"better syntax highlighting for C/C++
Plug 'jeaye/color_coded'


"latex better
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview'



"BEGIN SCHEME THINGS FOR 112
Plug 'tpope/vim-surround'
Plug 'kien/rainbow_parentheses.vim'
Plug 'MicahElliott/vrod'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'wlangstroth/vim-racket'


call plug#end()


set mouse=nv
"nerdtree
filetype plugin indent on
syntax on
set rnu
set nu
set showmatch
set ruler
set matchtime=2
"set undofile
set splitbelow
set splitright
set ignorecase "ignore case
set smartcase "unless we use capitals
set shiftround
set expandtab
set smarttab
set laststatus=2 "always show status line
set lazyredraw
set langnoremap
set autoread
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"set to unicode if possible
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
endif
"Airline config
let g:airline_powerline_fonts = 1

"Youcompleteme
nnoremap <leader>y :YcmForceCompileAndDiagnostics<cr>
nnoremap <leader>gt :YcmCompleter GoTo<CR>
nnoremap <leader>pd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>pc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_goto_buffer_command = 'vertical-split'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion=1


"This lets us dynamically set the python server which runs to the current
"python executable, Not fast probably, but it actually works great
"and syncs up with anaconda
let g:ycm_python_binary_path = substitute(system('which python | xargs echo -n'), '^\s*\(.\{-}\)\s*$', '\1', '')
"
"syntastic
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:ycm_always_populate_loc_list = 1
let g:syntastic_always_populate_loc_list = 1
let g:EasyMotion_leader_key = '<Leader>e'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_cpp_check_header = 1
"EASYMOTION JUST GOT EASIER
map <Leader> <Plug>(easymotion-prefix)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

"Easyclip
"
let g:EasyClipShareYanks=1
set clipboard=unnamedplus


syntax enable
"vim colors solarized
let g:solarized_termtrans=1
let g:solarized_contrast="high"

"Gundo
nnoremap <leader>u :GundoToggle<CR>

"ctrlp
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

set background=dark
colorscheme solarized

"I want folding?
set foldmethod=indent
set foldlevel=99

"syntax highlighting for python
let python_highlight_all = 1

"tabular configs for aligning shit
nnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a/ :Tabularize /\/\//l2c1l0<CR>
vnoremap <Leader>a/ :Tabularize /\/\//l2c1l0<CR>
nnoremap <Leader>a, :Tabularize /,/l0r1<CR>
vnoremap <Leader>a, :Tabularize /,/l0r1<CR>
vnoremap <Leader>l: :Tabularize /:<CR>
vnoremap <Leader>a: :Tabularize /:<CR>

"map to <leader>cf in C++ mode
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
autocmd FileType make setlocal noexpandtab

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Octave syntax 
augroup filetypedetect 
    au! BufRead,BufNewFile *.m,*.oct set filetype=octave 
augroup END 

set autochdir


"Color Coded is a cool thing for cool people
let g:color_coded_enabled = 1
let g:color_coded_filetypes = ['c', 'cpp', 'objc']


if !exists('g:ycm_semantic_triggers')
let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
        \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
        \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
        \ 're!\\hyperref\[[^]]*',
        \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
        \ 're!\\(include(only)?|input){[^}]*'
        \ ]

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

au BufRead,BufNewFile *.cpp setlocal textwidth=71
au BufRead,BufNewFile *.h setlocal textwidth=71

vmap <C-c> "+y

