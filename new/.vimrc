"              /$$                                  
"             |__/                                  
"   /$$    /$$ /$$ /$$$$$$/$$$$   /$$$$$$   /$$$$$$$
"  |  $$  /$$/| $$| $$_  $$_  $$ /$$__  $$ /$$_____/
"   \  $$/$$/ | $$| $$ \ $$ \ $$| $$  \__#| $$      
"    \  $$$/  | $$| $$ | $$ | $$| $$      | $$      
"  /$$\  $/   | $$| $$ | $$ | $$| $$      |  $$$$$$$
" |__/ \_/    |__/|__/ |__/ |__/|__/       \_______/
" 
" Vim config by : laelaps

" GENERAL

syntax on												" set syntax highlighting
syntax enable
set encoding=utf-8										" set encoding to UTF-8
set cursorline											" highlight current line
set number												" show line number
set tabstop=4											" set 4 chars for \t
set shiftwidth=4										" set 4 chars for >> / << / ==
set autoindent											" indent newlines automatically
set smartindent											" smart autoindent (language specific)
set noswapfile											" disable swapfile
set undofile											" enables undo history to make it persistent between sessions
set undodir=~/.vim/undodir								" the dir to save undo history to
set incsearch											" set incremental search (real time)
set hlsearch											" highlight search results
set ignorecase											" ignore case in search
set smartcase											" override ignorecase if search pattern contains upper case
set wrap												" set line wrapping
set linebreak											" if wrap is set, makes line breaks at natural places like spaces between words
set scrolloff=20										" ensures that (n) lines of document are visible above/bellow the cursor when scrolling through the document
set sidescrolloff=8										" similar to scrolloff but horizontally
set timeoutlen=500										" time to wait for a mapped sequence to complete
set foldmethod=manual									" manage folds manually
set laststatus=2										" always show status line
set clipboard=unnamedplus								" enable clipboard support for integration with system clipboard
set autoread											" automatically read files when edited outside of vim
set showmatch											" show matching brackets
set mouse=a												" enable mouse support
set noshowmode											" don't show mode in command line, as lightline shows it
set termguicolors										" enable 24-bit RGB colors in the terminal
"set expandtab											" convert tabs to spaces
"set colorcolumn=80										" highlight the (n) column
"set background=dark									" set the color of the background

" KEY MAPPINGS

let mapleader = " "										" set the leader key to SPACE

" Splits

" move between splits with Leader key
nnoremap <leader>h :wincmd h<CR>						" move to left split
nnoremap <leader>j :wincmd j<CR>						" move to bottom split
nnoremap <leader>k :wincmd k<CR>						" move to top split
nnoremap <leader>l :wincmd l<CR>						" move to right split

" move between splits with Ctrl key
nnoremap <C-h> <C-w>h									" move to left split
nnoremap <C-j> <C-w>j									" move to bottom split
nnoremap <C-k> <C-w>k									" move to top split
nnoremap <C-l> <C-w>l									" move to right split

" resizing splits
nnoremap <silent> <C-Up>    :resize -2<CR>				" resize split 2 chars to the left
nnoremap <silent> <C-Down>  :resize +2<CR>				" resize split 2 chars to the right
nnoremap <silent> <C-Left>  :vertical resize -2<CR> 	" resize split 2 lines up
nnoremap <silent> <C-Right> :vertical resize +2<CR> 	" resize split 2 lines down

nnoremap <leader>w :w<CR>								" save with Leader+w
nnoremap <leader>q :q<CR>								" quit with Leader+q

nnoremap <leader>/ :nohlsearch<CR>						" turn off highlighting in search with Leader+/

nnoremap <S-Up> :m .-2<CR>==							" move lines up with Shift+Up
nnoremap <S-Down> :m .+1<CR>==							" move lines down with Shift+Down

nnoremap <leader>t :term<CR>							" open a terminal with Leader+t

nnoremap <leader>n :set number!<CR>						" toggle line numbers with Leader+n
nnoremap <leader>r :set relativenumber!<CR>				" toggle relative line numbers with Leader+r


" PLUGINS

call plug#begin('~/.vim/plugged')													" Initialize vim-pluged. Use :PlugInstall to re-install plugins after making changes here

	Plug 'itchyny/lightline.vim'       												" Lightweight status line
	Plug 'tpope/vim-commentary'        												" Easy commenting
	Plug 'lervag/vimtex'               												" LaTeX support
	Plug 'morhetz/gruvbox'															" colorscheme
	Plug 'preservim/nerdtree'          												" NERDTree
	Plug 'ryanoasis/vim-devicons'													" NERDTree icons
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'									" NERDTree syntax highlighting


call plug#end()

" -- NerdTree --

nnoremap <leader>e :NERDTreeToggle<CR>    											" open/close NERDTree with <leader>e
map <leader>nt :NERDTreeFind<CR>													" open file in a new tab
nnoremap <leader>rt :NERDTreeRefreshRoot<CR>										" refresh nerdtree view
nnoremap <leader>cf :NERDTreeFind<CR>												" jump to current file in nerdtree


let NERDTreeShowHidden=1															" show hidden files
let g:nerdtree_win_size = 75														" set initial width
autocmd vimenter * NERDTree															" open NERDTree automatically when vim opens
autocmd bufenter * if (winnr('$') == 1 && &filetype == 'nerdtree') | quit | endif	" close vim automatically if NERDTree is the last window open
autocmd BufEnter * if (winnr('$') == 1 && &filetype == 'nerdtree') | q | endif		" close NERDTree automatically when opening a file
autocmd vimenter * if !argc() | NERDTree | endif									" open vim with NERDTree listing

" -- VimTeX (LaTeX) --

let g:vimtex_view_method = 'zathura'      											" Set PDF viewer for LaTeX
let g:tex_flavor = 'latex'                											" Set LaTeX as the default flavor

" -- Lightline --

let g:lightline = {'colorscheme': 'gruvbox','active': {'left': [['mode', 'paste'], ['readonly', 'filename', 'modified']]},'component_function': {'filename': 'LightlineFilename',},}

" function to show current file name
function! LightlineFilename()
	return expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

" - VimComentary -

nmap <leader>c gcc																	" comment current line with Leader+c
vmap <leader>c gc																	" comment selected lines with Leader+c

" COLORSCHEME

colorscheme gruvbox

set background=dark

" set transparent background
highlight Normal ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
highlight NormalNC ctermbg=NONE guibg=NONE
