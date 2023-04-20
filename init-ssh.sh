#!/bin/bash

if [ -f tmp/.ssh/authorized_keys ]
then
    echo "SSH already configured."
else
    mkdir tmp/.ssh
    ssh-keygen -t rsa -b 2048 -N '' -f tmp/.ssh/id_rsa
    cp tmp/.ssh/id_rsa.pub tmp/.ssh/authorized_keys
    chmod 700 tmp/.ssh
    chmod 600 tmp/.ssh/authorized_keys
    sudo chown -R root:root tmp/.ssh
fi
