#!/bin/sh

echo "Installing packages"
sudo rm /etc/motd

sudo apt-get update
sudo apt-get install -y direnv make apt-transport-https \
  ca-certificates curl software-properties-common gnupg-agent

echo "Installing local files"
direnv allow .
echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
eval "$(direnv hook bash)"
mkdir -p .bundle

echo "Installing docker"
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
arch=`uname -m`
if [ arch == "aarch64"]; then
    debianarch="arm64"
else
    debianarch="amd64"
fi

sudo add-apt-repository "deb [arch=${debianarch}] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli docker-compose containerd.io
sudo usermod -aG docker ${USER} && newgrp docker

cp vagrant/bundle.config .bundle/config

echo "Installing Heroku. This is only supported on Intel processors."
if [ arch == "x86_64"]; then
    curl https://cli-assets.heroku.com/install.sh | sh
end

echo "Increasing inotify"
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

if [ ! -d "$HOME/db" ]; then
    mkdir $HOME/db
fi
