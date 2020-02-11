# install manual

## vim

- gcc
  - which gcc
  - yum install -y gcc

- ncurses-devel
  - yum install -y ncurses-devel

- lua
  - which lua
  - yum install -y lua-devel

- ruby
  - which ruby
  - yum install -y ruby-devel

- python
  - which python
  - yum install -y python-devel

- python3
  - which python3
  - yum install -y python3-devel

- vim
  - install git
  - git clone https://github.com/vim/vim.git
  - cd vim
  - ./configure --with-features=huge --enable-multibyte --enable-luainterp=dynamic --enable-gpm --enable-cscope --enable-fontset --enable-fail-if-missing --prefix=/usr/local --enable-pythoninterp=dynamic --enable-python3interp=dynamic --enable-rubyinterp=dynamic
  - sudo make
  - ./src/vim --version
  - yum remove vim-enhanced
  - which vim
  - make install
  - which vim
  - vim --version

## zsh
- which zsh
- yum install -y zsh
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
- SET GLOBAL validate\_password.length = 8;
- SET GLOBAL validate\_password.policy = LOW;
- SHOW VARIABLES LIKE 'validate\_password%';
- ALTER USER 'root'@'localhost' IDENTIFIED BY '12345678';
- UNINSTALL COMPONENT 'file://component\_validate\_password';
- create user dbuser@localhost;
- grant all on \*.\* to dbuser@localhost;
- INSTALL COMPONENT 'file://component\_validate\_password';


## centos
- version確認
  - cat /etc/redhat-release
- lsのdirの色設定
  - sudo cp /etc/DIR\_COLORS ~/.dir\_colors
  - vim .dir\_colos
  - eval 'dircolors .dir\_colors -b'
- timezone
  - timedatectl status
  - sudo timedatectl set-timezone Asia/Tokyo
- locale
  - localectl status
  - sudo localectl set-locale LANG=ja_JP.UTF-8
  - source /etc/locale.conf
- service
  - systemctl list-jobs
  - systemctl list-unit-files --type=service

## vagrant
- SSL証明書error
  - vim Vagrantfile
  - config.vm.box\_download\_insecure = true
