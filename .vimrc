set nocompatible
filetype off
filetype plugin indent off

"set runtime path to include vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Vundle must manage Vundle
Plugin 'VundleVim/Vundle.vim'

"vim Colors Solarized
Plugin 'altercation/vim-colors-solarized'

"Configure vim plugins
Plugin 'tpope/vim-fugitive'
"Youcompleteme substring search code completion
Plugin 'Valloric/YouCompleteMe'
"Syntastic to allow for syntax checking
Plugin 'scrooloose/syntastic'
"Nerdtree for traversing directories
Plugin 'scrooloose/nerdtree'
"git plugin to show status of files in nerdtree
Plugin 'Xuyuanp/nerdtree-git-plugin'
"vim dispatch to allow for compilation within vim
Plugin 'tpope/vim-dispatch'
"keep track of ruby environments
"Tpope is life
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-rbenv'
Plugin 'vim-ruby/vim-ruby'
"Sensible vim standards
Plugin 'tpope/vim-sensible'
"ACK
Plugin 'mileszs/ack.vim'

"ctrlp is like my entire workflow
Plugin 'kien/ctrlp.vim'
"ag allows ctrlp to be much faster
Plugin 'rking/ag.vim'

"Git undo is like a beautiful tree, Use this if it breaks
Plugin 'sjl/gundo.vim'

"vim-easymotion makes vim like vimium! Are we recursing yet?
Plugin 'easymotion/vim-easymotion'
"edkolev/tmuxline.vim is a thing to integrate tmux and airline
Plugin 'edkolev/tmuxline.vim'
Plugin 'bling/vim-airline'
"tabular to make indentation nicer, we're gonna be coding python, after all
Plugin 'godlygeek/tabular'

"stop asking me dumb stuff about swp files
Plugin 'chrisbra/Recover.vim'

"javascript syntax highlighting
Plugin 'pangloss/vim-javascript'

"Tern is installed so that we can use YCM autocompletion for javascript
Plugin 'ternjs/tern_for_vim'

"maybe we can make YCM use jedi?"
Plugin 'davidhalter/jedi-vim'

"Begin all the nonsense of me trying to get react
Plugin 'mxw/vim-jsx'

Plugin 'hdima/python-syntax'

call vundle#end()


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
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab
set smarttab
set laststatus=2 "always show status line
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
let g:ycm_goto_buffer_command = 'vertical-split'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_filetype_blacklist = { 'python': 1}
let g:ycm_path_to_python_interpreter = '/home/ethan/miniconda2/envs/CS101completer/bin/python'
"
"syntastic
let g:syntastic_python_python_exec = 'home/ethan/miniconda2/envs/CS101/bin/python'
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_always_populate_loc_list = 1
let g:EasyMotion_leader_key = '<Leader>e'
let g:syntastic_javascript_checkers = ['eslint']
"EASYMOTION JUST GOT EASIER
map <Leader> <Plug>(easymotion-prefix) map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)


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
vnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a/ :Tabularize /\/\//l2c1l0<CR>
vnoremap <Leader>a/ :Tabularize /\/\//l2c1l0<CR>
nnoremap <Leader>a, :Tabularize /,/l0r1<CR>
vnoremap <Leader>a, :Tabularize /,/l0r1<CR>

"map to <leader>cf in C++ mode
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>


