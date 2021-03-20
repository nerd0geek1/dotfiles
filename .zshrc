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

eval "$(pyenv init -)"

# git(Homebrew)
export PATH="usr/local/bin/git:$PATH"

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# Android Studio
export ANDROID_HOME="/Users/tabatakohei/Library/Android/sdk/"
export PATH="/Users/tabatakohei/Library/Android/sdk/platform-tools:$PATH"

# JDK
export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home
export PATH=$PATH:/Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home/bin

# inhibit vim warnings
export LC_ALL=en_US.UTF-8
export LC_NUMERIC=ja_US

# Flutter
export PATH="$HOME/Flutter_development/bin:$PATH"
export FLUTTER_ROOT="$HOME/Flutter_development/bin:"
# FVM
export PATH="$PATH":"$HOME/.pub-cache/bin"

#Xcode
# export PATH="/Applications/Xcode.app/Contents/SharedFrameworks/DTDeviceKitBase.framework/Versions/A/Resources/:$PATH"
# export DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer/:$PATH"

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
alias bi="bundle install --path vendor/bundle"
alias be="bundle exec"

# terminal-notifier(通知カスタマイズ)
alias notify="terminal-notifier -message '処理終わったよ'"

# -------------------------------------
# キーバインド
# -------------------------------------
bindkey ";5D" backward-word
bindkey ";5C" forward-word

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tabatakohei/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tabatakohei/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tabatakohei/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tabatakohei/google-cloud-sdk/completion.zsh.inc'; fi
