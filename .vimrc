set nocompatible
filetype off
filetype plugin indent off

"set runtime path to include vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Vundle must manage Vundle
Plugin 'VundleVim/Vundle.vim'

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
"vim-easymotion makes vim like vimium! Are we recursing yet?
Plugin 'easymotion/vim-easymotion'
"edkolev/tmuxline.vim is a thing to integrate tmux and airline
Plugin 'edkolev/tmuxline.vim'
Plugin 'bling/vim-airline'
"tabular to make indentation nicer, we're gonna be coding python, after all
Plugin 'godlygeek/tabular'



call vundle#end()


filetype plugin indent on
syntax on
set rnu
set nu
set showmatch
set ruler
set matchtime=2
set undofile
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
set textwidth=120
set laststatus=2 "always show status line
map <C-n> :NERDTreeToggle<CR>

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


"Youcompleteme configs
nnoremap <leader>y :YcmForceCompileAndDiagnostics<cr>
nnoremap <leader>gt :YcmCompleter GoTo<CR>
nnoremap <leader>pd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>pc :YcmCompleter GoToDeclaration<CR>
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/cpp/ycm/.ycm_global_ycm_extra_conf.py' 

"syntastic
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_always_populate_loc_list = 1

let g:EasyMotion_leader_key = '<Leader>e'

"EASYMOTION JUST GOT EASIER
map <Leader> <Plug>(easymotion-prefix)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

"tabular configs for aligning shit
nnoremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a/ :Tabularize /\/\//l2c1l0<CR>
vnoremap <Leader>a/ :Tabularize /\/\//l2c1l0<CR>
nnoremap <Leader>a, :Tabularize /,/l0r1<CR>
vnoremap <Leader>a, :Tabularize /,/l0r1<CR>
