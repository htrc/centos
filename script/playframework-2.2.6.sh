#!/bin/bash

if [[ ! "$PLAY" =~ ^(true|yes|on|1|TRUE|YES|ON])$ ]]; then
  exit
fi

echo "=> Installing unzip"
yum -y install unzip

echo "=> Dowloading Play 2.2.6"
wget https://downloads.typesafe.com/play/2.2.6/play-2.2.6.zip

echo "=> Installing Play 2.2.6 for 'vagrant' user"
mkdir -p /home/vagrant/apps
mv play-2.2.6.zip /home/vagrant/apps/
cd /home/vagrant/apps
unzip play-2.2.6.zip
rm play-2.2.6.zip

echo "=> Fixing directory permissions"
chown -R vagrant:vagrant /home/vagrant/apps

echo "=> Adding Play to $PATH"
tee /home/vagrant/.bashrc <<-'EOF'
export PLAY_HOME=/home/vagrant/apps/play-2.2.6
export PATH=$PLAY_HOME:$PATH
EOF
