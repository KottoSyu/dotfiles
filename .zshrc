## PATH
export PATH="$PATH:$HOME/dotfiles/bin"

### locale設定
export LANG=en_US.UTF-8

### OS毎の設定ファイルを適用
case ${OSTYPE} in
    darwin*)
        source ~/.zshrc.darwin
        ;;
    linux-gnu)
        source ~/.zshrc.linux-gnu
        ;;
esac

# 小文字入力時は大文字も補完する(大文字入力時は大文字のみ補完)
zstyle ':completion*' matcher-list 'm:{[:lower:]}={[:upper:]}'

# 色を使用
autoload -Uz colors
colors

### promptの設定
PROMPT="%{${fg[cyan]}%}[%n@%m] %{${fg[yellow]}%}%~%{${reset_color}%}
%#: "

#lsの色設定
case ${OSTYPE} in
    darwin*)
				alias ls='ls -G'
        ;;
    linux-gnu)
				alias ls='ls --color=auto'
        ;;
esac
alias grep='grep --color=auto'

# 便利なエイリアス
alias la='ls -a'
cdls ()
{
    \cd "$@" && la
}
alias cd="cdls"

### ヒストリの設定
# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history
# メモリに保存される履歴の件数
export HISTSIZE=1000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
# 重複を記録しない
setopt hist_ignore_dups
# 開始と終了を記録
setopt EXTENDED_HISTORY
# historyを複数windowやtabで共有する
setopt share_history

# zsh-completionsを追加
case ${OSTYPE} in
    darwin*)
				fpath=($(brew --prefix)/share/zsh-completions $fpath)
        ;;
    linux-gnu)
				fpath=(/home/$USER/.zsh-completions/src $fpath)
        ;;
esac

### 補完機能有効にする
autoload -U compinit
compinit -u

# gitのalias
alias g='git'

### keypadのremap
# enter
bindkey -s "^[OM" "^M"

