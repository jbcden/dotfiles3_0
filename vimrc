set nocompatible
set relativenumber
set number
set hidden " For vim-racer -- need to see why

let g:racer_cmd = "/Users/jchae/.cargo/bin/racer"
let g:racer_experimental_completer = 1

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
" filetype off
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()

" Plugins
" Plugin 'VundleVim/Vundle.vim'
" Plugin 'sheerun/vim-polyglot'
" Plugin 'neomake/neomake'
" Plugin 'ludovicchabant/vim-gutentags'
" Plugin 'slashmili/alchemist.vim'
" Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'tpope/vim-surround'
" Plugin 'tpope/vim-repeat'
" Plugin 'tpope/vim-bundler'
" Plugin 'tpope/vim-fugitive'
" Plugin 'kana/vim-textobj-user'
" Plugin 'nelstrom/vim-textobj-rubyblock'
" Plugin 'tpope/vim-dispatch'
" Plugin 'thoughtbot/vim-rspec'
" Plugin 'racer-rust/vim-racer'
" Bundle 'mattn/webapi-vim'
" Bundle 'mattn/gist-vim'
" Plugin 'dikiaap/minimalist'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'sbdchd/neoformat'
" Plugin 'ngmy/vim-rubocop'
" Plugin 'avakhov/vim-yaml'
" 
" call vundle#end()

filetype plugin indent on

set packpath^=~/.vim
packadd minpac
call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('neomake/neomake')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('ctrlpvim/ctrlp.vim')
call minpac#add('sbdchd/neoformat')
call minpac#add('ngmy/vim-rubocop')
call minpac#add('kana/vim-textobj-user')
call minpac#add('nelstrom/vim-textobj-rubyblock')
call minpac#add('rust-lang/rust.vim')
call minpac#add('racer-rust/vim-racer')
call minpac#add('keith/swift.vim')
call minpac#add('ElmCast/elm-vim')

syntax enable
set background=dark
" colorscheme minimalist
" colorscheme delek
colorscheme slate

" Neomake
" disable Neomake checks for Java -- this currently isn't setup correctly and
" causes vim to hang for a while.
let blacklist = ['java']
highlight NeomakeWarning ctermfg=227 ctermbg=237
autocmd! BufWritePost * if index(blacklist, &ft) < 0 | Neomake
let g:gutentags_cache_dir = '~/.tags_cache'
let g:alchemist_tag_disable = 1

if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading\ -i
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:rustfmt_autosave = 1

" let g:syntastic_mode_map = { 'passive_filetypes': ['html', 'cucumber', 'java', 'javascript'], 'mode': 'active' }
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" augroup fmt
"   autocmd!
"   autocmd BufWritePre * Neoformat
" augroup END

let g:rspec_command = 'Dispatch rspec {spec}'

" Ctrl-p setup with Ag
" let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
" let g:ctrlp_use_caching = 0

" let g:ctrlp_user_command = 'rg --files --no-ignore --hidden --follow -g ""'
" let g:ctrlp_user_command = 'rg %s --files --hidden --follow -g "!.git/*"'

hi StatusLine ctermbg=lightgreen ctermfg=grey

let mapleader = "\<Space>"

let g:haskell_enable_arrowsyntax = 1 " to enable highlighting of `proc`

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

" Rust
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
