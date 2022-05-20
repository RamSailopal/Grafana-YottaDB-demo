#!/bin/bash
apt-get update
apt-get install -y git 
source /opt/yottadb/current/ydb_env_set
/opt/yottadb/current/ydb <<< 'H'
cd /usr/local
git clone https://github.com/RamSailopal/YottaDB-Grafana-Server.git
cd YottaDB-Grafana-Server
cp routines/* /data/r1.34_x86_64/r
cp /home/entrypoint/*.m /data/r1.34_x86_64/r
/opt/yottadb/current/ydb <<< 'H'
/opt/yottadb/current/ydb <<< 'ZL "grafanaserver.m"'
/opt/yottadb/current/ydb <<< 'ZL "gvstat.m"'
/opt/yottadb/current/ydb <<< 'ZL "_zmgsis1.m"'
/opt/yottadb/current/ydb <<< 'ZL "_zmgsi1.m"'
/opt/yottadb/current/ydb <<< "do ylink^%zmgsi1"
/opt/yottadb/current/ydb <<< "do start^%zmgsi1(0)"
sleep 2
/opt/yottadb/current/ydb <<< 'do START^grafanaserver("DEFAULT",10)'
sleep 2
tail -f /dev/null

