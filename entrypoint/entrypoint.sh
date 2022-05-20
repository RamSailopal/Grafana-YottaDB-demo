#!/bin/bash
apt-get update
apt-get install -y wget unzip 
cd /tmp
wget --no-check-certificate 'https://drive.google.com/uc?export=download&id=17EQMzWEC42ob5TqhBoL8ynFm4Cli7JlG&confirm=t' -O 'yottadbmetric.zip'
sed -i 's/^;allow_loading_unsigned_plugins =/allow_loading_unsigned_plugins = ramsailopal-yottadb-datasource/' /etc/grafana/grafana.ini
sed -i 's/^;enable_gzip = false/enable_gzip = true/' /etc/grafana/grafana.ini
cd /var/lib/grafana/plugins
unzip /tmp/yottadbmetric.zip
cd /usr/share/grafana && /run.sh
