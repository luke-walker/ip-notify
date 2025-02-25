#!/bin/bash

BASE_DIR=$(dirname "$0")
INSTALL_DIR="/opt/ip-notify"

# Create installation directory
if ! [[ -d ${INSTALL_DIR} ]] ; then
    sudo mkdir ${INSTALL_DIR}
    sudo chown www-data:www-data ${INSTALL_DIR}
    sudo chmod og=wxr ${INSTALL_DIR}
fi

# Install script and dependencies
cp ${BASE_DIR}/main.py ${INSTALL_DIR}/main.py
rm -rf ${INSTALL_DIR}/.venv
python -m venv ${INSTALL_DIR}/.venv
${INSTALL_DIR}/.venv/bin/python -m pip install -r ${BASE_DIR}/requirements.txt
sudo chown -R www-data:www-data ${INSTALL_DIR}
sudo chmod -R og=wxr ${INSTALL_DIR}

# Fill .env file
missing_vars=()
touch ${INSTALL_DIR}/.env
while IFS="=" read exmp_var _ ; do
    missing=1
    while IFS="=" read user_var _ ; do
        if [[ ${exmp_var} == ${user_var} ]] ; then
            missing=0
            break
        fi
    done < ${INSTALL_DIR}/.env
    if [[ ${missing} -eq 1 ]] ; then
        missing_vars+=(${exmp_var})
    fi
done < ${BASE_DIR}/.env.example
for var in ${missing_vars[@]} ; do
    read -p "Enter ${var} value: " user_val
    echo "${var}=${user_val}" >> ${INSTALL_DIR}/.env
done
