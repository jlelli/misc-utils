#! /bin/bash

if [ "$#" -ne 2 ]; then
    echo 
    echo "usage: vm-pin [guest_name] [cpu]"
    echo "valid guests are:"
    echo "guest1-debian-64"
    echo "guest2-debian-64"
    echo 
    exit 0
fi

VMNAME=$1
CPU=$2

INFO=$(virsh --connect qemu:///system vcpupin --live --vcpu 0 ${VMNAME} ${CPU})

if [ $? -ne 0 ]; then
    echo 
    echo "usage: vm-pin [guest_name] [cpu]"
    echo "valid guests are:"
    echo "guest1-debian-64"
    echo "guest2-debian-64"
    echo 
    exit 1
fi
