###OS毎の設定ファイルを適用
case ${OSTYPE} in
    darwin*)
        source ~/.zshrc.darwin
        ;;
    linux*)
        source ~/.zshrc.linux
        ;;
esac

# 色を使用
autoload -Uz colors
colors

### gitの補完機能
# brew の場合
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

# zsh-completionsを追加
fpath=(/usr/local/share/zsh-completions $fpath)

### 補完機能有効にする
autoload -U compinit
compinit -u


