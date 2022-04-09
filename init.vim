call plug#begin()

Plug 'sonph/onehalf', { 'rtp': 'vim' }

Plug 'neovim/nvim-lspconfig'
Plug 'google/vim-jsonnet'


" navigation tools
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'

" literally waste the whole day configuring vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'EvitanRelta/vim-colorschemes'


" blessing unto papa tpope
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'

" fix vim annoyances
Plug 'chrisbra/Recover.vim'
Plug 'tpope/vim-surround'
Plug 'kien/rainbow_parentheses.vim'

Plug 'folke/zen-mode.nvim'

"ctrlp is like my entire workflow
Plug 'kien/ctrlp.vim'
"ag allows ctrlp to be much faster
Plug 'rking/ag.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
set nu
set rnu
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'


call plug#end()

set t_Co=256
set tabstop=4 shiftwidth=4 expandtab
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
set mouse=a
set clipboard+=unnamedplus
set ruler
colorscheme solarized

map <C-n> :NERDTreeToggle<CR>
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"ctrl p shit
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

lua << EOF
  require("zen-mode").setup {
  window = {
    backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    -- height and width can be:
    -- * an absolute number of cells when > 1
    -- * a percentage of the width / height of the editor when <= 1
    -- * a function that returns the width or the height
    width = 120, -- width of the Zen window
    height = 1, -- height of the Zen window
    -- by default, no options are changed for the Zen window
    -- uncomment any of the options below, or add other vim.wo options you want to apply
    options = {
      -- signcolumn = "no", -- disable signcolumn
      -- number = false, -- disable number column
      -- relativenumber = false, -- disable relative numbers
      -- cursorline = false, -- disable cursorline
      -- cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      -- list = false, -- disable whitespace characters
    },
  },
  plugins = {
    -- disable some global vim options (vim.o...)
    -- comment the lines to not apply the options
    options = {
      enabled = true,
      ruler = true, -- disables the ruler text in the cmd line area
      showcmd = false, -- disables the command in the last line of the screen
    },
    twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
    gitsigns = { enabled = false }, -- disables git signs
    tmux = { enabled = false }, -- disables the tmux statusline
    -- this will change the font size on kitty when in zen mode
    -- to make this work, you need to set the following kitty options:
    -- - allow_remote_control socket-only
    -- - listen_on unix:/tmp/kitty
    kitty = {
      enabled = false,
      font = "+4", -- font size increment
    },
  },
  -- callback where you can add custom code when the Zen window opens
  on_open = function(win)
  end,
  -- callback where you can add custom code when the Zen window closes
  on_close = function()
  end,
}

EOF


" split navigations
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

""EASYMOTION JUST GOT EASIER
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



" it's literally all coc bs
" coc configuration stuff
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

nmap rd <Plug> :call CocCommand('rust-analyzer.openDocs')


"let g:AirlineTheme='solarized'
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
