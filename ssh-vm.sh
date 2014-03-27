#! /bin/bash
# Connect to virtual machines via ssh

VMNAME=$1

ssh $(ssh-vm.py $1) 2> /dev/null

if [ $? -ne 0 ]; then
    echo "unknown guest or guest unreachable, valid guests are:"
    echo "guest1-debian-64"
    echo "guest2-debian-64"
fi
