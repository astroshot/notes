#!/bin/sh

group=docker

# create group docker if not exists
egrep "^$group" /etc/group >&/dev/null
if [ $? -ne 0 ]; then
    groupadd $group
fi

# add user to group docker
sudo usermod -aG ${group} ${USER}
