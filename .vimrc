"""""""""""""""""
" VIM-PLUG PACKAGES
"""""""""""""""""

set nocompatible              " disables vi compatibility, allow vim features

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()

Plug 'preservim/nerdtree'

" Add plugins here. Github, vim-scripts.org, git, and local files are all supported.
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/vim-coffee-script'
Plug 'digitaltoad/vim-jade'
Plug 'skwp/greplace.vim'
Plug 'zivyangll/git-blame.vim'
"Plug 'sjl/gundo.vim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mxw/vim-jsx'
Plug 'isRuslan/vim-es6'
Plug 'github/copilot.vim'
Plug 'tomtom/tcomment_vim'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-endwise'
Plug 'joshuavial/aider.nvim'

"Start Plugins for Avante.vim
" Deps
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
"Plug 'MeanderingProgrammer/render-markdown.nvim'

" Optional deps
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-tree/nvim-web-devicons' "or Plug 'echasnovski/mini.icons'
Plug 'HakonHarnes/img-clip.nvim'
Plug 'zbirenbaum/copilot.lua'
Plug 'stevearc/dressing.nvim' " for enhanced input UI
Plug 'folke/snacks.nvim' " for modern input UI

" Yay, pass source=true if you want to build from source
Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': 'make' }

" All of your Plugins must be added before the following line
call plug#end()            " required

lua << EOF
require('avante').setup({
  -- your config here, for example:
  provider = "claude",
  providers = {
    claude = {
      endpoint = "https://api.anthropic.com",
      model = "claude-4-sonnet-20250514",
      timeout = 30000, -- Timeout in milliseconds
      extra_request_body = {
        temperature = 0.75,
        max_tokens = 20480,
      },
    },
  },
})
EOF


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
colorscheme solarized
set termguicolors

" :BGD and :BGL to quickly switch color schemes
command BGD set background=dark | colo solarized
command BGL set background=light | colo solarized

let mapleader = "\<Space>"

" Use ag for CtrlP
let g:ctrlp_user_command = 'ag %s -l -i --hidden -g ""'
let g:ctrlp_use_caching = 0

let g:markdown_fenced_languages = ['ruby', 'bash=sh', 'javascript', 'python', 'html', 'css']

map <leader>f :CtrlP<CR>
map <leader>b :CtrlPMRU<CR>
map <leader>g :Gsearch 
map <leader>a :Ag 

" run git blame command with leader s
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

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
" imap ‘ :copilot-next<CR>
" imap “ :copilot-previous<CR>

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
nmap <silent> <leader>ee :e ~/Library/Application\ Support/espanso/match/from_textexpander.yml<CR>
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
imap cp <Esc>:Copilot panel<CR>
nmap cp :Copilot panel<CR>
nmap cd :Copilot disable<CR>
nmap ce :Copilot enable<CR>
let g:copilot_filetypes = { '*': v:true }

"imap <C-L> <Plug>(copilot-accept-word)
"imap <C-J> <Plug>(copilot-accept-line)
"imap <C-]> <Plug>(copilot-next) works but breaks vim (cant get out of Insert)
"imap <C-[> <Plug>(copilot-previous) works but breaks vim (cant get out of Insert)
"imap <C-\> <Plug>(copilot-suggest)
"imap <C-^?> <Plug>(copilot-dismiss)

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
