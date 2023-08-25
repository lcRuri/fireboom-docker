#!/bin/bash

sh update-fb.sh

./fireboom build

start_command="/fbserver/fireboom $1"

eval "$start_command"

