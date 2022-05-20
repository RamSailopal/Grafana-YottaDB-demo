#!/bin/bash
yum update
yum install -y python3 python3-devel git gcc make
cd /usr/local && git clone https://github.com/chrisemunt/mg_python.git
cd /usr/local/mg_python/src && python3 setup.py install
cd /usr/local
git clone https://github.com/RamSailopal/YottaDB-Grafana-Server.git
cd YottaDB-Grafana-Server
python3 -m pip install -r requirements/requirements.txt
export FLASK_APP="yottametrics"
export FLASK_ENV="development"
export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8
flask run --host=0.0.0.0

