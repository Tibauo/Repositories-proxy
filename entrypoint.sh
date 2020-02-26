#!/bin/bash

nginx -g "daemon off;"
rsync  -R -av --chown nginx --delete --delete-excluded  --exclude "local*" --exclude "isos" rsync://ftp.pasteur.fr/mirrors/CentOS/7/ /repos/
rsync  -R -av --chown nginx --delete --delete-excluded  --exclude "local*" --exclude "isos" rsync://ftp.pasteur.fr/mirrors/CentOS/8/ /repos/
while :; do sleep 2; done
