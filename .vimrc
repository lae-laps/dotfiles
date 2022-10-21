"         _
"        (_)
"  __   ___ _ __ ___  _ __ ___
"  \ \ / / | '_ ` _ \| '__/ __|
"   \ V /| | | | | | | | | (__
"    \_/ |_|_| |_| |_|_|  \___|
"
" vim config by: laelaps

set encoding=utf-8

syntax on
syntax enable

set cursorline
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set ic
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch                   " incremental searching
"set hlsearch                    " continuous searching
"set paste
"set conceallevel=0
set colorcolumn=500
set ttimeoutlen=0

set termwinsize=28x0            " set terminal size
set splitbelow                  " always split terminals below
set mouse=a                     " enable mouse drag on window splits

"highlight ColorColumn ctermbg=0 guibg=lightgrey

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible              " be iMproved, required
filetype off                  " required

" Vundle plugin manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
"    Plugin 'Valloric/YouCompleteMe'
call vundle#end()           

call pathogen#infect()

filetype plugin indent on

call plug#begin('~/.vim/plugged')
    Plug 'preservim/nerdtree'                       " nerdtree 
    Plug 'ryanoasis/vim-devicons'                   " icons for nerdtree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  " improve nerdtree icons with colors
    Plug 'VundleVim/Vundle.vim'                     " git plugin
    "Plug 'wfxr/minimap.vim'                        " minimap like VsCode in right
    Plug 'Valloric/YouCompleteMe'                   " code completion  
    Plug 'adrian5/oceanic-next-vim'                 " colorscheme
    Plug 'drewtempelmeyer/palenight.vim'            " colorscheme
    Plug 'morhetz/gruvbox'                          " colorscheme
    Plug 'arcticicestudio/nord-vim'                 " colorscheme
    Plug 'Yggdroot/indentLine'                      " Indent lines
    Plug 'vim-airline/vim-airline'                  " Status line
    Plug 'haya14busa/incsearch.vim'                 " Incremental Searching (multiple highlightings at once, etc...)
    Plug 'tpope/vim-fugitive'                       " GIT wrapper
    Plug 'lervag/vimtex'                            " plugin for LaTeX
    "Plug 'leafgarland/typescript-vim'              " typescript for vim
    Plug 'vim-utils/vim-man'                        " View man pages from within vim
    "Plug 'preservim/tagbar'                        " File Structure Viewer
    Plug 'lyuts/vim-rtags'
    Plug 'mbbill/undotree'
call plug#end()

"let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf=0
"let g:ycm_python_binary_path='/usr/bin/python3'

let g:indentLine_faster          = 1

let g:palenight_terminal_italics = 1

let g:airline_powerline_fonts    = 1

let g:airline#extensions#whitespace#enabled = 0

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "
let g:netrw_browse_split = 2
let g:netrw_winsize = 25

let g:gruvbox_contrast_dark = 'hard'

" vimTeX config 

"filetype plugin indent on

set conceallevel=0

let g:tex_flavor = 'latex'

let g:vimtex_view_method = 'zathura'                                                    " set the viewer to zathura 

let g:vimtex_syntax_conceal_disable = 1

"nmap <F12> :VimtexCompile<CR>                                                           

" default latex run is set to latexmk

" Set python support

"let g:python3_host_prog = 'path/to/python3'
"let g:python2_host_prog = 'path/to/python2'

" Minimap Config

"let g:minimap_width = 10
"let g:minimap_auto_start = 1
"let g:minimap_auto_start_win_enter = 1

" Tagbar Config

nmap <F3> :TagbarToggle<CR>                     
let g:tagbar_autofocus = 1                      " focus the bar on opening it
"let g:tagbar_autoshowtag = 1                   " highlight active bar
let g:tagbar_position = 'botright vertical'     " make vertical and put in right

" Complete symbols

"inoremap ( ()<Esc>i
inoremap { {}<Esc>i
"inoremap [ []<Esc>i
"inoremap < <><Esc>i
"inoremap ' ''<Esc>i
"inoremap " ""<Esc>i

" KeyBindings for moving lines up and down with Shift+Up/Down

"inoremap <S-Up> <Esc>:m-2<CR>
"inoremap <S-Down> <Esc>:m+1<CR>

nnoremap <S-Up>   :m-2<CR>
nnoremap <S-Down> :m+1<CR>

nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

"open NERDTree on F2

nmap <F2> :NERDTreeToggle<CR>

let NERDTreeMinimalMenu = 1
let NERDTreeWinSize = 31

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>m :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <silent>ps :Rg<SPACE>
nnoremap <Leader> <Leader>+ :vertical resize +5<CR>
nnoremap <Leader> <Leader>- :vertical resize -5<CR>

" Incremental Searching

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" vim-grep

map <leader>k <Plug>(Man)
map <leader>v <Plug>(Vman)

" YCM

nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

let g:ycm_autoclose_preview_window_after_insertion = 1
set completeopt-=preview

" Key remaps
" better to keep them normal

"noremap ; l
"noremap l k
"noremap k j
"noremap j h

let filename = @% 

" mapping to open a terminal window -> tt

nnoremap tt :term<CR>

" shortcuts to run different projects

nnoremap gr :!go run .
nnoremap cr :!gcc % -o %.out && ./%.out

"augroup PolyVim 
 "   autocmd!
  "  autocmd VimEnter * call system('echo' . filename . '> ~/myfile.txt')
   " autocmd VimLeave * call system('echo filename > ~/leftvim.txt')
"augroup END

" Enable true colors
if (has("termguicolors"))
  set termguicolors
endif

" Set dark theme
if exists('theme') && theme == 'light'
    set background=light
else
    set background=dark
endif

set background=dark

colorscheme palenight
"colorscheme gruvbox
"colorscheme oceanicnext
"colorscheme monokai
"colorscheme onedark
"colorscheme tokyobones
"colorscheme phosphor
"colorscheme nord
"colorscheme badwolf

let g:airline_theme = "palenight"

hi Normal guibg=NONE ctermbg=NONE
"highlight LineNr ctermfg=NONE ctermbg=NONE
"
