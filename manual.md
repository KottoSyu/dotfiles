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
  - ./configure --with-features=huge --enable-multibyte --enable-luainterp=dynamic --enable-gpm --enable-cscope --enable-fontset --enable-fail-if-missing --prefix=/usr/local --enable-python3interp=dynamic --enable-rubyinterp=dynamic
  - sudo make
  - ./src/vim --version
  - yum remove vim-enhanced
  - which vim
  - make install
  - which vim
      ns .zsh-completions
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

## tmux
- curl -kLO https://github.com/tmux/tmux/releases/download/2.9/tmux-2.9.tar.gz
- sudo yum -y install libevent-devel
- tar -zxvf tmux-2.9.tar.gz
- cd tmux-2.9
- ./configure
- make
- sudo make install
- tmux -V

## php
- sudo yum install epel-release
- sudo yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
- sudo yum update
- sudo yum repolist
- yum info php --enablerepo=epel,remi,remi-php73
- sudo yum -y install --enablerepo=epel,remi,remi-php73 php php-devel php-mbstring php-pdo php-gd php-xml php-mcrypt
- php -r "echo phpinfo();" | grep "php.ini"
### zip unzip
- sudo yum install -y zip unzip

## SELinux
- getenforce
- sudo vi /etc/selinux/config
- SELINUX=enforcing -> disabled
- reboot

## composer
- php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
- php -r "if (hash_file('sha384', 'composer-setup.php') === 'e0012edf3e80b6978849f5eff0d4b4e4c79ff1609dd1e613307e16318854d24ae64f26d17af3ef0bf7cfb710ca74755a') { echo 'Installer verified';  } else { echo 'Installer corrupt'; unlink('composer-setup.php');  } echo PHP_EOL;"
- php composer-setup.php
- php -r "unlink('composer-setup.php');"
- mv composer.phar /usr/local/bin/composer

## nodeJS npm
- su -
- curl -sL https://rpm.nodesource.com/setup_10.x | bash -
- yum install nodejs
- node -v
- npm -v
- npm update -g

## dotfiles
- git clone https://github.com/k-syu0/dotfiles
- cd dotfiles
- ./link.sh

## mysql8
- yum localinstall https://dev.mysql.com/get/mysql80-community-release-el7-1.noarch.rpm -y
- install mysql
- install mysql-community-server
- systemctl start mysqld.service

### how to start up
- sudo cat /var/log/mysqld.log
- mysql -u root -p
- SET GLOBAL validate\_password.length = 8;
- SET GLOBAL validate\_password.policy = LOW;
- ALTER USER 'root'@'localhost' IDENTIFIED BY '12345678';
- SHOW VARIABLES LIKE 'validate\_password%';
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
  - localectl list-locales | grep US
  - sudo localectl set-locale LANG=en_US.utf8
  - source /etc/locale.conf
  - エラーの場所は以下を確認
    - locale -a | grep ~
    - ない場合は以下
      - sudo localedef -f UTF-8 -i en_US en_US
      - source /etc/locale.conf
    - 以下のコマンドでリセットされる
      - sudo yum update glibc-common
- service
  - systemctl list-jobs
  - systemctl list-unit-files --type=service

## vagrant
- SSL証明書error
  - vim Vagrantfile
  - config.vm.box\_download\_insecure = true
