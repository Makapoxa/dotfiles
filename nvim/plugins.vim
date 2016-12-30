func! plugins#configure()

  autocmd! BufWritePost * Neomake

  let g:vim_json_syntax_conceal = 0
  let g:easytags_async = 1

  let g:buffergator_viewport_split_policy = "B"
  let g:buffergator_sort_regime = "mru"

  let g:vim_markdown_folding_disabled = 1

  let g:neomake_open_list=2
  let g:neomake_javascript_enabled_makers = ['eslint']
  let g:neomake_jsx_enabled_makers = ['eslint']
  let g:neomake_javascript_eslint_exe = $PWD . '/client/node_modules/eslint/bin/eslint.js'
  let g:neomake_haml_enabled_makers = ['haml_lint']
  let g:neomake_ruby_enabled_makers = ['rubocop']
  let g:neomake_vim_enabled_makers = ['vimlint']
  let g:neomake_error_sign = {
        \ 'text': '❌',
        \ 'texthl': 'ErrorMsg',
        \ }
  let g:neomake_warning_sign = {
        \ 'text': '⚠️',
        \ 'texthl': 'WarningMsg',
        \ }

  let g:vimrubocop_config = '~/work/zabava_backend/.rubocop.yml'

  let g:jsx_ext_required = 0


  " Toggle paste mode
  nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
  imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

  " format the entire file
  nnoremap <leader>fef :normal! gg=G``<CR>

  " set text wrapping toggles
  nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

  " find merge conflict markers
  nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

  " upper/lower word
  nmap <leader>u mQviwU`Q
  nmap <leader>l mQviwu`Q

  nmap <C-\> :NERDTreeFind<CR>
  nmap <silent> <leader><leader> :NERDTreeToggle<CR>
  let NERDTreeIgnore = ['\.pyc$']

  nmap <silent> // :nohlsearch<CR>
  noremap ,hl :set hlsearch! hlsearch?<CR>

  " Allows you to enter sudo pass and save the file
  " " when you forgot to open your file with sudo
  cmap w!! %!sudo tee > /dev/null %

  " Allow to copy/paste between VIM instances
  " "copy the current visual selection to ~/.vbuf
  vmap <Leader>y :w! ~/.vbuf<CR>
  " "copy the current line to the buffer file if no visual selection
  nmap <Leader>y :.w! ~/.vbuf<CR>
  " "paste the contents of the buffer file
  nmap <Leader>p :r ~/.vbuf<CR>

  " Automatically removing all trailing whitespace
  autocmd BufWritePre * :%s/\s\+$//e

  au BufRead,BufNewFile {Vagrantfile,Gemfile,Capfile} set ft=ruby

  " autocmd FileType ruby compiler ruby

  " au FileType ruby setl sw=2 sts=2 et
  " au FileType javascript setl sw=2 sts=2 et
  " au FileType yaml setl sw=2 sts=2 et

  let g:ctrlp_custom_ignore = 'node_modules\|tmp'
endfunc

func! plugins#define()
  call plug#begin('~/.local/share/nvim/plugged')

  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'rking/ag.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'jeetsukumaran/vim-buffergator'

  Plug 'tpope/vim-sleuth'
  if !has('nvim') | Plug 'tpope/vim-sensible' | end
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-bundler'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-git'
  Plug 'airblade/vim-gitgutter'

  Plug 'bling/vim-airline'
  Plug 'majutsushi/tagbar'
  Plug 'godlygeek/tabular'
  Plug 'mbbill/undotree'
  Plug 'ervandew/supertab'
  Plug 'editorconfig/editorconfig-vim'

  Plug 'elzr/vim-json'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'

  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-easytags'

  Plug 'plasticboy/vim-markdown'

  Plug 'vim-ruby/vim-ruby'
  Plug 'Shougo/vimshell.vim'
  Plug 'vim-scripts/paredit.vim'
  Plug 'stephpy/vim-yaml'
  Plug 'ekalinin/Dockerfile.vim'

  Plug 'ngmy/vim-rubocop'

  Plug 'neomake/neomake'

  call plug#end()
endfunc

func! plugins#open(name)
  let l:path =  "~/.local/share/nvim/plugged/" . a:name
  exec(":edit " . l:path)
endfunc

func! plugins#bind()
  call plugins#configure()
  call plugins#define()
  filetype plugin indent on
endfunc

command! -complete=dir -nargs=1 OpenPluginDir call plugins#open("<args>")<cr>
