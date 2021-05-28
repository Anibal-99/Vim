set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax on
set showcmd
set ruler
set encoding=UTF-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set noshowmode
set splitbelow
set splitright
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase
" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" Better display for messages
set cmdheight=1
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
"highlight Normal ctermbg=NONE
call plug#begin('~/.config/nvim/plugged')
Plug 'ironcamel/vim-script-runner', {'for': ['sh', 'python']}
" Syntax
Plug 'sheerun/vim-polyglot'

" Lineas de indentado
Plug 'yggdroot/indentline'

"autocomenplado
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'

"Plug 'cristianoliveira/vim-react-html-snippets'
Plug 'jvanja/vim-bootstrap4-snippets'

" Themes
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'

" Easymotion
Plug 'easymotion/vim-easymotion'

"Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'

" Airline 
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" status bar
Plug 'itchyny/lightline.vim'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

" test
Plug 'vim-test/vim-test'

" python
Plug 'vim-python/python-syntax'

" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" emmet
Plug 'mattn/emmet-vim'

" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'

" snippets
Plug 'honza/vim-snippets'

" Inconos
"Plug 'ryanoasis/vim-devicons'

call plug#end()
let g:webdevicons_enable_nerdtree_brackets = 1


colorscheme gruvbox
" colores 
let g:gruvbox_contrast_dark = "hard"
highlight Normal ctermbg=NONE

" letra para easymotion
let mapleader=" "
nmap <Leader>s <Plug>(easymotion-s2)

" Configuracion de Nerdtree
nmap <Leader>nc :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1

" airline
let g:airline#extensions#tabline#enabled = 1 "pare superior del airline

" Configuracion de escape y guardar
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

" Kite
let g:kite_supported_languages = ['python', 'javascript']
let g:kite_tab_complete=1
let g:kite_previous_placeholder = '<C-H>'
let g:kite_next_placeholder = '<C-L>'
"let g:kite_supported_languages = []

" coc
autocmd FileType python let b:coc_suggest_disable = 1
autocmd FileType javascript let b:coc_suggest_disable = 1

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"gatillado de autocomenplado de coc y kite
if &filetype =="javascript" || &filetype =="python"
 inoremap <c-space> <C-x><C-u>
else  
  inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
     \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
endif

" atajos de definicion de coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Terminal
vnoremap <c-t> :split<CR>:ter<CR>: resize 10<CR>
nnoremap <c-t> :split<CR>:ter<CR>: resize 10<CR>

let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key=','
let g:user_emmet_mode='a'

" fuzzy finder
nnoremap <Leader>fs :Files<CR>

" Tmux config
"let g:tmux_navigator_no_mappings = 1 
"nnoremap <silent> <Leader><C-h> :TmuxNavigateLeft<cr>
"nnoremap <silent> <Leader><C-j> :TmuxNavigateDown<cr>
"nnoremap <silent> <Leader><C-k> :TmuxNavigateUp<cr>
"nnoremap <silent> <Leader><C-l> :TmuxNavigateRight<cr>

" Ejecutar archivo actual
nnoremap <Leader>x :!python3 %<cr>

" mapeo de buffers
map <Leader>ob :Buffers<cr>
:imap ii <Esc>

" Config status bar
let g:lightline = {
      \ 'active': {
      \   'left': [['mode', 'paste'], [], ['relativepath', 'modified']],
      \   'right': [['kitestatus'], ['filetype', 'percent', 'lineinfo'], ['gitbranch']]
      \ },
      \ 'inactive': {
      \   'left': [['inactive'], ['relativepath']],
      \   'right': [['bufnum']]
      \ },
      \ 'component': {
      \   'bufnum': '%n',
      \   'inactive': 'inactive'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'kitestatus': 'kite#statusline'
      \ },
      \ 'colorscheme': 'gruvbox',
      \ 'subseparator': {
      \   'left': '',
      \   'right': ''
      \ }
      \}



