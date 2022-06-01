sudo dnf -y update
sudo dnf -y install \
    dnf-plugins-core \
    fuse-overlayfs \
    neofetch \
    cmatrix \
    dconf \
    snapd \
    htop \
    wget \
    gh

git config --global user.name   "Byancode"
git config --global user.email  "byancode@gmail.com"

sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

sudo dnf -y install http://rpms.remirepo.net/fedora/remi-release-36.rpm
sudo dnf -y module install php:remi-8.1
sudo dnf -y install \
    php \
    php-gd \
    php-fpm \
    php-zip \
    php-intl \
    php-devel \
    php-mcrypt \
    php-mysqlnd \
    php-mbstring \
    php-memcache \
    php-imagick \
    php-xdebug \
    php-xmlrpc \
    php-swoole \
    php-curl \
    php-pear \
    php-json

sudo rpm --import https://dl.google.com/linux/linux_signing_key.pub
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo dnf -y install google-chrome-stable_current_x86_64.rpm

wget https://getcomposer.org/composer-stable.phar -O /usr/local/bin/composer
sudo wget https://getcomposer.org/composer-stable.phar -O /usr/local/bin/composer
sudo chmod +x /usr/local/bin/composer

sudo dnf config-manager     --add-repo     https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo systemctl start docker

sudo dnf -y install docker-compose-plugin
sudo curl -SL https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo systemctl disable --now docker.service docker.socket

curl -fsSL https://get.docker.com/rootless | sh
export PATH=/home/byancode/bin:$PATH
export DOCKER_HOST=unix:///run/user/1000/docker.sock

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
source ~/.bashrc

nvm install 18.2.0
npm install -g yarn

sudo snap install flutter --classic --channel=stable
sudo snap install android-studio --classic --stable
sudo snap install telegram-desktop
sudo snap install code --classic
sudo snap install snap-store
sudo snap install insomnia
sudo snap install postman
sudo snap install slack

flutter doctor --android-licenses

sudo dnf remove $(dnf list installed | grep libreoffice | grep -o -E "^\S+")

bash -c "$(wget -qO- https://raw.githubusercontent.com/harry-cpp/code-nautilus/master/install.sh)"