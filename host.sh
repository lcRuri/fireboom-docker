#!/bin/bash


echo "0.0.0.0 localhost">/etc/hosts

curl -fsSL fireboom.io/install.sh | bash -s fb-project -t fb-init-todo

start_command="/dist/fireboom $1"

eval "$start_command"

