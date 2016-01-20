#!/bin/bash

# Remove the host key
sed -i '/192.168.122.10/d' ~/.ssh/known_hosts

qemu-img create -f qcow2 -o preallocation=metadata atomic-master.qcow2 16G

sudo virt-install -n fedatomic-master -r 2048 --os-type=linux --disk atomic-master.qcow2,device=disk,bus=virtio -w bridge=virbr0,model=virtio --noautoconsole --initrd-inject /home/matt.micene/Projects/atomic/vms/f22/master.ks --extra-args "ks=file:/master.ks" --location /home/matt.micene/Projects/atomic/vms/f22/Fedora-Server-DVD-x86_64-22.iso
