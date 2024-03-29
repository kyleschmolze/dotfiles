"""""""""""""""""
" VUNDLE PACKAGES
"""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'preservim/nerdtree'

" Add plugins here. Github, vim-scripts.org, git, and local files are all supported.
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/vim-coffee-script'
Plugin 'digitaltoad/vim-jade'
Plugin 'skwp/greplace.vim'
"Plugin 'sjl/gundo.vim'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'

Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'mxw/vim-jsx'
Plugin 'isRuslan/vim-es6'
Plugin 'github/copilot.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-endwise'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""
" SETTINGS
""""""""""

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Color settings. Very picky!
syntax enable
set background=dark
let g:solarized_termcolors=256 
colorscheme solarized

" :BGD and :BGL to quickly switch color schemes
command BGD set background=dark | colo solarized
command BGL set background=light | colo solarized

let mapleader = "\<Space>"

" Use ag for CtrlP
let g:ctrlp_user_command = 'ag %s -l -i --hidden -g ""'
let g:ctrlp_use_caching = 0

map <leader>f :CtrlP<CR>
map <leader>b :CtrlPMRU<CR>
map <leader>g :Gsearch 
map <leader>a :Ag 

" NERDTree settings
nnoremap <leader>n :NERDTreeFind<CR>
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" Some settings
set expandtab " Always use spaces, never tabs
set ts=2
set shiftwidth=2
set scrolloff=3 " 3 lines between cursor and top/bottom of screen
set cursorline
set relativenumber
set number
set ruler " Shows current mode, cursor position, on bottom status bar

set autoindent " based on previous line
set incsearch " search as you type
set showmatch " Show matching brackets/parenthesis
set ignorecase " Case insensitive search
set smartcase " Case sensitive when uc present
set nohlsearch " Disable highlighting of search results

set backspace=2 " otherwise, you can only Backspace-delete things you just typed

" Persistent undo
set undodir=~/.vim/undo
set undofile

set clipboard=unnamed " Use mac clipboard (requires vim 7.4)

" Put all swap and backup files in one place
set backupdir=~/.vim/backup
set directory=~/.vim/swap

" Folding
set foldlevel=999
set foldmethod=indent

" github copilot
imap ‘ :copilot-next<CR>
imap “ :copilot-previous<CR>

" Disable auto-commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Declare some filetypes for syntax highlighting
au BufNewFile,BufRead *.eco set filetype=html
au BufNewFile,BufRead *.rabl set filetype=ruby
au BufNewFile,BufRead *.less set filetype=scss
au BufNewFile,BufRead *.js set filetype=javascript

" Quickly edit dotfiles
nmap <silent> <leader>ev :e ~/.vimrc<CR>
nmap <silent> <leader>ez :e ~/.zshrc<CR>
nmap <silent> <leader>eb :e ~/.dotfiles/Brewfile<CR>

" Create new lines below and above cursor
nmap <BS> O<Esc>j
nmap <CR> o<Esc>k

" Space => Insert one char
nmap <leader>r i_<Esc>r

" Quick save
map <leader>w :w<CR>
" Quick quit
map <leader>q :q<CR>

" Simple key remaps
imap jk <Esc>

" space+< does a crazy indent-redent
nmap <leader>< <<j>>khh

nmap <C-;> ;

" resize current buffer by +/- 5 
nmap ˙ :vertical resize -5<cr>
nmap ¬ :vertical resize +5<cr>
nmap ∆ :resize +5<cr>
nmap ˚ :resize -5<cr>

" Space + r => Insert one char
nmap <Space>r i_<Esc>r

" Y => cut rest of line
nmap Y Du

" Common typos
cmap Wq wq
cmap WQ wq
cmap Q q


" The following lines make word wraping great
set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0
set formatoptions+=l



" This function moves the current file, quite useful
function! MoveFile(newspec)
  let old = expand('%')
  " could be improved:
  if (old == a:newspec)
    return 0
  endif
  exe 'sav' fnameescape(a:newspec)
  call delete(old)
endfunction

" This function let's you write into new directories, and it mkdir's them
function s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction
augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

command! -nargs=1 -complete=file -bar MoveFile call MoveFile('<args>')
command! -nargs=1 AddExt execute "saveas ".expand("%:p").<q-args>
command! -nargs=1 ChgExt execute "saveas ".expand("%:p:r").<q-args>

" vim rspec shortcuts
map <leader>tt :call RunCurrentSpecFile()<CR>
map <leader>ts :call RunNearestSpec()<CR>
map <leader>tl :call RunLastSpec()<CR>
map <leader>tr :call RunAllSpecs()<CR>
" Requires term (brew install term)
let g:rspec_command = "split | terminal bundle exec rspec {spec}"
