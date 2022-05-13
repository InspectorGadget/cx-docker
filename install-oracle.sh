#!/bin/bash

apt-get update
apt-get install -y libaio1 wget zip unzip
wget https://download.oracle.com/otn_software/linux/instantclient/216000/instantclient-basic-linux.x64-21.6.0.0.0dbru.zip
unzip instantclient-basic-linux.x64-21.6.0.0.0dbru.zip
rm -f instantclient-basic-linux.x64-21.6.0.0.0dbru.zip

cd /opt/oracle/instantclient*

rm -f *jdbc* *mysql *README* *jar uidrvci genezi adrci
echo /opt/oracle/instantclient* > /etc/ld.so.conf.d/oracle-instantclient.conf
ldconfig