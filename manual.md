# install manual

## vim

- gcc
 - which gcc
 - install gcc

- ncurses-devel
 - install ncurses-devel

- lua
 - which lua
 - install lua lua-devel

- ruby
 - which ruby
 - install ruby ruby-devel

- python3
 - which python3
 - install python3 python3-devel

- vim
 - install git
 - git clone https://github.com/vim/vim.git
 - cd vim
 - sudo ./configure --with-features=huge --enable-multibyte --enable-luainterp=dynamic --enable-gpm --enable-cscope --enable-fontset --enable-fail-if-missing --prefix=/usr/local --enable-pythoninterp=dynamic --enable-python3interp=dynamic --enable-rubyinterp=dynamic
 - sudo make
 - ./src/vim --version
 - remove vim-enhanced
 - which vim
 - sudo make install
 - which vim
 - vim --version

## zsh
- which zsh
- install zsh
- chsh -s PATH/zsh \n (if no command chsh -> install util-linux-user)

## zsh-completions
- git clone https://github.com/zsh-users/zsh-completions 
- mv zsh-completions .zsh-completions

## neovim
- pip3 install neovim

## mycli
- pip3 install mycli

## dotfiles
- git clone https://github.com/k-syu0/dotfiles
- cd dotfiles
- ./link.sh

## mysql8
- yum localinstall https://dev.mysql.com/get/mysql80-community-release-el7-1    .noarch.rpm -y
- install mysql
- install mysql-community-server
- systemclt start mysqld.service

### how to start up
- sudo cat /var/log/mysqld.log
- mysql -u root -p
- SET GLOBAL validate_password.length = 8;
- SET GLOBAL validate_password.policy = LOW;
- ALTER USER 'root'@'localhost' IDENTIFIED BY '******************'
*********
