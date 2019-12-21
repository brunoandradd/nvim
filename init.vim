call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'tpope/vim-rails'
Plug 'benmills/vimux'
Plug 'jgdavey/vim-turbux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next','do': 'bash install.sh'}
Plug 'antew/vim-elm-language-server'
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'carmonw/elm-vim'
Plug 'w0rp/ale'
Plug 'cohama/lexima.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'pbogut/deoplete-elm'
Plug 'tmux-plugins/vim-tmux-focus-events'

call plug#end()

" autocmd VimEnter * NERDTree | wincmd p

colorscheme gruvbox
set background=dark

set hidden

set number
set relativenumber
set termguicolors

set mouse=a

set inccommand=split
set clipboard=unnamed

set expandtab
set shiftwidth=2

set autoread
autocmd FocusGained * checktime
let g:LanguageClient_serverCommands = {'elm': ['~/.config/coc/elm-language-server'] }

let mapleader="\<space>"

nnoremap <leader>; A;<esc>
nnoremap <leader>s "_d<esc>
nnoremap <leader>sv :source /Users/brunoandradd/.config/nvim/init.vim<cr>
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>nf :NERDTreeFind<cr>
nnoremap <leader>nc :NERDTreeClose<cr>
nnoremap <leader>nu :NERDTreeFocus<cr>
nnoremap <leader>h :split<cr>
nnoremap <leader>q :quit<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <c-p> :Files<cr>
nnoremap <c-f> :Ag<space>
nnoremap <c-d> :%s/
vnoremap qq <Esc>`>a'<Esc>`<i'<Esc>
nnoremap mm ^i#<space><Esc>

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"
let g:UltiSnipsExpandTrigger =      '<tab>'
let g:UltiSnipsListSnippets  =      '<c-tab>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

