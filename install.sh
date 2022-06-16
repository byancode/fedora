sudo dnf -y update
sudo dnf -y install \
    java-latest-openjdk \
    java-1.8.0-openjdk \
    java-11-openjdk \
    dnf-plugins-core \
    fuse-overlayfs \
    android-tools \
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

# CREATE FOLDERS
mkdir ~/programs
mkdir ~/workspace

# GOOGLE CHROME
sudo rpm --import https://dl.google.com/linux/linux_signing_key.pub
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo dnf -y install google-chrome-stable_current_x86_64.rpm

# COMPOSER
wget https://getcomposer.org/composer-stable.phar -O /usr/local/bin/composer
sudo wget https://getcomposer.org/composer-stable.phar -O /usr/local/bin/composer
sudo chmod +x /usr/local/bin/composer

# HTTPTOOLKIT
HTTPTOOLKIT_VERSION=1.8.1
sudo wget https://github.com/httptoolkit/httptoolkit-desktop/releases/download/v${HTTPTOOLKIT_VERSION}/HttpToolkit-linux-x64-${HTTPTOOLKIT_VERSION}.zip
unzip HttpToolkit-linux-x64-${HTTPTOOLKIT_VERSION}.zip -d ~/programs

# DOCKER
sudo dnf config-manager     --add-repo     https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo systemctl start docker

# DOCKER-COMPOSE
sudo dnf -y install docker-compose-plugin
sudo curl -SL https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# ROOTLESS DOCKER
sudo systemctl disable --now docker.service docker.socket
curl -fsSL https://get.docker.com/rootless | sh

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

source ~/.bashrc

nvm install 18.2.0
npm install -g yarn

sudo snap install flutter --classic --channel=stable
sudo snap install android-studio --classic --stable
sudo snap install kotlin --classic
sudo snap install gradle --classic
sudo snap install telegram-desktop
sudo snap install code --classic
sudo snap install runjs --edge
sudo snap install obs-studio
sudo snap install snap-store
sudo snap install insomnia
sudo snap install postman
sudo snap install slack

# ADD VSCODE ON CONTEXTMENU NAUTIUS
bash -c "$(wget -qO- https://raw.githubusercontent.com/harry-cpp/code-nautilus/master/install.sh)"

# REMOVE LIBREOFFICE
sudo dnf -y remove $(dnf list installed | grep libreoffice | grep -o -E "^\S+")

# ACCEPT
flutter doctor --android-licenses