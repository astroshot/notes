#!/bin/sh

set -x
ssh_path=$HOME/.ssh
chmod 644 $ssh_path/*
chmod 600 $ssh_path/id_rsa
