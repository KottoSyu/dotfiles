#!/bin/sh

DOT_FILES=(.vimrc .vim .gitconfig .zshrc .myclirc .my.cnf .tmux.conf)

case ${OSTYPE} in
    darwin*)
        DOT_FILES+=( .zshrc.darwin )
        ;;
    linux-gnu)
        DOT_FILES+=( .zshrc.linux-gnu )
        ;;
esac

for file in ${DOT_FILES[@]}
do
  ln -s $HOME/dotfiles/$file $HOME/$file
done

echo "Complete!"

