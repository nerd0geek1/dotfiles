#-------------------------------------
# setup PATH
# -------------------------------------

# 重複したPATHを登録しない
typeset -U path PATH

# ruby
if [ -e $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

if [ -e $HOME/.pyenv ]; then
  eval "$(pyenv init -)"
fi

# git(Homebrew)
export PATH="/opt/homebrew/bin:$PATH"
export PATH="usr/local/bin/git:$PATH"

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# JDK
export JAVA_HOME=$(/usr/libexec/java_home -v 17)
export PATH=$JAVA_HOME/bin:$PATH

# inhibit vim warnings
export LC_ALL=en_US.UTF-8
export LC_NUMERIC=ja_US

# Flutter
export PATH="$HOME/fvm/default/bin:$PATH"
export FLUTTER_ROOT="$HOME/fvm/default/bin/flutter:"

# FVM
export PATH="$PATH":"$HOME/.pub-cache/bin"

# Mint
export MINT_PATH=./mint/lib
export MINT_LINK_PATH=./mint/bin

#-------------------------------------
# zshのオプション
# -------------------------------------

# 補完機能の強化
autoload -U compinit
compinit

# 色を使う
setopt prompt_subst

# 入力しているコマンド名が間違っている場合にもしかして：を出す。
setopt correct

# ビープを鳴らさない
setopt nobeep

# ディレクトリ名を入力するだけでcdできるようにする
setopt auto_cd

# globがマッチしなくてもコマンドが実行されるようにする
unsetopt nomatch

# cd時の仕掛け
function precmd ()
{
    pwd=`pwd`
    echo '\n\n'$pwd
}

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY

#プロンプト(画面左端)の文字列を設定
PROMPT='%% '

# -------------------------------------
# 履歴
# -------------------------------------

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# -------------------------------------
# エイリアス
# -------------------------------------

#vi, vimどちらでもvimを起動するように
alias vi="vim"

# gitを短縮して呼び出す
alias g="git"
alias gst="git status"

# bundler関連
alias bi="bundle config set path 'vendor/bundle' && bundle install"
alias be="bundle exec"

# Flutter関連
alias flutter="fvm flutter"

# terminal-notifier(通知カスタマイズ)
alias notify="terminal-notifier -message '処理終わったよ'"

# -------------------------------------
# キーバインド
# -------------------------------------
bindkey ";5D" backward-word
bindkey ";5C" forward-word

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tabatakohei/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tabatakohei/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tabatakohei/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tabatakohei/google-cloud-sdk/completion.zsh.inc'; fi


# pnpm
export PNPM_HOME="/Users/tabatakohei/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
