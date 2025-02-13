#!/bin/bash

BASEDIR=$(dirname "$0")

# Create installation directory
if ! [[ -d "/opt/ip-notify" ]] ; then
    sudo mkdir /opt/ip-notify
    sudo chmod g=wxr /opt/ip-notify
    sudo chown :www-data /opt/ip-notify
fi

# Install script and dependencies
if ! [[ -f "/opt/ip-notify/.env" ]] ; then
	cp ${BASEDIR}/.env.example /opt/ip-notify/.env
	echo "Edit /opt/ip-notify/.env before running the script."
fi
cp ${BASEDIR}/main.py /opt/ip-notify/main.py
rm -rf /opt/ip-notify/env
python -m venv /opt/ip-notify/env
/opt/ip-notify/env/bin/python -m pip install -r ${BASEDIR}/requirements.txt
