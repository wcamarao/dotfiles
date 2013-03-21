set nocompatible
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype on
syntax on

if has('gui_macvim')

  cd ~/Spikes/upstream

  let NERDTreeDirArrows=1
  let NERDTreeShowHidden=1

  "let g:ruby_debugger_no_maps = 1
  "let g:ruby_debugger_debug_mode = 1
  "let g:ruby_debugger_progname = 'mvim'
  "let g:ruby_debugger_default_script = 'script/rails s'

  colorscheme macvim
  set background=dark
  set gfn=Monaco:h14

  set guioptions-=l
  set guioptions-=r
  set guioptions-=L
  set guioptions-=R
  set guioptions-=T

  set cursorline
  set cursorcolumn
  hi cursorline   guibg=#222222
  hi cursorcolumn guibg=#222222

  set number                        " show line numbers
  set wildignore+=node_modules      " ignores node_modules
  set wildignore+=assets/static/img " ignores node_modules
  set ruler                         " show current position
  set showmode                      " show what mode we're currently editing in
  set showmatch                     " show matching brackets
  set list                          " show hidden chars
  set listchars=tab:▸\ ,eol:¬       " chars to be shown
  set clipboard+=unnamed            " yanks to clipboard

  set noswapfile                    " no sw?s
  set visualbell                    " no beeps
  set nospell                       " no spell checking
  set wrap!                         " no word wrapping

  set virtualedit=all               " allow the cursor to go in to "invalid" places
  set backspace=indent,eol,start    " allow backspacing over everything in insert mode
  set iskeyword+=_,$,@,%,#          " none of these are word dividers
  set ttimeoutlen=50                " make Esc key faster
  set scrolloff=3                   " number of lines to keep off the edges of the screen when scrolling
  set textwidth=0                   " no limit for text column width

  set autoindent                    " always set autoindenting on
  set copyindent                    " copy indentation on new lines
  set smartindent                   " indent on new blocks

  set expandtab                     " expand tabs by default (overloadable per file type later)
  set smarttab                      " insert tabs on the start of a line according to shiftwidth, not tabstop
  set tabstop=2                     " tab spaces size
  set softtabstop=2                 " when hitting <BS>, pretend like a tab is removed, even if spaces
  set shiftwidth=2                  " number of spaces to use for autoindenting
  set shiftround                    " use multiple of shiftwidth when indenting with '<' and '>'

  set noignorecase                  " do not ignore case when searching
  set nogdefault                    " do not search/replace "globally" (on a line) by default
  set smartcase                     " ignore case if search pattern is all lowercase, case-sensitive otherwise
  set hlsearch                      " highlight search terms
  set incsearch                     " show search matches as you type
  set wildmenu                      " show list instead of just completing
  set wildmode=list:longest,full    " command <Tab> completion, list matches, then longest common part, then all
  set showtabline=2                 " always show tabs

  nnoremap ; :
  cmap cwd lcd %:p:h
  nmap <Esc> :nohlsearch<CR>:<CR>
  nmap <silent> <Leader>] :CommandT<CR>
  nmap <silent> <Leader>[ :CommandTFlush<CR>
  nmap <silent> <Leader>t :NERDTreeToggle<CR>

  "format json
  nmap <silent> <Leader>j :%!python -m json.tool<CR>

  "tabs navigation
  nmap <D-A-Left> :tabprevious<CR>
  nmap <D-A-Right> :tabnext<CR>

  "splits navigation
  nmap <silent> <D-S-Up> :wincmd k<CR>
  nmap <silent> <D-S-Down> :wincmd j<CR>
  nmap <silent> <D-S-Left> :wincmd h<CR>
  nmap <silent> <D-S-Right> :wincmd l<CR>

  "create empty split related to the current one
  nmap <Leader><left>  :leftabove  vnew<CR>
  nmap <Leader><right> :rightbelow vnew<CR>
  nmap <Leader><up>    :leftabove  new<CR>
  nmap <Leader><down>  :rightbelow new<CR>

  "center search results
  nmap n nzz
  nmap N Nzz
  nmap * *zz
  nmap # #zz
  nmap g* g*zz
  nmap g# g#zz

  "move visual block up/down
  vmap <C-A-up> xkP'[V']
  vmap <C-A-down> xp'[V']

  "move line up/down
  nmap <C-A-up> :call g:MoveLineUp()<CR>
  nmap <C-A-down> :call g:MoveLineDown()<CR>

  "vim-ruby-debugger - not working yet
  "nmap <C-S-b> :call ruby_debugger#load_debugger() <bar> call g:RubyDebugger.toggle_breakpoint()<CR>
  "nmap <leader>v  :call ruby_debugger#load_debugger() <bar> call g:RubyDebugger.open_variables()<CR>
  "nmap <leader>m  :call ruby_debugger#load_debugger() <bar> call g:RubyDebugger.open_breakpoints()<CR>
  "nmap <leader>t  :call ruby_debugger#load_debugger() <bar> call g:RubyDebugger.open_frames()<CR>
  "nmap <leader>s  :call ruby_debugger#load_debugger() <bar> call g:RubyDebugger.step()<CR>
  "nmap <leader>f  :call ruby_debugger#load_debugger() <bar> call g:RubyDebugger.finish()<CR>
  "nmap <leader>n  :call ruby_debugger#load_debugger() <bar> call g:RubyDebugger.next()<CR>
  "nmap <leader>c  :call ruby_debugger#load_debugger() <bar> call g:RubyDebugger.continue()<CR>
  "nmap <leader>e  :call ruby_debugger#load_debugger() <bar> call g:RubyDebugger.exit()<CR>
  "nmap <leader>d  :call ruby_debugger#load_debugger() <bar> call g:RubyDebugger.remove_breakpoints()<CR>

  function! g:MoveLineUp()
    if &modifiable
      normal ddkP
    endif
  endfunction

  function! g:MoveLineDown()
    if &modifiable
      normal ddp
    endif
  endfunction

  "ignore F1
  inoremap <F1> <ESC>
  nnoremap <F1> <ESC>
  vnoremap <F1> <ESC>

  "fix sign column color (vim-gitgutter)
  highlight clear SignColumn

endif

" Bundle: ervandew/supertab
" Bundle: kchmck/vim-coffee-script
" Bundle: scrooloose/nerdtree
" Bundle: tpope/vim-cucumber
" Bundle: tpope/vim-fugitive
" Bundle: tpope/vim-surround
" Bundle: vim-scripts/jQuery
" Bundle: vim-scripts/matchit.zip
" Bundle: vim-scripts/snipMate
" Bundle: vim-scripts/Rainbow-Parenthsis-Bundle
" Bundle: vim-scripts/rails
" -Bundle: git://github.com/astashov/vim-ruby-debugger.git
" Bundle: git://git.wincent.com/command-t.git
" Bundle: git://github.com/bbommarito/vim-slim.git
