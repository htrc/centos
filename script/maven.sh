#!/bin/bash

if [[ ! "$MAVEN" =~ ^(true|yes|on|1|TRUE|YES|ON])$ ]]; then
  exit
fi

echo "=> Downloading Apache Maven 3.3.9"
wget http://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz

echo "=> Extracting Maven archive and copying to /usr/local"
su -c "tar -zxvf apache-maven-3.3.9-bin.tar.gz -C /usr/local"
rm apache-maven-3.3.9-bin.tar.gz
cd /usr/local
sudo ln -s apache-maven-3.3.9 maven

echo "=> Setting up environmental variables"
sudo tee /etc/profile.d/maven.sh <<-'EOF'
export M2_HOME=/usr/local/maven
export M2=$M2_HOME/bin
PATH=$M2:$PATH
EOF
