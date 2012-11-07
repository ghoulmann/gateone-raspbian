#!/bin/bash -ex

#Check for root privileges

LUID=$(id -u)
if [[ $LUID -ne 0 ]]; then
echo "$0 must be run with root privileges."
exit 1
fi


#######CONFIGURE########
port="443"
websource="https://github.com/downloads/liftoff/GateOne/gateone_1.1-1_all.deb"
addy=$(hostname -I)
#########################



#function to update repos; download and install packages from repos

install ()
{
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y \
        -o DPkg::Options::=--force-confdef \
        -o DPkg::Options::=--force-confold \
        install $@
}

pips ()
{
for package in $piplist
do
	pip install $package
done
}

#update; download, install and configure (install function)

install python-setuptools build-essential python-imaging dtach python-openssl python-pip

#Install python packages with pip (using pips function)
piplist="ordereddict tornado"

#do pips function with piplist
pips

#download Gateone Deb from web: to /tmp/gateone.deb
wget -O /tmp/gateone.deb $websource



#install package for Gateone
dpkg -i /tmp/gateone.deb
#

#function: clean up after apt
cleanup_apt()
    {
        rm -r /var/cache/apt/*
        mkdir /var/cache/apt/archives
        mkdir /var/cache/apt/archives/partial
    }

cleanup_apt
