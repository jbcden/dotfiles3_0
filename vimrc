set nocompatible
set relativenumber
set number
set hidden " For vim-racer -- need to see why
syntax on
colorscheme pablo

set laststatus=2  " Always display the status line
set showcmd " display incomplete commands
set nowrap
set nobackup
set nowritebackup
set noswapfile " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=1000
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
set omnifunc=syntaxcomplete#Complete
set exrc
set secure " disable unsafe commands in local vimrcs
set hlsearch
set ruler
" set cursorline
set cursorcolumn

set colorcolumn=80

" Fixes some issues with backspace -- not sure why these were occurring,
" furthur investigation is needed.
set backspace=2
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Enable Matchit
runtime macros/matchit.vim

" Vundle setup
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-fugitive'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'tpope/vim-dispatch'
Plugin 'thoughtbot/vim-rspec'
Plugin 'rust-lang/rust.vim'
Plugin 'elixir-lang/vim-elixir'
Bundle 'kchmck/vim-coffee-script'
Plugin 'racer-rust/vim-racer'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'ElmCast/elm-vim'
Bundle 'neovimhaskell/haskell-vim'
Bundle 'scrooloose/syntastic'

call vundle#end()
filetype plugin indent on

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:rustfmt_autosave = 1

" let g:syntastic_mode_map = { 'passive_filetypes': ['html', 'cucumber', 'java', 'javascript'], 'mode': 'active' }
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

let g:rspec_command = 'Dispatch rspec {spec}'

" Ctrl-p setup with Ag
" let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
" let g:ctrlp_use_caching = 0

" let g:ctrlp_user_command = 'rg --files --no-ignore --hidden --follow -g ""'
let g:ctrlp_user_command = 'rg %s --files --hidden --follow -g "!.git/*"'

hi StatusLine ctermbg=lightgreen ctermfg=grey

let mapleader = "\<Space>"

" vim-rspec setup
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>


" Clear search highlighting
nmap <leader>h :let @/=''<CR>

" Sane navigation for wrapped lines
nmap j gj
nmap k gk

nmap 0 ^

nmap <leader>vi :tabe $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>

" Map original '0' behavior to <leader>0
nmap <leader>0 <HOME>

autocmd Filetype help nmap <buffer> q :q<CR>

" Automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
" Zoom a vim split
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Fixups with Fugitive
map <space>l :Git! log<cr>gg
nnoremap <c-F> yiw <ESC>:Git commit --fixup=<c-r>"<cr>

let g:racer_cmd = "/Users/jchae/.multirust/toolchains/stable/cargo/bin/racer"
let $RUST_SRC_PATH="/Users/jchae/software/rust/src/"
