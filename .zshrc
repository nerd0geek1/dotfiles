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

# node.js
export PATH=$HOME/.nodebrew/current/bin:$PATH

#Xcode
# export PATH="/Applications/Xcode.app/Contents/SharedFrameworks/DTDeviceKitBase.framework/Versions/A/Resources/:$PATH"
# export DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer/:$PATH"

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

# -------------------------------------
# キーバインド
# -------------------------------------
bindkey ";5D" backward-word
bindkey ";5C" forward-word

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### gitをcommand line toolからhomebrewのものに変更するため
export PATH=/usr/local/bin:$PATH
