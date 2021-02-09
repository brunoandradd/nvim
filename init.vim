autocmd FileType elm setlocal softtabstop=4 shiftwidth=4 expandtab
" let g:elm_setup_keybindings = 0

call plug#begin()
Plug 'elmcast/elm-vim'
Plug 'mattn/webapi-vim'
Plug 'mattn/vim-gist'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'elixir-editors/vim-elixir'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'
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
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'gregsexton/Atom'
" clojure plugins 
Plug 'guns/vim-sexp',    {'for': 'clojure'}
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'liquidz/vim-iced-asyncomplete', {'for': 'clojure'}
Plug 'liquidz/vim-iced', {'for': 'clojure'}
Plug 'liquidz/vim-iced-coc-source', {'for': 'clojure'}

" colore schemes 
Plug 'sainnhe/sonokai'
Plug 'luochen1990/rainbow'


call plug#end()

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
let mapleader="\<space>"
let maplocalleader=","

" config asynctaks
let g:asyncrun_open = 0
noremap <localleader>tr :AsyncRun open "https://trello.com/b/JKXRD0Ka/desenvolvimento"<cr>
noremap <localleader>cs :AsyncRun open "https://app.codeship.com/home"<cr>
noremap <localleader>he :AsyncRun open "https://dashboard.heroku.com/apps"<cr>
noremap <localleader>gh :AsyncRun open "https://github.com/"<cr>
noremap <localleader>cc :AsyncRun open "https://codeclimate.com/"<cr>
noremap <localleader>bc :AsyncRun open "https://3.basecamp.com/4288753/"<cr>

" config fzf 
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" keys to fzf work
map <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>
nnoremap <leader>l :Locate ""<CR>
nnoremap <leader>b :Buffers<cr>
nnoremap <c-p> :Files<cr>
nnoremap <c-f> :Ag<space>


let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND=""

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

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)



" config plugin iced
let g:iced_enable_default_key_mappings = v:true

let g:rainbow_active = 1 
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
" set setguifont=Monospace\ 20
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
nmap <c-s> :w<cr>
imap <c-s> <Esc>:w<cr>

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

