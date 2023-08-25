#!/bin/bash

sh update-fb.sh

./fireboom build

start_command="/dist/fireboom $1"

eval "$start_command"

