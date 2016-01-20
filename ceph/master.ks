#version=DEVEL
# System authorization information
auth --enableshadow --passalgo=sha512

# Use CDROM installation media
cdrom
# Use graphical install
graphical
# Run the Setup Agent on first boot
firstboot --enable
ignoredisk --only-use=vda
# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'
# System language
lang en_US.UTF-8

# Network information
network  --bootproto=static --device=eth0 --gateway=192.168.122.1 --ip=192.168.122.10 --nameserver=192.168.122.1 --netmask=255.255.255.0 --noipv6 --activate
network  --hostname=atomic-master
# Root password
rootpw --iscrypted $6$e3u7kvzPZRr9LlRB$JG3HpCFsXpKMSG.Tfld4njf6xo5f0l8Xul92Lz6AwI6d5wAKPdxGJ14ZWXMyosQK58NfpxQBpPYlxvfZREnVJ1
# System timezone
timezone America/New_York --isUtc
user --groups=wheel --name=fedora --password=$6$pMhEPK.bhpsxyD43$l9tskERlw38rENPanWaohQMRh51wPnZA7Dy4H6Fccw9b8nbDIJAIw/EjMBuj1xDUHM9Cs4mOEUOHo7Z9rv6jz0 --iscrypted --gecos="fedora"
# System bootloader configuration
bootloader --location=mbr --boot-drive=vda
autopart --type=lvm
# Partition clearing information
clearpart --none --initlabel

%packages
@container-management
@core
@domain-client
@hardware-support
@headless-management
@server-product
@standard

%end

%addon com_redhat_kdump --disable --reserve-mb='128'
%end

%post

/usr/bin/yum update -y 

%end

reboot
