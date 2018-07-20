" Installed scripts
" 0. Vundle
" 1. Pathogen
" 2. LatexBox
" 3. Colorscheme - molokai
" 4. vim-sensible
" 5. vim-airline
" 6. ctrlp.vim
" 7. vim-fugitive
" 8. nerdcommenter
" 9. youcompleteme
" 10. auto-pairs
" 11. tabline
" 12. vim-markdown
" 13. vim-flake8

" Vundle setup scripts

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'

"Adding required plugins
"1. Pathogen
Plugin 'https://github.com/tpope/vim-pathogen.git'

"2. LatexBox
Plugin 'https://github.com/LaTeX-Box-Team/LaTeX-Box.git'

"3. Colorscheme - molokai
Plugin 'https://github.com/tomasr/molokai.git'

"4. vim-sensible
Plugin 'https://github.com/tpope/vim-sensible.git'

"5. vim-airline
Plugin 'https://github.com/bling/vim-airline.git'

"6. ctrlp 
Plugin 'https://github.com/kien/ctrlp.vim.git'

"7. vim-fugitive
Plugin 'https://github.com/tpope/vim-fugitive.git'

"8. nerdcommenter
Plugin 'https://github.com/scrooloose/nerdcommenter.git'

"9. youcompleteme
Plugin 'https://github.com/Valloric/YouCompleteMe.git'

"10- auto-pairs
Plugin 'https://github.com/jiangmiao/auto-pairs.git'

"11- tab-line
Plugin 'https://github.com/mkitt/tabline.vim.git'

"12- vim-markdown
Plugin 'https://github.com/plasticboy/vim-markdown.git'

"13- macvim
Plugin 'https://github.com/jellonek/macvim.git'

"14- flake8
Plugin 'https://github.com/nvie/vim-flake8.git'

"15- verilog
Plugin 'https://github.com/vhda/verilog_systemverilog.vim.git'

"16- Scala
Plugin 'derekwyatt/vim-scala'

Plugin 'https://github.com/vim-airline/vim-airline-themes'

"17- clang-formater
Plugin 'https://github.com/rhysd/vim-clang-format.git'

"18- cmake-syntax
Plugin 'https://github.com/pboettch/vim-cmake-syntax'

"19- quick-scope
"Plugin 'https://github.com/unblevable/quick-scope'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Reload .vimrc if changed
autocmd! bufwritepost .vimrc source %

" Not compatible with VI
set nocompatible

" Indentation 
set autoindent
set smartindent
set cindent

" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" use intelligent file completion like in the bash
set wildmode=longest:full
set wildmenu

" Enable line numbers
set number

" Syntax highlighting
syntax on 

" Basic settings 
"filetype plugin indent on

" Set map leader key
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w<CR>

" Tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Timeout to Normal mode
set ttimeoutlen=30

" Remove the default mode indicator because we have airline!
set noshowmode

" Switch buffers without saving
set hidden

" Case insensitive search by default
set ignorecase

" Incremental Search
set incsearch

" Set smartcase search
set smartcase

" Pathogen runtimepath management
execute pathogen#infect()
execute pathogen#helptags()

" Theme settings
colorscheme molokai
"colorscheme mustang
"colorscheme antares
"colorscheme Monokai-chris
"colorscheme monokain

"set t_Co=256
let g:molokai_original = 1
let g:rehash256 = 1
"set background=dark

set t_Co=256
set background=dark
"colorscheme molokai 
"highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" Powerline fonts for vim-airline 
" Remember to set encoding in xshell
let g:airline_powerline_fonts = 1

" Airline theme to match
let g:airline_theme = "molokai"
"let g:airline_theme = "luna"
"let g:airline_theme = "solarized"
"let g:airline_theme = "tomorrow"
"let g:airline_theme = "base16"
"let g:airline_theme = "zenburn"

" Airline tabs for open buffers -- Install tabline
let g:airline#extensions#tabline#enabled = 1

" Reindent the entire file
map <F7> mzgg=G`z<CR>

" Python flake8
autocmd FileType python map <buffer> <F3> :call Flake8()<CR>


" Center line in Normal mode
nmap <space> zz

" Center while searching
nmap n nzz
nmap N Nzz

" Open empty files in insert mode
autocmd VimEnter * if empty(expand("%")) | startinsert | endif

" You complete me
let g:ycm_global_ycm_extra_conf = "/home/amiralis/.vim/.ycm_extra_conf.py"
let g:ycm_python_binary_path    = '/usr/bin/python3'

" Vim markdown folding disabled
let g:vim_markdown_folding_disabled=1

" No Arrowkeys
inoremap <LEFT>     <NOP>
inoremap <RIGHT>    <NOP>
inoremap <UP>       <NOP>
inoremap <DOWN>     <NOP>

" Next and previous buffer
nmap <C-n> :bnext<CR>
nmap <C-m> :bprev<CR>

" Split file, 2 columns with scroll bind
noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

set so=7

" CTRLP settings
let g:ctrlp_custom_ignore ='\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_dotfiles = 0
"let g:ctrlp_map = '<c-f>'

" Relative Line Numbers
set relativenumber

" Always show gutter so that YCM syntax
" error highlight doesnt move text L/R
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

" Autoclose the preview window after 
" leaving insert mode for YCM
let g:ycm_autoclose_preview_window_after_insertion = 1

" Active NERDTree
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"map <C-O> :NERDTreeToggle<CR>


" Clang-format
map <leader>r :ClangFormat<CR>
"map <C-K> :pyf /p-ssd/modules/llvm-6.0.0/share/clang/clang-format.py<cr>
"imap <C-K> <c-o>:pyf /p-ssd/modules/llvm-6.0.0/share/clang/clang-format.py<cr>

"" Auto formating files
function! Formatonsave()
    let l:formatdiff = 1
    "ClangFormat
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()
