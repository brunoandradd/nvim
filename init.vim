autocmd FileType elm setlocal softtabstop=4 shiftwidth=4 expandtab
let g:elm_setup_keybindings = 0

call plug#begin()
Plug 'elixir-editors/vim-elixir'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'thoughtbot/vim-rspec'
Plug 'benmills/vimux'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'andys8/vim-elm-syntax'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'w0rp/ale'
Plug 'cohama/lexima.vim'
Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'gregsexton/Atom'
" clojure plugins 
Plug 'Olical/conjure', {'tag': 'v4.4.0'}
Plug 'clojure-vim/vim-jack-in'
Plug 'radenling/vim-dispatch-neovim'
Plug 'ncm2/float-preview.nvim'
" colore schemes 
Plug 'sainnhe/sonokai'
Plug 'liuchengxu/vim-clap'
Plug 'luochen1990/rainbow'


call plug#end()

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" config tree

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

let g:rainbow_active = 1 

 " Configuration to claps 
let g:clap_provider_grep_delay = 50
let g:clap_provider_grep_opts = '-H --no-heading --vimgrep --smart-case --hidden -g "!.git/"'


let g:float_preview#docked = 0
let g:float_preview#max_width = 80
let g:float_preview#max_height = 40

let g:ale_linters = {
      \ 'clojure': ['clj-kondo']
      \}

colorscheme sonokai
let g:sonokai_style = 'shusia'
set background=dark

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
set hidden
set number
set relativenumber
set termguicolors
set mouse=a
set inccommand=split
set clipboard=unnamed
set cmdheight=1
set updatetime=300
set expandtab
set shiftwidth=2
set ignorecase

let tabulousLabelNameTruncate = 1 
let g:rspec_runner = "os_x_iterm2"
let g:rspec_command = "Dispatch rspec {spec}"
let NERDTreeShowHidden=1


filetype plugin indent on
syntax on

set autoread
autocmd FocusGained * checktime

let mapleader="\<space>"
let maplocalleader=","

" config to clojure
noremap <leader>cr  :ConjureConnect<cr>

" coc Remap keys
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>ca :CocAction<cr>

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <leader>; A;<esc>
nnoremap <leader>== :set cmdheight=4<cr>
nnoremap <leader>-- :set cmdheight=1<cr>
nnoremap <leader>s "_d<esc>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>v :vsplit<cr>
noremap  <leader>e :NERDTreeFind<cr>
nnoremap <leader>nu :NERDTreeFocus<cr>
nnoremap <leader>h :split<cr>
nnoremap <leader>q :quit<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <c-p> :Files<cr>
nnoremap <c-f> :Ag<space>
nnoremap <c-d> :%s/
vnoremap qq <Esc>`>a'<Esc>`<i'<Esc>

" config to rails
noremap <leader>lm :Emigration<cr>
noremap <leader>db :tabnew config/database.yml<cr>
noremap <leader>ge :tabnew Gemfile<cr>

" config to tabs
noremap <c-t> :tabnew<cr>
noremap <leader>tc :tabclose<cr>
noremap <leader>] :tabnext<cr>
noremap <leader>[ :tabprevious<cr>


" Default highlighting (see help :highlight and help :highlight-link)
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual

" save files
nnoremap <c-s> :w<cr>

noremap <c-o> :CocList outline methods<cr>

" block navigate keys in normal mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

