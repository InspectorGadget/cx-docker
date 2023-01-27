#!/bin/bash

apt-get update
apt-get install -y libaio1 wget zip unzip

# Linux Dependency
wget https://download.oracle.com/otn_software/linux/instantclient/216000/instantclient-basic-linux.x64-21.6.0.0.0dbru.zip
unzip instantclient-basic-linux.x64*.zip
rm -f instantclient-basic-linux.x64*.zip

# Mac Dependency
wget https://download.oracle.com/otn_software/mac/instantclient/198000/instantclient-basic-macos.x64-19.8.0.0.0dbru.zip
unzip instantclient-basic-macos.x64*.zip
rm -f instantclient-basic-macos.x64*.zip

# Create directories
mkdir -p /opt/oracle/linux/
mkdir -p /opt/oracle/mac/

mv instantclient_21_6/ /opt/oracle/linux/
mv instantclient_19_8/ /opt/oracle/mac/

# Set environment variables
echo 'export ORACLE_HOME=/opt/oracle/linux/instantclient_21_6' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=$ORACLE_HOME' >> ~/.bashrc
echo 'export PATH=$ORACLE_HOME:$PATH' >> ~/.bashrc

# Remove unwanted files
cd /opt/oracle/linux/instantclient_21_6
rm -f *jdbc* *mysql *README* *jar uidrvci genezi adrci

cd /opt/oracle/mac/instantclient_19_8
rm -f *jdbc* *mysql *README* *jar uidrvci genezi adrci

echo /opt/oracle/linux/instantclient* > /etc/ld.so.conf.d/oracle-instantclient.conf

ldconfig