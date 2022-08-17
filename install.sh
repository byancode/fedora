sudo dnf -y update
sudo dnf -y install \
    java-latest-openjdk \
    java-1.8.0-openjdk \
    java-11-openjdk \
    dnf-plugins-core \
    fuse-overlayfs \
    android-tools \
    neofetch \
    xmodmap \
    xdotool \
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

# set background gnome
# gsettings set org.gnome.desktop.background picture-uri '/home/byancode/Imágenes/Fondos de escritorio/p1wn65kczsn51.jpg'


echo '#!/bin/bash
xmodmap -e "keycode 232=F1 F1 XF86MonBrightnessDown"
xmodmap -e "keycode 233=F2 F2 XF86MonBrightnessUp"
xmodmap -e "keycode 128=F3 F3 XF86LaunchA"
xmodmap -e "keycode 212=F4 F4 XF86LaunchB"
xmodmap -e "keycode 237=F5 F5 XF86KbdBrightnessDown"
xmodmap -e "keycode 238=F6 F6 XF86KbdBrightnessUp"
xmodmap -e "keycode 173=F7 F7 XF86AudioPrev"
xmodmap -e "keycode 172=F8 F8 XF86AudioPlay"
xmodmap -e "keycode 171=F9 F9 XF86AudioNext"
xmodmap -e "keycode 121=F10 F10 XF86AudioMute"
xmodmap -e "keycode 122=F11 F11 XF86AudioLowerVolume"
xmodmap -e "keycode 123=F12 F12 XF86AudioRaiseVolume"

xmodmap -e "keycode  57=n N ntilde Ntilde ntilde Ntilde ntilde Ntilde ntilde Ntilde ntilde Ntilde"
# ALT_R = ALT_G
xmodmap -e "keycode 108=Mode_switch Mode_switch"
' >> ~/.xmodmap

# convertir en ejecutable
chmod +x ~/.xmodmap

# show configuration keycodes
# xmodmap -pke

# reset xmodmap
# setxkbmap -option


echo '#!/bin/bash
git add . && git commit -m "$(echo $@)"
' >> ~/bin/gac && chmod +x ~/bin/gac

echo '#!/bin/bash
git add . && git commit -m "$(echo $@)" && git push
' >> ~/bin/ggp && chmod +x ~/bin/ggp

echo '#!/bin/bash
echo "# New project" >> README.md
git init
git add .
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:$(echo $1).git
git push -u origin main
' >> ~/bin/gii && chmod +x ~/bin/gii


echo '#!/bin/bash
echo "# New project" >> README.md
rm -rf .git
git init
git branch -M main
gh repo create $(echo $1) --private --source=. --remote=upstream
git add .
git commit -m "first commit"
git remote add origin git@github.com:$(echo $1).git
git push -u origin main
' >> ~/bin/ghc && chmod +x ~/bin/ghc