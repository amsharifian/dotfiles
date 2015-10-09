" Installed scripts
" 1. Pathogen
" 2. LatexBox
" 3. Colorscheme - molokai
" 4. vim-sensible
" 5. vim-airline
" 6. vim-autoclose -
" 7. ctrlp.vim
" 8. vim-fugitive
" 9. nerdcommenter
" 10. youcompleteme
" 11. auto-pairs
" 12. tabline
" 13. vim-markdown

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
filetype plugin indent on

" Set map leader key
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w<CR>

" Tab settings
set tabstop=4
set shiftwidth=4
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
set t_Co=256
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark

" Powerline fonts for vim-airline 
" Remember to set encoding in xshell
let g:airline_powerline_fonts = 1

" Airline theme to match
let g:airline_theme = "molokai"

" Airline tabs for open buffers -- Install tabline
let g:airline#extensions#tabline#enabled = 1

" Reindent the entire file
map <F7> mzgg=G`z<CR>

" Center line in Normal mode
nmap <space> zz

" Center while searching
nmap n nzz
nmap N Nzz

" Open empty files in insert mode
autocmd VimEnter * if empty(expand("%")) | startinsert | endif

" You complete me

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
let g:ctrlp_map = '<c-f>'

" Relative Line Numbers
"set relativenumber

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
map <C-O> :NERDTreeToggle<CR>
