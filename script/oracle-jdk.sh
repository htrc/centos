#!/bin/bash

if [[ ! "$ORACLE_JDK" =~ ^(true|yes|on|1|TRUE|YES|ON])$ ]]; then
  exit
fi

echo "==> Downloading jdk-7u79-linux-x64.rpm"
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.rpm"

echo "=> Installing jdk-7u79"
sudo yum -y localinstall jdk-7u79-linux-x64.rpm

echo "=> Cleaning up JDK installation archives"
rm jdk-7u79-linux-x64.rpm
