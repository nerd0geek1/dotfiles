"-------------------------------------
" setコマンド
"-------------------------------------
" 行番号を表示
set number
" 対応する括弧を強調表示
set showmatch
" カーソル行の背景色を変える
set cursorline
" タブ文字を入力した際にスペースで展開されるようにする
set expandtab
" タブ文字の幅を定義
set tabstop=2
" インデント幅を定義
set shiftwidth=2
" backspaceで削除が効くように設定
set backspace=start,eol,indent

" 初回起動時のみ実行
if has('vim_starting')
  " 設定ファイル、プラグインファイルの読込元を定義
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" 以下の関数では、NeoBundleの初期化を行っている。
call neobundle#begin(expand('~/.vim/bundle/'))


"-------------------------------------
" プラグイン
"-------------------------------------
" if...end等の対応するキーワードの補完を行う
NeoBundle 'tpope/vim-endwise.git'
" 括弧を自動で閉じる
NeoBundle 'Townk/vim-autoclose'
" ディレクトリツリーを表示する
NeoBundle 'scrooloose/nerdtree'
" syntax checkを行う
NeoBundle 'scrooloose/syntastic'
" インデントのハイライト
NeoBundle 'Yggdroot/indentLine'
" 文末の空白を可視化
NeoBundle 'bronson/vim-trailing-whitespace'
" コメントアウトの切替簡略化
NeoBundle 'tomtom/tcomment_vim'
" コード片の実行
NeoBundle "thinca/vim-quickrun"
" 自動補完
function! s:meet_neocomplete_requirements()
  return has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))
endfunction
if s:meet_neocomplete_requirements()
  NeoBundle 'Shougo/neocomplete.vim'
  NeoBundleFetch 'Shougo/neocomplcache.vim'
else
  NeoBundleFetch 'Shougo/neocomplete.vim'
  NeoBundle 'Shougo/neocomplcache.vim'
endif
"------------------
" HTML, CSS, js
"------------------
" Zen Coding likeにHTMLを記述することができる
NeoBundle 'mattn/emmet-vim'
" HTML5の補完
" NeoBundle 'othree/html5.vim'
" CSS3の補完
" NeoBundle 'hail2u/vim-css3-syntax'
" Javascriptのsyntax, indentを追加(es6を扱う際はoffにする(arrow構文のインデントが深くなってしまうため))
" NeoBundle 'pangloss/vim-javascript'
" ECMAScript6のsyntax, indentを追加
NeoBundle 'vim-es6'
"------------------
" Node.js
"------------------
" NeoBundle 'myhere/vim-nodejs-complete'
"------------------
" Rails
"------------------
" Railsのプラグイン(View<-->Controller、model<-->Schema、Test<-->Helperの移動が簡単になる)
" NeoBundle 'tpope/vim-rails'
" Rails/sinatra/rspec等の補完を行う
" NeoBundle 'vim-ruby/vim-ruby'
" slimの補完を行う
NeoBundle 'slim-template/vim-slim'
"NeoBundle 'Shougo/neosnippet'
"NeoBundle 'Shougo/neosnippet-snippets'

call neobundle#end()

"-------------------------------------
" プラグイン設定
"-------------------------------------
" Gemfile, Podfile, AppFile, Fastfileに対してrubyのfiletypeを適用
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead Podfile set filetype=ruby
au BufNewFile,BufRead Fastfile,Appfile,Snapfile,Scanfile,Gymfile,Matchfile,Deliverfile set filetype=ruby
" vim-slim
autocmd BufNewFile,BufRead *.slim set filetype=slim
" vue.jsのcomponentが適切にハイライトされるように設定
autocmd BufNewFile,BufRead *.{html,htm,vue*} set filetype=html

"------------------
" Key Binding
"------------------
"NERDTreeのKey bindを定義
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"------------------
" neocomplete.vim
"------------------
if s:meet_neocomplete_requirements()
  " AutoComplPopを無効化
  let g:acp_enableAtStartup = 1
  " NeoCompleteを有効にする
  let g:neocomplete#enable_at_startup = 1
  " 大文字入力まで大文字小文字の区別を無視
  let g:neocomplete#enable_smart_case = 1

  " tabで補完の切替
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " 補完候補の選択(改行なし)
  inoremap <expr><C-d> neocomplete#close_popup()
  " ポップアップをキャンセル
  inoremap <expr><C-c>  neocomplete#cancel_popup()
endif

"------------------
" syntastic
"------------------
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby', 'javascript'] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['jshint']

filetype plugin indent on

syntax on

" インストールの確認
if neobundle#exists_not_installed_bundles()
  " インストールされてないNeoBundleが存在した場合
  echomsg 'Not installed bundles : ' . string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
endif
