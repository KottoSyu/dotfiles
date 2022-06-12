# install manual

## vim

- gcc
  1. ``which gcc``
  1. `yum install -y gcc`

- ncurses-devel
  1. `yum install -y ncurses-devel`

- lua
  1. `which lua`
  1. `dnf --enablerepo=PowerTools install lua-devel`

- ruby
  1. `which ruby`
  1. `yum install -y ruby-devel`

- python3
  1. `which python3`
  1. `yum install -y python3-devel`

- vim
  1. `install git`
  1. `git clone https://github.com/vim/vim.git`
  1. `cd vim`
  1. `./configure --with-features=huge --enable-multibyte --enable-luainterp=dynamic --enable-gpm --enable-cscope --enable-fontset --enable-fail-if-missing --prefix=/usr/local --enable-python3interp=dynamic --enable-rubyinterp=dynamic`
  LDFLAGS="$LDFLAGS -fPIC" を入れてみる(--enable-rubyinterp=dynamicのため？)
  1. `sudo make`
  1. `./src/vim --version`
  1. `yum remove vim-enhanced`
  1. `which vim`
  1. `make install`
  1. `which vim`
  1. `vim --version`

## zsh

1. `which zsh`
1. `yum install -y zsh`
1. `chsh -s PATH/zsh (if no command chsh -> install util-linux-user)`
1. `echo $SHELL`

## zsh-completions

1. `git clone https://github.com/zsh-users/zsh-completions`
1. `mv zsh-completions .zsh-completions`

## neovim

1. `pip3 install neovim`

## mycli

1. `pip3 install mycli`

## tmux

1. `git clone https://github.com/tmux/tmux`
1. `sh autogen.sh`
1. `cd tmux`
1. `sudo yum -y install libevent-devel  (if not install)`
1. `./configure`
1. `make`
1. `sudo make install`
1. `tmux -V`

## php

1. `sudo yum install epel-release`
1. `sudo yum -y install https://rpms.remirepo.net/enterprise/remi-release-8.rpm`
1. `sudo yum update`
1. `sudo yum repolist`
1. `sudo yum -y install --enablerepo=epel,remi,remi-php73 php php-devel php-mbstring php-pdo php-mysqlnd php-gd php-xml php-mcrypt`
mysqlのドライバーをいれるため、php-mysqlndを追加した
1. `sudo dnf module install php:remi-7.4`
1. `php -r "echo phpinfo();" | grep "php.ini"`

## xdebug

1. `sudo dnf install php-pecl-xdebug`
1. `vi /etc/php.d/15-xdebug.ini`

    ```config
    xdebug.remote_autostart = true
    xdebug.remote_connect_back = true
    xdebug.remote_enable = true
    xdebug.remote_port = 9001
    ```

1. `systemctl restart php-fpm`

## zip unzip

1. `sudo yum install -y zip unzip`

## SELinux

1. `getenforce`
1. `sudo vi /etc/selinux/config`
1. `SELINUX=enforcing -> disabled`
1. `reboot`

## composer

1. `php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"`
1. `php -r "if (hash_file('sha384', 'composer-setup.php') === 'e0012edf3e80b6978849f5eff0d4b4e4c79ff1609dd1e613307e16318854d24ae64f26d17af3ef0bf7cfb710ca74755a') { echo 'Installer verified';  } else { echo 'Installer corrupt'; unlink('composer-setup.php');  } echo PHP_EOL;"`
1. `php composer-setup.php`
1. `php -r "unlink('composer-setup.php');"`
1. `mv composer.phar /usr/local/bin/composer`

## nodeJS npm

1. `su -`
1. `curl -sL https://rpm.nodesource.com/setup_10.x | bash -`
1. `yum install nodejs`
1. `node -v`
1. `npm -v`
1. `npm update -g`

## dotfiles

1. `git clone https://github.com/k-syu0/dotfiles`
1. `cd dotfiles`
1. `./link.sh`

## mysql8

1. `yum localinstall -y https://dev.mysql.com/get/mysql80-community-release-el7-1.noarch.rpm`
1. `install mysql`
1. `install mysql-community-server`
1. `systemctl start mysqld.service`

### how to start up

1. `sudo cat /var/log/mysqld.log`
1. `mysql -u root -p`
1. `SET GLOBAL validate\_password.length = 8;`
1. `SET GLOBAL validate\_password.policy = LOW;`
1. `ALTER USER 'root'@'localhost' IDENTIFIED BY '12345678';`
1. `SHOW VARIABLES LIKE 'validate\_password%';`
1. `UNINSTALL COMPONENT 'file://component\_validate\_password';`
1. `create user dbuser@localhost;`
1. `grant all on \*.\* to dbuser@localhost;`
1. `show variables like 'default_authentication_plugin';`
デフォルトのユーザー認証のプラグインの確認
mysql8からは、「caching_sha2_password」となっている
1. `select user, plugin from mysql.user;`
1. `alter user 'dbuser'@'localhost' identified with mysql_native_password by '';`
phpのpdoでは、まだ「caching_sha2_password」に対応していないため、
もともと使われていた「mysql_native_password」に変更
1. `INSTALL COMPONENT 'file://component\_validate\_password';`

## centos

1. version確認
`cat /etc/redhat-release`
1. lsのdirの色設定
`sudo cp /etc/DIR\_COLORS ~/.dir\_colors`
`vim .dir\_colos`
`eval 'dircolors .dir\_colors -b'`
1. timezone設定
`timedatectl status`
`sudo timedatectl set-timezone Asia/Tokyo`
1. locale設定
`localectl status`
`localectl list-locales | grep US`
`sudo localectl set-locale LANG=en_US.utf8`
`source /etc/locale.conf`
*エラーの場合は以下の場所にあるかを確認*
`locale -a | grep ~`
*ない場合は以下のコマンドで追加?*
`sudo localedef -f UTF-8 -i en_US en_US`
`source /etc/locale.conf`
以下のコマンドでリセットされる
`sudo yum update glibc-common`
1. service
`systemctl list-jobs`
`systemctl list-unit-files --type=service`

## vagrant

1. SSL証明書error
`vim Vagrantfile`

    ```config
    config.vm.box\_download\_insecure = true
    ```

## apache

- `Require all granted`
全てのアクセスを許可
特定のipを許可・拒否出来る
- `AllowOverRide All`
.htaccessがある場合
- `FollowSymLinks`
シンボリックリンクのリンク先を Apache がたどれるようにする

## laravel

1. `php artisan key:generate`
APP_KEYの値が生成され、.envファイルに追加される
composerでインストールすれば自動的に実行される
