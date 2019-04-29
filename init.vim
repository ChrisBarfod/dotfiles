if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/bundle')

Plug 'vimwiki/vimwiki'

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
Plug 'alvan/vim-closetag' "Auto close HTML tags
"Plug '/usr/local/opt/fzf' "fuzzy find
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' "fuzzy find
Plug 'mileszs/ack.vim' "Search tool for vim
Plug 'xolox/vim-session' "Extended session management
Plug 'xolox/vim-misc' "Miscellaneous auto-load Vim scripts - needed for vim-session
"Plug 'hankchiutw/flutter-reload.vim' "Automatically hot reload flutter project on save
Plug 'mbbill/undotree' "Undo history branch visualizer
Plug 'reisub0/hot-reload.vim' "Automatically hot reload flutter project on save

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips' "Snippet engine for vim
Plug 'honza/vim-snippets' "Snippets for UltiSnips
Plug 'natebosch/vim-lsc' "Plugin for communicating with a language server

" Syntax
Plug 'sheerun/vim-polyglot' "Collection of language packs
Plug 'jiangmiao/auto-pairs' "Automatic parenthesis
Plug 'luochen1990/rainbow' "Rainbow parenthesis
Plug 'vim-scripts/HTML-AutoCloseTag' "close tags after >
Plug 'tpope/vim-surround' "Quoting/parenthesizing made simple
Plug 'elixir-editors/vim-elixir' "Elixir support for vim - auto indent
Plug 'dart-lang/dart-vim-plugin' "Syntax highlighting for Dart

Plug 'ryanoasis/vim-devicons' "Icons == always load this last ==

" execute :source% once file saved, then :PlugInstall || :PlugUpdate to 
" install or update new plugins. 

call plug#end()

" ================ Theme ====================
syntax enable
set termguicolors
set cmdheight=1
set background=dark
colorscheme gruvbox

" ================ General Config ====================

set title                  "change the terminal's title
set number                 "Line numbers are good
set number relativenumber  "Relatiive line numbers
set tabstop=2              "Tab = 2 spaces
set shiftwidth=0
set expandtab
" Show file options above the command line
set wildmenu
" Don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*

" ================ Custom mappings ========================

" Yank to the end of the line
nnoremap Y y$

" Find current file in NERDTree
nnoremap <Leader>hf :NERDTreeFind<CR>
" Open NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>

" Exit Nvim Terminal-Mode with Esc key
tnoremap <Esc> <C-\><C-n> 

" ================ Plugins Setups ========================

" == Gruvbox ==
let g:gruvbox_contrast_dark="medium"

" == Airline ==
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#wordcount#format = '%d words'
let g:airline_section_z = '%3p%% %3l/%L:%3v'
let g:airline_skip_empty_sections = 1
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ }

" == Conoline ==
let g:conoline_auto_enable = 1
let g:conoline_color_normal_dark = 'guibg=#1E1E1E'
let g:conoline_color_insert_dark = 'guibg=#1A1A1A'

" == NERDTree ==
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1

" == IndentLine ==
let g:indentLine_char = '│'

" == Deoplete
let g:deoplete#enable_at_startup = 1

" == Nerdcommenter ==
filetype plugin on

" == Rainbow parenthesis ==
let g:rainbow_active = 1

" == FZF ==
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" == UltiSnips ==
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" Get :UltiSnipsEdit to split window.
let g:UltiSnipsEditSplit="vertical"

" == Vim-Session ==
let g:session_autosave='yes'
let g:session_directory='~/.config/nvim/session'
let g:session_autoload='yes'

" == Vim Language Server Client (vim-lsc)
let g:lsc_server_commands = {'dart': 'dart_language_server'}
" Use all the default mappings
let g:lsc_auto_map = v:true 

" == Dart-vim-plugin ==
let dart_format_on_save = 1
let dart_style_guide = 2 
" Automatically close dart documentation window
autocmd CompleteDone * silent! pclose 

" == Undotree ==
nnoremap <leader>ut :UndotreeToggle<cr>
" Put plugins and dictionaries in this dir
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir
" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
  let myUndoDir = expand(vimDir . '/undodir')
  " Create dirs
  call system('mkdir ' . vimDir)
  call system('mkdir ' . myUndoDir)
  let &undodir = myUndoDir
  set undofile
endif

" vimwiki - Personal Wiki for Vim
set nocompatible
filetype plugin on
syntax on
" vimwiki with markdown support
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" helppage -> :h vimwiki-syntax 
"let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" vim-instant-markdown - Instant Markdown previews from Vim
let g:instant_markdown_autostart = 0	" disable autostart
map <leader>md :InstantMarkdownPreview<CR>
