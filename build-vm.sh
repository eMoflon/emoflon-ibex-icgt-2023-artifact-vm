#!/bin/bash

set -e

is_installed() {
    if ! command -v $1 &> /dev/null
    then
        echo "Binary $1 could not be found."
        exit
    fi
}

# Check if required tools are installed
echo "Checking required tools."
is_installed wget
is_installed unzip
is_installed vboxmanage
is_installed vagrant

# Run other scripts
echo "Starting download script."
./download-base-vm.sh
echo "Starting vagrant box preparation script."
./prepare.sh

echo "Start vagrant provisioning."
vagrant up
vagrant halt
vboxmanage export emoflon-hosr -o emoflon.ova

echo "eMoflon OVA was exported successfully."
