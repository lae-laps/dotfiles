"         _
"        (_)
"  __   ___ _ __ ___  _ __ ___
"  \ \ / / | '_ ` _ \| '__/ __|
"   \ V /| | | | | | | | | (__
"    \_/ |_|_| |_| |_|_|  \___|
"
" vim config by: laelaps

syntax on

set cursorline
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
"set paste
set colorcolumn=500

highlight ColorColumn ctermbg=0 guibg=lightgrey

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

    Plug 'adrian5/oceanic-next-vim'       " colorscheme
    Plug 'drewtempelmeyer/palenight.vim'  " colorscheme
    Plug 'morhetz/gruvbox'                " colorscheme
    Plug 'Yggdroot/indentLine'            " Indent lines
    Plug 'vim-airline/vim-airline'        " Status line
    Plug 'jremmen/vim-ripgrep'
    Plug 'tpope/vim-fugitive'
    Plug 'leafgarland/typescript-vim'
    Plug 'vim-utils/vim-man'
    Plug 'lyuts/vim-rtags'
    Plug 'git@github.com:Valloric/YouCompleteMe.git'
    Plug 'mbbill/undotree'

call plug#end()

let g:indentLine_faster     = 1
let g:indentLine_setConceal = 1 

let g:airline_powerline_fonts = 1

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "
let g:netrw_browse_split = 2
let g:netrw_winsize = 25
let g:gruvbox_contrast_dark = 'hard'

" Complete symbols

"inoremap ( ()<Esc>i
"inoremap { {}<Esc>i
"inoremap {<CR> {<CR>}<Esc>O
"inoremap [ []<Esc>i
"inoremap < <><Esc>i
"inoremap ' ''<Esc>i
"inoremap " ""<Esc>i

" KeyBindings for moving lines up and down with Shift+Up/Down

inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>

nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>; :wincmd ;<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>m :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <silent>ps :Rg<SPACE>
nnoremap <Leader> <Leader>+ :vertical resize +5<CR>
nnoremap <Leader> <Leader>- :vertical resize -5<CR>

" YCM

nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

" Key remaps

noremap ; l
noremap l k
noremap k j
noremap j h

let filename = @% 

"augroup PolyVim 
 "   autocmd!
  "  autocmd VimEnter * call system('echo' . filename . '> ~/myfile.txt')
   " autocmd VimLeave * call system('echo filename > ~/leftvim.txt')
"augroup END

if exists('theme') && theme == 'light'
    set background=light
else
    set background=dark
endif

set background=dark

"colorscheme palenight
colorscheme gruvbox
"colorscheme oceanicnext

let g:airline_theme = "gruvbox"

hi Normal guibg=NONE ctermbg=NONE
