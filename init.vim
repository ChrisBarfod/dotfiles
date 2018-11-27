call plug#begin('~/.config/nvim/bundle')

" Interface 
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'miyakogi/conoline.vim' "Highlights cursor line
Plug 'Yggdroot/indentLine' "Adds lines to indentations
Plug 'jeffkreeftmeijer/vim-numbertoggle' "Numbers are nice
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "Extra syntax and highlighting for NERDTree files

" Tools
Plug 'scrooloose/nerdtree' "Directory browsing
Plug 'Xuyuanp/nerdtree-git-plugin' "NERDTree show git status 
Plug 'scrooloose/nerdcommenter' "Easy commenting
Plug 'w0rp/ale' "Asynchronous Lint Engine

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Syntax
Plug 'sheerun/vim-polyglot' "Collection of language packs
Plug 'jiangmiao/auto-pairs' "Automatic parenthesis
Plug 'luochen1990/rainbow' "Rainbow parenthesis
Plug 'vim-scripts/HTML-AutoCloseTag' "close tags after >
Plug 'tpope/vim-surround' "Quoting/parenthesizing made simple

Plug 'ryanoasis/vim-devicons' "Icons - always load this last

" call PlugInstall to install new plugins

call plug#end()

" Theme
syntax enable
set termguicolors
set cmdheight=1
set background=dark
"colorscheme hybrid_material
colorscheme gruvbox

" ================ General Config ====================

set title                  "change the terminal's title
set number                 "Line numbers are good
set number relativenumber  "Relatiive line numbers
set tabstop=2
set shiftwidth=0
set expandtab

" ================ Custom mappings ========================

" Yank to the end of the line
nnoremap Y y$

" Find current file in NERDTree
nnoremap <Leader>hf :NERDTreeFind<CR>
" Open NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>

" ================ plugins setups ========================

" == Gruvbox ==
let g:gruvbox_contrast_dark="medium"

" == Airline ==
"let g:airline_theme='hybrid'
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" == Conoline ==
let g:conoline_auto_enable = 1
let g:conoline_color_normal_dark = 'guibg=#1E1E1E'
let g:conoline_color_insert_dark = 'guibg=#1A1A1A'

" == NERDTree ==
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" == IndentLine ==
let g:indentLine_char = '│'

" == Deoplete
let g:deoplete#enable_at_startup = 1

" == Nerdcommenter ==
filetype plugin on

" == Rainbow parenthesis ==
 let g:rainbow_active = 1
