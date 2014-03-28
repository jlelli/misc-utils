#! /bin/bash

if [ "$#" -ne 1 ]; then
    echo "usage: vm-tid [guest_name]"
    echo "valid guests are:"
    echo "guest1-debian-64"
    echo "guest2-debian-64"
    exit 0
fi

VMNAME=$1

INFO=$(virsh --connect qemu:///system qemu-monitor-command ${VMNAME} --hmp info cpus)

if [ $? -ne 0 ]; then
    echo 
    echo "usage: vm-tid [guest_name]"
    echo "valid guests are:"
    echo "guest1-debian-64"
    echo "guest2-debian-64"
    echo 
    exit 1
fi

echo "${INFO}" | sed 's/(halted)//'  | awk '{print $5}'  | tr -d '\n' | cut -c 11-
