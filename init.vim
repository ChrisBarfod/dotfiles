if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/bundle')

Plug 'vimwiki/vimwiki'
Plug 'suan/vim-instant-markdown'

" Interface
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'miyakogi/conoline.vim' "Highlights cursor line
Plug 'Yggdroot/indentLine' "Adds lines to indentations
Plug 'jeffkreeftmeijer/vim-numbertoggle' "Numbers are nice

" Tools
Plug 'justinmk/vim-dirvish' "Directory browsing
Plug 'kristijanhusak/vim-dirvish-git' "Git status flags for vim-dirvish
Plug 'scrooloose/nerdcommenter' "Easy commenting
Plug 'w0rp/ale' "Asynchronous Lint Engine
Plug 'alvan/vim-closetag' "Auto close HTML tags
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' "Fuzzy Find
Plug 'mileszs/ack.vim' "Search tool for vim
Plug 'xolox/vim-misc' "Miscellaneous auto-load Vim scripts - needed for vim-session
Plug 'xolox/vim-session' "Extended session management
Plug 'mbbill/undotree' "Undo history branch visualizer
Plug 'reisub0/hot-reload.vim' "Automatically hot reload flutter project on save
Plug 'airblade/vim-rooter' "Automatically change working directory to project root
Plug 'tpope/vim-eunuch' "File manipulation

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
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Elixir support for vim
Plug 'mhinz/vim-mix-format' "Format elixir files.

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
set expandtab "Use spaces instead of tabs"
set ignorecase "All searches will be case insensitive (need for smartcase)
set smartcase "Only search case sensative when one uppercase character used
" Show file options above the command line
set wildmenu
" Don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*
" Dont open folds when using { and }
set foldopen-=block
" Remove line numbers from nvim terminal
au TermOpen * setlocal nonumber norelativenumber
autocmd VimResized * wincmd = "Auto resize buffers when window is resized
" ================ Custom mappings ========================

" Yank to the end of the line
nnoremap Y y$

" Exit Nvim Terminal-Mode with Esc key
tnoremap <Esc> <C-\><C-n> 

" Easier window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" `gf` opens file under cursor in a new vertical split
nnoremap gf :vertical wincmd f<CR>

" Remap fzf :Files
map ; :Files<CR>


" ================ Plugins Setups ========================
" Disable Netrw
let g:loaded_netrwPlugin = 1

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
"let g:conoline_color_insert_dark = 'guibg=#1A1A1B'
let g:conoline_color_insert_dark = 'guibg=#151516'

" == IndentLine ==
let g:indentLine_char = '│'

" == Deoplete
let g:deoplete#enable_at_startup = 1
inoremap <silent><buffer> <expr><Right> pumvisible() ? deoplete#close_popup() : "<CR>"


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
let g:vimwiki_list = [{'path': '$HOME/Dropbox/VimWiki/', 
      \ 'syntax': 'markdown', 'ext': '.md'}] " set path to a directory inside Dropbox
let g:vimwiki_links_space_char = '_'
let g:vimwiki_auto_header = 1

" vimwiki with markdown support
let g:vimwiki_ext = '.md' " set extension to .md
let g:vimwiki_global_ext = 0 " make sure vimwiki doesn't own all .md files
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" helppage -> :h vimwiki-syntax 

" vim-instant-markdown - Instant Markdown previews from Vim
let g:instant_markdown_autostart = 0	" disable autostart
map <leader>md :InstantMarkdownPreview<CR>

" MixFormat - elixir formatting
let g:mix_format_on_save = 1
