
# Vagrant
export VAGRANT_WSL_WINDOWS_ACCESS_USER= realsys
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
export PATH="$PATH:/c/Program Files/Oracle/VirtualBox"
export PATH="$PATH:/c/Windows/System32/"
export PATH="$PATH:/c/Windows/System32/WindowsPowerShell/v1.0/"

# Xserver

# Docker
export DOCKER_HOST=tcp://localhost:2375

# ホームのbinフォルダにPATHを通す(自作コマンド)
export PATH="/home/k_syu/bin:$PATH"

# 新規フォルダ作成のパーミッション設定
umask 002

# vagrant id
readonly mycent='7311dd8'
readonly cent8='ddebd9b'
